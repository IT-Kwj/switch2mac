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
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
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
    float2 _485 = float2(_80, _82);
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_485, float2(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_485, float2(0.0), isnan(_485))).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = in.m_40.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_42.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _78 * _99;
    float _109 = _93 * _107;
    float _111 = _78 * _105;
    float _113 = 0.0 + _109;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * _111;
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _123 = isnan(_117);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _129 = _125 || _127;
    if (!_129)
    {
        discard_fragment();
    }
    if (!_129)
    {
        out.m_45.x = 0.006000000052154064178466796875;
        out.m_45.y = 0.00200000009499490261077880859375;
        out.m_45.z = 0.001000000047497451305389404296875;
        out.m_45.w = _109;
        return out;
    }
    float _131 = in.m_47.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_47.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _78 * _135;
    float _151 = _78 * _141;
    float _153 = _78 * _147;
    float _155 = _149 * _149;
    float _157 = fma(_151, _151, _155);
    float _159 = fma(_153, _153, _157);
    float _161 = rsqrt(_159);
    float _163 = _151 * _161;
    float _165 = _149 * _161;
    float _167 = _153 * _161;
    float _169 = abs(_163);
    float _171 = abs(_165);
    float _173 = precise::max(_169, _171);
    float _175 = abs(_167);
    float _177 = precise::max(_175, _173);
    float _179 = 1.0 / _177;
    float _181 = -_179;
    float _183 = _167 * _181;
    float _185 = _163 * _179;
    float _187 = _165 * _179;
    float3 _648 = float3(_185, _187, _183);
    float3 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_648, float3(0.0), isnan(_648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_648, float3(0.0), isnan(_648)), level(0.0)).xyz;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float _199 = in.m_49.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_49.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_49.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_40.y;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_40.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_40.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = -_87;
    float _237 = _235 + 1.0;
    float _239 = -_89;
    float _241 = _239 + 1.0;
    float _243 = -_91;
    float _245 = _243 + 1.0;
    float _247 = in.m_51.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_53.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_53.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_53.y;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = 0.0 + _117;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _78 * _203;
    float _277 = _78 * _209;
    float _279 = _78 * _215;
    float _281 = _275 * _237;
    float _283 = _277 * _241;
    float _285 = _78 * _221;
    float _287 = _78 * _227;
    float _289 = _279 * _245;
    float _291 = _78 * _233;
    float _293 = fma(_89, _285, _283);
    float _295 = fma(_87, _287, _281);
    float _297 = in.m_51.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = fma(_91, _291, _289);
    float _305 = _293 * 0.715200006961822509765625;
    float _307 = in.m_51.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_55.w;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_55.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = fma(_295, 0.2125999927520751953125, _305);
    float _327 = in.m_55.y;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = fma(_303, 0.072200000286102294921875, _325);
    float _335 = in.m_55.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = 1.0 / _333;
    float _343 = _341 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_345, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _349 = _78 * _301;
    float _351 = _78 * _251;
    float _353 = _78 * _311;
    float _355 = _295 * _347;
    float _357 = _293 * _347;
    float _359 = _303 * _347;
    float _361 = _78 * _263;
    float _363 = _78 * _317;
    float _365 = _78 * _339;
    bool _367 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _369 = _78 * _323;
    float _371 = fma(_193, 0.20999999344348907470703125, _353);
    float _373 = fma(_195, 0.20999999344348907470703125, _349);
    float _375 = fma(_197, 0.20999999344348907470703125, _351);
    float _377 = _78 * _257;
    float _379 = _78 * _269;
    float _381 = _371 + _361;
    float _383 = _375 + _377;
    float _385 = _373 + _379;
    float _387 = fma(_381, 0.006000000052154064178466796875, _355);
    float _389 = _78 * _331;
    float _391 = fma(_383, 0.001000000047497451305389404296875, _359);
    float _393 = fma(_385, 0.00200000009499490261077880859375, _357);
    float _395 = fma(_387, _363, _369);
    float _397 = fma(_391, _363, _365);
    float _399 = fma(_393, _363, _389);
    float _401 = _365;
    if (!_367)
    {
        _401 = _273;
    }
    float _403 = _401;
    bool _405 = !_367;
    float _407 = _403;
    if (!_405)
    {
        float _409 = in.m_57.w;
        float _411 = gl_FragCoord.w;
        float _413 = _409 * _411;
        float _415 = in.m_57.z;
        float _417 = gl_FragCoord.w;
        float _419 = _415 * _417;
        float _421 = _78 * _413;
        float _423 = _78 * _419;
        float _425 = 1.0 / _421;
        float _427 = _423 * _425;
        float _429 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _431 = fma(_427, (*spvDescriptorSet0.fp_c8)._m0[30].w, _429);
        float _433 = 1.0 / _431;
        float _435 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _437 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _439 = fma(_433, _435, _437);
        float _441 = _439 * 8.0;
        float _443 = precise::clamp(_441, 0.0, 1.0);
        float _445 = _273 * _443;
        _407 = _445;
    }
    float _447 = _407;
    float _449 = 0.0 + _447;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    out.m_45.x = _395;
    out.m_45.y = _399;
    out.m_45.z = _397;
    out.m_45.w = _451;
    return out;
}

