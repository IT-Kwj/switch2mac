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
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_38.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _589 = float2(_86, _88);
    float4 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).xyzw;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = _91.w;
    float _101 = in.m_40.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_40.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_40.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_42.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_42.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_42.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_44.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _84 * _105;
    float _151 = _84 * _111;
    float _153 = _84 * _117;
    float _155 = _149 * _149;
    float _157 = fma(_151, _151, _155);
    float _159 = fma(_153, _153, _157);
    float _161 = _84 * _123;
    float _163 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _165 = _163 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _167 = _84 * _129;
    float _169 = in.m_48.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = rsqrt(_159);
    float _177 = 1.0 / _165;
    float _179 = _149 * _175;
    float _181 = _151 * _175;
    float _183 = _153 * _175;
    float _185 = _84 * _135;
    float _187 = _161 * _179;
    float _189 = fma(_167, _181, _187);
    float _191 = fma(_185, _183, _189);
    float _193 = abs(_191);
    float _195 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _197 = _193 + _195;
    float _199 = _197 * _177;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _84 * _173;
    float _205 = fma(_201, -2.0, 3.0);
    float _207 = _201 * _201;
    float _209 = _84 * _141;
    float _211 = _205 * _207;
    float _213 = in.m_46.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_50.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_50.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_44.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_44.y;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_44.z;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _84 * _223;
    float _251 = _99 * _209;
    float _253 = _84 * _147;
    float _255 = _253 * _251;
    float _257 = 0.0 + _255;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = _259 * _211;
    float _263 = _261 * _203;
    bool _267 = _263 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _269 = isnan(_263);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _275 = _271 || _273;
    float _277 = in.m_46.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_46.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_50.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    if (!_275)
    {
        discard_fragment();
    }
    float _295 = _93 * _93;
    float _297 = _95 * _95;
    float _299 = _97 * _97;
    float _301 = _84 * _281;
    float _303 = _84 * _287;
    float _305 = _84 * _217;
    float _307 = _84 * _293;
    float _309 = _84 * _229;
    float _311 = -_249;
    float _313 = _303 + _311;
    float _315 = -_307;
    float _317 = _301 + _315;
    float _319 = -_309;
    float _321 = _305 + _319;
    float _323 = fma(_297, _313, _249);
    float _325 = _84 * _235;
    float _327 = fma(_295, _317, _307);
    float _329 = fma(_299, _321, _309);
    float _331 = _84 * _241;
    float _333 = _84 * _247;
    float _335 = _327 * _325;
    float _337 = _323 * _331;
    float _339 = _329 * _333;
    if (!_275)
    {
        out.m_53.x = _335;
        out.m_53.y = _337;
        out.m_53.z = _339;
        out.m_53.w = _255;
        return out;
    }
    float _341 = _161 * _161;
    float _343 = in.m_55.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = fma(_167, _167, _341);
    float _351 = fma(_185, _185, _349);
    float _353 = rsqrt(_351);
    float _355 = _167 * _353;
    float _357 = _161 * _353;
    float _359 = _185 * _353;
    float _361 = _84 * _347;
    float _363 = abs(_355);
    float _365 = abs(_357);
    float _367 = precise::max(_363, _365);
    float _369 = precise::min(_361, 1.0);
    float _371 = abs(_359);
    float _373 = precise::max(_371, _367);
    float _375 = 1.0 / _373;
    float _377 = -_375;
    float _379 = _359 * _377;
    float _381 = _355 * _375;
    float _383 = _357 * _375;
    float3 _1011 = float3(_381, _383, _379);
    float3 _387 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1011, float3(0.0), isnan(_1011)), level(_369)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1011, float3(0.0), isnan(_1011)), level(_369)).xyz;
    float _389 = _387.x;
    float _391 = _387.y;
    float _393 = _387.z;
    float _395 = in.m_57.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_57.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_57.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_59.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_59.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_59.y;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_61.x;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_61.w;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_61.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_61.z;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = 0.0 + _263;
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = _84 * _399;
    float _461 = _84 * _405;
    float _463 = _84 * _411;
    bool _465 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _467 = fma(_389, 0.20999999344348907470703125, _461);
    float _469 = fma(_393, 0.20999999344348907470703125, _463);
    float _471 = _84 * _417;
    float _473 = _84 * _423;
    float _475 = fma(_391, 0.20999999344348907470703125, _459);
    float _477 = _84 * _429;
    float _479 = _467 + _471;
    float _481 = _469 + _473;
    float _483 = _84 * _447;
    float _485 = _475 + _477;
    float _487 = _335 * _479;
    float _489 = _339 * _481;
    float _491 = _84 * _435;
    float _493 = _84 * _441;
    float _495 = _337 * _485;
    float _497 = _84 * _453;
    float _499 = fma(_487, _493, _491);
    float _501 = fma(_495, _493, _483);
    float _503 = fma(_489, _493, _497);
    float _505 = _491;
    if (!_465)
    {
        _505 = _457;
    }
    float _507 = _505;
    bool _509 = !_465;
    float _511 = _507;
    if (!_509)
    {
        float _513 = in.m_63.w;
        float _515 = gl_FragCoord.w;
        float _517 = _513 * _515;
        float _519 = in.m_63.z;
        float _521 = gl_FragCoord.w;
        float _523 = _519 * _521;
        float _525 = _84 * _517;
        float _527 = _84 * _523;
        float _529 = 1.0 / _525;
        float _531 = _527 * _529;
        float _533 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _535 = fma(_531, (*spvDescriptorSet0.fp_c8)._m0[30].w, _533);
        float _537 = 1.0 / _535;
        float _539 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _541 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _543 = fma(_537, _539, _541);
        float _545 = _543 * 8.0;
        float _547 = precise::clamp(_545, 0.0, 1.0);
        float _549 = _457 * _547;
        _511 = _549;
    }
    float _551 = _511;
    float _553 = 0.0 + _551;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    out.m_53.x = _499;
    out.m_53.y = _501;
    out.m_53.z = _503;
    out.m_53.w = _555;
    return out;
}

