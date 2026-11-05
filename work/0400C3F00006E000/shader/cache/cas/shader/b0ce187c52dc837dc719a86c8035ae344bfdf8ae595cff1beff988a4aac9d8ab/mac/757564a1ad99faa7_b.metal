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
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _483 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_40.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_42.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_44.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _80 * _101;
    float _117 = _80 * _107;
    float _119 = in.m_40.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_42.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_40.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_42.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _80 * _129;
    float _145 = _80 * _135;
    float _147 = -_115;
    float _149 = _95 + _147;
    float _151 = _117 * _149;
    float _153 = _80 * _113;
    float _155 = 0.0 + _151;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _153;
    bool _163 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _171 = _167 || _169;
    float _173 = in.m_40.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_42.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    if (!_171)
    {
        discard_fragment();
    }
    float _185 = _80 * _177;
    float _187 = _80 * _183;
    float _189 = _80 * _123;
    float _191 = _80 * _141;
    float _193 = -_187;
    float _195 = _185 + _193;
    float _197 = -_143;
    float _199 = _189 + _197;
    float _201 = -_191;
    float _203 = _145 + _201;
    float _205 = fma(_89, _195, _187);
    float _207 = fma(_91, _199, _143);
    float _209 = fma(_93, _203, _191);
    if (!_171)
    {
        out.m_47.x = _205;
        out.m_47.y = _207;
        out.m_47.z = _209;
        out.m_47.w = _151;
        return out;
    }
    float _211 = in.m_49.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_49.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_49.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _80 * _215;
    float _231 = _80 * _221;
    float _233 = _80 * _227;
    float _235 = _229 * _229;
    float _237 = in.m_51.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = fma(_231, _231, _235);
    float _245 = fma(_233, _233, _243);
    float _247 = rsqrt(_245);
    float _249 = _231 * _247;
    float _251 = _229 * _247;
    float _253 = _233 * _247;
    float _255 = _80 * _241;
    float _257 = abs(_249);
    float _259 = abs(_251);
    float _261 = precise::max(_257, _259);
    float _263 = abs(_253);
    float _265 = precise::max(_263, _261);
    float _267 = 1.0 / _265;
    float _269 = _251 * _267;
    float _271 = -_267;
    float _273 = _253 * _271;
    float _275 = precise::min(_255, 1.0);
    float _277 = _249 * _267;
    float3 _760 = float3(_277, _269, _273);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_760, float3(0.0), isnan(_760)), level(_275)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_760, float3(0.0), isnan(_760)), level(_275)).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    float _289 = in.m_53.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_53.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_53.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_55.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_55.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_55.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_57.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_57.w;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_57.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_57.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _80 * _293;
    float _351 = _80 * _299;
    float _353 = _80 * _305;
    bool _355 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _357 = fma(_285, 0.20999999344348907470703125, _349);
    float _359 = fma(_287, 0.20999999344348907470703125, _351);
    float _361 = fma(_283, 0.20999999344348907470703125, _353);
    float _363 = _80 * _311;
    float _365 = _80 * _317;
    float _367 = _80 * _323;
    float _369 = _357 + _363;
    float _371 = _359 + _365;
    float _373 = _361 + _367;
    float _375 = _80 * _335;
    float _377 = _207 * _369;
    float _379 = _209 * _371;
    float _381 = _205 * _373;
    float _383 = 0.0 + _159;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = _80 * _329;
    float _389 = _80 * _341;
    float _391 = _80 * _347;
    float _393 = fma(_381, _375, _387);
    float _395 = fma(_377, _375, _389);
    float _397 = fma(_379, _375, _391);
    float _399 = _387;
    if (!_355)
    {
        _399 = _385;
    }
    float _401 = _399;
    bool _403 = !_355;
    float _405 = _401;
    if (!_403)
    {
        float _407 = in.m_59.w;
        float _409 = gl_FragCoord.w;
        float _411 = _407 * _409;
        float _413 = in.m_59.z;
        float _415 = gl_FragCoord.w;
        float _417 = _413 * _415;
        float _419 = _80 * _411;
        float _421 = _80 * _417;
        float _423 = 1.0 / _419;
        float _425 = _421 * _423;
        float _427 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _429 = fma(_425, (*spvDescriptorSet0.fp_c8)._m0[30].w, _427);
        float _431 = 1.0 / _429;
        float _433 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _435 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _437 = fma(_431, _433, _435);
        float _439 = _437 * 8.0;
        float _441 = precise::clamp(_439, 0.0, 1.0);
        float _443 = _385 * _441;
        _405 = _443;
    }
    float _445 = _405;
    float _447 = 0.0 + _445;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    out.m_47.x = _393;
    out.m_47.y = _395;
    out.m_47.z = _397;
    out.m_47.w = _449;
    return out;
}

