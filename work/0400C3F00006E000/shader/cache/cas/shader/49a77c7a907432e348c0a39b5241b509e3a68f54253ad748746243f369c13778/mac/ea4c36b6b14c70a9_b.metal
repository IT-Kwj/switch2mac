#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_38.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_38.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _64;
    float _80 = _78 * _70;
    float _82 = _78 * _76;
    float2 _481 = float2(_80, _82);
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_481, float2(0.0), isnan(_481))).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = in.m_40.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_42.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_44.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _78 * _99;
    float _115 = _78 * _105;
    float _117 = in.m_40.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_40.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_42.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_40.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_42.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _78 * _133;
    float _149 = _78 * _139;
    float _151 = -_113;
    float _153 = _93 + _151;
    float _155 = _153 * 4.0;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _115 * _157;
    float _161 = _78 * _111;
    float _163 = 0.0 + _159;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _165 * _161;
    bool _171 = _167 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _179 = _175 || _177;
    float _181 = in.m_42.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    if (!_179)
    {
        discard_fragment();
    }
    float _187 = _78 * _127;
    float _189 = _78 * _121;
    float _191 = _78 * _145;
    float _193 = _87 * _87;
    float _195 = _89 * _89;
    float _197 = -_147;
    float _199 = _189 + _197;
    float _201 = -_191;
    float _203 = _149 + _201;
    float _205 = fma(_195, _199, _147);
    float _207 = _78 * _185;
    float _209 = -_207;
    float _211 = _187 + _209;
    float _213 = _91 * _91;
    float _215 = fma(_193, _211, _207);
    float _217 = fma(_213, _203, _191);
    if (!_179)
    {
        out.m_47.x = _215;
        out.m_47.y = _205;
        out.m_47.z = _217;
        out.m_47.w = _159;
        return out;
    }
    float _219 = in.m_49.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_49.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_49.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _78 * _223;
    float _239 = _78 * _229;
    float _241 = _78 * _235;
    float _243 = _237 * _237;
    float _245 = fma(_239, _239, _243);
    float _247 = fma(_241, _241, _245);
    float _249 = rsqrt(_247);
    float _251 = _239 * _249;
    float _253 = _237 * _249;
    float _255 = _241 * _249;
    float _257 = abs(_251);
    float _259 = abs(_253);
    float _261 = precise::max(_257, _259);
    float _263 = abs(_255);
    float _265 = precise::max(_263, _261);
    float _267 = 1.0 / _265;
    float _269 = -_267;
    float _271 = _255 * _269;
    float _273 = _251 * _267;
    float _275 = _253 * _267;
    float3 _760 = float3(_273, _275, _271);
    float3 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_760, float3(0.0), isnan(_760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_760, float3(0.0), isnan(_760)), level(0.0)).xyz;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = in.m_51.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_51.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_51.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_53.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_53.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_53.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_55.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_55.w;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_55.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_55.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    bool _347 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _349 = _78 * _291;
    float _351 = _78 * _297;
    float _353 = _78 * _303;
    float _355 = fma(_281, 0.20999999344348907470703125, _349);
    float _357 = fma(_285, 0.20999999344348907470703125, _351);
    float _359 = fma(_283, 0.20999999344348907470703125, _353);
    float _361 = _78 * _309;
    float _363 = _78 * _315;
    float _365 = _78 * _321;
    float _367 = _355 + _361;
    float _369 = _357 + _363;
    float _371 = _359 + _365;
    float _373 = 0.0 + _167;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _215 * _367;
    float _379 = _217 * _369;
    float _381 = _205 * _371;
    float _383 = _78 * _327;
    float _385 = _78 * _333;
    float _387 = _78 * _339;
    float _389 = _78 * _345;
    float _391 = fma(_377, _385, _383);
    float _393 = fma(_381, _385, _387);
    float _395 = fma(_379, _385, _389);
    float _397 = _383;
    if (!_347)
    {
        _397 = _375;
    }
    float _399 = _397;
    bool _401 = !_347;
    float _403 = _399;
    if (!_401)
    {
        float _405 = in.m_57.w;
        float _407 = gl_FragCoord.w;
        float _409 = _405 * _407;
        float _411 = in.m_57.z;
        float _413 = gl_FragCoord.w;
        float _415 = _411 * _413;
        float _417 = _78 * _409;
        float _419 = _78 * _415;
        float _421 = 1.0 / _417;
        float _423 = _419 * _421;
        float _425 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _427 = fma(_423, (*spvDescriptorSet0.fp_c8)._m0[30].w, _425);
        float _429 = 1.0 / _427;
        float _431 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _433 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _435 = fma(_429, _431, _433);
        float _437 = _435 * 8.0;
        float _439 = precise::clamp(_437, 0.0, 1.0);
        float _441 = _375 * _439;
        _403 = _441;
    }
    float _443 = _403;
    float _445 = 0.0 + _443;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    out.m_47.x = _391;
    out.m_47.y = _393;
    out.m_47.z = _395;
    out.m_47.w = _447;
    return out;
}

