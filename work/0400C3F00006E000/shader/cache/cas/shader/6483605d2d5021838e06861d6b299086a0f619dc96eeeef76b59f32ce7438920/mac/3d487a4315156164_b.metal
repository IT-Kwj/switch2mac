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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_40.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _70;
    float _98 = _96 * _76;
    float _100 = _96 * _82;
    float _102 = _96 * _88;
    float _104 = _96 * _94;
    float2 _598 = float2(_98, _100);
    float4 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_598, float2(0.0), isnan(_598))).xyzw;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float _115 = _107.w;
    float2 _617 = float2(_102, _104);
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_617, float2(0.0), isnan(_617))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float _127 = in.m_42.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_42.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_42.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_44.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_44.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_44.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_46.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _96 * _131;
    float _171 = _96 * _137;
    float _173 = _96 * _143;
    float _175 = _169 * _169;
    float _177 = fma(_171, _171, _175);
    float _179 = _96 * _149;
    float _181 = fma(_173, _173, _177);
    float _183 = rsqrt(_181);
    float _185 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _187 = _185 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _189 = _96 * _155;
    float _191 = 1.0 / _187;
    float _193 = _169 * _183;
    float _195 = _171 * _183;
    float _197 = _173 * _183;
    float _199 = _96 * _161;
    float _201 = _179 * _193;
    float _203 = fma(_189, _195, _201);
    float _205 = in.m_48.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = fma(_199, _197, _203);
    float _213 = abs(_211);
    float _215 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _217 = _213 + _215;
    float _219 = _217 * _191;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = fma(_221, -2.0, 3.0);
    float _225 = _221 * _221;
    float _227 = _223 * _225;
    float _229 = _96 * _167;
    float _231 = in.m_50.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_46.y;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_50.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_46.z;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_50.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _96 * _247;
    float _263 = _115 * _125;
    float _265 = _96 * _209;
    float _267 = _263 * _229;
    float _269 = 0.0 + _267;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _271 * _227;
    float _275 = _273 * _265;
    bool _279 = _275 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _281 = isnan(_275);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _287 = _283 || _285;
    float _289 = in.m_46.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    if (!_287)
    {
        discard_fragment();
    }
    float _295 = _109 * _119;
    float _297 = _111 * _121;
    float _299 = _96 * _235;
    float _301 = _96 * _241;
    float _303 = _96 * _253;
    float _305 = _113 * _123;
    float _307 = -_261;
    float _309 = _301 + _307;
    float _311 = fma(_297, _309, _261);
    float _313 = _96 * _293;
    float _315 = _96 * _259;
    float _317 = -_299;
    float _319 = _313 + _317;
    float _321 = -_315;
    float _323 = _303 + _321;
    float _325 = fma(_295, _319, _299);
    float _327 = fma(_305, _323, _315);
    if (!_287)
    {
        out.m_53.x = _325;
        out.m_53.y = _311;
        out.m_53.z = _327;
        out.m_53.w = _267;
        return out;
    }
    float _329 = _179 * _179;
    float _331 = fma(_189, _189, _329);
    float _333 = in.m_55.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = fma(_199, _199, _331);
    float _341 = rsqrt(_339);
    float _343 = _189 * _341;
    float _345 = _179 * _341;
    float _347 = _199 * _341;
    float _349 = abs(_343);
    float _351 = abs(_345);
    float _353 = precise::max(_349, _351);
    float _355 = _96 * _337;
    float _357 = abs(_347);
    float _359 = precise::max(_357, _353);
    float _361 = 1.0 / _359;
    float _363 = _343 * _361;
    float _365 = _345 * _361;
    float _367 = -_361;
    float _369 = _347 * _367;
    float _371 = precise::min(_355, 1.0);
    float3 _986 = float3(_363, _365, _369);
    float3 _375 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_986, float3(0.0), isnan(_986)), level(_371)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_986, float3(0.0), isnan(_986)), level(_371)).xyz;
    float _377 = _375.x;
    float _379 = _375.y;
    float _381 = _375.z;
    float _383 = in.m_57.y;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_57.z;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_57.x;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_59.z;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_59.x;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_59.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_61.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_61.w;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_61.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_61.z;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = _96 * _387;
    float _445 = _96 * _393;
    float _447 = _96 * _399;
    bool _449 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _451 = fma(_381, 0.20999999344348907470703125, _445);
    float _453 = fma(_377, 0.20999999344348907470703125, _447);
    float _455 = fma(_379, 0.20999999344348907470703125, _443);
    float _457 = _96 * _405;
    float _459 = _96 * _411;
    float _461 = _96 * _417;
    float _463 = _451 + _457;
    float _465 = _453 + _459;
    float _467 = _455 + _461;
    float _469 = 0.0 + _275;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = _327 * _463;
    float _475 = _325 * _465;
    float _477 = _311 * _467;
    float _479 = _96 * _423;
    float _481 = _96 * _429;
    float _483 = _96 * _435;
    float _485 = _96 * _441;
    float _487 = fma(_475, _481, _479);
    float _489 = fma(_477, _481, _483);
    float _491 = fma(_473, _481, _485);
    float _493 = _479;
    if (!_449)
    {
        _493 = _471;
    }
    float _495 = _493;
    bool _497 = !_449;
    float _499 = _495;
    if (!_497)
    {
        float _501 = in.m_63.w;
        float _503 = gl_FragCoord.w;
        float _505 = _501 * _503;
        float _507 = in.m_63.z;
        float _509 = gl_FragCoord.w;
        float _511 = _507 * _509;
        float _513 = _96 * _505;
        float _515 = _96 * _511;
        float _517 = 1.0 / _513;
        float _519 = _515 * _517;
        float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _523 = fma(_519, (*spvDescriptorSet0.fp_c8)._m0[30].w, _521);
        float _525 = 1.0 / _523;
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _529 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _531 = fma(_525, _527, _529);
        float _533 = _531 * 8.0;
        float _535 = precise::clamp(_533, 0.0, 1.0);
        float _537 = _471 * _535;
        _499 = _537;
    }
    float _539 = _499;
    float _541 = 0.0 + _539;
    float _543 = precise::clamp(_541, 0.0, 1.0);
    out.m_53.x = _487;
    out.m_53.y = _489;
    out.m_53.z = _491;
    out.m_53.w = _543;
    return out;
}

