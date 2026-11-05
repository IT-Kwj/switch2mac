#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _7485, thread const int& _7486, constant _10& support_buffer)
{
    float _7489 = as_type<float>(support_buffer._m4);
    int _7491 = _7486 + as_type<int>(_7489);
    int _7493 = 1 + _7491;
    float _7495 = support_buffer._m5[_7493].x;
    float _7497 = abs(_7495);
    bool _7499 = _7497 == 1.0;
    if (_7499)
    {
        return _7485;
    }
    float _7501 = float(_7485);
    float _7503 = _7501 / _7497;
    int _7505 = int(_7503);
    return _7505;
}

static inline __attribute__((always_inline))
int _97(thread const int& _7535, thread const int& _7536, constant _10& support_buffer)
{
    float _7539 = as_type<float>(support_buffer._m4);
    int _7541 = _7536 + as_type<int>(_7539);
    int _7543 = 1 + _7541;
    float _7545 = support_buffer._m5[_7543].x;
    bool _7547 = _7545 == 1.0;
    if (_7547)
    {
        return _7535;
    }
    float _7549 = float(_7535);
    float _7551 = _7549 * _7545;
    int _7553 = int(_7551);
    return _7553;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2095 = false;
    bool _949 = false;
    bool _723 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = in.m_48.w;
    float _105 = trunc(_101);
    int _107 = int(_105);
    float _109 = -_103;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _103;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3041 = as_type<float>(_127);
        out.gl_Position.z = _3041;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _131 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_103);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = in.m_55.x;
    float _143 = float(_107);
    float _145 = in.m_55.y;
    bool _147 = _111 >= _143;
    bool _149 = !_139;
    bool _151 = _147 || _149;
    if (_151)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _119;
    if (_151)
    {
        out.m_53.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _129 = as_type<int>(_155);
    }
    int _157 = _129;
    out.m_57.x = _141;
    out.m_57.y = _145;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3104 = as_type<float>(_157);
        out.gl_Position.z = _3104;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = in.m_59.x;
    float _161 = in.m_59.y;
    float _163 = in.m_59.z;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _167 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _169 = in.m_61.x;
    float _171 = in.m_61.y;
    float _173 = in.m_61.z;
    float _175 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = _167 * _165;
    float _195 = 0.0;
    float _197 = _165;
    float _199 = _175;
    if (!_185)
    {
        float _201 = _175 * _175;
        float _203 = _201 * 0.5;
        _195 = _203;
    }
    float _205 = _195;
    float _207 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    float _209 = _161 * _161;
    float _211 = _163 * _163;
    float _213 = _159 * _159;
    float _215 = _205;
    float _217 = _161;
    float _219 = _163;
    if (!_185)
    {
        float _221 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _221;
    }
    float _223 = _215;
    float _225 = fma(_171, _171, _209);
    float _227 = fma(_173, _173, _211);
    float _229 = fma(_169, _169, _213);
    float _231 = fma(_189, _189, _225);
    float _233 = fma(_191, _191, _227);
    float _235 = fma(_187, _187, _229);
    float _237 = sqrt(_231);
    float _239 = sqrt(_235);
    float _241 = sqrt(_233);
    bool _243 = _237 > 0.0;
    float _245 = floor(_207);
    bool _247 = _239 > 0.0;
    float _249 = 0.0;
    float _251 = 0.0;
    float _253 = _233;
    float _255 = _223;
    float _257 = _189;
    float _259 = _189;
    if (!_243)
    {
        _249 = 0.0;
        _251 = 0.0;
    }
    float _261 = _249;
    float _263 = _251;
    float _265 = 0.0;
    float _267 = _263;
    float _269 = _261;
    if (!_243)
    {
        _265 = 0.0;
    }
    float _271 = _265;
    float _273 = _231;
    float _275 = _271;
    if (_243)
    {
        float _277 = rsqrt(_231);
        _273 = _277;
    }
    float _279 = _273;
    bool _281 = _241 > 0.0;
    float _283 = 0.0;
    float _285 = 0.0;
    if (!_247)
    {
        _283 = 0.0;
        _285 = 0.0;
    }
    float _287 = _283;
    float _289 = _285;
    int _291 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _293 = _291 != 0;
    float _295 = -_245;
    float _297 = _207 + _295;
    float _299 = _207 * 6.283185482025146484375;
    float _301 = _235;
    float _303 = _299;
    float _305 = _287;
    float _307 = _289;
    if (_247)
    {
        float _309 = rsqrt(_235);
        _301 = _309;
    }
    float _311 = _301;
    float _313 = 0.0;
    if (!_247)
    {
        _313 = 0.0;
    }
    float _315 = _313;
    float _317 = _299 * 0.15915493667125701904296875;
    float _319 = _315;
    if (!_281)
    {
        _197 = 0.0;
    }
    float _321 = _197;
    float _323 = _321;
    if (!_281)
    {
        _303 = 0.0;
    }
    float _325 = _303;
    float _327 = _325;
    if (_243)
    {
        float _329 = _279 * _171;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = 1.4012984643248170709237295832899e-45;
    if (_281)
    {
        float _335 = rsqrt(_233);
        _333 = _335;
    }
    float _337 = _333;
    if (_243)
    {
        float _339 = _279 * _161;
        _269 = _339;
    }
    float _341 = _269;
    if (_243)
    {
        float _343 = _279 * _189;
        _275 = _343;
    }
    float _345 = _275;
    float _347 = _317 * 6.283185482025146484375;
    float _349 = cos(_347);
    if (!_281)
    {
        _253 = 0.0;
    }
    float _351 = _253;
    float _353 = _351;
    if (_247)
    {
        float _355 = _311 * _169;
        _319 = _355;
    }
    float _357 = _319;
    if (_247)
    {
        float _359 = _311 * _159;
        _305 = _359;
    }
    float _361 = _305;
    if (_247)
    {
        float _363 = _311 * _187;
        _307 = _363;
    }
    float _365 = _307;
    if (_281)
    {
        float _367 = _337 * _173;
        _323 = _367;
    }
    float _369 = _323;
    if (_281)
    {
        float _371 = _337 * _163;
        _353 = _371;
    }
    float _373 = _353;
    float _375 = _373;
    if (_281)
    {
        float _377 = _337 * _191;
        _327 = _377;
    }
    float _379 = _327;
    bool _381 = !_185;
    if (!_381)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _175 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _175);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _411;
    }
    float _413 = _255;
    bool _415 = !_185;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _175 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _199 = _435;
    }
    float _437 = _199;
    float _439 = in.m_65.w;
    float _441 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _443 = _297 < 0.5;
    float _445 = float(_443);
    float _447 = in.m_48.x;
    float _449 = in.m_48.y;
    float _451 = in.m_48.z;
    float _453 = fma(_349, 0.5, 0.5);
    float _455 = -_297;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = _441 * _341;
    float _461 = in.m_46.x;
    float _463 = in.m_46.y;
    float _465 = in.m_46.z;
    float _467 = -_445;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _471 = -_453;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _475 = _441 * _361;
    float _477 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _479 = _441 * _373;
    float _481 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _483 = fma(_477, _357, _475);
    float _485 = fma(_477, _331, _459);
    float _487 = fma(_477, _369, _479);
    float _489 = _477;
    float _491 = _481;
    float _493 = _483;
    if (!_185)
    {
        float _495 = _111 * _111;
        float _497 = _495 * 0.5;
        _489 = _497;
    }
    float _499 = _489;
    float _501 = fma(_481, _365, _483);
    float _503 = fma(_481, _345, _485);
    float _505 = fma(_481, _379, _487);
    if (!_185)
    {
        float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _491 = _507;
    }
    float _509 = _491;
    bool _511 = !_185;
    float _513 = _509;
    if (!_511)
    {
        float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _517 = log2(_515);
        float _519 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _521 = _519 + 1.0;
        float _523 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _525 = _111 * _517;
        float _527 = exp2(_525);
        float _529 = _523 * 0.693147182464599609375;
        float _531 = 1.0 / _529;
        float _533 = 1.0 / _521;
        float _535 = _527 + (-1.0);
        float _537 = -_535;
        float _539 = fma(_537, _531, _111);
        float _541 = _539 * _533;
        float _543 = _541 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _513 = _543;
        _493 = _541;
    }
    float _545 = _513;
    float _547 = _493;
    float _549 = fma(_437, _447, _501);
    float _551 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _555 = fma(_437, _449, _503);
    float _557 = _547;
    if (!_185)
    {
        _557 = _111;
    }
    float _559 = _557;
    bool _561 = !_185;
    float _563 = _559;
    if (!_561)
    {
        float _565 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _567 = log2(_565);
        float _569 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _571 = _569 + 1.0;
        float _573 = 1.0 / _571;
        float _575 = _111 * _567;
        float _577 = exp2(_575);
        float _579 = -_577;
        float _581 = _579 + 1.0;
        float _583 = _581 * _573;
        _563 = _583;
    }
    float _585 = _563;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _593 = _591 != 0;
    float _595 = _553 * _361;
    float _597 = _553 * _341;
    float _599 = _553 * _373;
    float _601 = fma(_437, _451, _505);
    bool _603 = !_589;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_551, _357, _595);
    float _609 = fma(_551, _331, _597);
    float _611 = fma(_551, _369, _599);
    float _613 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _615 = abs(_605);
    float _617 = fma(_549, _439, _461);
    float _619 = fma(_555, _439, _463);
    float _621 = fma(_613, _345, _609);
    float _623 = fma(_601, _439, _465);
    float _625 = fma(_613, _365, _607);
    bool _627 = !_293;
    int _629 = _627 ? 0 : 1;
    float _631 = fma(_613, _379, _611);
    float _633 = fma(_585, _449, _621);
    bool _635 = !_593;
    int _637 = _635 ? 0 : 1;
    float _639 = 1.0 / _143;
    float _641 = float(_615);
    float _643 = fma(_585, _447, _625);
    int _645 = abs(_629);
    float _647 = -_633;
    float _649 = _555 + _647;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _653 = fma(_585, _451, _631);
    int _655 = abs(_637);
    float _657 = abs(_457);
    float _659 = _641 * _657;
    float _661 = _649 * _171;
    float _663 = _649 * _161;
    float _665 = _649 * _189;
    float _667 = float(_645);
    float _669 = -_643;
    float _671 = _549 + _669;
    float _673 = fma(_671, _169, _661);
    float _675 = float(_655);
    float _677 = fma(_671, _159, _663);
    float _679 = fma(_671, _187, _665);
    float _681 = fma(_667, _473, _659);
    float _683 = -_653;
    float _685 = _601 + _683;
    float _687 = abs(_469);
    float _689 = fma(_675, _687, _681);
    float _691 = fma(_685, _173, _673);
    float _693 = fma(_685, _163, _677);
    float _695 = fma(_685, _191, _679);
    float _697 = _111 * _639;
    bool _699 = !_651;
    float _701 = _693;
    float _703 = _691;
    float _705 = _695;
    float _721;
    if (!_699)
    {
        float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _709 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _713 = _711 * _707;
        float _715 = floor(_713);
        float _717 = -_715;
        float _719 = _713 + _717;
        _721 = _719;
        _723 = true;
    }
    else
    {
        _721 = _697;
    }
    _723 = false;
    float _725 = _721;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _729 = _725 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _733 = _725 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _749 = _725 + _747;
    float _751 = 1.0 / _737;
    bool _753 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _755 = isnan(_725);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _767 = isnan(_725);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_763;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / _741;
    bool _783 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _785 = _775 * _779;
    float _787 = -_775;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _745;
    float _793 = _729 * _751;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _799;
    float _803 = _733 * _781;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _805;
    float _809 = fma(_797, _793, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _815 = fma(_807, _793, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _817 = fma(_813, _803, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _819 = _749 * _791;
    bool _821 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _823 = isnan(_725);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_801, _793, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _835 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _837 = isnan(_725);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _855 = -_831;
    float _857 = _855 + 1.0;
    float _859 = _831 * _789;
    float _861 = fma(_849, _803, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _863 = fma(_853, _803, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _865 = _845 * _857;
    float _867 = in.m_65.x;
    float _869 = in.m_65.y;
    float _871 = in.m_65.z;
    float _873 = -_845;
    float _875 = _873 + 1.0;
    float _877 = _809 * _865;
    float _879 = _833 * _865;
    float _881 = _815 * _865;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _883;
    float _887 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].x, _877);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].y, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _895;
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].z, _881);
    float _901 = fma(_885, _819, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _903 = fma(_893, _819, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _905 = fma(_897, _819, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _907 = fma(_861, _859, _887);
    float _909 = fma(_817, _859, _889);
    float _911 = fma(_863, _859, _899);
    float _913 = fma(_901, _785, _907);
    float _915 = fma(_903, _785, _909);
    float _917 = fma(_905, _785, _911);
    float _919 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].x, _913);
    float _921 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].y, _915);
    float _923 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].z, _917);
    float _925 = _919 * _867;
    float _927 = _921 * _869;
    float _929 = _923 * _871;
    bool _931 = !_783;
    float _947;
    if (!_931)
    {
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _935 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _939 = _937 * _933;
        float _941 = floor(_939);
        float _943 = -_941;
        float _945 = _939 + _943;
        _947 = _945;
        _949 = true;
    }
    else
    {
        _947 = _697;
    }
    _949 = false;
    float _951 = _947;
    int _953 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _955 = _953;
    int _957 = 0;
    int _959 = _96(_955, _957, (*spvDescriptorSet0.support_buffer));
    float _961 = _141 * 8.0;
    float _963 = in.m_67.z;
    float _965 = rint(_961);
    float _967 = _965 * 0.125;
    float _969 = precise::clamp(_967, 0.0, 1.0);
    int _971 = _959 + (-1);
    float _973 = float(_971);
    float _975 = _969 * _973;
    float _977 = trunc(_963);
    int _979 = int(_977);
    float _981 = trunc(_975);
    int _983 = int(_981);
    int _985 = _983 + 1;
    int _987 = min(_971, _985);
    int _989 = _983;
    int _991 = 0;
    int _993 = _97(_989, _991, (*spvDescriptorSet0.support_buffer));
    int _995 = _979;
    int _997 = 0;
    int _999 = _97(_995, _997, (*spvDescriptorSet0.support_buffer));
    float3 _1003 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_993, _999)), 0).xyz;
    float _1005 = _1003.x;
    float _1007 = _1003.y;
    float _1009 = _1003.z;
    int _1011 = _987;
    int _1013 = 0;
    int _1015 = _97(_1011, _1013, (*spvDescriptorSet0.support_buffer));
    int _1017 = _979;
    int _1019 = 0;
    int _1021 = _97(_1017, _1019, (*spvDescriptorSet0.support_buffer));
    float3 _1023 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1015, _1021)), 0).xyz;
    float _1025 = _1023.x;
    float _1027 = _1023.y;
    float _1029 = _1023.z;
    float _1031 = in.m_55.z;
    float _1033 = _141 * 2.0;
    float _1035 = _145 * 2.0;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1045 = floor(_1033);
    float _1047 = _619 * _171;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1059 = _1057 != 0;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1061;
    float _1065 = _689 * _925;
    float _1067 = _689 * _927;
    float _1069 = _689 * _929;
    float _1071 = 1.0 / _1039;
    float _1073 = _619 * _189;
    float _1075 = fma(_617, _169, _1047);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _1079 = _951 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1083 = _951 + _1081;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1087 = _951 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1091 = _951 + _1089;
    float _1093 = floor(_1035);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1099 = _1045 >= 0.0;
    bool _1101 = isnan(_1045);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.0);
    bool _1107 = _1103 || _1105;
    float _1109 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1111 = _1045 > 0.0;
    float _1113 = fma(_623, _173, _1075);
    float _1115 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1117 = 1.0 / _1097;
    float _1119 = _619 * _161;
    float _1121 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1123 = fma(_617, _159, _1119);
    float _1125 = fma(_617, _187, _1073);
    float _1127 = 1.0 / _1043;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1131 = _951 + _1129;
    bool _1133 = _1093 > 0.0;
    float _1135 = fma(_623, _163, _1123);
    float _1137 = _1131 * _1071;
    float _1139 = _141 + _1031;
    float _1141 = 1.0 / _1063;
    float _1143 = _141 + _145;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1145;
    bool _1149 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1151 = isnan(_951);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1165 = _1143 + (-1.0);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _1167;
    bool _1171 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1173 = isnan(_951);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = _1083 * _1127;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _1189 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1191 = 1.0 / _1169;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1195 = _951 + _1193;
    int _1197 = _1107 ? 0 : 1;
    float _1199 = _141 + (-0.5);
    bool _1201 = _1093 >= 0.0;
    bool _1203 = isnan(_1093);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    float _1211 = _1195 * _1117;
    float _1213 = _1139 + (-1.0);
    float _1215 = 1.0 / _1187;
    float _1217 = _1031 * 2.0;
    float _1219 = _145 + _1031;
    float _1221 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1223 = _1091 * _1141;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = _1219 + (-1.0);
    float _1233 = floor(_1217);
    int _1235 = _1229;
    if (!_1111)
    {
        int _1237 = ~_1197;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _1087 * _1191;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1251 = _1209 ? 0 : 1;
    float _1253 = fma(_1247, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1255 = _1079 * _1215;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1273 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1275 = log2(_1273);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1277;
    float _1281 = fma(_1267, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1283 = _1233 > 0.0;
    float _1285 = fma(_1271, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1287 = _1233 >= 0.0;
    bool _1289 = isnan(_1233);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1313;
    float _1317 = fma(_1259, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1319 = fma(_1263, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1321 = fma(_1279, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1323;
    float _1327 = fma(_1299, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    bool _1329 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _1331 = isnan(_951);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = fma(_1303, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1343 = fma(_1307, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1345 = fma(_1311, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1347 = fma(_1315, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    bool _1349 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1351 = isnan(_951);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = fma(_1325, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    bool _1363 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _1365 = isnan(_951);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _1371 = _1367 || _1369;
    float _1373 = float(_1371);
    float _1375 = -_1339;
    float _1377 = _1375 + 1.0;
    bool _1379 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1381 = isnan(_951);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -_1359;
    float _1393 = _1391 + 1.0;
    float _1395 = _111 * _1275;
    float _1397 = _1373 * _1377;
    float _1399 = fma(_1147, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1401 = _1389 * _1393;
    float _1403 = -_1389;
    float _1405 = _1403 + 1.0;
    float _1407 = exp2(_1395);
    float _1409 = _1159 * _1405;
    bool _1411 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1413 = isnan(_951);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1419 = _1415 || _1417;
    float _1421 = float(_1419);
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1425 = 1.0 + _1423;
    float _1427 = -_1159;
    float _1429 = _1427 + 1.0;
    float _1431 = -_1373;
    float _1433 = _1431 + 1.0;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1435;
    float _1439 = _1421 * _1429;
    float _1441 = 1.0 / _1425;
    float _1443 = -_1421;
    float _1445 = _1443 + 1.0;
    float _1447 = _1359 * _1433;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1449;
    float _1453 = fma(_1437, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1455 = _1181 * _1445;
    bool _1457 = !_1055;
    int _1459 = _1457 ? 0 : 1;
    float _1461 = -_1407;
    float _1463 = _1461 + 1.0;
    bool _1465 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1467 = isnan(0.0);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1473 = _1469 || _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1477 = _1475 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1479 = fma(_1451, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1481 = fma(_1163, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1483 = _1317 * _1455;
    float _1485 = _1319 * _1455;
    float _1487 = _1321 * _1455;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1493 = _1473 ? _1463 : 0.0;
    float _1495 = in.m_69.x;
    float _1497 = in.m_69.y;
    float _1499 = in.m_69.z;
    float _1501 = float(_1241);
    float _1503 = fma(_1491, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    int _1505 = ~_1251;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = _1493 * _1441;
    int _1513 = _1509;
    if (!_1133)
    {
        int _1515 = ~_1251;
        int _1517 = _1515 + 1;
        _1513 = _1517;
    }
    int _1519 = _1513;
    float _1521 = fma(_1477, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    bool _1523 = !_1059;
    int _1525 = _1523 ? 0 : 1;
    float _1527 = _145 + (-0.5);
    int _1529 = abs(_1459);
    float _1531 = -_1181;
    float _1533 = _1531 + 1.0;
    int _1535 = abs(_1525);
    float _1537 = fma(_623, _191, _1125);
    float _1539 = float(_1529);
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1483);
    float _1543 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1485);
    float _1545 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1487);
    int _1547 = _1295 ? 0 : 1;
    float _1549 = _1539 * _1501;
    float _1551 = fma(_1281, _1439, _1541);
    float _1553 = fma(_1253, _1439, _1543);
    float _1555 = fma(_1285, _1439, _1545);
    float _1557 = _1549 * (-2.0);
    int _1559 = ~_1547;
    int _1561 = _1559 + 1;
    int _1563 = _1561 + 1;
    float _1565 = fma(_1327, _1409, _1551);
    int _1567 = _1563;
    if (!_1283)
    {
        int _1569 = ~_1547;
        int _1571 = _1569 + 1;
        _1567 = _1571;
    }
    int _1573 = _1567;
    float _1575 = fma(_1557, _1497, _1497);
    bool _1577 = !_1051;
    int _1579 = _1577 ? 0 : 1;
    float _1581 = fma(_1249, _1557, _1249);
    bool _1583 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1585 = isnan(1.0);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1591 = _1587 || _1589;
    float _1593 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1575);
    float _1595 = float(_1535);
    float _1597 = fma(_1347, _1409, _1553);
    float _1599 = float(_1519);
    float _1601 = fma(_1341, _1401, _1565);
    int _1603 = abs(_1579);
    float _1605 = fma(_1361, _1409, _1555);
    bool _1607 = !_1591;
    float _1609 = _1607 ? _111 : _1511;
    float _1611 = _1595 * _1599;
    float _1613 = float(_1603);
    float _1615 = fma(_1343, _1401, _1597);
    float _1617 = float(_1573);
    float _1619 = fma(_1609, _1581, _1593);
    float _1621 = _1611 * (-2.0);
    float _1623 = fma(_1345, _1401, _1605);
    float _1625 = fma(_1399, _1447, _1601);
    float _1627 = _1613 * _1617;
    float _1629 = _1619 * 0.15915493667125701904296875;
    float _1631 = _1031 + (-0.5);
    float _1633 = fma(_1621, _1499, _1499);
    float _1635 = fma(_1221, _1621, _1221);
    float _1637 = fma(_1453, _1447, _1615);
    float _1639 = fma(_1479, _1447, _1623);
    float _1641 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1633);
    float _1643 = _1627 * (-2.0);
    float _1645 = _1629 * 6.283185482025146484375;
    float _1647 = sin(_1645);
    float _1649 = fma(_1481, _1397, _1625);
    float _1651 = fma(_1609, _1635, _1641);
    float _1653 = fma(_1643, _1495, _1495);
    float _1655 = fma(_1189, _1643, _1189);
    float _1657 = _1651 * 0.15915493667125701904296875;
    float _1659 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1653);
    float _1661 = _1629 * 6.283185482025146484375;
    float _1663 = cos(_1661);
    float _1665 = fma(_1503, _1397, _1637);
    float _1667 = fma(_1521, _1397, _1639);
    float _1669 = fma(_1609, _1655, _1659);
    float _1671 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1649);
    float _1673 = _1669 * 0.15915493667125701904296875;
    float _1675 = floor(_975);
    float _1677 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1665);
    float _1679 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].z, _1667);
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1687 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1689 = _1657 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1699 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1701 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1703 = _1657 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    out.m_71.x = _1687;
    out.m_71.y = _1695;
    out.m_71.z = _1697;
    out.m_71.w = _1693;
    float _1707 = -_1675;
    float _1709 = _975 + _1707;
    float _1711 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1673 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1721 = _1663 * _1691;
    float _1723 = _1647 * _1691;
    float _1725 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1727 = _1673 * 6.283185482025146484375;
    float _1729 = sin(_1727);
    float _1731 = _1647 * _1705;
    float _1733 = _1663 * _1705;
    out.m_73.x = _1725;
    out.m_73.y = _1711;
    out.m_73.z = _1713;
    float _1735 = _1717 * _1647;
    float _1737 = _1717 * _1705;
    float _1739 = in.m_63.w;
    float _1741 = _1717 * _1691;
    float _1743 = _1717 * _1663;
    float _1745 = fma(_1729, _1723, _1733);
    float _1747 = fma(_1729, _1733, _1723);
    float _1749 = -_1731;
    float _1751 = fma(_1729, _1721, _1749);
    float _1753 = -_1005;
    float _1755 = _1753 + _1025;
    float _1757 = -_1007;
    float _1759 = _1757 + _1027;
    float _1761 = -_1009;
    float _1763 = _1761 + _1029;
    float _1765 = -_1721;
    float _1767 = fma(_1729, _1731, _1765);
    float _1769 = fma(_1709, _1755, _1005);
    float _1771 = fma(_1709, _1759, _1007);
    float _1773 = fma(_1709, _1763, _1009);
    float _1775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1769);
    float _1777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1771);
    float _1779 = in.m_61.w;
    bool _1781 = _1771 != 0.0;
    bool _1783 = isnan(_1771);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(0.0);
    bool _1789 = _1785 || _1787;
    float _1791 = _1115 * _1775;
    float _1793 = _1109 * _1777;
    float _1795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1773);
    bool _1797 = _1769 == 0.0;
    bool _1799 = !_1789;
    bool _1801 = _1797 && _1799;
    float _1803 = _1737 * _1793;
    float _1805 = _1767 * _1793;
    float _1807 = _1121 * _1795;
    float _1809 = _1747 * _1793;
    float _1811 = fma(_1741, _1791, _1803);
    float _1813 = fma(_1745, _1791, _1805);
    float _1815 = in.m_59.w;
    float _1817 = fma(_1751, _1791, _1809);
    float _1819 = -_1729;
    float _1821 = fma(_1819, _1807, _1811);
    float _1823 = fma(_1735, _1807, _1813);
    bool _1825 = _1773 == 0.0;
    bool _1827 = _1825 && _1801;
    float _1829 = fma(_1743, _1807, _1817);
    float _1831 = _1821 * _331;
    float _1833 = _1821 * _345;
    float _1835 = _1537 + _1739;
    float _1837 = _1821 * _341;
    float _1839 = fma(_1823, _357, _1831);
    float _1841 = fma(_1823, _365, _1833);
    float _1843 = _1113 + _1779;
    float _1845 = fma(_1823, _361, _1837);
    float _1847 = fma(_1829, _369, _1839);
    float _1849 = fma(_1829, _379, _1841);
    float _1851 = fma(_1829, _373, _1845);
    float _1853 = _1843 + _1847;
    float _1855 = _1835 + _1849;
    float _1857 = in.m_75.x;
    float _1859 = in.m_75.y;
    float _1861 = in.m_75.z;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1865 = _1853 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1869 = _1855 + _1867;
    float _1871 = _1135 + _1815;
    float _1873 = _1865 * _1865;
    float _1875 = _1869 * _1869;
    float _1877 = _1871 + _1851;
    float _1879 = _1873 + _1875;
    float _1881 = sqrt(_1879);
    float _1883 = _1859;
    float _1885 = _1857;
    float _1887 = _1845;
    float _1889 = _1767;
    float _1891 = _1747;
    float _1893 = _1771;
    float _1895 = _1861;
    float _1897 = _1773;
    if (!_1827)
    {
        float _1899 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _1883 = _1899;
    }
    float _1901 = _1883;
    float _1903 = _1901;
    if (!_1827)
    {
        float _1905 = fma(_1769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _1885 = _1905;
    }
    float _1907 = _1885;
    float _1909 = _1737 * _1901;
    float _1911 = _1767 * _1901;
    bool _1913 = _1881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1915 = _1747 * _1901;
    float _1917 = fma(_1741, _1907, _1909);
    float _1919 = _1881;
    if (!_1913)
    {
        _1887 = _1875;
    }
    float _1921 = _1887;
    float _1923 = _1921;
    if (!_1913)
    {
        _1903 = _1873;
    }
    float _1925 = _1903;
    float _1927 = _1925;
    if (!_1913)
    {
        _1889 = _1853;
    }
    float _1929 = _1889;
    float _1931 = _1929;
    if (!_1913)
    {
        _1891 = _1855;
    }
    float _1933 = _1891;
    float _1935 = _1933;
    if (!_1913)
    {
        _1893 = _1877;
    }
    float _1937 = _1893;
    bool _1939 = !_1913;
    float _1941 = _1937;
    if (!_1939)
    {
        float _1943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1947 = _1881 + _1945;
        float _1949 = rsqrt(_1879);
        float _1951 = _1947 * _1943;
        float _1953 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1955 = _1951 * 0.15915493667125701904296875;
        float _1957 = _1955 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = _1955 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = fma(_1959, _1953, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1967 = _1949 * _1965;
        float _1969 = _1963 + (-1.0);
        float _1971 = fma(_1865, _1967, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1973 = fma(_1869, _1967, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1975 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1979 = _1971 + _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1983 = _1973 + _1981;
        float _1985 = fma(_1877, _1963, _1975);
        float _1987 = _1979 * _1979;
        float _1989 = _1983 * _1983;
        _1941 = _1985;
        _1927 = _1987;
        _1923 = _1989;
        _1931 = _1971;
        _1935 = _1973;
        _1919 = _1983;
    }
    float _1991 = _1941;
    float _1993 = _1927;
    float _1995 = _1923;
    float _1997 = _1931;
    float _1999 = _1935;
    float _2001 = _1919;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2005 = _1991 + _2003;
    if (!_1827)
    {
        float _2007 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1861);
        _1895 = _2007;
    }
    float _2009 = _1895;
    float _2011 = fma(_1745, _1907, _1911);
    float _2013 = fma(_1751, _1907, _1915);
    float _2015 = fma(_2005, _2005, _1993);
    float _2017 = -_1729;
    float _2019 = fma(_2017, _2009, _1917);
    float _2021 = fma(_1735, _2009, _2011);
    float _2023 = fma(_1743, _2009, _2013);
    float _2025 = _2015 + _1995;
    float _2027 = _2019 * _331;
    float _2029 = _2019 * _341;
    float _2031 = _2019 * _345;
    float _2033 = fma(_2021, _357, _2027);
    float _2035 = sqrt(_2025);
    float _2037 = fma(_2021, _361, _2029);
    float _2039 = fma(_2021, _365, _2031);
    float _2041 = fma(_2023, _369, _2033);
    float _2043 = fma(_2023, _373, _2037);
    float _2045 = fma(_2023, _379, _2039);
    out.m_77.x = _2041;
    out.m_77.y = _2043;
    out.m_77.z = _2045;
    bool _2047 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2049 = isnan(_2035);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2055 = _2051 || _2053;
    float _2057 = _2021;
    float _2059 = _2035;
    if (!_2055)
    {
        _1897 = 1.0;
    }
    float _2061 = _1897;
    bool _2063 = !_2055;
    float _2065 = _2061;
    if (!_2063)
    {
        bool _2067 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2069 = isnan(_2035);
        bool _2071 = _2067 || _2069;
        bool _2073 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2075 = _2071 || _2073;
        if (!_2075)
        {
            float _2077 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2079 = _2035 + _2077;
            float _2081 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2083 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2089 = 1.0 / _2083;
            float _2091 = _2079 * _2089;
            float _2093 = fma(_2091, _2087, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2065 = _2093;
            _2095 = true;
        }
        else
        {
            bool _2097 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2099 = isnan(_2035);
            bool _2101 = _2097 || _2099;
            bool _2103 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2105 = _2101 || _2103;
            if (!_2105)
            {
                float _2107 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2109 = _2035 + _2107;
                float _2111 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2113 = _2111 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2115 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2117 = _2115 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2119 = 1.0 / _2113;
                float _2121 = _2109 * _2119;
                float _2123 = fma(_2121, _2117, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2065 = _2123;
                _2095 = true;
            }
            else
            {
                _2065 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2095 = false;
    float _2125 = _2065;
    float _2127 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2129 = _1991 + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2133 = _1997 + _2131;
    float _2135 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2137 = _1999 + _2135;
    float _2139 = fma(_2129, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2141 = fma(_2133, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2143 = fma(_2137, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2145 = -_1871;
    float _2147 = _2145 + _2139;
    float _2149 = -_1843;
    float _2151 = _2149 + _2141;
    float _2153 = -_1835;
    float _2155 = _2153 + _2143;
    float _2157 = _2147 * _2147;
    float _2159 = fma(_2151, _2151, _2157);
    float _2161 = fma(_2155, _2155, _2159);
    float _2163 = sqrt(_2161);
    bool _2165 = _2163 > 0.0;
    bool _2167 = !_2165;
    float _2169 = _2163;
    float _2171 = _2141;
    float _2173 = _2139;
    float _2175 = _2143;
    if (!_2167)
    {
        bool _2177 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2179 = _2001;
        if (_2177)
        {
            float _2181 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2179 = _2181;
        }
        float _2183 = _2179;
        if (_2177)
        {
            float _2185 = _691 * _2183;
            _2057 = _2185;
        }
        float _2187 = _2057;
        float _2189 = _2187;
        if (_2177)
        {
            float _2191 = _693 * _2183;
            _2059 = _2191;
        }
        float _2193 = _2059;
        float _2195 = _2193;
        if (_2177)
        {
            float _2197 = _695 * _2183;
            _2169 = _2197;
        }
        float _2199 = _2169;
        float _2201 = _2199;
        float _2203 = _2199;
        if (!_2177)
        {
            float _2205 = _111 + 1.0;
            if (!_185)
            {
                float _2207 = _2205 * _2205;
                float _2209 = _2207 * 0.5;
                _2201 = _2209;
            }
            float _2211 = _2201;
            float _2213 = _2211;
            if (!_185)
            {
                float _2215 = _2211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2213 = _2215;
            }
            float _2217 = _2213;
            bool _2219 = !_185;
            float _2221 = _2217;
            if (!_2219)
            {
                float _2223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2225 = log2(_2223);
                float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2229 = _2227 + 1.0;
                float _2231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2233 = _2225 * _2205;
                float _2235 = 1.0 / _2229;
                float _2237 = _2231 * 0.693147182464599609375;
                float _2239 = exp2(_2233);
                float _2241 = 1.0 / _2237;
                float _2243 = _2239 + (-1.0);
                float _2245 = -_2243;
                float _2247 = fma(_2245, _2241, _2205);
                float _2249 = _2247 * _2235;
                float _2251 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2221 = _2251;
            }
            float _2253 = _2221;
            float _2255 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2257 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2259 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2261 = _2255 * _341;
            float _2263 = _2255 * _361;
            float _2265 = fma(_2257, _331, _2261);
            float _2267 = _2255 * _373;
            float _2269 = fma(_2257, _357, _2263);
            if (!_185)
            {
                _375 = _2205;
            }
            float _2271 = _375;
            float _2273 = fma(_2259, _345, _2265);
            bool _2275 = !_185;
            float _2277 = _2271;
            if (!_2275)
            {
                float _2279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2281 = log2(_2279);
                float _2283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2285 = _2283 + 1.0;
                float _2287 = 1.0 / _2285;
                float _2289 = _2281 * _2205;
                float _2291 = exp2(_2289);
                float _2293 = -_2291;
                float _2295 = _2293 + 1.0;
                float _2297 = _2295 * _2287;
                _2277 = _2297;
            }
            float _2299 = _2277;
            float _2301 = fma(_2259, _365, _2269);
            float _2303 = fma(_2257, _369, _2267);
            float _2305 = fma(_2299, _449, _2273);
            float _2307 = fma(_2299, _447, _2301);
            float _2309 = fma(_2259, _379, _2303);
            float _2311 = -_633;
            float _2313 = _2311 + _2305;
            float _2315 = -_643;
            float _2317 = _2315 + _2307;
            float _2319 = fma(_2299, _451, _2309);
            float _2321 = _2313 * _171;
            float _2323 = _2313 * _161;
            float _2325 = _2313 * _189;
            float _2327 = -_653;
            float _2329 = _2327 + _2319;
            float _2331 = fma(_2317, _169, _2321);
            float _2333 = fma(_2317, _159, _2323);
            float _2335 = fma(_2317, _187, _2325);
            float _2337 = fma(_2329, _173, _2331);
            float _2339 = fma(_2329, _163, _2333);
            float _2341 = fma(_2329, _191, _2335);
            _701 = _2339;
            _703 = _2337;
            _705 = _2341;
            _2189 = _2337;
            _2195 = _2339;
            _2203 = _2341;
            _257 = _2335;
        }
        float _2343 = _701;
        float _2345 = _703;
        float _2347 = _705;
        float _2349 = _2189;
        float _2351 = _2195;
        float _2353 = _2203;
        float _2355 = _257;
        float _2357 = _2343 * _2343;
        float _2359 = rsqrt(_2161);
        float _2361 = fma(_2345, _2345, _2357);
        float _2363 = fma(_2347, _2347, _2361);
        float _2365 = sqrt(_2363);
        float _2367 = _2151 * _2359;
        float _2369 = _2147 * _2359;
        float _2371 = _2155 * _2359;
        bool _2373 = _2365 > 0.0;
        bool _2375 = !_2373;
        _217 = _2361;
        _259 = _2355;
        if (!_2375)
        {
            float _2377 = rsqrt(_2363);
            float _2379 = _2377 * _2343;
            float _2381 = _2377 * _2345;
            float _2383 = _2377 * _2347;
            float _2385 = _2369 * _2379;
            float _2387 = fma(_2367, _2381, _2385);
            float _2389 = fma(_2371, _2383, _2387);
            float _2391 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2393 = fma(_2349, _2391, _2141);
            float _2395 = fma(_2351, _2391, _2139);
            float _2397 = fma(_2353, _2391, _2143);
            _2171 = _2393;
            _2173 = _2395;
            _2175 = _2397;
            _217 = _2383;
            _219 = _2379;
        }
    }
    float _2399 = _2171;
    float _2401 = _2173;
    float _2403 = _2175;
    float _2405 = _217;
    float _2407 = _219;
    float _2409 = _259;
    bool _2411 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.5);
    bool _2419 = _2415 || _2417;
    float _2421 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2423 = _2405;
    float _2425 = _2407;
    float _2427 = _2409;
    float _2429 = _2399;
    if (_2419)
    {
        _2421 = _2399;
    }
    float _2431 = _2421;
    float _2433 = _2431;
    if (_2419)
    {
        _2423 = _2401;
    }
    float _2435 = _2423;
    float _2437 = _2435;
    if (_2419)
    {
        _2425 = _2403;
    }
    float _2439 = _2425;
    float _2441 = _2439;
    if (!_2419)
    {
        float _2443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2445 = _1871 + _2443;
        float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2449 = _1843 + _2447;
        float _2451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2453 = -_1871;
        float _2455 = _2453 + _2401;
        float _2457 = _2445 * _2445;
        float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2461 = _1835 + _2459;
        float _2463 = -_1835;
        float _2465 = _2463 + _2403;
        float _2467 = fma(_2449, _2449, _2457);
        float _2469 = fma(_2461, _2461, _2467);
        float _2471 = -_1843;
        float _2473 = _2471 + _2399;
        float _2475 = sqrt(_2469);
        float _2477 = precise::min(_2475, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2479 = _2477 * _2451;
        float _2481 = fma(_2473, _2479, _1843);
        float _2483 = fma(_2455, _2479, _1871);
        float _2485 = fma(_2465, _2479, _1835);
        _2437 = _2483;
        _2433 = _2481;
        _2441 = _2485;
    }
    float _2487 = _2437;
    float _2489 = _2433;
    float _2491 = _2441;
    float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2495 = _2487 + _2493;
    float _2497 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2499 = _2489 + _2497;
    float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2503 = _2491 + _2501;
    float _2505 = _2495 * _2495;
    float _2507 = fma(_2499, _2499, _2505);
    float _2509 = fma(_2503, _2503, _2507);
    float _2511 = rsqrt(_2509);
    float _2513 = sqrt(_2509);
    float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2517 = _2499 * _2515;
    float _2519 = _2503 * _2515;
    float _2521 = _2517 * _2517;
    float _2523 = _2519 * _2519;
    float _2525 = _2521 + _2523;
    float _2527 = sqrt(_2525);
    bool _2529 = _2527 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = _2527 + _2531;
    float _2535 = _2511;
    float _2537 = _2533;
    float _2539 = _2495;
    float _2541 = _2515;
    if (_2529)
    {
        float _2543 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2535 = _2543;
    }
    float _2545 = _2535;
    float _2547 = _2545;
    if (_2529)
    {
        float _2549 = _2533 * _2545;
        _2537 = _2549;
    }
    float _2551 = _2537;
    if (_2529)
    {
        float _2553 = rsqrt(_2525);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = _2555;
    if (_2529)
    {
        float _2559 = _2551 * 0.15915493667125701904296875;
        _2427 = _2559;
    }
    float _2561 = _2427;
    float _2563 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2565 = _2503;
    float _2567 = _2561;
    if (_2529)
    {
        float _2569 = _2561 * 6.283185482025146484375;
        float _2571 = sin(_2569);
        _2565 = _2571;
    }
    float _2573 = _2565;
    float _2575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2577 = precise::max(0.0, _2563);
    float _2579 = _187;
    float _2581 = _2577;
    if (_2529)
    {
        float _2583 = _2561 * 6.283185482025146484375;
        float _2585 = cos(_2583);
        _2579 = _2585;
    }
    float _2587 = _2579;
    float _2589 = -_2515;
    float _2591 = -_2577;
    float _2593 = fma(_2495, _2589, _2591);
    if (_2529)
    {
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2539 = _2595;
    }
    float _2597 = _2539;
    float _2599 = _2573;
    float _2601 = _2597;
    if (_2529)
    {
        float _2603 = fma(_2573, _2597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2599 = _2603;
    }
    float _2605 = _2599;
    float _2607 = _2605;
    if (!_2529)
    {
        _2601 = _2519;
    }
    float _2609 = _2601;
    float _2611 = _2609;
    if (!_2529)
    {
        _2567 = _2521;
    }
    float _2613 = _2567;
    float _2615 = _2613;
    if (_2529)
    {
        float _2617 = _2555 * _2605;
        _2429 = _2617;
    }
    float _2619 = _2429;
    if (!_2529)
    {
        _2557 = _2517;
    }
    float _2621 = _2557;
    float _2623 = _2621;
    if (_2529)
    {
        float _2625 = _2587 + (-1.0);
        _2581 = _2625;
    }
    float _2627 = _2581;
    float _2629 = _2627;
    if (_2529)
    {
        float _2631 = _2517 * _2619;
        _2623 = _2631;
    }
    float _2633 = _2623;
    if (!_2529)
    {
        _2607 = _2593;
    }
    float _2635 = _2607;
    float _2637 = _2635;
    if (_2529)
    {
        float _2639 = _2519 * _2619;
        _2611 = _2639;
    }
    float _2641 = _2611;
    if (_2529)
    {
        float _2643 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2541 = _2643;
    }
    float _2645 = _2541;
    if (_2529)
    {
        float _2647 = _2633 * _2633;
        _2615 = _2647;
    }
    float _2649 = _2615;
    if (!_2529)
    {
        _2629 = _2523;
    }
    float _2651 = _2629;
    float _2653 = _2651;
    if (_2529)
    {
        float _2655 = _2641 * _2641;
        _2653 = _2655;
    }
    float _2657 = _2653;
    if (_2529)
    {
        float _2659 = fma(_2593, _2587, _2645);
        _2637 = _2659;
    }
    float _2661 = _2637;
    float _2663 = fma(_2661, _2661, _2649);
    float _2665 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2669 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2667);
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2675 = _2663 + _2657;
    float _2677 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2665);
    float _2679 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2681 = -_2671;
    float _2683 = _2681 + 1.0;
    float _2685 = rsqrt(_2675);
    float _2687 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2677);
    float _2689 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2691 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2679);
    float _2693 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2673);
    float _2695 = _2687 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2697 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2689);
    float _2699 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2691);
    float _2701 = abs(_2683);
    float _2703 = log2(_2701);
    float _2705 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2693);
    float _2707 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2697);
    float _2709 = _2699 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2711 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2713 = _2705 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2715 = _2707 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2717 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2719 = _2685 * _2633;
    float _2721 = _2685 * _2661;
    float _2723 = _2685 * _2641;
    float _2725 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2717);
    float _2727 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2729 = -_2711;
    float _2731 = fma(_2729, _2575, 1.0);
    float _2733 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2725);
    float _2735 = -_2727;
    float _2737 = fma(_2721, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2735);
    float _2739 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2741 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2743 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2733);
    float _2745 = -_2723;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2737);
    float _2749 = log2(_2731);
    float _2751 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2753 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2741);
    float _2755 = fma(_2747, -0.5, 0.5);
    float _2757 = fma(_2747, 0.5, 0.5);
    float _2759 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2751);
    float _2761 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2753);
    float _2763 = _2721 + 1.0;
    float _2765 = exp2(_2739);
    float _2767 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2759);
    float _2769 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2767);
    float _2771 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2761);
    float _2773 = 1.0 / _2743;
    float _2775 = fma(_2757, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2777 = _2749 * 0.693147182464599609375;
    float _2779 = fma(_2757, _2775, -0.212114393711090087890625);
    float _2781 = _2777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2783 = sqrt(_2755);
    float _2785 = -_2721;
    float _2787 = fma(_2765, _2763, _2785);
    float _2789 = fma(_2757, _2779, 1.570728778839111328125);
    float _2791 = fma(_2787, 0.5, 0.5);
    float _2793 = _2769 * _2773;
    float _2795 = _2771 * _2773;
    float _2797 = fma(_2793, 0.5, 0.5);
    float _2799 = fma(_2795, -0.5, 0.5);
    float _2801 = _2783 * 0.636619746685028076171875;
    float3 _7157 = float3(_2797, _2799, _2781);
    float _2803 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7157, float3(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7157, float3(0.0), isnan(_7157)), level(0.0)).x;
    float3 _7168 = float3(_2797, _2799, _2781);
    float4 _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7168, float3(0.0), isnan(_7168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7168, float3(0.0), isnan(_7168)), level(0.0)).xyzw;
    float _2808 = _2806.x;
    float _2810 = _2806.y;
    float _2812 = _2806.z;
    float _2814 = _2806.w;
    float _2816 = -_2789;
    float _2818 = fma(_2801, _2816, 1.0);
    float2 _7190 = float2(_2818, _2791);
    float3 _2820 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7190, float2(0.0), isnan(_7190)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7190, float2(0.0), isnan(_7190)), level(0.0)).xyz;
    float _2822 = _2820.x;
    float _2824 = _2820.y;
    float _2826 = _2820.z;
    float _2828 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2830 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2832 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2489;
    out.m_79.y = _2487;
    out.m_79.z = _2491;
    float _2834 = fma(_1843, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2828);
    float _2836 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2838 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2832);
    float _2840 = exp2(_2830);
    float _2842 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2834);
    float _2844 = fma(_1843, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2836);
    float _2846 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2838);
    float _2848 = _2842 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2850 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2844);
    float _2852 = 1.0 / _2848;
    bool _2854 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2858 = _2854 || _2856;
    bool _2860 = isnan(0.5);
    bool _2862 = _2858 || _2860;
    float _2864 = _2850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2866 = _2864 + _2848;
    float _2868 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2870 = _2866;
    float _2872 = _2801;
    float _2874 = _2715;
    if (!_2862)
    {
        _2868 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2876 = _2868;
    float _2878 = _2866 * _2852;
    float _2880 = _2878 * 0.5;
    float _2882 = _2880;
    float _2884 = _2876;
    if (!_2862)
    {
        _2870 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2886 = _2870;
    if (!_2862)
    {
        float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2890 = fma(_2880, _2876, _2888);
        _2882 = _2890;
    }
    float _2892 = _2882;
    if (_2862)
    {
        _2884 = 1.0;
    }
    float _2894 = _2884;
    float _2896 = _2894;
    if (!_2862)
    {
        float _2898 = -_2886;
        float _2900 = _2898 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2872 = _2900;
    }
    float _2902 = _2872;
    float _2904 = _2892;
    if (!_2862)
    {
        float _2906 = 1.0 / _2892;
        _2904 = _2906;
    }
    float _2908 = _2904;
    float _2910 = _2902;
    if (!_2862)
    {
        float _2912 = 1.0 / _2902;
        _2910 = _2912;
    }
    float _2914 = _2910;
    if (!_2862)
    {
        float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2918 = -_2886;
        float _2920 = fma(_2908, _2916, _2918);
        _2874 = _2920;
    }
    float _2922 = _2874;
    float _2924 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2846);
    float _2926 = -_2840;
    float _2928 = _2926 + 1.0;
    float _2930 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2769;
    out.gl_Position.y = _2771;
    out.gl_Position.z = _2924;
    out.gl_Position.w = _2743;
    if (!_2862)
    {
        float _2932 = _2922 * _2914;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        _2896 = _2934;
    }
    float _2936 = _2896;
    float _2938 = _2924 + _2743;
    float _2940 = _2936 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2942 = _2936 > 0.0;
    bool _2944 = isnan(_2936);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan(0.0);
    bool _2950 = _2946 || _2948;
    float _2952 = _2938 * 0.5;
    float _2954 = _2940 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.z = _2952;
    out.m_81.w = _2743;
    out.m_53.x = _2954;
    float _2956 = _2930 * _2803;
    float _2958 = -_2930;
    float _2960 = _2958 + 1.0;
    float _2962 = _2814 * _2956;
    float _2964 = _2826 * _2956;
    float _2966 = fma(_2822, _2962, _2808);
    float _2968 = fma(_2824, _2962, _2810);
    float _2970 = _2814 * _2960;
    float _2972 = fma(_2814, _2964, _2812);
    out.m_83.x = _2966;
    out.m_83.y = _2968;
    out.m_83.z = _2972;
    out.m_83.w = _2970;
    if (_2950)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2974;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2095 = false;
    bool _949 = false;
    bool _723 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = in.m_48.w;
    float _105 = trunc(_101);
    int _107 = int(_105);
    float _109 = -_103;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _103;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3041 = as_type<float>(_127);
        out.gl_Position.z = _3041;
    }
    if (!_115)
    {
        return out;
    }
    bool _131 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_103);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = in.m_55.x;
    float _143 = float(_107);
    float _145 = in.m_55.y;
    bool _147 = _111 >= _143;
    bool _149 = !_139;
    bool _151 = _147 || _149;
    if (_151)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _119;
    if (_151)
    {
        out.m_53.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _129 = as_type<int>(_155);
    }
    int _157 = _129;
    out.m_57.x = _141;
    out.m_57.y = _145;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3104 = as_type<float>(_157);
        out.gl_Position.z = _3104;
    }
    if (_151)
    {
        return out;
    }
    float _159 = in.m_59.x;
    float _161 = in.m_59.y;
    float _163 = in.m_59.z;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _167 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _169 = in.m_61.x;
    float _171 = in.m_61.y;
    float _173 = in.m_61.z;
    float _175 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = _167 * _165;
    float _195 = 0.0;
    float _197 = _165;
    float _199 = _175;
    if (!_185)
    {
        float _201 = _175 * _175;
        float _203 = _201 * 0.5;
        _195 = _203;
    }
    float _205 = _195;
    float _207 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    float _209 = _161 * _161;
    float _211 = _163 * _163;
    float _213 = _159 * _159;
    float _215 = _205;
    float _217 = _161;
    float _219 = _163;
    if (!_185)
    {
        float _221 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _221;
    }
    float _223 = _215;
    float _225 = fma(_171, _171, _209);
    float _227 = fma(_173, _173, _211);
    float _229 = fma(_169, _169, _213);
    float _231 = fma(_189, _189, _225);
    float _233 = fma(_191, _191, _227);
    float _235 = fma(_187, _187, _229);
    float _237 = sqrt(_231);
    float _239 = sqrt(_235);
    float _241 = sqrt(_233);
    bool _243 = _237 > 0.0;
    float _245 = floor(_207);
    bool _247 = _239 > 0.0;
    float _249 = 0.0;
    float _251 = 0.0;
    float _253 = _233;
    float _255 = _223;
    float _257 = _189;
    float _259 = _189;
    if (!_243)
    {
        _249 = 0.0;
        _251 = 0.0;
    }
    float _261 = _249;
    float _263 = _251;
    float _265 = 0.0;
    float _267 = _263;
    float _269 = _261;
    if (!_243)
    {
        _265 = 0.0;
    }
    float _271 = _265;
    float _273 = _231;
    float _275 = _271;
    if (_243)
    {
        float _277 = rsqrt(_231);
        _273 = _277;
    }
    float _279 = _273;
    bool _281 = _241 > 0.0;
    float _283 = 0.0;
    float _285 = 0.0;
    if (!_247)
    {
        _283 = 0.0;
        _285 = 0.0;
    }
    float _287 = _283;
    float _289 = _285;
    int _291 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _293 = _291 != 0;
    float _295 = -_245;
    float _297 = _207 + _295;
    float _299 = _207 * 6.283185482025146484375;
    float _301 = _235;
    float _303 = _299;
    float _305 = _287;
    float _307 = _289;
    if (_247)
    {
        float _309 = rsqrt(_235);
        _301 = _309;
    }
    float _311 = _301;
    float _313 = 0.0;
    if (!_247)
    {
        _313 = 0.0;
    }
    float _315 = _313;
    float _317 = _299 * 0.15915493667125701904296875;
    float _319 = _315;
    if (!_281)
    {
        _197 = 0.0;
    }
    float _321 = _197;
    float _323 = _321;
    if (!_281)
    {
        _303 = 0.0;
    }
    float _325 = _303;
    float _327 = _325;
    if (_243)
    {
        float _329 = _279 * _171;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = 1.4012984643248170709237295832899e-45;
    if (_281)
    {
        float _335 = rsqrt(_233);
        _333 = _335;
    }
    float _337 = _333;
    if (_243)
    {
        float _339 = _279 * _161;
        _269 = _339;
    }
    float _341 = _269;
    if (_243)
    {
        float _343 = _279 * _189;
        _275 = _343;
    }
    float _345 = _275;
    float _347 = _317 * 6.283185482025146484375;
    float _349 = cos(_347);
    if (!_281)
    {
        _253 = 0.0;
    }
    float _351 = _253;
    float _353 = _351;
    if (_247)
    {
        float _355 = _311 * _169;
        _319 = _355;
    }
    float _357 = _319;
    if (_247)
    {
        float _359 = _311 * _159;
        _305 = _359;
    }
    float _361 = _305;
    if (_247)
    {
        float _363 = _311 * _187;
        _307 = _363;
    }
    float _365 = _307;
    if (_281)
    {
        float _367 = _337 * _173;
        _323 = _367;
    }
    float _369 = _323;
    if (_281)
    {
        float _371 = _337 * _163;
        _353 = _371;
    }
    float _373 = _353;
    float _375 = _373;
    if (_281)
    {
        float _377 = _337 * _191;
        _327 = _377;
    }
    float _379 = _327;
    bool _381 = !_185;
    if (!_381)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _175 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _175);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _411;
    }
    float _413 = _255;
    bool _415 = !_185;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _175 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _199 = _435;
    }
    float _437 = _199;
    float _439 = in.m_65.w;
    float _441 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _443 = _297 < 0.5;
    float _445 = float(_443);
    float _447 = in.m_48.x;
    float _449 = in.m_48.y;
    float _451 = in.m_48.z;
    float _453 = fma(_349, 0.5, 0.5);
    float _455 = -_297;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = _441 * _341;
    float _461 = in.m_46.x;
    float _463 = in.m_46.y;
    float _465 = in.m_46.z;
    float _467 = -_445;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _471 = -_453;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _475 = _441 * _361;
    float _477 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _479 = _441 * _373;
    float _481 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _483 = fma(_477, _357, _475);
    float _485 = fma(_477, _331, _459);
    float _487 = fma(_477, _369, _479);
    float _489 = _477;
    float _491 = _481;
    float _493 = _483;
    if (!_185)
    {
        float _495 = _111 * _111;
        float _497 = _495 * 0.5;
        _489 = _497;
    }
    float _499 = _489;
    float _501 = fma(_481, _365, _483);
    float _503 = fma(_481, _345, _485);
    float _505 = fma(_481, _379, _487);
    if (!_185)
    {
        float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _491 = _507;
    }
    float _509 = _491;
    bool _511 = !_185;
    float _513 = _509;
    if (!_511)
    {
        float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _517 = log2(_515);
        float _519 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _521 = _519 + 1.0;
        float _523 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _525 = _111 * _517;
        float _527 = exp2(_525);
        float _529 = _523 * 0.693147182464599609375;
        float _531 = 1.0 / _529;
        float _533 = 1.0 / _521;
        float _535 = _527 + (-1.0);
        float _537 = -_535;
        float _539 = fma(_537, _531, _111);
        float _541 = _539 * _533;
        float _543 = _541 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _513 = _543;
        _493 = _541;
    }
    float _545 = _513;
    float _547 = _493;
    float _549 = fma(_437, _447, _501);
    float _551 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _555 = fma(_437, _449, _503);
    float _557 = _547;
    if (!_185)
    {
        _557 = _111;
    }
    float _559 = _557;
    bool _561 = !_185;
    float _563 = _559;
    if (!_561)
    {
        float _565 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _567 = log2(_565);
        float _569 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _571 = _569 + 1.0;
        float _573 = 1.0 / _571;
        float _575 = _111 * _567;
        float _577 = exp2(_575);
        float _579 = -_577;
        float _581 = _579 + 1.0;
        float _583 = _581 * _573;
        _563 = _583;
    }
    float _585 = _563;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _593 = _591 != 0;
    float _595 = _553 * _361;
    float _597 = _553 * _341;
    float _599 = _553 * _373;
    float _601 = fma(_437, _451, _505);
    bool _603 = !_589;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_551, _357, _595);
    float _609 = fma(_551, _331, _597);
    float _611 = fma(_551, _369, _599);
    float _613 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _615 = abs(_605);
    float _617 = fma(_549, _439, _461);
    float _619 = fma(_555, _439, _463);
    float _621 = fma(_613, _345, _609);
    float _623 = fma(_601, _439, _465);
    float _625 = fma(_613, _365, _607);
    bool _627 = !_293;
    int _629 = _627 ? 0 : 1;
    float _631 = fma(_613, _379, _611);
    float _633 = fma(_585, _449, _621);
    bool _635 = !_593;
    int _637 = _635 ? 0 : 1;
    float _639 = 1.0 / _143;
    float _641 = float(_615);
    float _643 = fma(_585, _447, _625);
    int _645 = abs(_629);
    float _647 = -_633;
    float _649 = _555 + _647;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _653 = fma(_585, _451, _631);
    int _655 = abs(_637);
    float _657 = abs(_457);
    float _659 = _641 * _657;
    float _661 = _649 * _171;
    float _663 = _649 * _161;
    float _665 = _649 * _189;
    float _667 = float(_645);
    float _669 = -_643;
    float _671 = _549 + _669;
    float _673 = fma(_671, _169, _661);
    float _675 = float(_655);
    float _677 = fma(_671, _159, _663);
    float _679 = fma(_671, _187, _665);
    float _681 = fma(_667, _473, _659);
    float _683 = -_653;
    float _685 = _601 + _683;
    float _687 = abs(_469);
    float _689 = fma(_675, _687, _681);
    float _691 = fma(_685, _173, _673);
    float _693 = fma(_685, _163, _677);
    float _695 = fma(_685, _191, _679);
    float _697 = _111 * _639;
    bool _699 = !_651;
    float _701 = _693;
    float _703 = _691;
    float _705 = _695;
    float _721;
    if (!_699)
    {
        float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _709 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _713 = _711 * _707;
        float _715 = floor(_713);
        float _717 = -_715;
        float _719 = _713 + _717;
        _721 = _719;
        _723 = true;
    }
    else
    {
        _721 = _697;
    }
    _723 = false;
    float _725 = _721;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _729 = _725 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _733 = _725 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _749 = _725 + _747;
    float _751 = 1.0 / _737;
    bool _753 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _755 = isnan(_725);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _767 = isnan(_725);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_763;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / _741;
    bool _783 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _785 = _775 * _779;
    float _787 = -_775;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _745;
    float _793 = _729 * _751;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _799;
    float _803 = _733 * _781;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _805;
    float _809 = fma(_797, _793, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _815 = fma(_807, _793, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _817 = fma(_813, _803, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _819 = _749 * _791;
    bool _821 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _823 = isnan(_725);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_801, _793, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _835 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _837 = isnan(_725);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _855 = -_831;
    float _857 = _855 + 1.0;
    float _859 = _831 * _789;
    float _861 = fma(_849, _803, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _863 = fma(_853, _803, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _865 = _845 * _857;
    float _867 = in.m_65.x;
    float _869 = in.m_65.y;
    float _871 = in.m_65.z;
    float _873 = -_845;
    float _875 = _873 + 1.0;
    float _877 = _809 * _865;
    float _879 = _833 * _865;
    float _881 = _815 * _865;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _883;
    float _887 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].x, _877);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].y, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _895;
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].z, _881);
    float _901 = fma(_885, _819, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _903 = fma(_893, _819, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _905 = fma(_897, _819, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _907 = fma(_861, _859, _887);
    float _909 = fma(_817, _859, _889);
    float _911 = fma(_863, _859, _899);
    float _913 = fma(_901, _785, _907);
    float _915 = fma(_903, _785, _909);
    float _917 = fma(_905, _785, _911);
    float _919 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].x, _913);
    float _921 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].y, _915);
    float _923 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].z, _917);
    float _925 = _919 * _867;
    float _927 = _921 * _869;
    float _929 = _923 * _871;
    bool _931 = !_783;
    float _947;
    if (!_931)
    {
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _935 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _939 = _937 * _933;
        float _941 = floor(_939);
        float _943 = -_941;
        float _945 = _939 + _943;
        _947 = _945;
        _949 = true;
    }
    else
    {
        _947 = _697;
    }
    _949 = false;
    float _951 = _947;
    int _953 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _955 = _953;
    int _957 = 0;
    int _959 = _96(_955, _957, (*spvDescriptorSet0.support_buffer));
    float _961 = _141 * 8.0;
    float _963 = in.m_67.z;
    float _965 = rint(_961);
    float _967 = _965 * 0.125;
    float _969 = precise::clamp(_967, 0.0, 1.0);
    int _971 = _959 + (-1);
    float _973 = float(_971);
    float _975 = _969 * _973;
    float _977 = trunc(_963);
    int _979 = int(_977);
    float _981 = trunc(_975);
    int _983 = int(_981);
    int _985 = _983 + 1;
    int _987 = min(_971, _985);
    int _989 = _983;
    int _991 = 0;
    int _993 = _97(_989, _991, (*spvDescriptorSet0.support_buffer));
    int _995 = _979;
    int _997 = 0;
    int _999 = _97(_995, _997, (*spvDescriptorSet0.support_buffer));
    float3 _1003 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_993, _999)), 0).xyz;
    float _1005 = _1003.x;
    float _1007 = _1003.y;
    float _1009 = _1003.z;
    int _1011 = _987;
    int _1013 = 0;
    int _1015 = _97(_1011, _1013, (*spvDescriptorSet0.support_buffer));
    int _1017 = _979;
    int _1019 = 0;
    int _1021 = _97(_1017, _1019, (*spvDescriptorSet0.support_buffer));
    float3 _1023 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1015, _1021)), 0).xyz;
    float _1025 = _1023.x;
    float _1027 = _1023.y;
    float _1029 = _1023.z;
    float _1031 = in.m_55.z;
    float _1033 = _141 * 2.0;
    float _1035 = _145 * 2.0;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1045 = floor(_1033);
    float _1047 = _619 * _171;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1059 = _1057 != 0;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1061;
    float _1065 = _689 * _925;
    float _1067 = _689 * _927;
    float _1069 = _689 * _929;
    float _1071 = 1.0 / _1039;
    float _1073 = _619 * _189;
    float _1075 = fma(_617, _169, _1047);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _1079 = _951 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1083 = _951 + _1081;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1087 = _951 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1091 = _951 + _1089;
    float _1093 = floor(_1035);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1099 = _1045 >= 0.0;
    bool _1101 = isnan(_1045);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.0);
    bool _1107 = _1103 || _1105;
    float _1109 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1111 = _1045 > 0.0;
    float _1113 = fma(_623, _173, _1075);
    float _1115 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1117 = 1.0 / _1097;
    float _1119 = _619 * _161;
    float _1121 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1123 = fma(_617, _159, _1119);
    float _1125 = fma(_617, _187, _1073);
    float _1127 = 1.0 / _1043;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1131 = _951 + _1129;
    bool _1133 = _1093 > 0.0;
    float _1135 = fma(_623, _163, _1123);
    float _1137 = _1131 * _1071;
    float _1139 = _141 + _1031;
    float _1141 = 1.0 / _1063;
    float _1143 = _141 + _145;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1145;
    bool _1149 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1151 = isnan(_951);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1165 = _1143 + (-1.0);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _1167;
    bool _1171 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1173 = isnan(_951);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = _1083 * _1127;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _1189 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1191 = 1.0 / _1169;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1195 = _951 + _1193;
    int _1197 = _1107 ? 0 : 1;
    float _1199 = _141 + (-0.5);
    bool _1201 = _1093 >= 0.0;
    bool _1203 = isnan(_1093);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    float _1211 = _1195 * _1117;
    float _1213 = _1139 + (-1.0);
    float _1215 = 1.0 / _1187;
    float _1217 = _1031 * 2.0;
    float _1219 = _145 + _1031;
    float _1221 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1223 = _1091 * _1141;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = _1219 + (-1.0);
    float _1233 = floor(_1217);
    int _1235 = _1229;
    if (!_1111)
    {
        int _1237 = ~_1197;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _1087 * _1191;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1251 = _1209 ? 0 : 1;
    float _1253 = fma(_1247, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1255 = _1079 * _1215;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1273 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1275 = log2(_1273);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1277;
    float _1281 = fma(_1267, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1283 = _1233 > 0.0;
    float _1285 = fma(_1271, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1287 = _1233 >= 0.0;
    bool _1289 = isnan(_1233);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1313;
    float _1317 = fma(_1259, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1319 = fma(_1263, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1321 = fma(_1279, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1323;
    float _1327 = fma(_1299, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    bool _1329 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _1331 = isnan(_951);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = fma(_1303, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1343 = fma(_1307, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1345 = fma(_1311, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1347 = fma(_1315, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    bool _1349 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1351 = isnan(_951);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = fma(_1325, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    bool _1363 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _1365 = isnan(_951);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _1371 = _1367 || _1369;
    float _1373 = float(_1371);
    float _1375 = -_1339;
    float _1377 = _1375 + 1.0;
    bool _1379 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1381 = isnan(_951);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -_1359;
    float _1393 = _1391 + 1.0;
    float _1395 = _111 * _1275;
    float _1397 = _1373 * _1377;
    float _1399 = fma(_1147, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1401 = _1389 * _1393;
    float _1403 = -_1389;
    float _1405 = _1403 + 1.0;
    float _1407 = exp2(_1395);
    float _1409 = _1159 * _1405;
    bool _1411 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1413 = isnan(_951);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1419 = _1415 || _1417;
    float _1421 = float(_1419);
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1425 = 1.0 + _1423;
    float _1427 = -_1159;
    float _1429 = _1427 + 1.0;
    float _1431 = -_1373;
    float _1433 = _1431 + 1.0;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1435;
    float _1439 = _1421 * _1429;
    float _1441 = 1.0 / _1425;
    float _1443 = -_1421;
    float _1445 = _1443 + 1.0;
    float _1447 = _1359 * _1433;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1449;
    float _1453 = fma(_1437, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1455 = _1181 * _1445;
    bool _1457 = !_1055;
    int _1459 = _1457 ? 0 : 1;
    float _1461 = -_1407;
    float _1463 = _1461 + 1.0;
    bool _1465 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1467 = isnan(0.0);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1473 = _1469 || _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1477 = _1475 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1479 = fma(_1451, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1481 = fma(_1163, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1483 = _1317 * _1455;
    float _1485 = _1319 * _1455;
    float _1487 = _1321 * _1455;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1493 = _1473 ? _1463 : 0.0;
    float _1495 = in.m_69.x;
    float _1497 = in.m_69.y;
    float _1499 = in.m_69.z;
    float _1501 = float(_1241);
    float _1503 = fma(_1491, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    int _1505 = ~_1251;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = _1493 * _1441;
    int _1513 = _1509;
    if (!_1133)
    {
        int _1515 = ~_1251;
        int _1517 = _1515 + 1;
        _1513 = _1517;
    }
    int _1519 = _1513;
    float _1521 = fma(_1477, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    bool _1523 = !_1059;
    int _1525 = _1523 ? 0 : 1;
    float _1527 = _145 + (-0.5);
    int _1529 = abs(_1459);
    float _1531 = -_1181;
    float _1533 = _1531 + 1.0;
    int _1535 = abs(_1525);
    float _1537 = fma(_623, _191, _1125);
    float _1539 = float(_1529);
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1483);
    float _1543 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1485);
    float _1545 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1487);
    int _1547 = _1295 ? 0 : 1;
    float _1549 = _1539 * _1501;
    float _1551 = fma(_1281, _1439, _1541);
    float _1553 = fma(_1253, _1439, _1543);
    float _1555 = fma(_1285, _1439, _1545);
    float _1557 = _1549 * (-2.0);
    int _1559 = ~_1547;
    int _1561 = _1559 + 1;
    int _1563 = _1561 + 1;
    float _1565 = fma(_1327, _1409, _1551);
    int _1567 = _1563;
    if (!_1283)
    {
        int _1569 = ~_1547;
        int _1571 = _1569 + 1;
        _1567 = _1571;
    }
    int _1573 = _1567;
    float _1575 = fma(_1557, _1497, _1497);
    bool _1577 = !_1051;
    int _1579 = _1577 ? 0 : 1;
    float _1581 = fma(_1249, _1557, _1249);
    bool _1583 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1585 = isnan(1.0);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1591 = _1587 || _1589;
    float _1593 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1575);
    float _1595 = float(_1535);
    float _1597 = fma(_1347, _1409, _1553);
    float _1599 = float(_1519);
    float _1601 = fma(_1341, _1401, _1565);
    int _1603 = abs(_1579);
    float _1605 = fma(_1361, _1409, _1555);
    bool _1607 = !_1591;
    float _1609 = _1607 ? _111 : _1511;
    float _1611 = _1595 * _1599;
    float _1613 = float(_1603);
    float _1615 = fma(_1343, _1401, _1597);
    float _1617 = float(_1573);
    float _1619 = fma(_1609, _1581, _1593);
    float _1621 = _1611 * (-2.0);
    float _1623 = fma(_1345, _1401, _1605);
    float _1625 = fma(_1399, _1447, _1601);
    float _1627 = _1613 * _1617;
    float _1629 = _1619 * 0.15915493667125701904296875;
    float _1631 = _1031 + (-0.5);
    float _1633 = fma(_1621, _1499, _1499);
    float _1635 = fma(_1221, _1621, _1221);
    float _1637 = fma(_1453, _1447, _1615);
    float _1639 = fma(_1479, _1447, _1623);
    float _1641 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1633);
    float _1643 = _1627 * (-2.0);
    float _1645 = _1629 * 6.283185482025146484375;
    float _1647 = sin(_1645);
    float _1649 = fma(_1481, _1397, _1625);
    float _1651 = fma(_1609, _1635, _1641);
    float _1653 = fma(_1643, _1495, _1495);
    float _1655 = fma(_1189, _1643, _1189);
    float _1657 = _1651 * 0.15915493667125701904296875;
    float _1659 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1653);
    float _1661 = _1629 * 6.283185482025146484375;
    float _1663 = cos(_1661);
    float _1665 = fma(_1503, _1397, _1637);
    float _1667 = fma(_1521, _1397, _1639);
    float _1669 = fma(_1609, _1655, _1659);
    float _1671 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1649);
    float _1673 = _1669 * 0.15915493667125701904296875;
    float _1675 = floor(_975);
    float _1677 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1665);
    float _1679 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].z, _1667);
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1687 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1689 = _1657 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1699 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1701 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1703 = _1657 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    out.m_71.x = _1687;
    out.m_71.y = _1695;
    out.m_71.z = _1697;
    out.m_71.w = _1693;
    float _1707 = -_1675;
    float _1709 = _975 + _1707;
    float _1711 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1673 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1721 = _1663 * _1691;
    float _1723 = _1647 * _1691;
    float _1725 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1727 = _1673 * 6.283185482025146484375;
    float _1729 = sin(_1727);
    float _1731 = _1647 * _1705;
    float _1733 = _1663 * _1705;
    out.m_73.x = _1725;
    out.m_73.y = _1711;
    out.m_73.z = _1713;
    float _1735 = _1717 * _1647;
    float _1737 = _1717 * _1705;
    float _1739 = in.m_63.w;
    float _1741 = _1717 * _1691;
    float _1743 = _1717 * _1663;
    float _1745 = fma(_1729, _1723, _1733);
    float _1747 = fma(_1729, _1733, _1723);
    float _1749 = -_1731;
    float _1751 = fma(_1729, _1721, _1749);
    float _1753 = -_1005;
    float _1755 = _1753 + _1025;
    float _1757 = -_1007;
    float _1759 = _1757 + _1027;
    float _1761 = -_1009;
    float _1763 = _1761 + _1029;
    float _1765 = -_1721;
    float _1767 = fma(_1729, _1731, _1765);
    float _1769 = fma(_1709, _1755, _1005);
    float _1771 = fma(_1709, _1759, _1007);
    float _1773 = fma(_1709, _1763, _1009);
    float _1775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1769);
    float _1777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1771);
    float _1779 = in.m_61.w;
    bool _1781 = _1771 != 0.0;
    bool _1783 = isnan(_1771);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(0.0);
    bool _1789 = _1785 || _1787;
    float _1791 = _1115 * _1775;
    float _1793 = _1109 * _1777;
    float _1795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1773);
    bool _1797 = _1769 == 0.0;
    bool _1799 = !_1789;
    bool _1801 = _1797 && _1799;
    float _1803 = _1737 * _1793;
    float _1805 = _1767 * _1793;
    float _1807 = _1121 * _1795;
    float _1809 = _1747 * _1793;
    float _1811 = fma(_1741, _1791, _1803);
    float _1813 = fma(_1745, _1791, _1805);
    float _1815 = in.m_59.w;
    float _1817 = fma(_1751, _1791, _1809);
    float _1819 = -_1729;
    float _1821 = fma(_1819, _1807, _1811);
    float _1823 = fma(_1735, _1807, _1813);
    bool _1825 = _1773 == 0.0;
    bool _1827 = _1825 && _1801;
    float _1829 = fma(_1743, _1807, _1817);
    float _1831 = _1821 * _331;
    float _1833 = _1821 * _345;
    float _1835 = _1537 + _1739;
    float _1837 = _1821 * _341;
    float _1839 = fma(_1823, _357, _1831);
    float _1841 = fma(_1823, _365, _1833);
    float _1843 = _1113 + _1779;
    float _1845 = fma(_1823, _361, _1837);
    float _1847 = fma(_1829, _369, _1839);
    float _1849 = fma(_1829, _379, _1841);
    float _1851 = fma(_1829, _373, _1845);
    float _1853 = _1843 + _1847;
    float _1855 = _1835 + _1849;
    float _1857 = in.m_75.x;
    float _1859 = in.m_75.y;
    float _1861 = in.m_75.z;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1865 = _1853 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1869 = _1855 + _1867;
    float _1871 = _1135 + _1815;
    float _1873 = _1865 * _1865;
    float _1875 = _1869 * _1869;
    float _1877 = _1871 + _1851;
    float _1879 = _1873 + _1875;
    float _1881 = sqrt(_1879);
    float _1883 = _1859;
    float _1885 = _1857;
    float _1887 = _1845;
    float _1889 = _1767;
    float _1891 = _1747;
    float _1893 = _1771;
    float _1895 = _1861;
    float _1897 = _1773;
    if (!_1827)
    {
        float _1899 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _1883 = _1899;
    }
    float _1901 = _1883;
    float _1903 = _1901;
    if (!_1827)
    {
        float _1905 = fma(_1769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _1885 = _1905;
    }
    float _1907 = _1885;
    float _1909 = _1737 * _1901;
    float _1911 = _1767 * _1901;
    bool _1913 = _1881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1915 = _1747 * _1901;
    float _1917 = fma(_1741, _1907, _1909);
    float _1919 = _1881;
    if (!_1913)
    {
        _1887 = _1875;
    }
    float _1921 = _1887;
    float _1923 = _1921;
    if (!_1913)
    {
        _1903 = _1873;
    }
    float _1925 = _1903;
    float _1927 = _1925;
    if (!_1913)
    {
        _1889 = _1853;
    }
    float _1929 = _1889;
    float _1931 = _1929;
    if (!_1913)
    {
        _1891 = _1855;
    }
    float _1933 = _1891;
    float _1935 = _1933;
    if (!_1913)
    {
        _1893 = _1877;
    }
    float _1937 = _1893;
    bool _1939 = !_1913;
    float _1941 = _1937;
    if (!_1939)
    {
        float _1943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1947 = _1881 + _1945;
        float _1949 = rsqrt(_1879);
        float _1951 = _1947 * _1943;
        float _1953 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1955 = _1951 * 0.15915493667125701904296875;
        float _1957 = _1955 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = _1955 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = fma(_1959, _1953, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1967 = _1949 * _1965;
        float _1969 = _1963 + (-1.0);
        float _1971 = fma(_1865, _1967, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1973 = fma(_1869, _1967, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1975 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1979 = _1971 + _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1983 = _1973 + _1981;
        float _1985 = fma(_1877, _1963, _1975);
        float _1987 = _1979 * _1979;
        float _1989 = _1983 * _1983;
        _1941 = _1985;
        _1927 = _1987;
        _1923 = _1989;
        _1931 = _1971;
        _1935 = _1973;
        _1919 = _1983;
    }
    float _1991 = _1941;
    float _1993 = _1927;
    float _1995 = _1923;
    float _1997 = _1931;
    float _1999 = _1935;
    float _2001 = _1919;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2005 = _1991 + _2003;
    if (!_1827)
    {
        float _2007 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1861);
        _1895 = _2007;
    }
    float _2009 = _1895;
    float _2011 = fma(_1745, _1907, _1911);
    float _2013 = fma(_1751, _1907, _1915);
    float _2015 = fma(_2005, _2005, _1993);
    float _2017 = -_1729;
    float _2019 = fma(_2017, _2009, _1917);
    float _2021 = fma(_1735, _2009, _2011);
    float _2023 = fma(_1743, _2009, _2013);
    float _2025 = _2015 + _1995;
    float _2027 = _2019 * _331;
    float _2029 = _2019 * _341;
    float _2031 = _2019 * _345;
    float _2033 = fma(_2021, _357, _2027);
    float _2035 = sqrt(_2025);
    float _2037 = fma(_2021, _361, _2029);
    float _2039 = fma(_2021, _365, _2031);
    float _2041 = fma(_2023, _369, _2033);
    float _2043 = fma(_2023, _373, _2037);
    float _2045 = fma(_2023, _379, _2039);
    out.m_77.x = _2041;
    out.m_77.y = _2043;
    out.m_77.z = _2045;
    bool _2047 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2049 = isnan(_2035);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2055 = _2051 || _2053;
    float _2057 = _2021;
    float _2059 = _2035;
    if (!_2055)
    {
        _1897 = 1.0;
    }
    float _2061 = _1897;
    bool _2063 = !_2055;
    float _2065 = _2061;
    if (!_2063)
    {
        bool _2067 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2069 = isnan(_2035);
        bool _2071 = _2067 || _2069;
        bool _2073 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2075 = _2071 || _2073;
        if (!_2075)
        {
            float _2077 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2079 = _2035 + _2077;
            float _2081 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2083 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2089 = 1.0 / _2083;
            float _2091 = _2079 * _2089;
            float _2093 = fma(_2091, _2087, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2065 = _2093;
            _2095 = true;
        }
        else
        {
            bool _2097 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2099 = isnan(_2035);
            bool _2101 = _2097 || _2099;
            bool _2103 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2105 = _2101 || _2103;
            if (!_2105)
            {
                float _2107 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2109 = _2035 + _2107;
                float _2111 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2113 = _2111 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2115 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2117 = _2115 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2119 = 1.0 / _2113;
                float _2121 = _2109 * _2119;
                float _2123 = fma(_2121, _2117, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2065 = _2123;
                _2095 = true;
            }
            else
            {
                _2065 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2095 = false;
    float _2125 = _2065;
    float _2127 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2129 = _1991 + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2133 = _1997 + _2131;
    float _2135 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2137 = _1999 + _2135;
    float _2139 = fma(_2129, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2141 = fma(_2133, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2143 = fma(_2137, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2145 = -_1871;
    float _2147 = _2145 + _2139;
    float _2149 = -_1843;
    float _2151 = _2149 + _2141;
    float _2153 = -_1835;
    float _2155 = _2153 + _2143;
    float _2157 = _2147 * _2147;
    float _2159 = fma(_2151, _2151, _2157);
    float _2161 = fma(_2155, _2155, _2159);
    float _2163 = sqrt(_2161);
    bool _2165 = _2163 > 0.0;
    bool _2167 = !_2165;
    float _2169 = _2163;
    float _2171 = _2141;
    float _2173 = _2139;
    float _2175 = _2143;
    if (!_2167)
    {
        bool _2177 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2179 = _2001;
        if (_2177)
        {
            float _2181 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2179 = _2181;
        }
        float _2183 = _2179;
        if (_2177)
        {
            float _2185 = _691 * _2183;
            _2057 = _2185;
        }
        float _2187 = _2057;
        float _2189 = _2187;
        if (_2177)
        {
            float _2191 = _693 * _2183;
            _2059 = _2191;
        }
        float _2193 = _2059;
        float _2195 = _2193;
        if (_2177)
        {
            float _2197 = _695 * _2183;
            _2169 = _2197;
        }
        float _2199 = _2169;
        float _2201 = _2199;
        float _2203 = _2199;
        if (!_2177)
        {
            float _2205 = _111 + 1.0;
            if (!_185)
            {
                float _2207 = _2205 * _2205;
                float _2209 = _2207 * 0.5;
                _2201 = _2209;
            }
            float _2211 = _2201;
            float _2213 = _2211;
            if (!_185)
            {
                float _2215 = _2211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2213 = _2215;
            }
            float _2217 = _2213;
            bool _2219 = !_185;
            float _2221 = _2217;
            if (!_2219)
            {
                float _2223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2225 = log2(_2223);
                float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2229 = _2227 + 1.0;
                float _2231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2233 = _2225 * _2205;
                float _2235 = 1.0 / _2229;
                float _2237 = _2231 * 0.693147182464599609375;
                float _2239 = exp2(_2233);
                float _2241 = 1.0 / _2237;
                float _2243 = _2239 + (-1.0);
                float _2245 = -_2243;
                float _2247 = fma(_2245, _2241, _2205);
                float _2249 = _2247 * _2235;
                float _2251 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2221 = _2251;
            }
            float _2253 = _2221;
            float _2255 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2257 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2259 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2261 = _2255 * _341;
            float _2263 = _2255 * _361;
            float _2265 = fma(_2257, _331, _2261);
            float _2267 = _2255 * _373;
            float _2269 = fma(_2257, _357, _2263);
            if (!_185)
            {
                _375 = _2205;
            }
            float _2271 = _375;
            float _2273 = fma(_2259, _345, _2265);
            bool _2275 = !_185;
            float _2277 = _2271;
            if (!_2275)
            {
                float _2279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2281 = log2(_2279);
                float _2283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2285 = _2283 + 1.0;
                float _2287 = 1.0 / _2285;
                float _2289 = _2281 * _2205;
                float _2291 = exp2(_2289);
                float _2293 = -_2291;
                float _2295 = _2293 + 1.0;
                float _2297 = _2295 * _2287;
                _2277 = _2297;
            }
            float _2299 = _2277;
            float _2301 = fma(_2259, _365, _2269);
            float _2303 = fma(_2257, _369, _2267);
            float _2305 = fma(_2299, _449, _2273);
            float _2307 = fma(_2299, _447, _2301);
            float _2309 = fma(_2259, _379, _2303);
            float _2311 = -_633;
            float _2313 = _2311 + _2305;
            float _2315 = -_643;
            float _2317 = _2315 + _2307;
            float _2319 = fma(_2299, _451, _2309);
            float _2321 = _2313 * _171;
            float _2323 = _2313 * _161;
            float _2325 = _2313 * _189;
            float _2327 = -_653;
            float _2329 = _2327 + _2319;
            float _2331 = fma(_2317, _169, _2321);
            float _2333 = fma(_2317, _159, _2323);
            float _2335 = fma(_2317, _187, _2325);
            float _2337 = fma(_2329, _173, _2331);
            float _2339 = fma(_2329, _163, _2333);
            float _2341 = fma(_2329, _191, _2335);
            _701 = _2339;
            _703 = _2337;
            _705 = _2341;
            _2189 = _2337;
            _2195 = _2339;
            _2203 = _2341;
            _257 = _2335;
        }
        float _2343 = _701;
        float _2345 = _703;
        float _2347 = _705;
        float _2349 = _2189;
        float _2351 = _2195;
        float _2353 = _2203;
        float _2355 = _257;
        float _2357 = _2343 * _2343;
        float _2359 = rsqrt(_2161);
        float _2361 = fma(_2345, _2345, _2357);
        float _2363 = fma(_2347, _2347, _2361);
        float _2365 = sqrt(_2363);
        float _2367 = _2151 * _2359;
        float _2369 = _2147 * _2359;
        float _2371 = _2155 * _2359;
        bool _2373 = _2365 > 0.0;
        bool _2375 = !_2373;
        _217 = _2361;
        _259 = _2355;
        if (!_2375)
        {
            float _2377 = rsqrt(_2363);
            float _2379 = _2377 * _2343;
            float _2381 = _2377 * _2345;
            float _2383 = _2377 * _2347;
            float _2385 = _2369 * _2379;
            float _2387 = fma(_2367, _2381, _2385);
            float _2389 = fma(_2371, _2383, _2387);
            float _2391 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2393 = fma(_2349, _2391, _2141);
            float _2395 = fma(_2351, _2391, _2139);
            float _2397 = fma(_2353, _2391, _2143);
            _2171 = _2393;
            _2173 = _2395;
            _2175 = _2397;
            _217 = _2383;
            _219 = _2379;
        }
    }
    float _2399 = _2171;
    float _2401 = _2173;
    float _2403 = _2175;
    float _2405 = _217;
    float _2407 = _219;
    float _2409 = _259;
    bool _2411 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.5);
    bool _2419 = _2415 || _2417;
    float _2421 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2423 = _2405;
    float _2425 = _2407;
    float _2427 = _2409;
    float _2429 = _2399;
    if (_2419)
    {
        _2421 = _2399;
    }
    float _2431 = _2421;
    float _2433 = _2431;
    if (_2419)
    {
        _2423 = _2401;
    }
    float _2435 = _2423;
    float _2437 = _2435;
    if (_2419)
    {
        _2425 = _2403;
    }
    float _2439 = _2425;
    float _2441 = _2439;
    if (!_2419)
    {
        float _2443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2445 = _1871 + _2443;
        float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2449 = _1843 + _2447;
        float _2451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2453 = -_1871;
        float _2455 = _2453 + _2401;
        float _2457 = _2445 * _2445;
        float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2461 = _1835 + _2459;
        float _2463 = -_1835;
        float _2465 = _2463 + _2403;
        float _2467 = fma(_2449, _2449, _2457);
        float _2469 = fma(_2461, _2461, _2467);
        float _2471 = -_1843;
        float _2473 = _2471 + _2399;
        float _2475 = sqrt(_2469);
        float _2477 = precise::min(_2475, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2479 = _2477 * _2451;
        float _2481 = fma(_2473, _2479, _1843);
        float _2483 = fma(_2455, _2479, _1871);
        float _2485 = fma(_2465, _2479, _1835);
        _2437 = _2483;
        _2433 = _2481;
        _2441 = _2485;
    }
    float _2487 = _2437;
    float _2489 = _2433;
    float _2491 = _2441;
    float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2495 = _2487 + _2493;
    float _2497 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2499 = _2489 + _2497;
    float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2503 = _2491 + _2501;
    float _2505 = _2495 * _2495;
    float _2507 = fma(_2499, _2499, _2505);
    float _2509 = fma(_2503, _2503, _2507);
    float _2511 = rsqrt(_2509);
    float _2513 = sqrt(_2509);
    float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2517 = _2499 * _2515;
    float _2519 = _2503 * _2515;
    float _2521 = _2517 * _2517;
    float _2523 = _2519 * _2519;
    float _2525 = _2521 + _2523;
    float _2527 = sqrt(_2525);
    bool _2529 = _2527 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = _2527 + _2531;
    float _2535 = _2511;
    float _2537 = _2533;
    float _2539 = _2495;
    float _2541 = _2515;
    if (_2529)
    {
        float _2543 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2535 = _2543;
    }
    float _2545 = _2535;
    float _2547 = _2545;
    if (_2529)
    {
        float _2549 = _2533 * _2545;
        _2537 = _2549;
    }
    float _2551 = _2537;
    if (_2529)
    {
        float _2553 = rsqrt(_2525);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = _2555;
    if (_2529)
    {
        float _2559 = _2551 * 0.15915493667125701904296875;
        _2427 = _2559;
    }
    float _2561 = _2427;
    float _2563 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2565 = _2503;
    float _2567 = _2561;
    if (_2529)
    {
        float _2569 = _2561 * 6.283185482025146484375;
        float _2571 = sin(_2569);
        _2565 = _2571;
    }
    float _2573 = _2565;
    float _2575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2577 = precise::max(0.0, _2563);
    float _2579 = _187;
    float _2581 = _2577;
    if (_2529)
    {
        float _2583 = _2561 * 6.283185482025146484375;
        float _2585 = cos(_2583);
        _2579 = _2585;
    }
    float _2587 = _2579;
    float _2589 = -_2515;
    float _2591 = -_2577;
    float _2593 = fma(_2495, _2589, _2591);
    if (_2529)
    {
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2539 = _2595;
    }
    float _2597 = _2539;
    float _2599 = _2573;
    float _2601 = _2597;
    if (_2529)
    {
        float _2603 = fma(_2573, _2597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2599 = _2603;
    }
    float _2605 = _2599;
    float _2607 = _2605;
    if (!_2529)
    {
        _2601 = _2519;
    }
    float _2609 = _2601;
    float _2611 = _2609;
    if (!_2529)
    {
        _2567 = _2521;
    }
    float _2613 = _2567;
    float _2615 = _2613;
    if (_2529)
    {
        float _2617 = _2555 * _2605;
        _2429 = _2617;
    }
    float _2619 = _2429;
    if (!_2529)
    {
        _2557 = _2517;
    }
    float _2621 = _2557;
    float _2623 = _2621;
    if (_2529)
    {
        float _2625 = _2587 + (-1.0);
        _2581 = _2625;
    }
    float _2627 = _2581;
    float _2629 = _2627;
    if (_2529)
    {
        float _2631 = _2517 * _2619;
        _2623 = _2631;
    }
    float _2633 = _2623;
    if (!_2529)
    {
        _2607 = _2593;
    }
    float _2635 = _2607;
    float _2637 = _2635;
    if (_2529)
    {
        float _2639 = _2519 * _2619;
        _2611 = _2639;
    }
    float _2641 = _2611;
    if (_2529)
    {
        float _2643 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2541 = _2643;
    }
    float _2645 = _2541;
    if (_2529)
    {
        float _2647 = _2633 * _2633;
        _2615 = _2647;
    }
    float _2649 = _2615;
    if (!_2529)
    {
        _2629 = _2523;
    }
    float _2651 = _2629;
    float _2653 = _2651;
    if (_2529)
    {
        float _2655 = _2641 * _2641;
        _2653 = _2655;
    }
    float _2657 = _2653;
    if (_2529)
    {
        float _2659 = fma(_2593, _2587, _2645);
        _2637 = _2659;
    }
    float _2661 = _2637;
    float _2663 = fma(_2661, _2661, _2649);
    float _2665 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2669 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2667);
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2675 = _2663 + _2657;
    float _2677 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2665);
    float _2679 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2681 = -_2671;
    float _2683 = _2681 + 1.0;
    float _2685 = rsqrt(_2675);
    float _2687 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2677);
    float _2689 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2691 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2679);
    float _2693 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2673);
    float _2695 = _2687 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2697 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2689);
    float _2699 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2691);
    float _2701 = abs(_2683);
    float _2703 = log2(_2701);
    float _2705 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2693);
    float _2707 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2697);
    float _2709 = _2699 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2711 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2713 = _2705 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2715 = _2707 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2717 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2719 = _2685 * _2633;
    float _2721 = _2685 * _2661;
    float _2723 = _2685 * _2641;
    float _2725 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2717);
    float _2727 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2729 = -_2711;
    float _2731 = fma(_2729, _2575, 1.0);
    float _2733 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2725);
    float _2735 = -_2727;
    float _2737 = fma(_2721, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2735);
    float _2739 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2741 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2743 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2733);
    float _2745 = -_2723;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2737);
    float _2749 = log2(_2731);
    float _2751 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2753 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2741);
    float _2755 = fma(_2747, -0.5, 0.5);
    float _2757 = fma(_2747, 0.5, 0.5);
    float _2759 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2751);
    float _2761 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2753);
    float _2763 = _2721 + 1.0;
    float _2765 = exp2(_2739);
    float _2767 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2759);
    float _2769 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2767);
    float _2771 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2761);
    float _2773 = 1.0 / _2743;
    float _2775 = fma(_2757, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2777 = _2749 * 0.693147182464599609375;
    float _2779 = fma(_2757, _2775, -0.212114393711090087890625);
    float _2781 = _2777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2783 = sqrt(_2755);
    float _2785 = -_2721;
    float _2787 = fma(_2765, _2763, _2785);
    float _2789 = fma(_2757, _2779, 1.570728778839111328125);
    float _2791 = fma(_2787, 0.5, 0.5);
    float _2793 = _2769 * _2773;
    float _2795 = _2771 * _2773;
    float _2797 = fma(_2793, 0.5, 0.5);
    float _2799 = fma(_2795, -0.5, 0.5);
    float _2801 = _2783 * 0.636619746685028076171875;
    float3 _7157 = float3(_2797, _2799, _2781);
    float _2803 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7157, float3(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7157, float3(0.0), isnan(_7157)), level(0.0)).x;
    float3 _7168 = float3(_2797, _2799, _2781);
    float4 _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7168, float3(0.0), isnan(_7168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7168, float3(0.0), isnan(_7168)), level(0.0)).xyzw;
    float _2808 = _2806.x;
    float _2810 = _2806.y;
    float _2812 = _2806.z;
    float _2814 = _2806.w;
    float _2816 = -_2789;
    float _2818 = fma(_2801, _2816, 1.0);
    float2 _7190 = float2(_2818, _2791);
    float3 _2820 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7190, float2(0.0), isnan(_7190)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7190, float2(0.0), isnan(_7190)), level(0.0)).xyz;
    float _2822 = _2820.x;
    float _2824 = _2820.y;
    float _2826 = _2820.z;
    float _2828 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2830 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2832 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2489;
    out.m_79.y = _2487;
    out.m_79.z = _2491;
    float _2834 = fma(_1843, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2828);
    float _2836 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2838 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2832);
    float _2840 = exp2(_2830);
    float _2842 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2834);
    float _2844 = fma(_1843, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2836);
    float _2846 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2838);
    float _2848 = _2842 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2850 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2844);
    float _2852 = 1.0 / _2848;
    bool _2854 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2858 = _2854 || _2856;
    bool _2860 = isnan(0.5);
    bool _2862 = _2858 || _2860;
    float _2864 = _2850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2866 = _2864 + _2848;
    float _2868 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2870 = _2866;
    float _2872 = _2801;
    float _2874 = _2715;
    if (!_2862)
    {
        _2868 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2876 = _2868;
    float _2878 = _2866 * _2852;
    float _2880 = _2878 * 0.5;
    float _2882 = _2880;
    float _2884 = _2876;
    if (!_2862)
    {
        _2870 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2886 = _2870;
    if (!_2862)
    {
        float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2890 = fma(_2880, _2876, _2888);
        _2882 = _2890;
    }
    float _2892 = _2882;
    if (_2862)
    {
        _2884 = 1.0;
    }
    float _2894 = _2884;
    float _2896 = _2894;
    if (!_2862)
    {
        float _2898 = -_2886;
        float _2900 = _2898 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2872 = _2900;
    }
    float _2902 = _2872;
    float _2904 = _2892;
    if (!_2862)
    {
        float _2906 = 1.0 / _2892;
        _2904 = _2906;
    }
    float _2908 = _2904;
    float _2910 = _2902;
    if (!_2862)
    {
        float _2912 = 1.0 / _2902;
        _2910 = _2912;
    }
    float _2914 = _2910;
    if (!_2862)
    {
        float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2918 = -_2886;
        float _2920 = fma(_2908, _2916, _2918);
        _2874 = _2920;
    }
    float _2922 = _2874;
    float _2924 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2846);
    float _2926 = -_2840;
    float _2928 = _2926 + 1.0;
    float _2930 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2769;
    out.gl_Position.y = _2771;
    out.gl_Position.z = _2924;
    out.gl_Position.w = _2743;
    if (!_2862)
    {
        float _2932 = _2922 * _2914;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        _2896 = _2934;
    }
    float _2936 = _2896;
    float _2938 = _2924 + _2743;
    float _2940 = _2936 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2942 = _2936 > 0.0;
    bool _2944 = isnan(_2936);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan(0.0);
    bool _2950 = _2946 || _2948;
    float _2952 = _2938 * 0.5;
    float _2954 = _2940 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.z = _2952;
    out.m_81.w = _2743;
    out.m_53.x = _2954;
    float _2956 = _2930 * _2803;
    float _2958 = -_2930;
    float _2960 = _2958 + 1.0;
    float _2962 = _2814 * _2956;
    float _2964 = _2826 * _2956;
    float _2966 = fma(_2822, _2962, _2808);
    float _2968 = fma(_2824, _2962, _2810);
    float _2970 = _2814 * _2960;
    float _2972 = fma(_2814, _2964, _2812);
    out.m_83.x = _2966;
    out.m_83.y = _2968;
    out.m_83.z = _2972;
    out.m_83.w = _2970;
    if (_2950)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2974;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2095 = false;
    bool _949 = false;
    bool _723 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = in.m_48.w;
    float _105 = trunc(_101);
    int _107 = int(_105);
    float _109 = -_103;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _103;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3041 = as_type<float>(_127);
        out.gl_Position.z = _3041;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _131 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_103);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = in.m_55.x;
    float _143 = float(_107);
    float _145 = in.m_55.y;
    bool _147 = _111 >= _143;
    bool _149 = !_139;
    bool _151 = _147 || _149;
    if (_151)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _119;
    if (_151)
    {
        out.m_53.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _129 = as_type<int>(_155);
    }
    int _157 = _129;
    out.m_57.x = _141;
    out.m_57.y = _145;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3104 = as_type<float>(_157);
        out.gl_Position.z = _3104;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = in.m_59.x;
    float _161 = in.m_59.y;
    float _163 = in.m_59.z;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _167 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _169 = in.m_61.x;
    float _171 = in.m_61.y;
    float _173 = in.m_61.z;
    float _175 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = _167 * _165;
    float _195 = 0.0;
    float _197 = _165;
    float _199 = _175;
    if (!_185)
    {
        float _201 = _175 * _175;
        float _203 = _201 * 0.5;
        _195 = _203;
    }
    float _205 = _195;
    float _207 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    float _209 = _161 * _161;
    float _211 = _163 * _163;
    float _213 = _159 * _159;
    float _215 = _205;
    float _217 = _161;
    float _219 = _163;
    if (!_185)
    {
        float _221 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _221;
    }
    float _223 = _215;
    float _225 = fma(_171, _171, _209);
    float _227 = fma(_173, _173, _211);
    float _229 = fma(_169, _169, _213);
    float _231 = fma(_189, _189, _225);
    float _233 = fma(_191, _191, _227);
    float _235 = fma(_187, _187, _229);
    float _237 = sqrt(_231);
    float _239 = sqrt(_235);
    float _241 = sqrt(_233);
    bool _243 = _237 > 0.0;
    float _245 = floor(_207);
    bool _247 = _239 > 0.0;
    float _249 = 0.0;
    float _251 = 0.0;
    float _253 = _233;
    float _255 = _223;
    float _257 = _189;
    float _259 = _189;
    if (!_243)
    {
        _249 = 0.0;
        _251 = 0.0;
    }
    float _261 = _249;
    float _263 = _251;
    float _265 = 0.0;
    float _267 = _263;
    float _269 = _261;
    if (!_243)
    {
        _265 = 0.0;
    }
    float _271 = _265;
    float _273 = _231;
    float _275 = _271;
    if (_243)
    {
        float _277 = rsqrt(_231);
        _273 = _277;
    }
    float _279 = _273;
    bool _281 = _241 > 0.0;
    float _283 = 0.0;
    float _285 = 0.0;
    if (!_247)
    {
        _283 = 0.0;
        _285 = 0.0;
    }
    float _287 = _283;
    float _289 = _285;
    int _291 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _293 = _291 != 0;
    float _295 = -_245;
    float _297 = _207 + _295;
    float _299 = _207 * 6.283185482025146484375;
    float _301 = _235;
    float _303 = _299;
    float _305 = _287;
    float _307 = _289;
    if (_247)
    {
        float _309 = rsqrt(_235);
        _301 = _309;
    }
    float _311 = _301;
    float _313 = 0.0;
    if (!_247)
    {
        _313 = 0.0;
    }
    float _315 = _313;
    float _317 = _299 * 0.15915493667125701904296875;
    float _319 = _315;
    if (!_281)
    {
        _197 = 0.0;
    }
    float _321 = _197;
    float _323 = _321;
    if (!_281)
    {
        _303 = 0.0;
    }
    float _325 = _303;
    float _327 = _325;
    if (_243)
    {
        float _329 = _279 * _171;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = 1.4012984643248170709237295832899e-45;
    if (_281)
    {
        float _335 = rsqrt(_233);
        _333 = _335;
    }
    float _337 = _333;
    if (_243)
    {
        float _339 = _279 * _161;
        _269 = _339;
    }
    float _341 = _269;
    if (_243)
    {
        float _343 = _279 * _189;
        _275 = _343;
    }
    float _345 = _275;
    float _347 = _317 * 6.283185482025146484375;
    float _349 = cos(_347);
    if (!_281)
    {
        _253 = 0.0;
    }
    float _351 = _253;
    float _353 = _351;
    if (_247)
    {
        float _355 = _311 * _169;
        _319 = _355;
    }
    float _357 = _319;
    if (_247)
    {
        float _359 = _311 * _159;
        _305 = _359;
    }
    float _361 = _305;
    if (_247)
    {
        float _363 = _311 * _187;
        _307 = _363;
    }
    float _365 = _307;
    if (_281)
    {
        float _367 = _337 * _173;
        _323 = _367;
    }
    float _369 = _323;
    if (_281)
    {
        float _371 = _337 * _163;
        _353 = _371;
    }
    float _373 = _353;
    float _375 = _373;
    if (_281)
    {
        float _377 = _337 * _191;
        _327 = _377;
    }
    float _379 = _327;
    bool _381 = !_185;
    if (!_381)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _175 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _175);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _411;
    }
    float _413 = _255;
    bool _415 = !_185;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _175 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _199 = _435;
    }
    float _437 = _199;
    float _439 = in.m_65.w;
    float _441 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _443 = _297 < 0.5;
    float _445 = float(_443);
    float _447 = in.m_48.x;
    float _449 = in.m_48.y;
    float _451 = in.m_48.z;
    float _453 = fma(_349, 0.5, 0.5);
    float _455 = -_297;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = _441 * _341;
    float _461 = in.m_46.x;
    float _463 = in.m_46.y;
    float _465 = in.m_46.z;
    float _467 = -_445;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _471 = -_453;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _475 = _441 * _361;
    float _477 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _479 = _441 * _373;
    float _481 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _483 = fma(_477, _357, _475);
    float _485 = fma(_477, _331, _459);
    float _487 = fma(_477, _369, _479);
    float _489 = _477;
    float _491 = _481;
    float _493 = _483;
    if (!_185)
    {
        float _495 = _111 * _111;
        float _497 = _495 * 0.5;
        _489 = _497;
    }
    float _499 = _489;
    float _501 = fma(_481, _365, _483);
    float _503 = fma(_481, _345, _485);
    float _505 = fma(_481, _379, _487);
    if (!_185)
    {
        float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _491 = _507;
    }
    float _509 = _491;
    bool _511 = !_185;
    float _513 = _509;
    if (!_511)
    {
        float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _517 = log2(_515);
        float _519 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _521 = _519 + 1.0;
        float _523 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _525 = _111 * _517;
        float _527 = exp2(_525);
        float _529 = _523 * 0.693147182464599609375;
        float _531 = 1.0 / _529;
        float _533 = 1.0 / _521;
        float _535 = _527 + (-1.0);
        float _537 = -_535;
        float _539 = fma(_537, _531, _111);
        float _541 = _539 * _533;
        float _543 = _541 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _513 = _543;
        _493 = _541;
    }
    float _545 = _513;
    float _547 = _493;
    float _549 = fma(_437, _447, _501);
    float _551 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _555 = fma(_437, _449, _503);
    float _557 = _547;
    if (!_185)
    {
        _557 = _111;
    }
    float _559 = _557;
    bool _561 = !_185;
    float _563 = _559;
    if (!_561)
    {
        float _565 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _567 = log2(_565);
        float _569 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _571 = _569 + 1.0;
        float _573 = 1.0 / _571;
        float _575 = _111 * _567;
        float _577 = exp2(_575);
        float _579 = -_577;
        float _581 = _579 + 1.0;
        float _583 = _581 * _573;
        _563 = _583;
    }
    float _585 = _563;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _593 = _591 != 0;
    float _595 = _553 * _361;
    float _597 = _553 * _341;
    float _599 = _553 * _373;
    float _601 = fma(_437, _451, _505);
    bool _603 = !_589;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_551, _357, _595);
    float _609 = fma(_551, _331, _597);
    float _611 = fma(_551, _369, _599);
    float _613 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _615 = abs(_605);
    float _617 = fma(_549, _439, _461);
    float _619 = fma(_555, _439, _463);
    float _621 = fma(_613, _345, _609);
    float _623 = fma(_601, _439, _465);
    float _625 = fma(_613, _365, _607);
    bool _627 = !_293;
    int _629 = _627 ? 0 : 1;
    float _631 = fma(_613, _379, _611);
    float _633 = fma(_585, _449, _621);
    bool _635 = !_593;
    int _637 = _635 ? 0 : 1;
    float _639 = 1.0 / _143;
    float _641 = float(_615);
    float _643 = fma(_585, _447, _625);
    int _645 = abs(_629);
    float _647 = -_633;
    float _649 = _555 + _647;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _653 = fma(_585, _451, _631);
    int _655 = abs(_637);
    float _657 = abs(_457);
    float _659 = _641 * _657;
    float _661 = _649 * _171;
    float _663 = _649 * _161;
    float _665 = _649 * _189;
    float _667 = float(_645);
    float _669 = -_643;
    float _671 = _549 + _669;
    float _673 = fma(_671, _169, _661);
    float _675 = float(_655);
    float _677 = fma(_671, _159, _663);
    float _679 = fma(_671, _187, _665);
    float _681 = fma(_667, _473, _659);
    float _683 = -_653;
    float _685 = _601 + _683;
    float _687 = abs(_469);
    float _689 = fma(_675, _687, _681);
    float _691 = fma(_685, _173, _673);
    float _693 = fma(_685, _163, _677);
    float _695 = fma(_685, _191, _679);
    float _697 = _111 * _639;
    bool _699 = !_651;
    float _701 = _693;
    float _703 = _691;
    float _705 = _695;
    float _721;
    if (!_699)
    {
        float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _709 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _711 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _713 = _711 * _707;
        float _715 = floor(_713);
        float _717 = -_715;
        float _719 = _713 + _717;
        _721 = _719;
        _723 = true;
    }
    else
    {
        _721 = _697;
    }
    _723 = false;
    float _725 = _721;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _729 = _725 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _733 = _725 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _749 = _725 + _747;
    float _751 = 1.0 / _737;
    bool _753 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _755 = isnan(_725);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _767 = isnan(_725);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_763;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / _741;
    bool _783 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _785 = _775 * _779;
    float _787 = -_775;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _745;
    float _793 = _729 * _751;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _799;
    float _803 = _733 * _781;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _805;
    float _809 = fma(_797, _793, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _815 = fma(_807, _793, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _817 = fma(_813, _803, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _819 = _749 * _791;
    bool _821 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _823 = isnan(_725);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_801, _793, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _835 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _837 = isnan(_725);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _855 = -_831;
    float _857 = _855 + 1.0;
    float _859 = _831 * _789;
    float _861 = fma(_849, _803, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _863 = fma(_853, _803, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _865 = _845 * _857;
    float _867 = in.m_65.x;
    float _869 = in.m_65.y;
    float _871 = in.m_65.z;
    float _873 = -_845;
    float _875 = _873 + 1.0;
    float _877 = _809 * _865;
    float _879 = _833 * _865;
    float _881 = _815 * _865;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _883;
    float _887 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].x, _877);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].y, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _895;
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].z, _881);
    float _901 = fma(_885, _819, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _903 = fma(_893, _819, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _905 = fma(_897, _819, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _907 = fma(_861, _859, _887);
    float _909 = fma(_817, _859, _889);
    float _911 = fma(_863, _859, _899);
    float _913 = fma(_901, _785, _907);
    float _915 = fma(_903, _785, _909);
    float _917 = fma(_905, _785, _911);
    float _919 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].x, _913);
    float _921 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].y, _915);
    float _923 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[146].z, _917);
    float _925 = _919 * _867;
    float _927 = _921 * _869;
    float _929 = _923 * _871;
    bool _931 = !_783;
    float _947;
    if (!_931)
    {
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _935 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _939 = _937 * _933;
        float _941 = floor(_939);
        float _943 = -_941;
        float _945 = _939 + _943;
        _947 = _945;
        _949 = true;
    }
    else
    {
        _947 = _697;
    }
    _949 = false;
    float _951 = _947;
    int _953 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _955 = _953;
    int _957 = 0;
    int _959 = _96(_955, _957, (*spvDescriptorSet0.support_buffer));
    float _961 = _141 * 8.0;
    float _963 = in.m_67.z;
    float _965 = rint(_961);
    float _967 = _965 * 0.125;
    float _969 = precise::clamp(_967, 0.0, 1.0);
    int _971 = _959 + (-1);
    float _973 = float(_971);
    float _975 = _969 * _973;
    float _977 = trunc(_963);
    int _979 = int(_977);
    float _981 = trunc(_975);
    int _983 = int(_981);
    int _985 = _983 + 1;
    int _987 = min(_971, _985);
    int _989 = _983;
    int _991 = 0;
    int _993 = _97(_989, _991, (*spvDescriptorSet0.support_buffer));
    int _995 = _979;
    int _997 = 0;
    int _999 = _97(_995, _997, (*spvDescriptorSet0.support_buffer));
    float3 _1003 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_993, _999)), 0).xyz;
    float _1005 = _1003.x;
    float _1007 = _1003.y;
    float _1009 = _1003.z;
    int _1011 = _987;
    int _1013 = 0;
    int _1015 = _97(_1011, _1013, (*spvDescriptorSet0.support_buffer));
    int _1017 = _979;
    int _1019 = 0;
    int _1021 = _97(_1017, _1019, (*spvDescriptorSet0.support_buffer));
    float3 _1023 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1015, _1021)), 0).xyz;
    float _1025 = _1023.x;
    float _1027 = _1023.y;
    float _1029 = _1023.z;
    float _1031 = in.m_55.z;
    float _1033 = _141 * 2.0;
    float _1035 = _145 * 2.0;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1045 = floor(_1033);
    float _1047 = _619 * _171;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1059 = _1057 != 0;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1061;
    float _1065 = _689 * _925;
    float _1067 = _689 * _927;
    float _1069 = _689 * _929;
    float _1071 = 1.0 / _1039;
    float _1073 = _619 * _189;
    float _1075 = fma(_617, _169, _1047);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _1079 = _951 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1083 = _951 + _1081;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1087 = _951 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1091 = _951 + _1089;
    float _1093 = floor(_1035);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1099 = _1045 >= 0.0;
    bool _1101 = isnan(_1045);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.0);
    bool _1107 = _1103 || _1105;
    float _1109 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1111 = _1045 > 0.0;
    float _1113 = fma(_623, _173, _1075);
    float _1115 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1117 = 1.0 / _1097;
    float _1119 = _619 * _161;
    float _1121 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1123 = fma(_617, _159, _1119);
    float _1125 = fma(_617, _187, _1073);
    float _1127 = 1.0 / _1043;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1131 = _951 + _1129;
    bool _1133 = _1093 > 0.0;
    float _1135 = fma(_623, _163, _1123);
    float _1137 = _1131 * _1071;
    float _1139 = _141 + _1031;
    float _1141 = 1.0 / _1063;
    float _1143 = _141 + _145;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1145;
    bool _1149 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1151 = isnan(_951);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1165 = _1143 + (-1.0);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _1167;
    bool _1171 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1173 = isnan(_951);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = _1083 * _1127;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _1189 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1191 = 1.0 / _1169;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1195 = _951 + _1193;
    int _1197 = _1107 ? 0 : 1;
    float _1199 = _141 + (-0.5);
    bool _1201 = _1093 >= 0.0;
    bool _1203 = isnan(_1093);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    float _1211 = _1195 * _1117;
    float _1213 = _1139 + (-1.0);
    float _1215 = 1.0 / _1187;
    float _1217 = _1031 * 2.0;
    float _1219 = _145 + _1031;
    float _1221 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1223 = _1091 * _1141;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = _1219 + (-1.0);
    float _1233 = floor(_1217);
    int _1235 = _1229;
    if (!_1111)
    {
        int _1237 = ~_1197;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _1087 * _1191;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1251 = _1209 ? 0 : 1;
    float _1253 = fma(_1247, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1255 = _1079 * _1215;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1273 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1275 = log2(_1273);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1277;
    float _1281 = fma(_1267, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1283 = _1233 > 0.0;
    float _1285 = fma(_1271, _1183, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1287 = _1233 >= 0.0;
    bool _1289 = isnan(_1233);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1313;
    float _1317 = fma(_1259, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1319 = fma(_1263, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1321 = fma(_1279, _1137, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1323;
    float _1327 = fma(_1299, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    bool _1329 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _1331 = isnan(_951);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = fma(_1303, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1343 = fma(_1307, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1345 = fma(_1311, _1211, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1347 = fma(_1315, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    bool _1349 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1351 = isnan(_951);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = fma(_1325, _1223, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    bool _1363 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _1365 = isnan(_951);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _1371 = _1367 || _1369;
    float _1373 = float(_1371);
    float _1375 = -_1339;
    float _1377 = _1375 + 1.0;
    bool _1379 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1381 = isnan(_951);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -_1359;
    float _1393 = _1391 + 1.0;
    float _1395 = _111 * _1275;
    float _1397 = _1373 * _1377;
    float _1399 = fma(_1147, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1401 = _1389 * _1393;
    float _1403 = -_1389;
    float _1405 = _1403 + 1.0;
    float _1407 = exp2(_1395);
    float _1409 = _1159 * _1405;
    bool _1411 = _951 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1413 = isnan(_951);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1419 = _1415 || _1417;
    float _1421 = float(_1419);
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1425 = 1.0 + _1423;
    float _1427 = -_1159;
    float _1429 = _1427 + 1.0;
    float _1431 = -_1373;
    float _1433 = _1431 + 1.0;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1435;
    float _1439 = _1421 * _1429;
    float _1441 = 1.0 / _1425;
    float _1443 = -_1421;
    float _1445 = _1443 + 1.0;
    float _1447 = _1359 * _1433;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1449;
    float _1453 = fma(_1437, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1455 = _1181 * _1445;
    bool _1457 = !_1055;
    int _1459 = _1457 ? 0 : 1;
    float _1461 = -_1407;
    float _1463 = _1461 + 1.0;
    bool _1465 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1467 = isnan(0.0);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1473 = _1469 || _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1477 = _1475 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1479 = fma(_1451, _1243, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1481 = fma(_1163, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1483 = _1317 * _1455;
    float _1485 = _1319 * _1455;
    float _1487 = _1321 * _1455;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1493 = _1473 ? _1463 : 0.0;
    float _1495 = in.m_69.x;
    float _1497 = in.m_69.y;
    float _1499 = in.m_69.z;
    float _1501 = float(_1241);
    float _1503 = fma(_1491, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    int _1505 = ~_1251;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = _1493 * _1441;
    int _1513 = _1509;
    if (!_1133)
    {
        int _1515 = ~_1251;
        int _1517 = _1515 + 1;
        _1513 = _1517;
    }
    int _1519 = _1513;
    float _1521 = fma(_1477, _1255, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    bool _1523 = !_1059;
    int _1525 = _1523 ? 0 : 1;
    float _1527 = _145 + (-0.5);
    int _1529 = abs(_1459);
    float _1531 = -_1181;
    float _1533 = _1531 + 1.0;
    int _1535 = abs(_1525);
    float _1537 = fma(_623, _191, _1125);
    float _1539 = float(_1529);
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1483);
    float _1543 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1485);
    float _1545 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1487);
    int _1547 = _1295 ? 0 : 1;
    float _1549 = _1539 * _1501;
    float _1551 = fma(_1281, _1439, _1541);
    float _1553 = fma(_1253, _1439, _1543);
    float _1555 = fma(_1285, _1439, _1545);
    float _1557 = _1549 * (-2.0);
    int _1559 = ~_1547;
    int _1561 = _1559 + 1;
    int _1563 = _1561 + 1;
    float _1565 = fma(_1327, _1409, _1551);
    int _1567 = _1563;
    if (!_1283)
    {
        int _1569 = ~_1547;
        int _1571 = _1569 + 1;
        _1567 = _1571;
    }
    int _1573 = _1567;
    float _1575 = fma(_1557, _1497, _1497);
    bool _1577 = !_1051;
    int _1579 = _1577 ? 0 : 1;
    float _1581 = fma(_1249, _1557, _1249);
    bool _1583 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1585 = isnan(1.0);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1591 = _1587 || _1589;
    float _1593 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1575);
    float _1595 = float(_1535);
    float _1597 = fma(_1347, _1409, _1553);
    float _1599 = float(_1519);
    float _1601 = fma(_1341, _1401, _1565);
    int _1603 = abs(_1579);
    float _1605 = fma(_1361, _1409, _1555);
    bool _1607 = !_1591;
    float _1609 = _1607 ? _111 : _1511;
    float _1611 = _1595 * _1599;
    float _1613 = float(_1603);
    float _1615 = fma(_1343, _1401, _1597);
    float _1617 = float(_1573);
    float _1619 = fma(_1609, _1581, _1593);
    float _1621 = _1611 * (-2.0);
    float _1623 = fma(_1345, _1401, _1605);
    float _1625 = fma(_1399, _1447, _1601);
    float _1627 = _1613 * _1617;
    float _1629 = _1619 * 0.15915493667125701904296875;
    float _1631 = _1031 + (-0.5);
    float _1633 = fma(_1621, _1499, _1499);
    float _1635 = fma(_1221, _1621, _1221);
    float _1637 = fma(_1453, _1447, _1615);
    float _1639 = fma(_1479, _1447, _1623);
    float _1641 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1633);
    float _1643 = _1627 * (-2.0);
    float _1645 = _1629 * 6.283185482025146484375;
    float _1647 = sin(_1645);
    float _1649 = fma(_1481, _1397, _1625);
    float _1651 = fma(_1609, _1635, _1641);
    float _1653 = fma(_1643, _1495, _1495);
    float _1655 = fma(_1189, _1643, _1189);
    float _1657 = _1651 * 0.15915493667125701904296875;
    float _1659 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1653);
    float _1661 = _1629 * 6.283185482025146484375;
    float _1663 = cos(_1661);
    float _1665 = fma(_1503, _1397, _1637);
    float _1667 = fma(_1521, _1397, _1639);
    float _1669 = fma(_1609, _1655, _1659);
    float _1671 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1649);
    float _1673 = _1669 * 0.15915493667125701904296875;
    float _1675 = floor(_975);
    float _1677 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1665);
    float _1679 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[113].z, _1667);
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1687 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1689 = _1657 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1699 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1701 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1703 = _1657 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    out.m_71.x = _1687;
    out.m_71.y = _1695;
    out.m_71.z = _1697;
    out.m_71.w = _1693;
    float _1707 = -_1675;
    float _1709 = _975 + _1707;
    float _1711 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1673 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1721 = _1663 * _1691;
    float _1723 = _1647 * _1691;
    float _1725 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1727 = _1673 * 6.283185482025146484375;
    float _1729 = sin(_1727);
    float _1731 = _1647 * _1705;
    float _1733 = _1663 * _1705;
    out.m_73.x = _1725;
    out.m_73.y = _1711;
    out.m_73.z = _1713;
    float _1735 = _1717 * _1647;
    float _1737 = _1717 * _1705;
    float _1739 = in.m_63.w;
    float _1741 = _1717 * _1691;
    float _1743 = _1717 * _1663;
    float _1745 = fma(_1729, _1723, _1733);
    float _1747 = fma(_1729, _1733, _1723);
    float _1749 = -_1731;
    float _1751 = fma(_1729, _1721, _1749);
    float _1753 = -_1005;
    float _1755 = _1753 + _1025;
    float _1757 = -_1007;
    float _1759 = _1757 + _1027;
    float _1761 = -_1009;
    float _1763 = _1761 + _1029;
    float _1765 = -_1721;
    float _1767 = fma(_1729, _1731, _1765);
    float _1769 = fma(_1709, _1755, _1005);
    float _1771 = fma(_1709, _1759, _1007);
    float _1773 = fma(_1709, _1763, _1009);
    float _1775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1769);
    float _1777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1771);
    float _1779 = in.m_61.w;
    bool _1781 = _1771 != 0.0;
    bool _1783 = isnan(_1771);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(0.0);
    bool _1789 = _1785 || _1787;
    float _1791 = _1115 * _1775;
    float _1793 = _1109 * _1777;
    float _1795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1773);
    bool _1797 = _1769 == 0.0;
    bool _1799 = !_1789;
    bool _1801 = _1797 && _1799;
    float _1803 = _1737 * _1793;
    float _1805 = _1767 * _1793;
    float _1807 = _1121 * _1795;
    float _1809 = _1747 * _1793;
    float _1811 = fma(_1741, _1791, _1803);
    float _1813 = fma(_1745, _1791, _1805);
    float _1815 = in.m_59.w;
    float _1817 = fma(_1751, _1791, _1809);
    float _1819 = -_1729;
    float _1821 = fma(_1819, _1807, _1811);
    float _1823 = fma(_1735, _1807, _1813);
    bool _1825 = _1773 == 0.0;
    bool _1827 = _1825 && _1801;
    float _1829 = fma(_1743, _1807, _1817);
    float _1831 = _1821 * _331;
    float _1833 = _1821 * _345;
    float _1835 = _1537 + _1739;
    float _1837 = _1821 * _341;
    float _1839 = fma(_1823, _357, _1831);
    float _1841 = fma(_1823, _365, _1833);
    float _1843 = _1113 + _1779;
    float _1845 = fma(_1823, _361, _1837);
    float _1847 = fma(_1829, _369, _1839);
    float _1849 = fma(_1829, _379, _1841);
    float _1851 = fma(_1829, _373, _1845);
    float _1853 = _1843 + _1847;
    float _1855 = _1835 + _1849;
    float _1857 = in.m_75.x;
    float _1859 = in.m_75.y;
    float _1861 = in.m_75.z;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1865 = _1853 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1869 = _1855 + _1867;
    float _1871 = _1135 + _1815;
    float _1873 = _1865 * _1865;
    float _1875 = _1869 * _1869;
    float _1877 = _1871 + _1851;
    float _1879 = _1873 + _1875;
    float _1881 = sqrt(_1879);
    float _1883 = _1859;
    float _1885 = _1857;
    float _1887 = _1845;
    float _1889 = _1767;
    float _1891 = _1747;
    float _1893 = _1771;
    float _1895 = _1861;
    float _1897 = _1773;
    if (!_1827)
    {
        float _1899 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _1883 = _1899;
    }
    float _1901 = _1883;
    float _1903 = _1901;
    if (!_1827)
    {
        float _1905 = fma(_1769, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _1885 = _1905;
    }
    float _1907 = _1885;
    float _1909 = _1737 * _1901;
    float _1911 = _1767 * _1901;
    bool _1913 = _1881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1915 = _1747 * _1901;
    float _1917 = fma(_1741, _1907, _1909);
    float _1919 = _1881;
    if (!_1913)
    {
        _1887 = _1875;
    }
    float _1921 = _1887;
    float _1923 = _1921;
    if (!_1913)
    {
        _1903 = _1873;
    }
    float _1925 = _1903;
    float _1927 = _1925;
    if (!_1913)
    {
        _1889 = _1853;
    }
    float _1929 = _1889;
    float _1931 = _1929;
    if (!_1913)
    {
        _1891 = _1855;
    }
    float _1933 = _1891;
    float _1935 = _1933;
    if (!_1913)
    {
        _1893 = _1877;
    }
    float _1937 = _1893;
    bool _1939 = !_1913;
    float _1941 = _1937;
    if (!_1939)
    {
        float _1943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1947 = _1881 + _1945;
        float _1949 = rsqrt(_1879);
        float _1951 = _1947 * _1943;
        float _1953 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1955 = _1951 * 0.15915493667125701904296875;
        float _1957 = _1955 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = _1955 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = fma(_1959, _1953, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1967 = _1949 * _1965;
        float _1969 = _1963 + (-1.0);
        float _1971 = fma(_1865, _1967, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1973 = fma(_1869, _1967, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1975 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1979 = _1971 + _1977;
        float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1983 = _1973 + _1981;
        float _1985 = fma(_1877, _1963, _1975);
        float _1987 = _1979 * _1979;
        float _1989 = _1983 * _1983;
        _1941 = _1985;
        _1927 = _1987;
        _1923 = _1989;
        _1931 = _1971;
        _1935 = _1973;
        _1919 = _1983;
    }
    float _1991 = _1941;
    float _1993 = _1927;
    float _1995 = _1923;
    float _1997 = _1931;
    float _1999 = _1935;
    float _2001 = _1919;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2005 = _1991 + _2003;
    if (!_1827)
    {
        float _2007 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1861);
        _1895 = _2007;
    }
    float _2009 = _1895;
    float _2011 = fma(_1745, _1907, _1911);
    float _2013 = fma(_1751, _1907, _1915);
    float _2015 = fma(_2005, _2005, _1993);
    float _2017 = -_1729;
    float _2019 = fma(_2017, _2009, _1917);
    float _2021 = fma(_1735, _2009, _2011);
    float _2023 = fma(_1743, _2009, _2013);
    float _2025 = _2015 + _1995;
    float _2027 = _2019 * _331;
    float _2029 = _2019 * _341;
    float _2031 = _2019 * _345;
    float _2033 = fma(_2021, _357, _2027);
    float _2035 = sqrt(_2025);
    float _2037 = fma(_2021, _361, _2029);
    float _2039 = fma(_2021, _365, _2031);
    float _2041 = fma(_2023, _369, _2033);
    float _2043 = fma(_2023, _373, _2037);
    float _2045 = fma(_2023, _379, _2039);
    out.m_77.x = _2041;
    out.m_77.y = _2043;
    out.m_77.z = _2045;
    bool _2047 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2049 = isnan(_2035);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2055 = _2051 || _2053;
    float _2057 = _2021;
    float _2059 = _2035;
    if (!_2055)
    {
        _1897 = 1.0;
    }
    float _2061 = _1897;
    bool _2063 = !_2055;
    float _2065 = _2061;
    if (!_2063)
    {
        bool _2067 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2069 = isnan(_2035);
        bool _2071 = _2067 || _2069;
        bool _2073 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2075 = _2071 || _2073;
        if (!_2075)
        {
            float _2077 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2079 = _2035 + _2077;
            float _2081 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2083 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2089 = 1.0 / _2083;
            float _2091 = _2079 * _2089;
            float _2093 = fma(_2091, _2087, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2065 = _2093;
            _2095 = true;
        }
        else
        {
            bool _2097 = _2035 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2099 = isnan(_2035);
            bool _2101 = _2097 || _2099;
            bool _2103 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2105 = _2101 || _2103;
            if (!_2105)
            {
                float _2107 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2109 = _2035 + _2107;
                float _2111 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2113 = _2111 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2115 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2117 = _2115 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2119 = 1.0 / _2113;
                float _2121 = _2109 * _2119;
                float _2123 = fma(_2121, _2117, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2065 = _2123;
                _2095 = true;
            }
            else
            {
                _2065 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2095 = false;
    float _2125 = _2065;
    float _2127 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2129 = _1991 + _2127;
    float _2131 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2133 = _1997 + _2131;
    float _2135 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2137 = _1999 + _2135;
    float _2139 = fma(_2129, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2141 = fma(_2133, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2143 = fma(_2137, _2125, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2145 = -_1871;
    float _2147 = _2145 + _2139;
    float _2149 = -_1843;
    float _2151 = _2149 + _2141;
    float _2153 = -_1835;
    float _2155 = _2153 + _2143;
    float _2157 = _2147 * _2147;
    float _2159 = fma(_2151, _2151, _2157);
    float _2161 = fma(_2155, _2155, _2159);
    float _2163 = sqrt(_2161);
    bool _2165 = _2163 > 0.0;
    bool _2167 = !_2165;
    float _2169 = _2163;
    float _2171 = _2141;
    float _2173 = _2139;
    float _2175 = _2143;
    if (!_2167)
    {
        bool _2177 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2179 = _2001;
        if (_2177)
        {
            float _2181 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2179 = _2181;
        }
        float _2183 = _2179;
        if (_2177)
        {
            float _2185 = _691 * _2183;
            _2057 = _2185;
        }
        float _2187 = _2057;
        float _2189 = _2187;
        if (_2177)
        {
            float _2191 = _693 * _2183;
            _2059 = _2191;
        }
        float _2193 = _2059;
        float _2195 = _2193;
        if (_2177)
        {
            float _2197 = _695 * _2183;
            _2169 = _2197;
        }
        float _2199 = _2169;
        float _2201 = _2199;
        float _2203 = _2199;
        if (!_2177)
        {
            float _2205 = _111 + 1.0;
            if (!_185)
            {
                float _2207 = _2205 * _2205;
                float _2209 = _2207 * 0.5;
                _2201 = _2209;
            }
            float _2211 = _2201;
            float _2213 = _2211;
            if (!_185)
            {
                float _2215 = _2211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2213 = _2215;
            }
            float _2217 = _2213;
            bool _2219 = !_185;
            float _2221 = _2217;
            if (!_2219)
            {
                float _2223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2225 = log2(_2223);
                float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2229 = _2227 + 1.0;
                float _2231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2233 = _2225 * _2205;
                float _2235 = 1.0 / _2229;
                float _2237 = _2231 * 0.693147182464599609375;
                float _2239 = exp2(_2233);
                float _2241 = 1.0 / _2237;
                float _2243 = _2239 + (-1.0);
                float _2245 = -_2243;
                float _2247 = fma(_2245, _2241, _2205);
                float _2249 = _2247 * _2235;
                float _2251 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2221 = _2251;
            }
            float _2253 = _2221;
            float _2255 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2257 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2259 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2261 = _2255 * _341;
            float _2263 = _2255 * _361;
            float _2265 = fma(_2257, _331, _2261);
            float _2267 = _2255 * _373;
            float _2269 = fma(_2257, _357, _2263);
            if (!_185)
            {
                _375 = _2205;
            }
            float _2271 = _375;
            float _2273 = fma(_2259, _345, _2265);
            bool _2275 = !_185;
            float _2277 = _2271;
            if (!_2275)
            {
                float _2279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2281 = log2(_2279);
                float _2283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2285 = _2283 + 1.0;
                float _2287 = 1.0 / _2285;
                float _2289 = _2281 * _2205;
                float _2291 = exp2(_2289);
                float _2293 = -_2291;
                float _2295 = _2293 + 1.0;
                float _2297 = _2295 * _2287;
                _2277 = _2297;
            }
            float _2299 = _2277;
            float _2301 = fma(_2259, _365, _2269);
            float _2303 = fma(_2257, _369, _2267);
            float _2305 = fma(_2299, _449, _2273);
            float _2307 = fma(_2299, _447, _2301);
            float _2309 = fma(_2259, _379, _2303);
            float _2311 = -_633;
            float _2313 = _2311 + _2305;
            float _2315 = -_643;
            float _2317 = _2315 + _2307;
            float _2319 = fma(_2299, _451, _2309);
            float _2321 = _2313 * _171;
            float _2323 = _2313 * _161;
            float _2325 = _2313 * _189;
            float _2327 = -_653;
            float _2329 = _2327 + _2319;
            float _2331 = fma(_2317, _169, _2321);
            float _2333 = fma(_2317, _159, _2323);
            float _2335 = fma(_2317, _187, _2325);
            float _2337 = fma(_2329, _173, _2331);
            float _2339 = fma(_2329, _163, _2333);
            float _2341 = fma(_2329, _191, _2335);
            _701 = _2339;
            _703 = _2337;
            _705 = _2341;
            _2189 = _2337;
            _2195 = _2339;
            _2203 = _2341;
            _257 = _2335;
        }
        float _2343 = _701;
        float _2345 = _703;
        float _2347 = _705;
        float _2349 = _2189;
        float _2351 = _2195;
        float _2353 = _2203;
        float _2355 = _257;
        float _2357 = _2343 * _2343;
        float _2359 = rsqrt(_2161);
        float _2361 = fma(_2345, _2345, _2357);
        float _2363 = fma(_2347, _2347, _2361);
        float _2365 = sqrt(_2363);
        float _2367 = _2151 * _2359;
        float _2369 = _2147 * _2359;
        float _2371 = _2155 * _2359;
        bool _2373 = _2365 > 0.0;
        bool _2375 = !_2373;
        _217 = _2361;
        _259 = _2355;
        if (!_2375)
        {
            float _2377 = rsqrt(_2363);
            float _2379 = _2377 * _2343;
            float _2381 = _2377 * _2345;
            float _2383 = _2377 * _2347;
            float _2385 = _2369 * _2379;
            float _2387 = fma(_2367, _2381, _2385);
            float _2389 = fma(_2371, _2383, _2387);
            float _2391 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2393 = fma(_2349, _2391, _2141);
            float _2395 = fma(_2351, _2391, _2139);
            float _2397 = fma(_2353, _2391, _2143);
            _2171 = _2393;
            _2173 = _2395;
            _2175 = _2397;
            _217 = _2383;
            _219 = _2379;
        }
    }
    float _2399 = _2171;
    float _2401 = _2173;
    float _2403 = _2175;
    float _2405 = _217;
    float _2407 = _219;
    float _2409 = _259;
    bool _2411 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.5);
    bool _2419 = _2415 || _2417;
    float _2421 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2423 = _2405;
    float _2425 = _2407;
    float _2427 = _2409;
    float _2429 = _2399;
    if (_2419)
    {
        _2421 = _2399;
    }
    float _2431 = _2421;
    float _2433 = _2431;
    if (_2419)
    {
        _2423 = _2401;
    }
    float _2435 = _2423;
    float _2437 = _2435;
    if (_2419)
    {
        _2425 = _2403;
    }
    float _2439 = _2425;
    float _2441 = _2439;
    if (!_2419)
    {
        float _2443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2445 = _1871 + _2443;
        float _2447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2449 = _1843 + _2447;
        float _2451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2453 = -_1871;
        float _2455 = _2453 + _2401;
        float _2457 = _2445 * _2445;
        float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2461 = _1835 + _2459;
        float _2463 = -_1835;
        float _2465 = _2463 + _2403;
        float _2467 = fma(_2449, _2449, _2457);
        float _2469 = fma(_2461, _2461, _2467);
        float _2471 = -_1843;
        float _2473 = _2471 + _2399;
        float _2475 = sqrt(_2469);
        float _2477 = precise::min(_2475, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2479 = _2477 * _2451;
        float _2481 = fma(_2473, _2479, _1843);
        float _2483 = fma(_2455, _2479, _1871);
        float _2485 = fma(_2465, _2479, _1835);
        _2437 = _2483;
        _2433 = _2481;
        _2441 = _2485;
    }
    float _2487 = _2437;
    float _2489 = _2433;
    float _2491 = _2441;
    float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2495 = _2487 + _2493;
    float _2497 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2499 = _2489 + _2497;
    float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2503 = _2491 + _2501;
    float _2505 = _2495 * _2495;
    float _2507 = fma(_2499, _2499, _2505);
    float _2509 = fma(_2503, _2503, _2507);
    float _2511 = rsqrt(_2509);
    float _2513 = sqrt(_2509);
    float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2517 = _2499 * _2515;
    float _2519 = _2503 * _2515;
    float _2521 = _2517 * _2517;
    float _2523 = _2519 * _2519;
    float _2525 = _2521 + _2523;
    float _2527 = sqrt(_2525);
    bool _2529 = _2527 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = _2527 + _2531;
    float _2535 = _2511;
    float _2537 = _2533;
    float _2539 = _2495;
    float _2541 = _2515;
    if (_2529)
    {
        float _2543 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2535 = _2543;
    }
    float _2545 = _2535;
    float _2547 = _2545;
    if (_2529)
    {
        float _2549 = _2533 * _2545;
        _2537 = _2549;
    }
    float _2551 = _2537;
    if (_2529)
    {
        float _2553 = rsqrt(_2525);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = _2555;
    if (_2529)
    {
        float _2559 = _2551 * 0.15915493667125701904296875;
        _2427 = _2559;
    }
    float _2561 = _2427;
    float _2563 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2565 = _2503;
    float _2567 = _2561;
    if (_2529)
    {
        float _2569 = _2561 * 6.283185482025146484375;
        float _2571 = sin(_2569);
        _2565 = _2571;
    }
    float _2573 = _2565;
    float _2575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2577 = precise::max(0.0, _2563);
    float _2579 = _187;
    float _2581 = _2577;
    if (_2529)
    {
        float _2583 = _2561 * 6.283185482025146484375;
        float _2585 = cos(_2583);
        _2579 = _2585;
    }
    float _2587 = _2579;
    float _2589 = -_2515;
    float _2591 = -_2577;
    float _2593 = fma(_2495, _2589, _2591);
    if (_2529)
    {
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2539 = _2595;
    }
    float _2597 = _2539;
    float _2599 = _2573;
    float _2601 = _2597;
    if (_2529)
    {
        float _2603 = fma(_2573, _2597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2599 = _2603;
    }
    float _2605 = _2599;
    float _2607 = _2605;
    if (!_2529)
    {
        _2601 = _2519;
    }
    float _2609 = _2601;
    float _2611 = _2609;
    if (!_2529)
    {
        _2567 = _2521;
    }
    float _2613 = _2567;
    float _2615 = _2613;
    if (_2529)
    {
        float _2617 = _2555 * _2605;
        _2429 = _2617;
    }
    float _2619 = _2429;
    if (!_2529)
    {
        _2557 = _2517;
    }
    float _2621 = _2557;
    float _2623 = _2621;
    if (_2529)
    {
        float _2625 = _2587 + (-1.0);
        _2581 = _2625;
    }
    float _2627 = _2581;
    float _2629 = _2627;
    if (_2529)
    {
        float _2631 = _2517 * _2619;
        _2623 = _2631;
    }
    float _2633 = _2623;
    if (!_2529)
    {
        _2607 = _2593;
    }
    float _2635 = _2607;
    float _2637 = _2635;
    if (_2529)
    {
        float _2639 = _2519 * _2619;
        _2611 = _2639;
    }
    float _2641 = _2611;
    if (_2529)
    {
        float _2643 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2541 = _2643;
    }
    float _2645 = _2541;
    if (_2529)
    {
        float _2647 = _2633 * _2633;
        _2615 = _2647;
    }
    float _2649 = _2615;
    if (!_2529)
    {
        _2629 = _2523;
    }
    float _2651 = _2629;
    float _2653 = _2651;
    if (_2529)
    {
        float _2655 = _2641 * _2641;
        _2653 = _2655;
    }
    float _2657 = _2653;
    if (_2529)
    {
        float _2659 = fma(_2593, _2587, _2645);
        _2637 = _2659;
    }
    float _2661 = _2637;
    float _2663 = fma(_2661, _2661, _2649);
    float _2665 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2669 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2667);
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2675 = _2663 + _2657;
    float _2677 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2665);
    float _2679 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2681 = -_2671;
    float _2683 = _2681 + 1.0;
    float _2685 = rsqrt(_2675);
    float _2687 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2677);
    float _2689 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2691 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2679);
    float _2693 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2673);
    float _2695 = _2687 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2697 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2689);
    float _2699 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2691);
    float _2701 = abs(_2683);
    float _2703 = log2(_2701);
    float _2705 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2693);
    float _2707 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2697);
    float _2709 = _2699 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2711 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2713 = _2705 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2715 = _2707 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2717 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2719 = _2685 * _2633;
    float _2721 = _2685 * _2661;
    float _2723 = _2685 * _2641;
    float _2725 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2717);
    float _2727 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2729 = -_2711;
    float _2731 = fma(_2729, _2575, 1.0);
    float _2733 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2725);
    float _2735 = -_2727;
    float _2737 = fma(_2721, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2735);
    float _2739 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2741 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2743 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2733);
    float _2745 = -_2723;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2737);
    float _2749 = log2(_2731);
    float _2751 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2753 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2741);
    float _2755 = fma(_2747, -0.5, 0.5);
    float _2757 = fma(_2747, 0.5, 0.5);
    float _2759 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2751);
    float _2761 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2753);
    float _2763 = _2721 + 1.0;
    float _2765 = exp2(_2739);
    float _2767 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2759);
    float _2769 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2767);
    float _2771 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2761);
    float _2773 = 1.0 / _2743;
    float _2775 = fma(_2757, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2777 = _2749 * 0.693147182464599609375;
    float _2779 = fma(_2757, _2775, -0.212114393711090087890625);
    float _2781 = _2777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2783 = sqrt(_2755);
    float _2785 = -_2721;
    float _2787 = fma(_2765, _2763, _2785);
    float _2789 = fma(_2757, _2779, 1.570728778839111328125);
    float _2791 = fma(_2787, 0.5, 0.5);
    float _2793 = _2769 * _2773;
    float _2795 = _2771 * _2773;
    float _2797 = fma(_2793, 0.5, 0.5);
    float _2799 = fma(_2795, -0.5, 0.5);
    float _2801 = _2783 * 0.636619746685028076171875;
    float3 _7157 = float3(_2797, _2799, _2781);
    float _2803 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7157, float3(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7157, float3(0.0), isnan(_7157)), level(0.0)).x;
    float3 _7168 = float3(_2797, _2799, _2781);
    float4 _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7168, float3(0.0), isnan(_7168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7168, float3(0.0), isnan(_7168)), level(0.0)).xyzw;
    float _2808 = _2806.x;
    float _2810 = _2806.y;
    float _2812 = _2806.z;
    float _2814 = _2806.w;
    float _2816 = -_2789;
    float _2818 = fma(_2801, _2816, 1.0);
    float2 _7190 = float2(_2818, _2791);
    float3 _2820 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7190, float2(0.0), isnan(_7190)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7190, float2(0.0), isnan(_7190)), level(0.0)).xyz;
    float _2822 = _2820.x;
    float _2824 = _2820.y;
    float _2826 = _2820.z;
    float _2828 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2830 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2832 = _2709 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2489;
    out.m_79.y = _2487;
    out.m_79.z = _2491;
    float _2834 = fma(_1843, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2828);
    float _2836 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2838 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2832);
    float _2840 = exp2(_2830);
    float _2842 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2834);
    float _2844 = fma(_1843, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2836);
    float _2846 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2838);
    float _2848 = _2842 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2850 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2844);
    float _2852 = 1.0 / _2848;
    bool _2854 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2858 = _2854 || _2856;
    bool _2860 = isnan(0.5);
    bool _2862 = _2858 || _2860;
    float _2864 = _2850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2866 = _2864 + _2848;
    float _2868 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2870 = _2866;
    float _2872 = _2801;
    float _2874 = _2715;
    if (!_2862)
    {
        _2868 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2876 = _2868;
    float _2878 = _2866 * _2852;
    float _2880 = _2878 * 0.5;
    float _2882 = _2880;
    float _2884 = _2876;
    if (!_2862)
    {
        _2870 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2886 = _2870;
    if (!_2862)
    {
        float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2890 = fma(_2880, _2876, _2888);
        _2882 = _2890;
    }
    float _2892 = _2882;
    if (_2862)
    {
        _2884 = 1.0;
    }
    float _2894 = _2884;
    float _2896 = _2894;
    if (!_2862)
    {
        float _2898 = -_2886;
        float _2900 = _2898 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2872 = _2900;
    }
    float _2902 = _2872;
    float _2904 = _2892;
    if (!_2862)
    {
        float _2906 = 1.0 / _2892;
        _2904 = _2906;
    }
    float _2908 = _2904;
    float _2910 = _2902;
    if (!_2862)
    {
        float _2912 = 1.0 / _2902;
        _2910 = _2912;
    }
    float _2914 = _2910;
    if (!_2862)
    {
        float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2918 = -_2886;
        float _2920 = fma(_2908, _2916, _2918);
        _2874 = _2920;
    }
    float _2922 = _2874;
    float _2924 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2846);
    float _2926 = -_2840;
    float _2928 = _2926 + 1.0;
    float _2930 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2769;
    out.gl_Position.y = _2771;
    out.gl_Position.z = _2924;
    out.gl_Position.w = _2743;
    if (!_2862)
    {
        float _2932 = _2922 * _2914;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        _2896 = _2934;
    }
    float _2936 = _2896;
    float _2938 = _2924 + _2743;
    float _2940 = _2936 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2942 = _2936 > 0.0;
    bool _2944 = isnan(_2936);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan(0.0);
    bool _2950 = _2946 || _2948;
    float _2952 = _2938 * 0.5;
    float _2954 = _2940 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.z = _2952;
    out.m_81.w = _2743;
    out.m_53.x = _2954;
    float _2956 = _2930 * _2803;
    float _2958 = -_2930;
    float _2960 = _2958 + 1.0;
    float _2962 = _2814 * _2956;
    float _2964 = _2826 * _2956;
    float _2966 = fma(_2822, _2962, _2808);
    float _2968 = fma(_2824, _2962, _2810);
    float _2970 = _2814 * _2960;
    float _2972 = fma(_2814, _2964, _2812);
    out.m_83.x = _2966;
    out.m_83.y = _2968;
    out.m_83.z = _2972;
    out.m_83.w = _2970;
    if (_2950)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2974;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

