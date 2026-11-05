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
    float4 m_44 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
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
    float2 _471 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_40.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_42.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _80 * _101;
    float _111 = in.m_44.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_40.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_44.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_40.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_44.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _80 * _115;
    float _143 = _80 * _127;
    float _145 = _80 * _133;
    float _147 = _95 * _109;
    float _149 = _80 * _107;
    float _151 = 0.0 + _147;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _153 * _149;
    bool _159 = _155 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _161 = isnan(_155);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _167 = _163 || _165;
    float _169 = in.m_40.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    if (!_167)
    {
        discard_fragment();
    }
    float _175 = _80 * _173;
    float _177 = _80 * _121;
    float _179 = _80 * _139;
    float _181 = -_141;
    float _183 = _175 + _181;
    float _185 = -_143;
    float _187 = _177 + _185;
    float _189 = -_179;
    float _191 = _145 + _189;
    float _193 = fma(_89, _183, _141);
    float _195 = fma(_91, _187, _143);
    float _197 = fma(_93, _191, _179);
    if (!_167)
    {
        out.m_47.x = _193;
        out.m_47.y = _195;
        out.m_47.z = _197;
        out.m_47.w = _147;
        return out;
    }
    float _199 = in.m_49.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_49.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_49.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _80 * _203;
    float _219 = _80 * _209;
    float _221 = _80 * _215;
    float _223 = _217 * _217;
    float _225 = in.m_51.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = fma(_219, _219, _223);
    float _233 = fma(_221, _221, _231);
    float _235 = rsqrt(_233);
    float _237 = _219 * _235;
    float _239 = _217 * _235;
    float _241 = _221 * _235;
    float _243 = _80 * _229;
    float _245 = abs(_237);
    float _247 = abs(_239);
    float _249 = precise::max(_245, _247);
    float _251 = abs(_241);
    float _253 = precise::max(_251, _249);
    float _255 = 1.0 / _253;
    float _257 = _239 * _255;
    float _259 = -_255;
    float _261 = _241 * _259;
    float _263 = precise::min(_243, 1.0);
    float _265 = _237 * _255;
    float3 _733 = float3(_265, _257, _261);
    float3 _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_733, float3(0.0), isnan(_733)), level(_263)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_733, float3(0.0), isnan(_733)), level(_263)).xyz;
    float _271 = _269.x;
    float _273 = _269.y;
    float _275 = _269.z;
    float _277 = in.m_53.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_53.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_53.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_55.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_55.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_55.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_57.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_57.w;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_57.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_57.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = _80 * _281;
    float _339 = _80 * _287;
    float _341 = _80 * _293;
    bool _343 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _345 = fma(_273, 0.20999999344348907470703125, _337);
    float _347 = fma(_275, 0.20999999344348907470703125, _339);
    float _349 = fma(_271, 0.20999999344348907470703125, _341);
    float _351 = _80 * _299;
    float _353 = _80 * _305;
    float _355 = _80 * _311;
    float _357 = _345 + _351;
    float _359 = _347 + _353;
    float _361 = _349 + _355;
    float _363 = _80 * _323;
    float _365 = _195 * _357;
    float _367 = _197 * _359;
    float _369 = _193 * _361;
    float _371 = 0.0 + _155;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _80 * _317;
    float _377 = _80 * _329;
    float _379 = _80 * _335;
    float _381 = fma(_369, _363, _375);
    float _383 = fma(_365, _363, _377);
    float _385 = fma(_367, _363, _379);
    float _387 = _375;
    if (!_343)
    {
        _387 = _373;
    }
    float _389 = _387;
    bool _391 = !_343;
    float _393 = _389;
    if (!_391)
    {
        float _395 = in.m_59.w;
        float _397 = gl_FragCoord.w;
        float _399 = _395 * _397;
        float _401 = in.m_59.z;
        float _403 = gl_FragCoord.w;
        float _405 = _401 * _403;
        float _407 = _80 * _399;
        float _409 = _80 * _405;
        float _411 = 1.0 / _407;
        float _413 = _409 * _411;
        float _415 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _417 = fma(_413, (*spvDescriptorSet0.fp_c8)._m0[30].w, _415);
        float _419 = 1.0 / _417;
        float _421 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _423 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _425 = fma(_419, _421, _423);
        float _427 = _425 * 8.0;
        float _429 = precise::clamp(_427, 0.0, 1.0);
        float _431 = _373 * _429;
        _393 = _431;
    }
    float _433 = _393;
    float _435 = 0.0 + _433;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    out.m_47.x = _381;
    out.m_47.y = _383;
    out.m_47.z = _385;
    out.m_47.w = _437;
    return out;
}

