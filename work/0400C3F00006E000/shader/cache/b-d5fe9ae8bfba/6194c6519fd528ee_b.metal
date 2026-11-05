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
    float2 _477 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477))).xyzw;
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
    float _175 = _89 * _89;
    float _177 = _91 * _91;
    float _179 = _80 * _173;
    float _181 = _80 * _121;
    float _183 = _80 * _139;
    float _185 = -_141;
    float _187 = _179 + _185;
    float _189 = -_143;
    float _191 = _181 + _189;
    float _193 = -_183;
    float _195 = _145 + _193;
    float _197 = _93 * _93;
    float _199 = fma(_175, _187, _141);
    float _201 = fma(_177, _191, _143);
    float _203 = fma(_197, _195, _183);
    if (!_167)
    {
        out.m_47.x = _199;
        out.m_47.y = _201;
        out.m_47.z = _203;
        out.m_47.w = _147;
        return out;
    }
    float _205 = in.m_49.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_49.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_49.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = _80 * _209;
    float _225 = _80 * _215;
    float _227 = _80 * _221;
    float _229 = _223 * _223;
    float _231 = in.m_51.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = fma(_225, _225, _229);
    float _239 = fma(_227, _227, _237);
    float _241 = rsqrt(_239);
    float _243 = _225 * _241;
    float _245 = _223 * _241;
    float _247 = _227 * _241;
    float _249 = _80 * _235;
    float _251 = abs(_243);
    float _253 = abs(_245);
    float _255 = precise::max(_251, _253);
    float _257 = abs(_247);
    float _259 = precise::max(_257, _255);
    float _261 = 1.0 / _259;
    float _263 = _245 * _261;
    float _265 = -_261;
    float _267 = _247 * _265;
    float _269 = precise::min(_249, 1.0);
    float _271 = _243 * _261;
    float3 _748 = float3(_271, _263, _267);
    float3 _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_748, float3(0.0), isnan(_748)), level(_269)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_748, float3(0.0), isnan(_748)), level(_269)).xyz;
    float _277 = _275.x;
    float _279 = _275.y;
    float _281 = _275.z;
    float _283 = in.m_53.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_53.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_53.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_55.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_55.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_55.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_57.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_57.w;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_57.y;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_57.z;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = _80 * _287;
    float _345 = _80 * _293;
    float _347 = _80 * _299;
    bool _349 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _351 = fma(_279, 0.20999999344348907470703125, _343);
    float _353 = fma(_281, 0.20999999344348907470703125, _345);
    float _355 = fma(_277, 0.20999999344348907470703125, _347);
    float _357 = _80 * _305;
    float _359 = _80 * _311;
    float _361 = _80 * _317;
    float _363 = _351 + _357;
    float _365 = _353 + _359;
    float _367 = _355 + _361;
    float _369 = _80 * _329;
    float _371 = _201 * _363;
    float _373 = _203 * _365;
    float _375 = _199 * _367;
    float _377 = 0.0 + _155;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = _80 * _323;
    float _383 = _80 * _335;
    float _385 = _80 * _341;
    float _387 = fma(_375, _369, _381);
    float _389 = fma(_371, _369, _383);
    float _391 = fma(_373, _369, _385);
    float _393 = _381;
    if (!_349)
    {
        _393 = _379;
    }
    float _395 = _393;
    bool _397 = !_349;
    float _399 = _395;
    if (!_397)
    {
        float _401 = in.m_59.w;
        float _403 = gl_FragCoord.w;
        float _405 = _401 * _403;
        float _407 = in.m_59.z;
        float _409 = gl_FragCoord.w;
        float _411 = _407 * _409;
        float _413 = _80 * _405;
        float _415 = _80 * _411;
        float _417 = 1.0 / _413;
        float _419 = _415 * _417;
        float _421 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _423 = fma(_419, (*spvDescriptorSet0.fp_c8)._m0[30].w, _421);
        float _425 = 1.0 / _423;
        float _427 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _429 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _431 = fma(_425, _427, _429);
        float _433 = _431 * 8.0;
        float _435 = precise::clamp(_433, 0.0, 1.0);
        float _437 = _379 * _435;
        _399 = _437;
    }
    float _439 = _399;
    float _441 = 0.0 + _439;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    out.m_47.x = _387;
    out.m_47.y = _389;
    out.m_47.z = _391;
    out.m_47.w = _443;
    return out;
}

