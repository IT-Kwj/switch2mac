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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _2153 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2153, float2(0.0), isnan(_2153))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2153, float2(0.0), isnan(_2153))).x;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _83 * _83;
    float _89 = _57 * _81;
    float _91 = fma(_85, _85, _87);
    float _93 = fma(_89, _89, _91);
    float _95 = rsqrt(_93);
    float _97 = (*spvDescriptorSet0.fp_c4)._m0[0].y + (-220.0);
    float _99 = precise::max(0.0, _97);
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _103 = _85 * _101;
    float _105 = _89 * _101;
    float _107 = -_101;
    float _109 = -_99;
    float _111 = fma(_83, _107, _109);
    float _113 = _103 * _103;
    float _115 = _105 * _105;
    float _117 = _113 + _115;
    float _119 = sqrt(_117);
    bool _123 = _119 > (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _125 = -(*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _127 = _119 + _125;
    float _129 = _95;
    float _131 = _127;
    float _133 = _117;
    float _135 = _111;
    float _137 = _103;
    float _139 = _113;
    if (_123)
    {
        float _141 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _129 = _141;
    }
    float _143 = _129;
    if (_123)
    {
        float _145 = _127 * _143;
        _131 = _145;
    }
    float _147 = _131;
    float _149 = 0.0;
    if (_123)
    {
        float _151 = _147 * 0.15915493667125701904296875;
        _149 = _151;
    }
    float _153 = _149;
    float _155 = _143;
    if (_123)
    {
        float _157 = _153 * 6.283185482025146484375;
        float _159 = sin(_157);
        _155 = _159;
    }
    float _161 = _155;
    float _163 = _147;
    if (_123)
    {
        float _165 = _153 * 6.283185482025146484375;
        float _167 = cos(_165);
        _163 = _167;
    }
    float _169 = _163;
    float _171 = 0.0 + _63;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = -_173;
    bool _177 = _175 != (-1.0);
    bool _179 = isnan(_175);
    bool _181 = _177 || _179;
    bool _183 = isnan(-1.0);
    bool _185 = _181 || _183;
    float _187 = _161;
    float _189 = _169;
    if (!_185)
    {
        discard_fragment();
    }
    float _191 = 0.0;
    if (_123)
    {
        float _193 = rsqrt(_117);
        _191 = _193;
    }
    float _195 = _191;
    float _197 = 0.0;
    if (_123)
    {
        float _199 = _111 + (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = _201;
    if (_123)
    {
        float _205 = fma(_161, _201, (*spvDescriptorSet0.fp_c4)._m0[1].x);
        _203 = _205;
    }
    float _207 = _203;
    float _209 = _207;
    if (_123)
    {
        float _211 = _169 + (-1.0);
        _187 = _211;
    }
    float _213 = _187;
    if (!_123)
    {
        _133 = _105;
    }
    float _215 = _133;
    float _217 = _195;
    float _219 = _215;
    if (_123)
    {
        float _221 = _195 * _207;
        _217 = _221;
    }
    float _223 = _217;
    if (_123)
    {
        float _225 = _213 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _209 = _225;
    }
    float _227 = _209;
    if (_123)
    {
        float _229 = _105 * _223;
        _219 = _229;
    }
    float _231 = _219;
    if (_123)
    {
        float _233 = fma(_111, _169, _227);
        _135 = _233;
    }
    float _235 = _135;
    if (!_123)
    {
        _189 = _103;
    }
    float _237 = _189;
    float _239 = _237;
    if (_123)
    {
        float _241 = _103 * _223;
        _239 = _241;
    }
    float _243 = _239;
    if (!_123)
    {
        _137 = _115;
    }
    float _245 = _137;
    float _247 = _245;
    if (_123)
    {
        float _249 = _231 * _231;
        _247 = _249;
    }
    float _251 = _247;
    if (_123)
    {
        float _253 = _243 * _243;
        _139 = _253;
    }
    float _255 = _139;
    float _257 = fma(_235, _235, _255);
    float _259 = _257 + _251;
    if (!_185)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _261 = rsqrt(_259);
    float _263 = (*spvDescriptorSet0.fp_c3)._m0[5].w * (-1.58496248722076416015625);
    float _265 = (*spvDescriptorSet0.fp_c3)._m0[5].w * (-0.58496248722076416015625);
    float _267 = exp2(_263);
    float _269 = 1.0 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _271 = _261 * _243;
    float _273 = _261 * _231;
    float _275 = exp2(_265);
    float _277 = fma(_267, 14200.0, 1800.0);
    float _279 = 1.0 / _277;
    float _281 = fma(_275, 14200.0, 1800.0);
    float _283 = 1.0 / _281;
    float _285 = _279 * 38016.78515625;
    float _287 = _279 * 47608.17578125;
    float _289 = _279 * 29653.09375;
    float _291 = exp2(_285);
    float _293 = _283 * 38016.78515625;
    float _295 = _283 * 29653.09375;
    float _297 = _283 * 47608.17578125;
    float _299 = exp2(_293);
    float _301 = _261 * _235;
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _305 = _301 * _303;
    float _307 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _309 = _301 * _307;
    float _311 = fma(_291, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _313 = _271 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _315 = exp2(_287);
    float _317 = _273 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _319 = -_305;
    float _321 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[7].y, _319);
    float _323 = -_301;
    float _325 = -_313;
    float _327 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[7].x, _325);
    float _329 = -_271;
    float _331 = -_309;
    float _333 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[7].x, _331);
    float _335 = -_317;
    float _337 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[7].z, _335);
    float _339 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _341 = fma(_271, _339, _321);
    float _343 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _345 = fma(_273, _343, _327);
    float _347 = exp2(_289);
    float _349 = -_273;
    float _351 = fma(_349, (*spvDescriptorSet0.fp_c3)._m0[7].z, _333);
    float _353 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[7].w, _337);
    float _355 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _357 = _341 * _355;
    float _359 = fma(_299, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _361 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _363 = _353 * _361;
    float _365 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _367 = -_357;
    float _369 = fma(_353, _365, _367);
    float _371 = exp2(_295);
    float _373 = fma(_315, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _375 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _377 = _353 * _375;
    float _379 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _381 = fma(_341, _379, _363);
    float _383 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _385 = fma(_345, _383, _369);
    float _387 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _389 = -_377;
    float _391 = fma(_341, _387, _389);
    float _393 = fma(_345, (*spvDescriptorSet0.fp_c3)._m0[7].y, _381);
    float _395 = fma(_347, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _397 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _399 = fma(_351, _397, _385);
    float _401 = 1.0 / _311;
    float _403 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _405 = fma(_345, _403, _391);
    float _407 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _409 = fma(_351, _407, _393);
    float _411 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _413 = fma(_351, _411, _405);
    float _415 = fma(_371, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _417 = _399 * _399;
    float _419 = 1.0 / _373;
    float _421 = fma(_409, _409, _417);
    float _423 = fma(_413, _413, _421);
    float _425 = 1.0 / _395;
    float _427 = _401 * 4.9924825491034901066866337467265e-24;
    float _429 = _419 * 4.9924825491034901066866337467265e-24;
    float _431 = rsqrt(_423);
    float _433 = precise::max(_427, _429);
    float _435 = _425 * 4.9924825491034901066866337467265e-24;
    float _437 = exp2(_297);
    float _439 = precise::max(_433, _435);
    bool _441 = _439 != 0.0;
    bool _443 = isnan(_439);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    float _451 = _431 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _453 = (*spvDescriptorSet0.fp_c3)._m0[4].w + 0.666666686534881591796875;
    float _455 = 1.0 / _359;
    float _457 = _409 * _451;
    float _459 = _399 * _451;
    float _461 = _413 * _451;
    float _463 = fma(_437, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _465 = (*spvDescriptorSet0.fp_c3)._m0[4].w + 0.3333333432674407958984375;
    float _467 = fma(_457, _453, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _469 = fma(_461, _453, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _471 = 1.0 / _415;
    float _473 = fma(_457, _465, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _475 = fma(_459, _465, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _477 = fma(_461, _465, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _479 = _467 * 0.58823525905609130859375;
    float _481 = _473 * 0.58823525905609130859375;
    float _483 = _475 * 0.58823525905609130859375;
    float _485 = _477 * 0.58823525905609130859375;
    float _487 = _309;
    if (_449)
    {
        float _489 = 1.0 / _439;
        _487 = _489;
    }
    float _491 = _487;
    float _493 = _469 * 0.58823525905609130859375;
    float _495 = floor(_483);
    float _497 = fma(_459, _453, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _499 = fma(_459, _269, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _501 = _471 * 4.9924825491034901066866337467265e-24;
    float _503 = _497 * 0.58823525905609130859375;
    float _505 = floor(_481);
    float _507 = fma(_457, _269, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _509 = _507 * 0.58823525905609130859375;
    float _511 = floor(_503);
    float _513 = -_475;
    float _515 = fma(_495, 1.7000000476837158203125, _513);
    float _517 = floor(_485);
    float _519 = -_473;
    float _521 = fma(_505, 1.7000000476837158203125, _519);
    float _523 = _455 * 4.9924825491034901066866337467265e-24;
    float _525 = _515 + 0.85000002384185791015625;
    float _527 = _521 + 0.85000002384185791015625;
    float _529 = 1.0 / _463;
    float _531 = fma(_461, _269, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _533 = _499 * 0.58823525905609130859375;
    float _535 = -_497;
    float _537 = fma(_511, 1.7000000476837158203125, _535);
    float _539 = _531 * 0.58823525905609130859375;
    float _541 = _537 + 0.85000002384185791015625;
    float _543 = floor(_479);
    float _545 = -_477;
    float _547 = fma(_517, 1.7000000476837158203125, _545);
    float _549 = _525 * _525;
    float _551 = _547 + 0.85000002384185791015625;
    float _553 = fma(_527, _527, _549);
    float _555 = _541 * _541;
    float _557 = floor(_493);
    float _559 = _529 * 4.9924825491034901066866337467265e-24;
    float _561 = fma(_551, _551, _553);
    float _563 = floor(_533);
    float _565 = -_467;
    float _567 = fma(_543, 1.7000000476837158203125, _565);
    float _569 = _567 + 0.85000002384185791015625;
    float _571 = floor(_509);
    float _573 = -_469;
    float _575 = fma(_557, 1.7000000476837158203125, _573);
    float _577 = precise::max(_523, _559);
    float _579 = fma(_569, _569, _555);
    float _581 = _575 + 0.85000002384185791015625;
    float _583 = precise::max(_501, _577);
    float _585 = floor(_539);
    float _587 = -_499;
    float _589 = fma(_563, 1.7000000476837158203125, _587);
    float _591 = fma(_581, _581, _579);
    bool _593 = _583 != 0.0;
    bool _595 = isnan(_583);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    float _603 = _589 + 0.85000002384185791015625;
    float _605 = 1.0 / _561;
    float _607 = -_507;
    float _609 = fma(_571, 1.7000000476837158203125, _607);
    float _611 = _609 + 0.85000002384185791015625;
    float _613 = _603 * _603;
    float _615 = 1.0 / _591;
    float _617 = -_531;
    float _619 = fma(_585, 1.7000000476837158203125, _617);
    float _621 = fma(_611, _611, _613);
    float _623 = _619 + 0.85000002384185791015625;
    float _625 = abs(_525);
    float _627 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _629 = fma(_625, _605, _627);
    float _631 = fma(_623, _623, _621);
    float _633 = abs(_527);
    float _635 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _637 = fma(_633, _605, _635);
    float _639 = abs(_551);
    float _641 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _643 = fma(_639, _605, _641);
    float _645 = _629 * _629;
    float _647 = _531;
    if (_601)
    {
        float _649 = 1.0 / _583;
        _647 = _649;
    }
    float _651 = _647;
    float _653 = abs(_541);
    float _655 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _657 = fma(_653, _615, _655);
    float _659 = fma(_637, _637, _645);
    float _661 = abs(_569);
    float _663 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _665 = fma(_661, _615, _663);
    float _667 = abs(_581);
    float _669 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _671 = fma(_667, _615, _669);
    float _673 = _657 * _657;
    float _675 = 1.0 / _631;
    float _677 = fma(_643, _643, _659);
    float _679 = fma(_665, _665, _673);
    float _681 = fma(_671, _671, _679);
    float _683 = 1.0 / _677;
    float _685 = abs(_603);
    float _687 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _689 = fma(_685, _675, _687);
    float _691 = 1.0 / _681;
    float _693 = abs(_611);
    float _695 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _697 = fma(_693, _675, _695);
    float _699 = abs(_623);
    float _701 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _703 = fma(_699, _675, _701);
    float _705 = _689 * _689;
    float _707 = fma(_697, _697, _705);
    float _709 = abs(_629);
    float _711 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _713 = fma(_709, _683, _711);
    float _715 = abs(_637);
    float _717 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _719 = fma(_715, _683, _717);
    float _721 = sqrt(_677);
    float _723 = fma(_703, _703, _707);
    float _725 = _713 * _713;
    float _727 = abs(_643);
    float _729 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _731 = fma(_727, _683, _729);
    float _733 = abs(_657);
    float _735 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _737 = fma(_733, _691, _735);
    float _739 = abs(_665);
    float _741 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _743 = fma(_739, _691, _741);
    float _745 = 1.0 / _723;
    float _747 = fma(_719, _719, _725);
    float _749 = _737 * _737;
    float _751 = abs(_671);
    float _753 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _755 = fma(_751, _691, _753);
    float _757 = fma(_731, _731, _747);
    float _759 = fma(_743, _743, _749);
    float _761 = sqrt(_723);
    float _763 = fma(_755, _755, _759);
    float _765 = 1.0 / _757;
    float _767 = abs(_689);
    float _769 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _771 = fma(_767, _745, _769);
    float _773 = abs(_697);
    float _775 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _777 = fma(_773, _745, _775);
    float _779 = abs(_703);
    float _781 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _783 = fma(_779, _745, _781);
    float _785 = _771 * _771;
    float _787 = 1.0 / _763;
    float _789 = fma(_777, _777, _785);
    float _791 = fma(_783, _783, _789);
    float _793 = abs(_713);
    float _795 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _797 = fma(_793, _765, _795);
    float _799 = abs(_719);
    float _801 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _803 = fma(_799, _765, _801);
    float _805 = abs(_731);
    float _807 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _809 = fma(_805, _765, _807);
    float _811 = 1.0 / _791;
    float _813 = _797 * _797;
    float _815 = abs(_737);
    float _817 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _819 = fma(_815, _787, _817);
    float _821 = fma(_803, _803, _813);
    float _823 = abs(_743);
    float _825 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _827 = fma(_823, _787, _825);
    float _829 = abs(_755);
    float _831 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _833 = fma(_829, _787, _831);
    float _835 = _819 * _819;
    float _837 = fma(_809, _809, _821);
    float _839 = sqrt(_681);
    float _841 = fma(_827, _827, _835);
    float _843 = abs(_771);
    float _845 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _847 = fma(_843, _811, _845);
    float _849 = fma(_833, _833, _841);
    float _851 = abs(_777);
    float _853 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _855 = fma(_851, _811, _853);
    float _857 = 1.0 / _837;
    float _859 = abs(_783);
    float _861 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _863 = fma(_859, _811, _861);
    float _865 = sqrt(_763);
    float _867 = 1.0 / _849;
    float _869 = _847 * _847;
    float _871 = abs(_797);
    float _873 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _875 = fma(_871, _857, _873);
    float _877 = abs(_803);
    float _879 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _881 = fma(_877, _857, _879);
    float _883 = abs(_809);
    float _885 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _887 = fma(_883, _857, _885);
    float _889 = fma(_855, _855, _869);
    float _891 = _857;
    if (!_449)
    {
        _891 = 1.0;
    }
    float _893 = _891;
    float _895 = _893;
    if (_449)
    {
        float _897 = _491 * _435;
        _895 = _897;
    }
    float _899 = _895;
    float _901 = sqrt(_791);
    float _903 = fma(_863, _863, _889);
    float _905 = 1.0 / _903;
    float _907 = _875 * _875;
    float _909 = abs(_819);
    float _911 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _913 = fma(_909, _867, _911);
    float _915 = abs(_827);
    float _917 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _919 = fma(_915, _867, _917);
    float _921 = abs(_833);
    float _923 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _925 = fma(_921, _867, _923);
    float _927 = fma(_881, _881, _907);
    float _929 = sqrt(_757);
    float _931 = fma(_887, _887, _927);
    float _933 = -_761;
    float _935 = _933 + _901;
    float _937 = abs(_761);
    float _939 = abs(_935);
    float _941 = _937 + _939;
    float _943 = sqrt(_849);
    float _945 = abs(_847);
    float _947 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _949 = fma(_945, _905, _947);
    float _951 = abs(_855);
    float _953 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _955 = fma(_951, _905, _953);
    float _957 = abs(_863);
    float _959 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _961 = fma(_957, _905, _959);
    float _963 = 1.0 / _931;
    float _965 = _913 * _913;
    float _967 = fma(_919, _919, _965);
    float _969 = sqrt(_903);
    float _971 = fma(_925, _925, _967);
    float _973 = sqrt(_837);
    float _975 = _903;
    if (!_449)
    {
        _975 = 1.0;
    }
    float _977 = _975;
    float _979 = _977;
    if (_449)
    {
        float _981 = _491 * _427;
        _979 = _981;
    }
    float _983 = _979;
    float _985 = _949 * _949;
    float _987 = abs(_875);
    float _989 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _991 = fma(_987, _963, _989);
    float _993 = abs(_881);
    float _995 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _997 = fma(_993, _963, _995);
    float _999 = abs(_887);
    float _1001 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1003 = fma(_999, _963, _1001);
    float _1005 = fma(_955, _955, _985);
    float _1007 = sqrt(_931);
    float _1009 = _985;
    float _1011 = _963;
    if (!_449)
    {
        _1009 = 1.0;
    }
    float _1013 = _1009;
    float _1015 = _1013;
    if (_449)
    {
        float _1017 = _491 * _429;
        _1015 = _1017;
    }
    float _1019 = _1015;
    float _1021 = fma(_961, _961, _1005);
    float _1023 = _991 * _991;
    if (!_601)
    {
        _1011 = 1.0;
    }
    float _1025 = _1011;
    float _1027 = _1025;
    if (_601)
    {
        float _1029 = _501 * _651;
        _1027 = _1029;
    }
    float _1031 = _1027;
    float _1033 = 1.0 / _971;
    float _1035 = fma(_997, _997, _1023);
    float _1037 = 1.0 / _1021;
    float _1039 = abs(_919);
    float _1041 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1043 = fma(_1039, _1033, _1041);
    float _1045 = fma(_1003, _1003, _1035);
    float _1047 = -_721;
    float _1049 = _1047 + _929;
    float _1051 = abs(_913);
    float _1053 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1055 = fma(_1051, _1033, _1053);
    float _1057 = -_929;
    float _1059 = _1057 + _973;
    float _1061 = sqrt(_1021);
    float _1063 = abs(_721);
    float _1065 = abs(_1049);
    float _1067 = _1063 + _1065;
    float _1069 = _1055 * _1055;
    float _1071 = abs(_949);
    float _1073 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1075 = fma(_1071, _1037, _1073);
    float _1077 = abs(_925);
    float _1079 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1081 = fma(_1077, _1033, _1079);
    float _1083 = abs(_1059);
    float _1085 = _1067 + _1083;
    float _1087 = abs(_955);
    float _1089 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1091 = fma(_1087, _1037, _1089);
    float _1093 = -_839;
    float _1095 = _1093 + _865;
    float _1097 = _1075 * _1075;
    float _1099 = fma(_1043, _1043, _1069);
    float _1101 = abs(_961);
    float _1103 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1105 = fma(_1101, _1037, _1103);
    float _1107 = 1.0 / _1045;
    float _1109 = abs(_839);
    float _1111 = abs(_1095);
    float _1113 = _1109 + _1111;
    float _1115 = fma(_1081, _1081, _1099);
    float _1117 = fma(_1091, _1091, _1097);
    float _1119 = -_865;
    float _1121 = _1119 + _943;
    float _1123 = -_973;
    float _1125 = _1123 + _1007;
    float _1127 = 1.0 / _1115;
    float _1129 = abs(_1121);
    float _1131 = _1113 + _1129;
    float _1133 = -_901;
    float _1135 = _1133 + _969;
    float _1137 = abs(_1125);
    float _1139 = _1085 + _1137;
    float _1141 = sqrt(_971);
    float _1143 = abs(_991);
    float _1145 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1147 = fma(_1143, _1107, _1145);
    float _1149 = abs(_997);
    float _1151 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1153 = fma(_1149, _1107, _1151);
    float _1155 = abs(_1003);
    float _1157 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1159 = fma(_1155, _1107, _1157);
    float _1161 = _1147 * _1147;
    float _1163 = abs(_1055);
    float _1165 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1167 = fma(_1163, _1127, _1165);
    float _1169 = fma(_1105, _1105, _1117);
    float _1171 = sqrt(_1115);
    float _1173 = abs(_1043);
    float _1175 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1177 = fma(_1173, _1127, _1175);
    float _1179 = abs(_1081);
    float _1181 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1183 = fma(_1179, _1127, _1181);
    float _1185 = _1167 * _1167;
    float _1187 = -_969;
    float _1189 = _1187 + _1061;
    float _1191 = -_943;
    float _1193 = _1191 + _1141;
    float _1195 = fma(_1177, _1177, _1185);
    float _1197 = 1.0 / _1169;
    float _1199 = fma(_1153, _1153, _1161);
    float _1201 = abs(_1135);
    float _1203 = _941 + _1201;
    float _1205 = abs(_1193);
    float _1207 = _1131 + _1205;
    float _1209 = fma(_1159, _1159, _1199);
    float _1211 = abs(_1189);
    float _1213 = _1203 + _1211;
    float _1215 = sqrt(_1045);
    float _1217 = -_1141;
    float _1219 = _1217 + _1171;
    float _1221 = abs(_1219);
    float _1223 = _1207 + _1221;
    float _1225 = abs(_1075);
    float _1227 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1229 = fma(_1225, _1197, _1227);
    float _1231 = abs(_1091);
    float _1233 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1235 = fma(_1231, _1197, _1233);
    float _1237 = abs(_1105);
    float _1239 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1241 = fma(_1237, _1197, _1239);
    float _1243 = 1.0 / _1209;
    float _1245 = _1229 * _1229;
    float _1247 = fma(_1235, _1235, _1245);
    float _1249 = sqrt(_1169);
    float _1251 = fma(_1241, _1241, _1247);
    float _1253 = 1.0 / _1251;
    float _1255 = fma(_1183, _1183, _1195);
    float _1257 = abs(_1147);
    float _1259 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1261 = fma(_1257, _1243, _1259);
    float _1263 = abs(_1153);
    float _1265 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1267 = fma(_1263, _1243, _1265);
    float _1269 = abs(_1159);
    float _1271 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1273 = fma(_1269, _1243, _1271);
    float _1275 = _1261 * _1261;
    float _1277 = 1.0 / _1255;
    float _1279 = fma(_1267, _1267, _1275);
    float _1281 = sqrt(_1209);
    float _1283 = abs(_1229);
    float _1285 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1287 = fma(_1283, _1253, _1285);
    float _1289 = abs(_1235);
    float _1291 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1293 = fma(_1289, _1253, _1291);
    float _1295 = abs(_1241);
    float _1297 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1299 = fma(_1295, _1253, _1297);
    float _1301 = _1287 * _1287;
    float _1303 = abs(_1167);
    float _1305 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1307 = fma(_1303, _1277, _1305);
    float _1309 = abs(_1177);
    float _1311 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1313 = fma(_1309, _1277, _1311);
    float _1315 = sqrt(_1255);
    float _1317 = abs(_1183);
    float _1319 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1321 = fma(_1317, _1277, _1319);
    float _1323 = _1307 * _1307;
    float _1325 = fma(_1293, _1293, _1301);
    float _1327 = fma(_1313, _1313, _1323);
    float _1329 = fma(_1299, _1299, _1325);
    float _1331 = sqrt(_1251);
    float _1333 = fma(_1273, _1273, _1279);
    float _1335 = -_1007;
    float _1337 = _1335 + _1215;
    float _1339 = fma(_1321, _1321, _1327);
    float _1341 = -_1215;
    float _1343 = _1341 + _1281;
    float _1345 = abs(_1337);
    float _1347 = _1139 + _1345;
    float _1349 = 1.0 / _1333;
    float _1351 = -_1061;
    float _1353 = _1351 + _1249;
    float _1355 = abs(_1343);
    float _1357 = _1347 + _1355;
    float _1359 = -_1171;
    float _1361 = _1359 + _1315;
    float _1363 = abs(_1353);
    float _1365 = _1213 + _1363;
    float _1367 = abs(_1361);
    float _1369 = _1223 + _1367;
    float _1371 = 1.0 / _1339;
    float _1373 = 1.0 / _1329;
    float _1375 = abs(_1261);
    float _1377 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1379 = fma(_1375, _1349, _1377);
    float _1381 = abs(_1267);
    float _1383 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1385 = fma(_1381, _1349, _1383);
    float _1387 = abs(_1273);
    float _1389 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1391 = fma(_1387, _1349, _1389);
    float _1393 = _1379 * _1379;
    float _1395 = abs(_1307);
    float _1397 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1399 = fma(_1395, _1371, _1397);
    float _1401 = fma(_1385, _1385, _1393);
    float _1403 = abs(_1313);
    float _1405 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1407 = fma(_1403, _1371, _1405);
    float _1409 = abs(_1321);
    float _1411 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1413 = fma(_1409, _1371, _1411);
    float _1415 = _1399 * _1399;
    float _1417 = fma(_1391, _1391, _1401);
    float _1419 = sqrt(_1329);
    float _1421 = abs(_1287);
    float _1423 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1425 = fma(_1421, _1373, _1423);
    float _1427 = fma(_1407, _1407, _1415);
    float _1429 = abs(_1299);
    float _1431 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1433 = fma(_1429, _1373, _1431);
    float _1435 = _1425 * _1425;
    float _1437 = 1.0 / _1417;
    float _1439 = abs(_1293);
    float _1441 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1443 = fma(_1439, _1373, _1441);
    float _1445 = fma(_1443, _1443, _1435);
    float _1447 = sqrt(_1333);
    float _1449 = abs(_1379);
    float _1451 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1453 = fma(_1449, _1437, _1451);
    float _1455 = fma(_1413, _1413, _1427);
    float _1457 = sqrt(_1417);
    float _1459 = abs(_1385);
    float _1461 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1463 = fma(_1459, _1437, _1461);
    float _1465 = _1453 * _1453;
    float _1467 = abs(_1391);
    float _1469 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1471 = fma(_1467, _1437, _1469);
    float _1473 = 1.0 / _1455;
    float _1475 = fma(_1433, _1433, _1445);
    float _1477 = -_1249;
    float _1479 = _1477 + _1331;
    float _1481 = abs(_1479);
    float _1483 = _1365 + _1481;
    float _1485 = sqrt(_1455);
    float _1487 = abs(_1399);
    float _1489 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1491 = fma(_1487, _1473, _1489);
    float _1493 = 1.0 / _1475;
    float _1495 = fma(_1463, _1463, _1465);
    float _1497 = abs(_1407);
    float _1499 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1501 = fma(_1497, _1473, _1499);
    float _1503 = _1491 * _1491;
    float _1505 = abs(_1413);
    float _1507 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1509 = fma(_1505, _1473, _1507);
    float _1511 = fma(_1471, _1471, _1495);
    float _1513 = fma(_1501, _1501, _1503);
    float _1515 = sqrt(_1475);
    float _1517 = fma(_1509, _1509, _1513);
    float _1519 = 1.0 / _1511;
    float _1521 = abs(_1425);
    float _1523 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1525 = fma(_1521, _1493, _1523);
    float _1527 = abs(_1443);
    float _1529 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1531 = fma(_1527, _1493, _1529);
    float _1533 = abs(_1433);
    float _1535 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1537 = fma(_1533, _1493, _1535);
    float _1539 = _1525 * _1525;
    float _1541 = sqrt(_1339);
    float _1543 = fma(_1531, _1531, _1539);
    float _1545 = fma(_1537, _1537, _1543);
    float _1547 = abs(_1453);
    float _1549 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1551 = fma(_1547, _1519, _1549);
    float _1553 = 1.0 / _1517;
    float _1555 = abs(_1463);
    float _1557 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1559 = fma(_1555, _1519, _1557);
    float _1561 = abs(_1471);
    float _1563 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1565 = fma(_1561, _1519, _1563);
    float _1567 = _1551 * _1551;
    float _1569 = -_1281;
    float _1571 = _1569 + _1447;
    float _1573 = -_1447;
    float _1575 = _1573 + _1457;
    float _1577 = -_1315;
    float _1579 = _1577 + _1541;
    float _1581 = sqrt(_1511);
    float _1583 = abs(_1571);
    float _1585 = _1357 + _1583;
    float _1587 = -_1541;
    float _1589 = _1587 + _1485;
    float _1591 = abs(_1579);
    float _1593 = _1369 + _1591;
    float _1595 = abs(_1575);
    float _1597 = _1585 + _1595;
    float _1599 = abs(_1589);
    float _1601 = _1593 + _1599;
    float _1603 = 1.0 / _1545;
    float _1605 = fma(_1559, _1559, _1567);
    float _1607 = -_1331;
    float _1609 = _1607 + _1419;
    float _1611 = abs(_1491);
    float _1613 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1615 = fma(_1611, _1553, _1613);
    float _1617 = abs(_1501);
    float _1619 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1621 = fma(_1617, _1553, _1619);
    float _1623 = fma(_1565, _1565, _1605);
    float _1625 = abs(_1609);
    float _1627 = _1483 + _1625;
    float _1629 = _1615 * _1615;
    float _1631 = abs(_1509);
    float _1633 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1635 = fma(_1631, _1553, _1633);
    float _1637 = 1.0 / _1623;
    float _1639 = -_1419;
    float _1641 = _1639 + _1515;
    float _1643 = fma(_1621, _1621, _1629);
    float _1645 = abs(_1641);
    float _1647 = _1627 + _1645;
    float _1649 = fma(_1635, _1635, _1643);
    float _1651 = abs(_1525);
    float _1653 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1655 = fma(_1651, _1603, _1653);
    float _1657 = sqrt(_1545);
    float _1659 = abs(_1531);
    float _1661 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1663 = fma(_1659, _1603, _1661);
    float _1665 = abs(_1537);
    float _1667 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1669 = fma(_1665, _1603, _1667);
    float _1671 = abs(_1551);
    float _1673 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1675 = fma(_1671, _1637, _1673);
    float _1677 = _1655 * _1655;
    float _1679 = abs(_1559);
    float _1681 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1683 = fma(_1679, _1637, _1681);
    float _1685 = abs(_1565);
    float _1687 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1689 = fma(_1685, _1637, _1687);
    float _1691 = _1675 * _1675;
    float _1693 = fma(_1663, _1663, _1677);
    float _1695 = sqrt(_1623);
    float _1697 = fma(_1683, _1683, _1691);
    float _1699 = fma(_1669, _1669, _1693);
    float _1701 = fma(_1689, _1689, _1697);
    float _1703 = 1.0 / _1649;
    float _1705 = 1.0 / _1699;
    float _1707 = 1.0 / _1701;
    float _1709 = abs(_1615);
    float _1711 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1713 = fma(_1709, _1703, _1711);
    float _1715 = abs(_1621);
    float _1717 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1719 = fma(_1715, _1703, _1717);
    float _1721 = abs(_1635);
    float _1723 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1725 = fma(_1721, _1703, _1723);
    float _1727 = _1713 * _1713;
    float _1729 = abs(_1655);
    float _1731 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1733 = fma(_1729, _1705, _1731);
    float _1735 = fma(_1719, _1719, _1727);
    float _1737 = abs(_1663);
    float _1739 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1741 = fma(_1737, _1705, _1739);
    float _1743 = sqrt(_1699);
    float _1745 = _1733 * _1733;
    float _1747 = fma(_1725, _1725, _1735);
    float _1749 = abs(_1669);
    float _1751 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1753 = fma(_1749, _1705, _1751);
    float _1755 = abs(_1683);
    float _1757 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1759 = fma(_1755, _1707, _1757);
    float _1761 = abs(_1675);
    float _1763 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1765 = fma(_1761, _1707, _1763);
    float _1767 = abs(_1689);
    float _1769 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1771 = fma(_1767, _1707, _1769);
    float _1773 = sqrt(_1517);
    float _1775 = fma(_1741, _1741, _1745);
    float _1777 = _1765 * _1765;
    float _1779 = -_1457;
    float _1781 = _1779 + _1581;
    float _1783 = -_1581;
    float _1785 = _1783 + _1695;
    float _1787 = fma(_1753, _1753, _1775);
    float _1789 = abs(_1781);
    float _1791 = _1597 + _1789;
    float _1793 = 1.0 / _1747;
    float _1795 = fma(_1759, _1759, _1777);
    float _1797 = abs(_1785);
    float _1799 = _1791 + _1797;
    float _1801 = fma(_1771, _1771, _1795);
    float _1803 = 1.0 / _1787;
    float _1805 = abs(_1713);
    float _1807 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1809 = fma(_1805, _1793, _1807);
    float _1811 = 1.0 / _1801;
    float _1813 = abs(_1719);
    float _1815 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1817 = fma(_1813, _1793, _1815);
    float _1819 = abs(_1725);
    float _1821 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1823 = fma(_1819, _1793, _1821);
    float _1825 = _1809 * _1809;
    float _1827 = fma(_1817, _1817, _1825);
    float _1829 = abs(_1733);
    float _1831 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1833 = fma(_1829, _1803, _1831);
    float _1835 = abs(_1741);
    float _1837 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1839 = fma(_1835, _1803, _1837);
    float _1841 = abs(_1753);
    float _1843 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1845 = fma(_1841, _1803, _1843);
    float _1847 = fma(_1823, _1823, _1827);
    float _1849 = _1833 * _1833;
    float _1851 = sqrt(_1787);
    float _1853 = abs(_1759);
    float _1855 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1857 = fma(_1811, _1853, _1855);
    float _1859 = abs(_1765);
    float _1861 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1863 = fma(_1811, _1859, _1861);
    float _1865 = abs(_1771);
    float _1867 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1869 = fma(_1811, _1865, _1867);
    float _1871 = 1.0 / _1847;
    float _1873 = fma(_1839, _1839, _1849);
    float _1875 = _1863 * _1863;
    float _1877 = fma(_1845, _1845, _1873);
    float _1879 = fma(_1857, _1857, _1875);
    float _1881 = sqrt(_1649);
    float _1883 = fma(_1869, _1869, _1879);
    float _1885 = -_1485;
    float _1887 = _1885 + _1773;
    float _1889 = abs(_1887);
    float _1891 = _1601 + _1889;
    float _1893 = sqrt(_1747);
    float _1895 = abs(_1809);
    float _1897 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1899 = fma(_1895, _1871, _1897);
    float _1901 = abs(_1817);
    float _1903 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1905 = fma(_1901, _1871, _1903);
    float _1907 = abs(_1823);
    float _1909 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1911 = fma(_1907, _1871, _1909);
    float _1913 = _1899 * _1899;
    float _1915 = 1.0 / _1877;
    float _1917 = fma(_1905, _1905, _1913);
    float _1919 = -_1773;
    float _1921 = _1919 + _1881;
    float _1923 = abs(_1921);
    float _1925 = _1891 + _1923;
    float _1927 = sqrt(_1701);
    float _1929 = abs(_1833);
    float _1931 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1933 = fma(_1929, _1915, _1931);
    float _1935 = abs(_1839);
    float _1937 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1939 = fma(_1935, _1915, _1937);
    float _1941 = sqrt(_1801);
    float _1943 = abs(_1845);
    float _1945 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1947 = fma(_1943, _1915, _1945);
    float _1949 = _1933 * _1933;
    float _1951 = fma(_1911, _1911, _1917);
    float _1953 = fma(_1939, _1939, _1949);
    float _1955 = -_1515;
    float _1957 = _1955 + _1657;
    float _1959 = sqrt(_1847);
    float _1961 = -_1695;
    float _1963 = _1961 + _1927;
    float _1965 = fma(_1947, _1947, _1953);
    float _1967 = abs(_1957);
    float _1969 = _1647 + _1967;
    float _1971 = -_1881;
    float _1973 = _1971 + _1893;
    float _1975 = abs(_1963);
    float _1977 = _1799 + _1975;
    float _1979 = -_1657;
    float _1981 = _1979 + _1743;
    float _1983 = -_1743;
    float _1985 = _1983 + _1851;
    float _1987 = sqrt(_1883);
    float _1989 = -_1927;
    float _1991 = _1989 + _1941;
    float _1993 = abs(_1973);
    float _1995 = _1925 + _1993;
    float _1997 = abs(_1981);
    float _1999 = _1969 + _1997;
    float _2001 = abs(_1991);
    float _2003 = _1977 + _2001;
    float _2005 = _1991;
    if (!_601)
    {
        _2005 = 1.0;
    }
    float _2007 = _2005;
    float _2009 = abs(_1985);
    float _2011 = _1999 + _2009;
    float _2013 = sqrt(_1951);
    float _2015 = -_1893;
    float _2017 = _2015 + _1959;
    float _2019 = _2007;
    if (_601)
    {
        float _2021 = _559 * _651;
        _2019 = _2021;
    }
    float _2023 = _2019;
    float _2025 = abs(_2017);
    float _2027 = _1995 + _2025;
    float _2029 = sqrt(_1877);
    float _2031 = -_1941;
    float _2033 = _1987 + _2031;
    float _2035 = abs(_2033);
    float _2037 = _2035 + _2003;
    float _2039 = _2033;
    if (!_601)
    {
        _2039 = 1.0;
    }
    float _2041 = _2039;
    float _2043 = _2041;
    if (_601)
    {
        float _2045 = _523 * _651;
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = sqrt(_1965);
    float _2051 = -_1959;
    float _2053 = _2051 + _2013;
    float _2055 = abs(_2053);
    float _2057 = _2027 + _2055;
    float _2059 = _2037 * _2037;
    float _2061 = -_1851;
    float _2063 = _2061 + _2029;
    float _2065 = _2057 * _2057;
    float _2067 = _2059 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _2069 = abs(_2063);
    float _2071 = _2011 + _2069;
    float _2073 = _2065 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _2075 = _2067 * _899;
    float _2077 = _2067 * _983;
    float _2079 = -_2029;
    float _2081 = _2079 + _2049;
    float _2083 = _2067 * _1019;
    float _2085 = fma(_2073, _1031, _2075);
    float _2087 = fma(_2073, _2047, _2077);
    float _2089 = abs(_2081);
    float _2091 = _2071 + _2089;
    float _2093 = fma(_2073, _2023, _2083);
    float _2095 = -_173;
    float _2097 = _2095 + 1.0;
    float _2099 = _2091 * _2091;
    float _2101 = _2099 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _2103 = fma(_2101, 0.24627263844013214111328125, _2085);
    float _2105 = fma(_2101, 0.531864106655120849609375, _2087);
    float _2107 = _2093 + _2101;
    float _2109 = _2103 * 0.3333333432674407958984375;
    float _2111 = _2105 * 0.3333333432674407958984375;
    float _2113 = _2107 * 0.3333333432674407958984375;
    float _2115 = precise::min(_2109, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _2117 = precise::min(_2111, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _2119 = precise::min(_2113, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    out.m_36.x = _2115;
    out.m_36.y = _2117;
    out.m_36.z = _2119;
    out.m_36.w = _2097;
    return out;
}

