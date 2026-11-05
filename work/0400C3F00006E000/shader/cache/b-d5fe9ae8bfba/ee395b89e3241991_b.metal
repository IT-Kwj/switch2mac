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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
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
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_62 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4), flat]];
    float4 m_56 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_64 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_45.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_45.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_45.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_47.x;
    float _93 = in.m_49.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_49.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _71;
    float _107 = rint(_91);
    float _109 = precise::max(_107, 0.0);
    uint _112 = uint(_109);
    uint _114 = clamp(_112, 0u, 65535u);
    float _116 = _105 * _77;
    float _118 = _105 * _83;
    float _120 = _105 * _89;
    float _122 = _105 * _103;
    float _124 = 1.0 / _116;
    float _126 = _118 * _124;
    float _128 = _120 * _124;
    float _130 = _105 * _97;
    float2 _839 = float2(_126, _128);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_839, float2(0.0), isnan(_839))).x;
    float3 _852 = float3(_122, _130, float(int(_114)));
    float3 _856 = select(_852, float3(0.0), isnan(_852));
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _856.xy, uint(rint(_856.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _856.xy, uint(rint(_856.z))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = in.m_45.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _105 * _149;
    float _153 = in.m_51.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _151 * _124;
    float _161 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = 1.0 / _165;
    float _169 = _105 * _157;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _173 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[30].w, _171);
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _177 = _167 * _175;
    float _179 = 1.0 / _173;
    float _181 = 0.0 + _143;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _187 = -_177;
    float _189 = fma(_179, _185, _187);
    float _191 = _189 * _161;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _183 * _193;
    float _197 = _195 * _169;
    bool _201 = _197 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _203 = isnan(_197);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _209 = _205 || _207;
    float _211 = _177;
    if (!_209)
    {
        discard_fragment();
    }
    if (!_209)
    {
        out.m_54.x = _137;
        out.m_54.y = _139;
        out.m_54.z = _141;
        out.m_54.w = _143;
        return out;
    }
    float _213 = in.m_56.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_56.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_56.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = _105 * _217;
    float _233 = _105 * _223;
    float _235 = _105 * _229;
    float _237 = _231 * _231;
    float _239 = fma(_233, _233, _237);
    float _241 = fma(_235, _235, _239);
    float _243 = rsqrt(_241);
    float _245 = _231 * _243;
    float _247 = _233 * _243;
    float _249 = _235 * _243;
    float _251 = _245 * _245;
    float _253 = fma(_247, _247, _251);
    float _255 = fma(_249, _249, _253);
    float _257 = rsqrt(_255);
    float _259 = _247 * _257;
    float _261 = _245 * _257;
    float _263 = _249 * _257;
    float _265 = abs(_259);
    float _267 = abs(_261);
    float _269 = precise::max(_265, _267);
    float _271 = abs(_263);
    float _273 = precise::max(_271, _269);
    float _275 = 1.0 / _273;
    float _277 = -_275;
    float _279 = _263 * _277;
    float _281 = _259 * _275;
    float _283 = _261 * _275;
    float3 _1084 = float3(_281, _283, _279);
    float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1084, float3(0.0), isnan(_1084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1084, float3(0.0), isnan(_1084)), level(0.0)).xyz;
    float _289 = _287.x;
    float _291 = _287.y;
    float _293 = _287.z;
    float _295 = in.m_58.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_58.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_58.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_60.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_60.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = _105 * _299;
    float _327 = _105 * _305;
    float _329 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _331 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _329;
    float _333 = -_325;
    float _335 = _333 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _337 = _105 * _311;
    float _339 = -_327;
    float _341 = _339 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _343 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _345 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _343;
    float _347 = _335 * _335;
    float _349 = -_337;
    float _351 = _349 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _353 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _355 = _353 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _357 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _359 = _357 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _361 = fma(_341, _341, _347);
    float _363 = 1.0 / _345;
    float _365 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _367 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _365;
    float _369 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _371 = _369 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _373 = fma(_351, _351, _361);
    float _375 = 1.0 / _355;
    float _377 = (*spvDescriptorSet0.fp_c10)._m0[2].x * (-0.0199999995529651641845703125);
    float _379 = sqrt(_373);
    float _381 = 1.0 / _331;
    float _383 = fma(_379, 0.00999999977648258209228515625, _377);
    float _385 = 1.0 / _359;
    float _387 = floor(_383);
    float _389 = -_387;
    float _391 = _383 + _389;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _397 = _393 + _395;
    float _399 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _401 = _393 + _399;
    float _403 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _405 = _393 + _403;
    bool _407 = _393 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _409 = isnan(_393);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = _397 * _375;
    float _421 = _401 * _363;
    float _423 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _425 = _393 + _423;
    float _427 = _405 * _381;
    bool _429 = _393 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _431 = isnan(_393);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _443 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _441;
    float _445 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _447 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _445;
    float _449 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _451 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _449;
    float _453 = -_417;
    float _455 = _453 + 1.0;
    float _457 = _425 * _385;
    float _459 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _461 = _459 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _463 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _465 = _463 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _467 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _469 = _467 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _471 = _393 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _473 = isnan(_393);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = fma(_443, _421, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _485 = fma(_447, _421, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _487 = fma(_451, _421, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _489 = _439 * _455;
    bool _491 = _393 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _493 = isnan(_393);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = fma(_461, _419, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _505 = fma(_465, _419, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _507 = fma(_469, _419, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    bool _509 = _393 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _511 = isnan(_393);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_481;
    float _523 = _521 + 1.0;
    float _525 = -_439;
    float _527 = _525 + 1.0;
    float _529 = _485 * _489;
    float _531 = -_501;
    float _533 = _531 + 1.0;
    float _535 = _483 * _489;
    float _537 = _417 * _523;
    float _539 = -_519;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _545 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _543;
    float _547 = fma(_527, (*spvDescriptorSet0.fp_c9)._m0[107].y, _529);
    float _549 = _481 * _533;
    float _551 = _501 * _541;
    float _553 = fma(_545, _427, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _555 = _487 * _489;
    float _557 = fma(_527, (*spvDescriptorSet0.fp_c9)._m0[107].x, _535);
    float _559 = fma(_505, _537, _547);
    float _561 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _563 = _561 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _565 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _567 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _565;
    float _569 = fma(_367, _427, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _571 = fma(_527, (*spvDescriptorSet0.fp_c9)._m0[107].z, _555);
    float _573 = fma(_503, _537, _557);
    float _575 = fma(_553, _549, _559);
    float _577 = fma(_563, _457, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _579 = fma(_567, _427, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _581 = fma(_507, _537, _571);
    float _583 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _585 = _583 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _587 = fma(_569, _549, _573);
    float _589 = fma(_371, _457, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _591 = fma(_577, _551, _575);
    float _593 = fma(_585, _457, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _595 = fma(_579, _549, _581);
    float _597 = fma(_589, _551, _587);
    float _599 = fma(_519, (*spvDescriptorSet0.fp_c9)._m0[111].y, _591);
    float _601 = in.m_62.z;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = fma(_593, _551, _595);
    float _609 = fma(_519, (*spvDescriptorSet0.fp_c9)._m0[111].x, _597);
    float _611 = _599 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _613 = in.m_62.x;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = fma(_519, (*spvDescriptorSet0.fp_c9)._m0[111].z, _607);
    float _621 = _609 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _623 = _611 * 0.715200006961822509765625;
    float _625 = in.m_62.y;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    float _631 = _619 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _633 = in.m_64.z;
    float _635 = gl_FragCoord.w;
    float _637 = _633 * _635;
    float _639 = fma(_621, 0.2125999927520751953125, _623);
    float _641 = in.m_64.x;
    float _643 = gl_FragCoord.w;
    float _645 = _641 * _643;
    float _647 = in.m_64.y;
    float _649 = gl_FragCoord.w;
    float _651 = _647 * _649;
    float _653 = in.m_60.z;
    float _655 = gl_FragCoord.w;
    float _657 = _653 * _655;
    float _659 = fma(_631, 0.072200000286102294921875, _639);
    float _661 = in.m_60.w;
    float _663 = gl_FragCoord.w;
    float _665 = _661 * _663;
    float _667 = 1.0 / _659;
    bool _669 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _671 = _105 * _605;
    if (_669)
    {
        float _673 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _675 = _177 + _673;
        _211 = _675;
    }
    float _677 = _211;
    float _679 = _667 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _681 = precise::clamp(_679, 0.0, 1.0);
    float _683 = _105 * _323;
    float _685 = _677;
    if (_669)
    {
        float _687 = _677 * 8.0;
        float _689 = precise::clamp(_687, 0.0, 1.0);
        _685 = _689;
    }
    float _691 = _685;
    float _693 = fma(_681, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _695 = _105 * _617;
    float _697 = _105 * _637;
    float _699 = _621 * _693;
    float _701 = _611 * _693;
    float _703 = _631 * _693;
    float _705 = _105 * _645;
    float _707 = _105 * _657;
    float _709 = fma(_289, 0.20999999344348907470703125, _695);
    float _711 = _105 * _629;
    float _713 = fma(_293, 0.20999999344348907470703125, _671);
    float _715 = _105 * _651;
    float _717 = _709 + _705;
    float _719 = fma(_291, 0.20999999344348907470703125, _711);
    float _721 = _713 + _697;
    float _723 = 0.0 + _197;
    float _725 = precise::clamp(_723, 0.0, 1.0);
    float _727 = _105 * _317;
    float _729 = _719 + _715;
    float _731 = _105 * _665;
    float _733 = fma(_137, _717, _699);
    float _735 = fma(_141, _721, _703);
    float _737 = fma(_139, _729, _701);
    float _739 = _725;
    if (_669)
    {
        float _741 = _725 * _691;
        _739 = _741;
    }
    float _743 = _739;
    float _745 = fma(_733, _731, _727);
    float _747 = fma(_735, _731, _707);
    float _749 = fma(_737, _731, _683);
    float _751 = 0.0 + _743;
    float _753 = precise::clamp(_751, 0.0, 1.0);
    out.m_54.x = _745;
    out.m_54.y = _749;
    out.m_54.z = _747;
    out.m_54.w = _753;
    return out;
}

