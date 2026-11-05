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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_51 [[user(locn4), flat]];
    float4 m_49 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_45 [[user(locn7), flat]];
    float4 m_62 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_66 [[user(locn10)]];
    float4 m_64 [[user(locn11)]];
    float4 m_72 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _79 = gl_FragCoord.w;
    float _81 = in.m_45.x;
    float _83 = in.m_47.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _91 = in.m_47.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_47.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_49.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_49.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = 1.0 / _79;
    float _117 = _81 + 1.0;
    float _119 = _117 * _89;
    float _121 = rint(_81);
    float _123 = precise::max(_121, 0.0);
    uint _126 = uint(_123);
    uint _128 = clamp(_126, 0u, 65535u);
    float _130 = floor(_119);
    float _132 = _115 * _87;
    float _134 = _115 * _107;
    float _136 = 1.0 / _132;
    float _138 = -_130;
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c9)._m0[22].x, _117);
    float _142 = _115 * _95;
    float _144 = _115 * _101;
    float _146 = rint(_140);
    float _148 = precise::max(_146, 0.0);
    uint _150 = uint(_148);
    uint _152 = clamp(_150, 0u, 65535u);
    float _154 = _142 * _136;
    float _156 = _144 * _136;
    float _158 = _115 * _113;
    float2 _760 = float2(_154, _156);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_760, float2(0.0), isnan(_760))).x;
    float3 _773 = float3(_134, _158, float(int(_128)));
    float3 _777 = select(_773, float3(0.0), isnan(_773));
    float4 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _777.xy, uint(rint(_777.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _777.xy, uint(rint(_777.z))).xyzw;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = _163.w;
    float3 _794 = float3(_134, _158, float(int(_152)));
    float3 _796 = select(_794, float3(0.0), isnan(_794));
    float4 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _796.xy, uint(rint(_796.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _796.xy, uint(rint(_796.z))).xyzw;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float _181 = _173.w;
    float _183 = in.m_51.y;
    float _185 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _187 = in.m_47.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_53.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_55.w;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_57.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _183 * _185;
    float _213 = _211 * _185;
    float _215 = floor(_213);
    float _217 = _115 * _191;
    float _219 = _217 * _136;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_219, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = 1.0 / _223;
    float _227 = -_215;
    float _229 = fma(_227, (*spvDescriptorSet0.fp_c9)._m0[22].y, _211);
    float _231 = _229 + 9.9999997473787516355514526367188e-05;
    float _233 = floor(_231);
    float _235 = -_233;
    float _237 = _231 + _235;
    float _239 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _243 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _241);
    float _245 = 1.0 / _243;
    float _247 = -_171;
    float _249 = _247 + _181;
    float _251 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _253 = _225 * _251;
    float _255 = fma(_237, _249, _171);
    float _257 = _115 * _197;
    float _259 = _115 * _209;
    float _261 = -_257;
    float _263 = _255 + _261;
    float _265 = _115 * _203;
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _269 = -_253;
    float _271 = fma(_245, _267, _269);
    float _273 = _265 * _263;
    float _275 = _271 * _239;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = 0.0 + _273;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _281 * _277;
    float _285 = _283 * _259;
    bool _289 = _285 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _291 = isnan(_285);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _297 = _293 || _295;
    float _299 = in.m_53.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_55.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_53.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_55.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_53.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_55.z;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = _253;
    if (!_297)
    {
        discard_fragment();
    }
    float _337 = -_165;
    float _339 = _337 + _175;
    float _341 = -_167;
    float _343 = _341 + _177;
    float _345 = -_169;
    float _347 = _345 + _179;
    float _349 = fma(_237, _339, _165);
    float _351 = fma(_237, _343, _167);
    float _353 = fma(_237, _347, _169);
    float _355 = _349 * _349;
    float _357 = _353 * _353;
    float _359 = _115 * _303;
    float _361 = _115 * _309;
    float _363 = _115 * _315;
    float _365 = _115 * _321;
    float _367 = _115 * _327;
    float _369 = _115 * _333;
    float _371 = -_361;
    float _373 = _359 + _371;
    float _375 = -_365;
    float _377 = _363 + _375;
    float _379 = _351 * _351;
    float _381 = -_369;
    float _383 = _367 + _381;
    float _385 = fma(_355, _373, _361);
    float _387 = fma(_379, _377, _365);
    float _389 = fma(_357, _383, _369);
    if (!_297)
    {
        out.m_60.x = _385;
        out.m_60.y = _387;
        out.m_60.z = _389;
        out.m_60.w = _273;
        return out;
    }
    float _391 = in.m_62.y;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_62.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_62.z;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = _115 * _395;
    float _411 = _115 * _401;
    float _413 = _115 * _407;
    float _415 = _409 * _409;
    float _417 = in.m_64.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = fma(_411, _411, _415);
    float _425 = fma(_413, _413, _423);
    float _427 = rsqrt(_425);
    float _429 = _411 * _427;
    float _431 = _409 * _427;
    float _433 = _413 * _427;
    float _435 = _115 * _421;
    float _437 = abs(_429);
    float _439 = abs(_431);
    float _441 = precise::max(_437, _439);
    float _443 = precise::min(_435, 1.0);
    float _445 = abs(_433);
    float _447 = precise::max(_445, _441);
    float _449 = 1.0 / _447;
    float _451 = -_449;
    float _453 = _433 * _451;
    float _455 = _429 * _449;
    float _457 = _431 * _449;
    float3 _1203 = float3(_455, _457, _453);
    float3 _461 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1203, float3(0.0), isnan(_1203)), level(_443)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1203, float3(0.0), isnan(_1203)), level(_443)).xyz;
    float _463 = _461.x;
    float _465 = _461.y;
    float _467 = _461.z;
    float _469 = in.m_66.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_66.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_66.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_68.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_68.z;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_68.y;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_70.z;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_70.x;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_70.y;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_72.x;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_72.z;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_72.w;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_72.y;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    bool _547 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _549 = _115 * _473;
    float _551 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _553 = _551 + 1.0;
    float _555 = _115 * _479;
    float _557 = _115 * _485;
    float _559 = _115 * _491;
    float _561 = fma(_549, (*spvDescriptorSet0.fp_c13)._m0[0].y, _553);
    float _563 = fma(_555, (*spvDescriptorSet0.fp_c13)._m0[0].y, _553);
    float _565 = fma(_557, (*spvDescriptorSet0.fp_c13)._m0[0].y, _553);
    float _567 = _115 * _509;
    float _569 = _115 * _515;
    float _571 = _387 * _563;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = _115 * _497;
    float _577 = _389 * _565;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    float _581 = _115 * _521;
    float _583 = _575;
    if (_547)
    {
        float _585 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _587 = _253 + _585;
        _335 = _587;
    }
    float _589 = _335;
    float _591 = _385 * _561;
    float _593 = precise::clamp(_591, 0.0, 1.0);
    float _595 = _115 * _527;
    float _597 = _115 * _545;
    float _599 = _115 * _533;
    float _601 = fma(_463, 0.20999999344348907470703125, _559);
    float _603 = _115 * _503;
    float _605 = fma(_467, 0.20999999344348907470703125, _575);
    if (_547)
    {
        float _607 = _589 * 8.0;
        float _609 = precise::clamp(_607, 0.0, 1.0);
        _583 = _609;
    }
    float _611 = _583;
    float _613 = _601 + _569;
    float _615 = fma(_465, 0.20999999344348907470703125, _603);
    float _617 = _605 + _567;
    float _619 = 0.0 + _285;
    float _621 = precise::clamp(_619, 0.0, 1.0);
    float _623 = _115 * _539;
    float _625 = _615 + _581;
    float _627 = _593 * _613;
    float _629 = _579 * _617;
    float _631 = _621;
    if (_547)
    {
        float _633 = _621 * _611;
        _631 = _633;
    }
    float _635 = _631;
    float _637 = _573 * _625;
    float _639 = fma(_627, _623, _595);
    float _641 = fma(_629, _623, _599);
    float _643 = 0.0 + _635;
    float _645 = precise::clamp(_643, 0.0, 1.0);
    float _647 = fma(_637, _623, _597);
    out.m_60.x = _639;
    out.m_60.y = _647;
    out.m_60.z = _641;
    out.m_60.w = _645;
    return out;
}

