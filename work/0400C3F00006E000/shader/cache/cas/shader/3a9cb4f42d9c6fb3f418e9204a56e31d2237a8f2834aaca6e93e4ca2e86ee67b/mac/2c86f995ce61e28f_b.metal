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
    float2 _2147 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2147, float2(0.0), isnan(_2147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2147, float2(0.0), isnan(_2147))).x;
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
    bool _175 = _173 != 0.0;
    bool _177 = isnan(_173);
    bool _179 = _175 || _177;
    bool _181 = isnan(0.0);
    bool _183 = _179 || _181;
    float _185 = _161;
    float _187 = _169;
    if (!_183)
    {
        discard_fragment();
    }
    float _189 = 0.0;
    if (_123)
    {
        float _191 = rsqrt(_117);
        _189 = _191;
    }
    float _193 = _189;
    float _195 = 0.0;
    if (_123)
    {
        float _197 = _111 + (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = _199;
    if (_123)
    {
        float _203 = fma(_161, _199, (*spvDescriptorSet0.fp_c4)._m0[1].x);
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _205;
    if (_123)
    {
        float _209 = _169 + (-1.0);
        _185 = _209;
    }
    float _211 = _185;
    if (!_123)
    {
        _133 = _105;
    }
    float _213 = _133;
    float _215 = _193;
    float _217 = _213;
    if (_123)
    {
        float _219 = _193 * _205;
        _215 = _219;
    }
    float _221 = _215;
    if (_123)
    {
        float _223 = _211 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _207 = _223;
    }
    float _225 = _207;
    if (_123)
    {
        float _227 = _105 * _221;
        _217 = _227;
    }
    float _229 = _217;
    if (_123)
    {
        float _231 = fma(_111, _169, _225);
        _135 = _231;
    }
    float _233 = _135;
    if (!_123)
    {
        _187 = _103;
    }
    float _235 = _187;
    float _237 = _235;
    if (_123)
    {
        float _239 = _103 * _221;
        _237 = _239;
    }
    float _241 = _237;
    if (!_123)
    {
        _137 = _115;
    }
    float _243 = _137;
    float _245 = _243;
    if (_123)
    {
        float _247 = _229 * _229;
        _245 = _247;
    }
    float _249 = _245;
    if (_123)
    {
        float _251 = _241 * _241;
        _139 = _251;
    }
    float _253 = _139;
    float _255 = fma(_233, _233, _253);
    float _257 = _255 + _249;
    if (!_183)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _259 = rsqrt(_257);
    float _261 = (*spvDescriptorSet0.fp_c3)._m0[5].w * (-1.58496248722076416015625);
    float _263 = (*spvDescriptorSet0.fp_c3)._m0[5].w * (-0.58496248722076416015625);
    float _265 = exp2(_261);
    float _267 = 1.0 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _269 = _259 * _241;
    float _271 = _259 * _229;
    float _273 = exp2(_263);
    float _275 = fma(_265, 14200.0, 1800.0);
    float _277 = 1.0 / _275;
    float _279 = fma(_273, 14200.0, 1800.0);
    float _281 = 1.0 / _279;
    float _283 = _277 * 38016.78515625;
    float _285 = _277 * 47608.17578125;
    float _287 = _277 * 29653.09375;
    float _289 = exp2(_283);
    float _291 = _281 * 38016.78515625;
    float _293 = _281 * 29653.09375;
    float _295 = _281 * 47608.17578125;
    float _297 = exp2(_291);
    float _299 = _259 * _233;
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _303 = _299 * _301;
    float _305 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _307 = _299 * _305;
    float _309 = fma(_289, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _311 = _269 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _313 = exp2(_285);
    float _315 = _271 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _317 = -_303;
    float _319 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[7].y, _317);
    float _321 = -_299;
    float _323 = -_311;
    float _325 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[7].x, _323);
    float _327 = -_269;
    float _329 = -_307;
    float _331 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[7].x, _329);
    float _333 = -_315;
    float _335 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[7].z, _333);
    float _337 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _339 = fma(_269, _337, _319);
    float _341 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _343 = fma(_271, _341, _325);
    float _345 = exp2(_287);
    float _347 = -_271;
    float _349 = fma(_347, (*spvDescriptorSet0.fp_c3)._m0[7].z, _331);
    float _351 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[7].w, _335);
    float _353 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _355 = _339 * _353;
    float _357 = fma(_297, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _359 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _361 = _351 * _359;
    float _363 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _365 = -_355;
    float _367 = fma(_351, _363, _365);
    float _369 = exp2(_293);
    float _371 = fma(_313, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _373 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _375 = _351 * _373;
    float _377 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _379 = fma(_339, _377, _361);
    float _381 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _383 = fma(_343, _381, _367);
    float _385 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _387 = -_375;
    float _389 = fma(_339, _385, _387);
    float _391 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[7].y, _379);
    float _393 = fma(_345, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _395 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _397 = fma(_349, _395, _383);
    float _399 = 1.0 / _309;
    float _401 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _403 = fma(_343, _401, _389);
    float _405 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _407 = fma(_349, _405, _391);
    float _409 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _411 = fma(_349, _409, _403);
    float _413 = fma(_369, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _415 = _397 * _397;
    float _417 = 1.0 / _371;
    float _419 = fma(_407, _407, _415);
    float _421 = fma(_411, _411, _419);
    float _423 = 1.0 / _393;
    float _425 = _399 * 4.9924825491034901066866337467265e-24;
    float _427 = _417 * 4.9924825491034901066866337467265e-24;
    float _429 = rsqrt(_421);
    float _431 = precise::max(_425, _427);
    float _433 = _423 * 4.9924825491034901066866337467265e-24;
    float _435 = exp2(_295);
    float _437 = precise::max(_431, _433);
    bool _439 = _437 != 0.0;
    bool _441 = isnan(_437);
    bool _443 = _439 || _441;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    float _449 = _429 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _451 = (*spvDescriptorSet0.fp_c3)._m0[4].w + 0.666666686534881591796875;
    float _453 = 1.0 / _357;
    float _455 = _407 * _449;
    float _457 = _397 * _449;
    float _459 = _411 * _449;
    float _461 = fma(_435, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _463 = (*spvDescriptorSet0.fp_c3)._m0[4].w + 0.3333333432674407958984375;
    float _465 = fma(_455, _451, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _467 = fma(_459, _451, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _469 = 1.0 / _413;
    float _471 = fma(_455, _463, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _473 = fma(_457, _463, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _475 = fma(_459, _463, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _477 = _465 * 0.58823525905609130859375;
    float _479 = _471 * 0.58823525905609130859375;
    float _481 = _473 * 0.58823525905609130859375;
    float _483 = _475 * 0.58823525905609130859375;
    float _485 = _307;
    if (_447)
    {
        float _487 = 1.0 / _437;
        _485 = _487;
    }
    float _489 = _485;
    float _491 = _467 * 0.58823525905609130859375;
    float _493 = floor(_481);
    float _495 = fma(_457, _451, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _497 = fma(_457, _267, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _499 = _469 * 4.9924825491034901066866337467265e-24;
    float _501 = _495 * 0.58823525905609130859375;
    float _503 = floor(_479);
    float _505 = fma(_455, _267, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _507 = _505 * 0.58823525905609130859375;
    float _509 = floor(_501);
    float _511 = -_473;
    float _513 = fma(_493, 1.7000000476837158203125, _511);
    float _515 = floor(_483);
    float _517 = -_471;
    float _519 = fma(_503, 1.7000000476837158203125, _517);
    float _521 = _453 * 4.9924825491034901066866337467265e-24;
    float _523 = _513 + 0.85000002384185791015625;
    float _525 = _519 + 0.85000002384185791015625;
    float _527 = 1.0 / _461;
    float _529 = fma(_459, _267, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _531 = _497 * 0.58823525905609130859375;
    float _533 = -_495;
    float _535 = fma(_509, 1.7000000476837158203125, _533);
    float _537 = _529 * 0.58823525905609130859375;
    float _539 = _535 + 0.85000002384185791015625;
    float _541 = floor(_477);
    float _543 = -_475;
    float _545 = fma(_515, 1.7000000476837158203125, _543);
    float _547 = _523 * _523;
    float _549 = _545 + 0.85000002384185791015625;
    float _551 = fma(_525, _525, _547);
    float _553 = _539 * _539;
    float _555 = floor(_491);
    float _557 = _527 * 4.9924825491034901066866337467265e-24;
    float _559 = fma(_549, _549, _551);
    float _561 = floor(_531);
    float _563 = -_465;
    float _565 = fma(_541, 1.7000000476837158203125, _563);
    float _567 = _565 + 0.85000002384185791015625;
    float _569 = floor(_507);
    float _571 = -_467;
    float _573 = fma(_555, 1.7000000476837158203125, _571);
    float _575 = precise::max(_521, _557);
    float _577 = fma(_567, _567, _553);
    float _579 = _573 + 0.85000002384185791015625;
    float _581 = precise::max(_499, _575);
    float _583 = floor(_537);
    float _585 = -_497;
    float _587 = fma(_561, 1.7000000476837158203125, _585);
    float _589 = fma(_579, _579, _577);
    bool _591 = _581 != 0.0;
    bool _593 = isnan(_581);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = _587 + 0.85000002384185791015625;
    float _603 = 1.0 / _559;
    float _605 = -_505;
    float _607 = fma(_569, 1.7000000476837158203125, _605);
    float _609 = _607 + 0.85000002384185791015625;
    float _611 = _601 * _601;
    float _613 = 1.0 / _589;
    float _615 = -_529;
    float _617 = fma(_583, 1.7000000476837158203125, _615);
    float _619 = fma(_609, _609, _611);
    float _621 = _617 + 0.85000002384185791015625;
    float _623 = abs(_523);
    float _625 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _627 = fma(_623, _603, _625);
    float _629 = fma(_621, _621, _619);
    float _631 = abs(_525);
    float _633 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _635 = fma(_631, _603, _633);
    float _637 = abs(_549);
    float _639 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _641 = fma(_637, _603, _639);
    float _643 = _627 * _627;
    float _645 = _529;
    if (_599)
    {
        float _647 = 1.0 / _581;
        _645 = _647;
    }
    float _649 = _645;
    float _651 = abs(_539);
    float _653 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _655 = fma(_651, _613, _653);
    float _657 = fma(_635, _635, _643);
    float _659 = abs(_567);
    float _661 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _663 = fma(_659, _613, _661);
    float _665 = abs(_579);
    float _667 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _669 = fma(_665, _613, _667);
    float _671 = _655 * _655;
    float _673 = 1.0 / _629;
    float _675 = fma(_641, _641, _657);
    float _677 = fma(_663, _663, _671);
    float _679 = fma(_669, _669, _677);
    float _681 = 1.0 / _675;
    float _683 = abs(_601);
    float _685 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _687 = fma(_683, _673, _685);
    float _689 = 1.0 / _679;
    float _691 = abs(_609);
    float _693 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _695 = fma(_691, _673, _693);
    float _697 = abs(_621);
    float _699 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _701 = fma(_697, _673, _699);
    float _703 = _687 * _687;
    float _705 = fma(_695, _695, _703);
    float _707 = abs(_627);
    float _709 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _711 = fma(_707, _681, _709);
    float _713 = abs(_635);
    float _715 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _717 = fma(_713, _681, _715);
    float _719 = sqrt(_675);
    float _721 = fma(_701, _701, _705);
    float _723 = _711 * _711;
    float _725 = abs(_641);
    float _727 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _729 = fma(_725, _681, _727);
    float _731 = abs(_655);
    float _733 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _735 = fma(_731, _689, _733);
    float _737 = abs(_663);
    float _739 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _741 = fma(_737, _689, _739);
    float _743 = 1.0 / _721;
    float _745 = fma(_717, _717, _723);
    float _747 = _735 * _735;
    float _749 = abs(_669);
    float _751 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _753 = fma(_749, _689, _751);
    float _755 = fma(_729, _729, _745);
    float _757 = fma(_741, _741, _747);
    float _759 = sqrt(_721);
    float _761 = fma(_753, _753, _757);
    float _763 = 1.0 / _755;
    float _765 = abs(_687);
    float _767 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _769 = fma(_765, _743, _767);
    float _771 = abs(_695);
    float _773 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _775 = fma(_771, _743, _773);
    float _777 = abs(_701);
    float _779 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _781 = fma(_777, _743, _779);
    float _783 = _769 * _769;
    float _785 = 1.0 / _761;
    float _787 = fma(_775, _775, _783);
    float _789 = fma(_781, _781, _787);
    float _791 = abs(_711);
    float _793 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _795 = fma(_791, _763, _793);
    float _797 = abs(_717);
    float _799 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _801 = fma(_797, _763, _799);
    float _803 = abs(_729);
    float _805 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _807 = fma(_803, _763, _805);
    float _809 = 1.0 / _789;
    float _811 = _795 * _795;
    float _813 = abs(_735);
    float _815 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _817 = fma(_813, _785, _815);
    float _819 = fma(_801, _801, _811);
    float _821 = abs(_741);
    float _823 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _825 = fma(_821, _785, _823);
    float _827 = abs(_753);
    float _829 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _831 = fma(_827, _785, _829);
    float _833 = _817 * _817;
    float _835 = fma(_807, _807, _819);
    float _837 = sqrt(_679);
    float _839 = fma(_825, _825, _833);
    float _841 = abs(_769);
    float _843 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _845 = fma(_841, _809, _843);
    float _847 = fma(_831, _831, _839);
    float _849 = abs(_775);
    float _851 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _853 = fma(_849, _809, _851);
    float _855 = 1.0 / _835;
    float _857 = abs(_781);
    float _859 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _861 = fma(_857, _809, _859);
    float _863 = sqrt(_761);
    float _865 = 1.0 / _847;
    float _867 = _845 * _845;
    float _869 = abs(_795);
    float _871 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _873 = fma(_869, _855, _871);
    float _875 = abs(_801);
    float _877 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _879 = fma(_875, _855, _877);
    float _881 = abs(_807);
    float _883 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _885 = fma(_881, _855, _883);
    float _887 = fma(_853, _853, _867);
    float _889 = _855;
    if (!_447)
    {
        _889 = 1.0;
    }
    float _891 = _889;
    float _893 = _891;
    if (_447)
    {
        float _895 = _489 * _433;
        _893 = _895;
    }
    float _897 = _893;
    float _899 = sqrt(_789);
    float _901 = fma(_861, _861, _887);
    float _903 = 1.0 / _901;
    float _905 = _873 * _873;
    float _907 = abs(_817);
    float _909 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _911 = fma(_907, _865, _909);
    float _913 = abs(_825);
    float _915 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _917 = fma(_913, _865, _915);
    float _919 = abs(_831);
    float _921 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _923 = fma(_919, _865, _921);
    float _925 = fma(_879, _879, _905);
    float _927 = sqrt(_755);
    float _929 = fma(_885, _885, _925);
    float _931 = -_759;
    float _933 = _931 + _899;
    float _935 = abs(_759);
    float _937 = abs(_933);
    float _939 = _935 + _937;
    float _941 = sqrt(_847);
    float _943 = abs(_845);
    float _945 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _947 = fma(_943, _903, _945);
    float _949 = abs(_853);
    float _951 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _953 = fma(_949, _903, _951);
    float _955 = abs(_861);
    float _957 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _959 = fma(_955, _903, _957);
    float _961 = 1.0 / _929;
    float _963 = _911 * _911;
    float _965 = fma(_917, _917, _963);
    float _967 = sqrt(_901);
    float _969 = fma(_923, _923, _965);
    float _971 = sqrt(_835);
    float _973 = _901;
    if (!_447)
    {
        _973 = 1.0;
    }
    float _975 = _973;
    float _977 = _975;
    if (_447)
    {
        float _979 = _489 * _425;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = _947 * _947;
    float _985 = abs(_873);
    float _987 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _989 = fma(_985, _961, _987);
    float _991 = abs(_879);
    float _993 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _995 = fma(_991, _961, _993);
    float _997 = abs(_885);
    float _999 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1001 = fma(_997, _961, _999);
    float _1003 = fma(_953, _953, _983);
    float _1005 = sqrt(_929);
    float _1007 = _983;
    float _1009 = _961;
    if (!_447)
    {
        _1007 = 1.0;
    }
    float _1011 = _1007;
    float _1013 = _1011;
    if (_447)
    {
        float _1015 = _489 * _427;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = fma(_959, _959, _1003);
    float _1021 = _989 * _989;
    if (!_599)
    {
        _1009 = 1.0;
    }
    float _1023 = _1009;
    float _1025 = _1023;
    if (_599)
    {
        float _1027 = _499 * _649;
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = 1.0 / _969;
    float _1033 = fma(_995, _995, _1021);
    float _1035 = 1.0 / _1019;
    float _1037 = abs(_917);
    float _1039 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1041 = fma(_1037, _1031, _1039);
    float _1043 = fma(_1001, _1001, _1033);
    float _1045 = -_719;
    float _1047 = _1045 + _927;
    float _1049 = abs(_911);
    float _1051 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1053 = fma(_1049, _1031, _1051);
    float _1055 = -_927;
    float _1057 = _1055 + _971;
    float _1059 = sqrt(_1019);
    float _1061 = abs(_719);
    float _1063 = abs(_1047);
    float _1065 = _1061 + _1063;
    float _1067 = _1053 * _1053;
    float _1069 = abs(_947);
    float _1071 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1073 = fma(_1069, _1035, _1071);
    float _1075 = abs(_923);
    float _1077 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1079 = fma(_1075, _1031, _1077);
    float _1081 = abs(_1057);
    float _1083 = _1065 + _1081;
    float _1085 = abs(_953);
    float _1087 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1089 = fma(_1085, _1035, _1087);
    float _1091 = -_837;
    float _1093 = _1091 + _863;
    float _1095 = _1073 * _1073;
    float _1097 = fma(_1041, _1041, _1067);
    float _1099 = abs(_959);
    float _1101 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1103 = fma(_1099, _1035, _1101);
    float _1105 = 1.0 / _1043;
    float _1107 = abs(_837);
    float _1109 = abs(_1093);
    float _1111 = _1107 + _1109;
    float _1113 = fma(_1079, _1079, _1097);
    float _1115 = fma(_1089, _1089, _1095);
    float _1117 = -_863;
    float _1119 = _1117 + _941;
    float _1121 = -_971;
    float _1123 = _1121 + _1005;
    float _1125 = 1.0 / _1113;
    float _1127 = abs(_1119);
    float _1129 = _1111 + _1127;
    float _1131 = -_899;
    float _1133 = _1131 + _967;
    float _1135 = abs(_1123);
    float _1137 = _1083 + _1135;
    float _1139 = sqrt(_969);
    float _1141 = abs(_989);
    float _1143 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1145 = fma(_1141, _1105, _1143);
    float _1147 = abs(_995);
    float _1149 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1151 = fma(_1147, _1105, _1149);
    float _1153 = abs(_1001);
    float _1155 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1157 = fma(_1153, _1105, _1155);
    float _1159 = _1145 * _1145;
    float _1161 = abs(_1053);
    float _1163 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1165 = fma(_1161, _1125, _1163);
    float _1167 = fma(_1103, _1103, _1115);
    float _1169 = sqrt(_1113);
    float _1171 = abs(_1041);
    float _1173 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1175 = fma(_1171, _1125, _1173);
    float _1177 = abs(_1079);
    float _1179 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1181 = fma(_1177, _1125, _1179);
    float _1183 = _1165 * _1165;
    float _1185 = -_967;
    float _1187 = _1185 + _1059;
    float _1189 = -_941;
    float _1191 = _1189 + _1139;
    float _1193 = fma(_1175, _1175, _1183);
    float _1195 = 1.0 / _1167;
    float _1197 = fma(_1151, _1151, _1159);
    float _1199 = abs(_1133);
    float _1201 = _939 + _1199;
    float _1203 = abs(_1191);
    float _1205 = _1129 + _1203;
    float _1207 = fma(_1157, _1157, _1197);
    float _1209 = abs(_1187);
    float _1211 = _1201 + _1209;
    float _1213 = sqrt(_1043);
    float _1215 = -_1139;
    float _1217 = _1215 + _1169;
    float _1219 = abs(_1217);
    float _1221 = _1205 + _1219;
    float _1223 = abs(_1073);
    float _1225 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1227 = fma(_1223, _1195, _1225);
    float _1229 = abs(_1089);
    float _1231 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1233 = fma(_1229, _1195, _1231);
    float _1235 = abs(_1103);
    float _1237 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1239 = fma(_1235, _1195, _1237);
    float _1241 = 1.0 / _1207;
    float _1243 = _1227 * _1227;
    float _1245 = fma(_1233, _1233, _1243);
    float _1247 = sqrt(_1167);
    float _1249 = fma(_1239, _1239, _1245);
    float _1251 = 1.0 / _1249;
    float _1253 = fma(_1181, _1181, _1193);
    float _1255 = abs(_1145);
    float _1257 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1259 = fma(_1255, _1241, _1257);
    float _1261 = abs(_1151);
    float _1263 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1265 = fma(_1261, _1241, _1263);
    float _1267 = abs(_1157);
    float _1269 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1271 = fma(_1267, _1241, _1269);
    float _1273 = _1259 * _1259;
    float _1275 = 1.0 / _1253;
    float _1277 = fma(_1265, _1265, _1273);
    float _1279 = sqrt(_1207);
    float _1281 = abs(_1227);
    float _1283 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1285 = fma(_1281, _1251, _1283);
    float _1287 = abs(_1233);
    float _1289 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1291 = fma(_1287, _1251, _1289);
    float _1293 = abs(_1239);
    float _1295 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1297 = fma(_1293, _1251, _1295);
    float _1299 = _1285 * _1285;
    float _1301 = abs(_1165);
    float _1303 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1305 = fma(_1301, _1275, _1303);
    float _1307 = abs(_1175);
    float _1309 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1311 = fma(_1307, _1275, _1309);
    float _1313 = sqrt(_1253);
    float _1315 = abs(_1181);
    float _1317 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1319 = fma(_1315, _1275, _1317);
    float _1321 = _1305 * _1305;
    float _1323 = fma(_1291, _1291, _1299);
    float _1325 = fma(_1311, _1311, _1321);
    float _1327 = fma(_1297, _1297, _1323);
    float _1329 = sqrt(_1249);
    float _1331 = fma(_1271, _1271, _1277);
    float _1333 = -_1005;
    float _1335 = _1333 + _1213;
    float _1337 = fma(_1319, _1319, _1325);
    float _1339 = -_1213;
    float _1341 = _1339 + _1279;
    float _1343 = abs(_1335);
    float _1345 = _1137 + _1343;
    float _1347 = 1.0 / _1331;
    float _1349 = -_1059;
    float _1351 = _1349 + _1247;
    float _1353 = abs(_1341);
    float _1355 = _1345 + _1353;
    float _1357 = -_1169;
    float _1359 = _1357 + _1313;
    float _1361 = abs(_1351);
    float _1363 = _1211 + _1361;
    float _1365 = abs(_1359);
    float _1367 = _1221 + _1365;
    float _1369 = 1.0 / _1337;
    float _1371 = 1.0 / _1327;
    float _1373 = abs(_1259);
    float _1375 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1377 = fma(_1373, _1347, _1375);
    float _1379 = abs(_1265);
    float _1381 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1383 = fma(_1379, _1347, _1381);
    float _1385 = abs(_1271);
    float _1387 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1389 = fma(_1385, _1347, _1387);
    float _1391 = _1377 * _1377;
    float _1393 = abs(_1305);
    float _1395 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1397 = fma(_1393, _1369, _1395);
    float _1399 = fma(_1383, _1383, _1391);
    float _1401 = abs(_1311);
    float _1403 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1405 = fma(_1401, _1369, _1403);
    float _1407 = abs(_1319);
    float _1409 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1411 = fma(_1407, _1369, _1409);
    float _1413 = _1397 * _1397;
    float _1415 = fma(_1389, _1389, _1399);
    float _1417 = sqrt(_1327);
    float _1419 = abs(_1285);
    float _1421 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1423 = fma(_1419, _1371, _1421);
    float _1425 = fma(_1405, _1405, _1413);
    float _1427 = abs(_1297);
    float _1429 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1431 = fma(_1427, _1371, _1429);
    float _1433 = _1423 * _1423;
    float _1435 = 1.0 / _1415;
    float _1437 = abs(_1291);
    float _1439 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1441 = fma(_1437, _1371, _1439);
    float _1443 = fma(_1441, _1441, _1433);
    float _1445 = sqrt(_1331);
    float _1447 = abs(_1377);
    float _1449 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1451 = fma(_1447, _1435, _1449);
    float _1453 = fma(_1411, _1411, _1425);
    float _1455 = sqrt(_1415);
    float _1457 = abs(_1383);
    float _1459 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1461 = fma(_1457, _1435, _1459);
    float _1463 = _1451 * _1451;
    float _1465 = abs(_1389);
    float _1467 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1469 = fma(_1465, _1435, _1467);
    float _1471 = 1.0 / _1453;
    float _1473 = fma(_1431, _1431, _1443);
    float _1475 = -_1247;
    float _1477 = _1475 + _1329;
    float _1479 = abs(_1477);
    float _1481 = _1363 + _1479;
    float _1483 = sqrt(_1453);
    float _1485 = abs(_1397);
    float _1487 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1489 = fma(_1485, _1471, _1487);
    float _1491 = 1.0 / _1473;
    float _1493 = fma(_1461, _1461, _1463);
    float _1495 = abs(_1405);
    float _1497 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1499 = fma(_1495, _1471, _1497);
    float _1501 = _1489 * _1489;
    float _1503 = abs(_1411);
    float _1505 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1507 = fma(_1503, _1471, _1505);
    float _1509 = fma(_1469, _1469, _1493);
    float _1511 = fma(_1499, _1499, _1501);
    float _1513 = sqrt(_1473);
    float _1515 = fma(_1507, _1507, _1511);
    float _1517 = 1.0 / _1509;
    float _1519 = abs(_1423);
    float _1521 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1523 = fma(_1519, _1491, _1521);
    float _1525 = abs(_1441);
    float _1527 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1529 = fma(_1525, _1491, _1527);
    float _1531 = abs(_1431);
    float _1533 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1535 = fma(_1531, _1491, _1533);
    float _1537 = _1523 * _1523;
    float _1539 = sqrt(_1337);
    float _1541 = fma(_1529, _1529, _1537);
    float _1543 = fma(_1535, _1535, _1541);
    float _1545 = abs(_1451);
    float _1547 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1549 = fma(_1545, _1517, _1547);
    float _1551 = 1.0 / _1515;
    float _1553 = abs(_1461);
    float _1555 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1557 = fma(_1553, _1517, _1555);
    float _1559 = abs(_1469);
    float _1561 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1563 = fma(_1559, _1517, _1561);
    float _1565 = _1549 * _1549;
    float _1567 = -_1279;
    float _1569 = _1567 + _1445;
    float _1571 = -_1445;
    float _1573 = _1571 + _1455;
    float _1575 = -_1313;
    float _1577 = _1575 + _1539;
    float _1579 = sqrt(_1509);
    float _1581 = abs(_1569);
    float _1583 = _1355 + _1581;
    float _1585 = -_1539;
    float _1587 = _1585 + _1483;
    float _1589 = abs(_1577);
    float _1591 = _1367 + _1589;
    float _1593 = abs(_1573);
    float _1595 = _1583 + _1593;
    float _1597 = abs(_1587);
    float _1599 = _1591 + _1597;
    float _1601 = 1.0 / _1543;
    float _1603 = fma(_1557, _1557, _1565);
    float _1605 = -_1329;
    float _1607 = _1605 + _1417;
    float _1609 = abs(_1489);
    float _1611 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1613 = fma(_1609, _1551, _1611);
    float _1615 = abs(_1499);
    float _1617 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1619 = fma(_1615, _1551, _1617);
    float _1621 = fma(_1563, _1563, _1603);
    float _1623 = abs(_1607);
    float _1625 = _1481 + _1623;
    float _1627 = _1613 * _1613;
    float _1629 = abs(_1507);
    float _1631 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1633 = fma(_1629, _1551, _1631);
    float _1635 = 1.0 / _1621;
    float _1637 = -_1417;
    float _1639 = _1637 + _1513;
    float _1641 = fma(_1619, _1619, _1627);
    float _1643 = abs(_1639);
    float _1645 = _1625 + _1643;
    float _1647 = fma(_1633, _1633, _1641);
    float _1649 = abs(_1523);
    float _1651 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1653 = fma(_1649, _1601, _1651);
    float _1655 = sqrt(_1543);
    float _1657 = abs(_1529);
    float _1659 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1661 = fma(_1657, _1601, _1659);
    float _1663 = abs(_1535);
    float _1665 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1667 = fma(_1663, _1601, _1665);
    float _1669 = abs(_1549);
    float _1671 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1673 = fma(_1669, _1635, _1671);
    float _1675 = _1653 * _1653;
    float _1677 = abs(_1557);
    float _1679 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1681 = fma(_1677, _1635, _1679);
    float _1683 = abs(_1563);
    float _1685 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1687 = fma(_1683, _1635, _1685);
    float _1689 = _1673 * _1673;
    float _1691 = fma(_1661, _1661, _1675);
    float _1693 = sqrt(_1621);
    float _1695 = fma(_1681, _1681, _1689);
    float _1697 = fma(_1667, _1667, _1691);
    float _1699 = fma(_1687, _1687, _1695);
    float _1701 = 1.0 / _1647;
    float _1703 = 1.0 / _1697;
    float _1705 = 1.0 / _1699;
    float _1707 = abs(_1613);
    float _1709 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1711 = fma(_1707, _1701, _1709);
    float _1713 = abs(_1619);
    float _1715 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1717 = fma(_1713, _1701, _1715);
    float _1719 = abs(_1633);
    float _1721 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1723 = fma(_1719, _1701, _1721);
    float _1725 = _1711 * _1711;
    float _1727 = abs(_1653);
    float _1729 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1731 = fma(_1727, _1703, _1729);
    float _1733 = fma(_1717, _1717, _1725);
    float _1735 = abs(_1661);
    float _1737 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1739 = fma(_1735, _1703, _1737);
    float _1741 = sqrt(_1697);
    float _1743 = _1731 * _1731;
    float _1745 = fma(_1723, _1723, _1733);
    float _1747 = abs(_1667);
    float _1749 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1751 = fma(_1747, _1703, _1749);
    float _1753 = abs(_1681);
    float _1755 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1757 = fma(_1753, _1705, _1755);
    float _1759 = abs(_1673);
    float _1761 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1763 = fma(_1759, _1705, _1761);
    float _1765 = abs(_1687);
    float _1767 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1769 = fma(_1765, _1705, _1767);
    float _1771 = sqrt(_1515);
    float _1773 = fma(_1739, _1739, _1743);
    float _1775 = _1763 * _1763;
    float _1777 = -_1455;
    float _1779 = _1777 + _1579;
    float _1781 = -_1579;
    float _1783 = _1781 + _1693;
    float _1785 = fma(_1751, _1751, _1773);
    float _1787 = abs(_1779);
    float _1789 = _1595 + _1787;
    float _1791 = 1.0 / _1745;
    float _1793 = fma(_1757, _1757, _1775);
    float _1795 = abs(_1783);
    float _1797 = _1789 + _1795;
    float _1799 = fma(_1769, _1769, _1793);
    float _1801 = 1.0 / _1785;
    float _1803 = abs(_1711);
    float _1805 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1807 = fma(_1803, _1791, _1805);
    float _1809 = 1.0 / _1799;
    float _1811 = abs(_1717);
    float _1813 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1815 = fma(_1811, _1791, _1813);
    float _1817 = abs(_1723);
    float _1819 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1821 = fma(_1817, _1791, _1819);
    float _1823 = _1807 * _1807;
    float _1825 = fma(_1815, _1815, _1823);
    float _1827 = abs(_1731);
    float _1829 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1831 = fma(_1827, _1801, _1829);
    float _1833 = abs(_1739);
    float _1835 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1837 = fma(_1833, _1801, _1835);
    float _1839 = abs(_1751);
    float _1841 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1843 = fma(_1839, _1801, _1841);
    float _1845 = fma(_1821, _1821, _1825);
    float _1847 = _1831 * _1831;
    float _1849 = sqrt(_1785);
    float _1851 = abs(_1757);
    float _1853 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1855 = fma(_1809, _1851, _1853);
    float _1857 = abs(_1763);
    float _1859 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1861 = fma(_1809, _1857, _1859);
    float _1863 = abs(_1769);
    float _1865 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1867 = fma(_1809, _1863, _1865);
    float _1869 = 1.0 / _1845;
    float _1871 = fma(_1837, _1837, _1847);
    float _1873 = _1861 * _1861;
    float _1875 = fma(_1843, _1843, _1871);
    float _1877 = fma(_1855, _1855, _1873);
    float _1879 = sqrt(_1647);
    float _1881 = fma(_1867, _1867, _1877);
    float _1883 = -_1483;
    float _1885 = _1883 + _1771;
    float _1887 = abs(_1885);
    float _1889 = _1599 + _1887;
    float _1891 = sqrt(_1745);
    float _1893 = abs(_1807);
    float _1895 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1897 = fma(_1893, _1869, _1895);
    float _1899 = abs(_1815);
    float _1901 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1903 = fma(_1899, _1869, _1901);
    float _1905 = abs(_1821);
    float _1907 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1909 = fma(_1905, _1869, _1907);
    float _1911 = _1897 * _1897;
    float _1913 = 1.0 / _1875;
    float _1915 = fma(_1903, _1903, _1911);
    float _1917 = -_1771;
    float _1919 = _1917 + _1879;
    float _1921 = abs(_1919);
    float _1923 = _1889 + _1921;
    float _1925 = sqrt(_1699);
    float _1927 = abs(_1831);
    float _1929 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _1931 = fma(_1927, _1913, _1929);
    float _1933 = abs(_1837);
    float _1935 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1937 = fma(_1933, _1913, _1935);
    float _1939 = sqrt(_1799);
    float _1941 = abs(_1843);
    float _1943 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _1945 = fma(_1941, _1913, _1943);
    float _1947 = _1931 * _1931;
    float _1949 = fma(_1909, _1909, _1915);
    float _1951 = fma(_1937, _1937, _1947);
    float _1953 = -_1513;
    float _1955 = _1953 + _1655;
    float _1957 = sqrt(_1845);
    float _1959 = -_1693;
    float _1961 = _1959 + _1925;
    float _1963 = fma(_1945, _1945, _1951);
    float _1965 = abs(_1955);
    float _1967 = _1645 + _1965;
    float _1969 = -_1879;
    float _1971 = _1969 + _1891;
    float _1973 = abs(_1961);
    float _1975 = _1797 + _1973;
    float _1977 = -_1655;
    float _1979 = _1977 + _1741;
    float _1981 = -_1741;
    float _1983 = _1981 + _1849;
    float _1985 = sqrt(_1881);
    float _1987 = -_1925;
    float _1989 = _1987 + _1939;
    float _1991 = abs(_1971);
    float _1993 = _1923 + _1991;
    float _1995 = abs(_1979);
    float _1997 = _1967 + _1995;
    float _1999 = abs(_1989);
    float _2001 = _1975 + _1999;
    float _2003 = _1989;
    if (!_599)
    {
        _2003 = 1.0;
    }
    float _2005 = _2003;
    float _2007 = abs(_1983);
    float _2009 = _1997 + _2007;
    float _2011 = sqrt(_1949);
    float _2013 = -_1891;
    float _2015 = _2013 + _1957;
    float _2017 = _2005;
    if (_599)
    {
        float _2019 = _557 * _649;
        _2017 = _2019;
    }
    float _2021 = _2017;
    float _2023 = abs(_2015);
    float _2025 = _1993 + _2023;
    float _2027 = sqrt(_1875);
    float _2029 = -_1939;
    float _2031 = _1985 + _2029;
    float _2033 = abs(_2031);
    float _2035 = _2033 + _2001;
    float _2037 = _2031;
    if (!_599)
    {
        _2037 = 1.0;
    }
    float _2039 = _2037;
    float _2041 = _2039;
    if (_599)
    {
        float _2043 = _521 * _649;
        _2041 = _2043;
    }
    float _2045 = _2041;
    float _2047 = sqrt(_1963);
    float _2049 = -_1957;
    float _2051 = _2049 + _2011;
    float _2053 = abs(_2051);
    float _2055 = _2025 + _2053;
    float _2057 = _2035 * _2035;
    float _2059 = -_1849;
    float _2061 = _2059 + _2027;
    float _2063 = _2055 * _2055;
    float _2065 = _2057 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _2067 = abs(_2061);
    float _2069 = _2009 + _2067;
    float _2071 = _2063 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _2073 = _2065 * _897;
    float _2075 = _2065 * _981;
    float _2077 = -_2027;
    float _2079 = _2077 + _2047;
    float _2081 = _2065 * _1017;
    float _2083 = fma(_2071, _1029, _2073);
    float _2085 = fma(_2071, _2045, _2075);
    float _2087 = abs(_2079);
    float _2089 = _2069 + _2087;
    float _2091 = fma(_2071, _2021, _2081);
    float _2093 = _2089 * _2089;
    float _2095 = _2093 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _2097 = fma(_2095, 0.24627263844013214111328125, _2083);
    float _2099 = fma(_2095, 0.531864106655120849609375, _2085);
    float _2101 = _2091 + _2095;
    float _2103 = _2097 * 0.3333333432674407958984375;
    float _2105 = _2099 * 0.3333333432674407958984375;
    float _2107 = _2101 * 0.3333333432674407958984375;
    float _2109 = precise::min(_2103, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _2111 = precise::min(_2105, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _2113 = precise::min(_2107, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    out.m_36.x = _2109;
    out.m_36.y = _2111;
    out.m_36.z = _2113;
    out.m_36.w = _173;
    return out;
}

