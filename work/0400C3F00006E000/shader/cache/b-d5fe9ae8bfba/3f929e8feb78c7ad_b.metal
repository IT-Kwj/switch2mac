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
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
    float4 m_34 [[color(1)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _674 = false;
    bool _758 = false;
    bool _331 = false;
    bool _411 = false;
    bool _131 = false;
    float _41 = gl_FragCoord.y;
    float _43 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _45 = _41 / _43;
    float _47 = gl_FragCoord.x;
    float _49 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _51 = _47 / _49;
    float _53 = (*spvDescriptorSet0.fp_c3)._m0[4].x * 0.5;
    float _55 = (*spvDescriptorSet0.fp_c4)._m0[2].z + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _57 = _45 + (-0.5);
    bool _61 = _57 >= _53;
    bool _63 = isnan(_57);
    bool _65 = _61 || _63;
    bool _67 = isnan(_53);
    bool _69 = _65 || _67;
    float _123;
    float _125;
    float _127;
    float _129;
    if (!_69)
    {
        float _71 = 1.0 / _55;
        float _73 = (*spvDescriptorSet0.fp_c3)._m0[8].y * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _75 = -_57;
        float _77 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[4].w, 1.0);
        float _79 = _77 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
        float _81 = (*spvDescriptorSet0.fp_c4)._m0[2].w * 0.999000012874603271484375;
        float _83 = precise::max(_79, (*spvDescriptorSet0.fp_c4)._m0[2].z);
        float _85 = _71 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _87 = precise::min(_83, _81);
        float _89 = _55 * _55;
        float _91 = -_85;
        float _93 = fma(_91, _85, 1.0);
        float _95 = precise::clamp(_93, 0.0, 1.0);
        float _97 = _55 * _87;
        float _99 = _97 * 2.0;
        float _101 = sqrt(_95);
        float _103 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _105 = -_89;
        float _107 = _103 + _105;
        float _109 = 1.0 / _99;
        float _111 = -_87;
        float _113 = fma(_111, _87, _107);
        float _115 = -_101;
        float _117 = _115 + (-0.001000000047497451305389404296875);
        float _119 = _113 * _109;
        float _121 = precise::min(_119, _117);
        _123 = _121;
        _125 = _89;
        _127 = _103;
        _129 = _73;
        _131 = true;
    }
    else
    {
        float _133 = 1.0 / _55;
        float _135 = -_53;
        float _137 = _57 + _135;
        float _139 = (*spvDescriptorSet0.fp_c3)._m0[8].y * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _141 = _137 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _143 = (*spvDescriptorSet0.fp_c4)._m0[2].y * 0.999000012874603271484375;
        float _145 = _141 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _147 = precise::max(_145, (*spvDescriptorSet0.fp_c4)._m0[2].x);
        float _149 = _133 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _151 = precise::min(_147, _143);
        float _153 = _55 * _55;
        float _155 = -_149;
        float _157 = fma(_155, _149, 1.0);
        float _159 = precise::clamp(_157, 0.0, 1.0);
        float _161 = _55 * _151;
        float _163 = _161 * 2.0;
        float _165 = -_153;
        float _167 = _165 + _139;
        float _169 = sqrt(_159);
        float _171 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _173 = -_151;
        float _175 = fma(_173, _151, _167);
        float _177 = 1.0 / _163;
        float _179 = -_169;
        float _181 = _179 + (-0.001000000047497451305389404296875);
        float _183 = _175 * _177;
        float _185 = precise::max(_183, _181);
        _123 = _185;
        _125 = _153;
        _127 = _171;
        _129 = _139;
    }
    _131 = false;
    float _187 = _123;
    float _189 = _125;
    float _191 = _127;
    float _193 = _129;
    float _195 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _197 = _51 + (-0.5);
    float _199 = fma(_187, _187, -1.0);
    float _201 = _199 * _189;
    float _203 = sqrt(_189);
    float _205 = _201 + _191;
    float _207 = -_201;
    bool _209 = _191 >= _207;
    float _211 = _201 + _193;
    float _213 = _197 * _195;
    float _215 = floor(_213);
    float _217 = _205;
    if (_209)
    {
        float _219 = sqrt(_205);
        _217 = _219;
    }
    float _221 = _217;
    float _223 = -_215;
    float _225 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[5].x, _197);
    float _227 = precise::max(_203, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _229 = _197 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _231 = _225 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _233 = fma(_231, 2.2000000476837158203125, -0.81400001049041748046875);
    float _235 = floor(_229);
    float _237 = _233 * 0.15915493667125701904296875;
    float _239 = _237 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = 1.0 / _227;
    float _245 = _235 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _247 = _237 * 6.283185482025146484375;
    float _249 = sin(_247);
    float _251 = 1.0 / _241;
    float _253 = _243 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _255 = _55 * _187;
    float _257 = -_253;
    float _259 = fma(_257, _253, 1.0);
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = -_255;
    bool _265 = _263 >= _221;
    bool _267 = _265 && _209;
    float _269 = sqrt(_211);
    float _271 = rsqrt(_189);
    float _273 = _249 * _251;
    float _275 = _273 * 0.18692903220653533935546875;
    float _277 = _273;
    float _279 = _251;
    if (_209)
    {
        float _281 = -_255;
        float _283 = -_221;
        float _285 = _281 + _283;
        _277 = _285;
    }
    float _287 = _277;
    float _289 = sqrt(_261);
    float _291 = -_255;
    float _293 = _291 + _269;
    float _295 = _55 * _275;
    float _297 = _293;
    if (!_209)
    {
        _279 = _293;
    }
    float _299 = _279;
    float _301 = _299;
    if (_267)
    {
        float _303 = precise::min(_293, _287);
        _297 = _303;
    }
    float _305 = _297;
    float _307 = _295 * _271;
    if (_209)
    {
        _301 = _305;
    }
    float _309 = _301;
    float _311 = -_289;
    bool _313 = _307 >= _311;
    float _315 = _309 * 0.0199999995529651641845703125;
    float _317 = fma(_245, 2.0, -1.0);
    float _319;
    float _321;
    float _323;
    float _325;
    float _327;
    float _329;
    if (!_313)
    {
        _319 = 0.0;
        _321 = 0.0;
        _323 = 0.0;
        _325 = 0.0;
        _327 = 0.0;
        _329 = 0.0;
        _331 = true;
    }
    else
    {
        float _333 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _335 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _333;
        bool _337 = _187 >= 0.0;
        float _339 = _255 * _271;
        float _341 = 1.0 / _335;
        float _343 = _341 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
        float _345 = sqrt(_343);
        bool _347 = !_337;
        float _405;
        float _407;
        float _409;
        if (!_347)
        {
            float _349 = fma(_339, 350.80767822265625, 53.62115478515625);
            float _351 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _353 = _203 + _351;
            float _355 = fma(_187, 350.80767822265625, 53.62115478515625);
            float _357 = _353 * _341;
            float _359 = log2(_349);
            float _361 = sqrt(_357);
            float _363 = _359 * 0.1155245304107666015625;
            float _365 = log2(_355);
            float2 _1408 = float2(_363, _361);
            float3 _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1408, float2(0.0), isnan(_1408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1408, float2(0.0), isnan(_1408))).xyz;
            float _371 = _369.x;
            float _373 = _369.y;
            float _375 = _369.z;
            float _377 = _365 * 0.1155245304107666015625;
            float2 _1426 = float2(_377, _345);
            float3 _379 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1426, float2(0.0), isnan(_1426))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1426, float2(0.0), isnan(_1426))).xyz;
            float _381 = _379.x;
            float _383 = _379.y;
            float _385 = _379.z;
            float _387 = precise::max(_371, 9.9999999747524270787835121154785e-07);
            float _389 = precise::max(_373, 9.9999999747524270787835121154785e-07);
            float _391 = precise::max(_375, 9.9999999747524270787835121154785e-07);
            float _393 = 1.0 / _387;
            float _395 = 1.0 / _389;
            float _397 = 1.0 / _391;
            float _399 = _381 * _393;
            float _401 = _383 * _395;
            float _403 = _385 * _397;
            _405 = _401;
            _407 = _403;
            _409 = _399;
            _411 = true;
        }
        else
        {
            float _413 = fma(_187, -350.80767822265625, 53.62115478515625);
            float _415 = fma(_339, -350.80767822265625, 53.62115478515625);
            float _417 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _419 = _203 + _417;
            float _421 = log2(_413);
            float _423 = _419 * _341;
            float _425 = log2(_415);
            float _427 = _421 * 0.1155245304107666015625;
            float _429 = sqrt(_423);
            float2 _1488 = float2(_427, _345);
            float3 _431 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1488, float2(0.0), isnan(_1488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1488, float2(0.0), isnan(_1488))).xyz;
            float _433 = _431.x;
            float _435 = _431.y;
            float _437 = _431.z;
            float _439 = _425 * 0.1155245304107666015625;
            float2 _1504 = float2(_439, _429);
            float3 _441 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1504, float2(0.0), isnan(_1504))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1504, float2(0.0), isnan(_1504))).xyz;
            float _443 = _441.x;
            float _445 = _441.y;
            float _447 = _441.z;
            float _449 = precise::max(_437, 9.9999999747524270787835121154785e-07);
            float _451 = precise::max(_433, 9.9999999747524270787835121154785e-07);
            float _453 = precise::max(_435, 9.9999999747524270787835121154785e-07);
            float _455 = 1.0 / _451;
            float _457 = 1.0 / _453;
            float _459 = 1.0 / _449;
            float _461 = _443 * _455;
            float _463 = _445 * _457;
            float _465 = _447 * _459;
            _405 = _463;
            _407 = _465;
            _409 = _461;
        }
        _411 = false;
        float _467 = _405;
        float _469 = _407;
        float _471 = _409;
        float _473 = fma(_307, 350.80767822265625, 53.62115478515625);
        float _475 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _477 = _227 + _475;
        float _479 = _477 * _341;
        float _481 = log2(_473);
        float _483 = sqrt(_479);
        float _485 = _481 * 0.1155245304107666015625;
        float2 _1563 = float2(_485, _483);
        float3 _487 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1563, float2(0.0), isnan(_1563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1563, float2(0.0), isnan(_1563))).xyz;
        float _489 = _487.x;
        float _491 = _487.y;
        float _493 = _487.z;
        float _495 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
        float _497 = -_227;
        float _499 = _497 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _501 = precise::min(_467, 1.0);
        float _503 = precise::min(_469, 1.0);
        float _505 = _499 * 1.44269502162933349609375;
        float _507 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].z;
        float _509 = _495 * _505;
        float _511 = exp2(_509);
        float _513 = _507 * _505;
        float _515 = precise::min(_471, 1.0);
        float _517 = exp2(_513);
        float _519 = _515 * _489;
        float _521 = _501 * _491;
        float _523 = _503 * _493;
        float _525 = _519 * _511;
        float _527 = _521 * _511;
        float _529 = _519 * _517;
        float _531 = _523 * _511;
        float _533 = _521 * _517;
        float _535 = _523 * _517;
        _319 = _531;
        _321 = _525;
        _323 = _527;
        _325 = _529;
        _327 = _533;
        _329 = _535;
    }
    _331 = false;
    float _537 = _319;
    float _539 = _321;
    float _541 = _323;
    float _543 = _325;
    float _545 = _327;
    float _547 = _329;
    float _549 = _55 * _187;
    float _551 = _549 * 2.0;
    int _554 = 1;
    int _556 = 0;
    int _558 = 0;
    int _560 = 0;
    float _562 = _537;
    float _564 = _539;
    float _566 = _541;
    float _568 = 0.0;
    float _570 = _543;
    float _572 = _545;
    float _574 = _547;
    float _576 = 0.0;
    float _578 = 0.0;
    float _580 = 0.0;
    float _582 = 0.0;
    float _584 = 0.0;
    bool _586;
    float _662;
    float _664;
    float _666;
    float _668;
    float _670;
    float _672;
    int _748;
    int _750;
    float _752;
    float _754;
    float _756;
    float _920;
    float _928;
    float _930;
    float _932;
    float _934;
    float _936;
    do
    {
        int _588 = _554;
        int _590 = _556;
        int _592 = _558;
        int _594 = _560;
        float _596 = _562;
        float _598 = _564;
        float _600 = _566;
        float _602 = _568;
        float _604 = _570;
        float _606 = _572;
        float _608 = _574;
        float _610 = _576;
        float _612 = _578;
        float _614 = _580;
        float _616 = _582;
        float _618 = _584;
        float _620 = float(_588);
        float _622 = _315 * _620;
        float _624 = fma(_622, _622, _189);
        float _626 = fma(_317, _622, _295);
        float _628 = fma(_622, _551, _624);
        float _630 = sqrt(_628);
        float _632 = rsqrt(_628);
        float _634 = precise::max(_630, (*spvDescriptorSet0.fp_c3)._m0[8].x);
        float _636 = 1.0 / _634;
        float _638 = _626 * _632;
        float _640 = _636 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _642 = -_640;
        float _644 = fma(_642, _640, 1.0);
        float _646 = precise::clamp(_644, 0.0, 1.0);
        float _648 = sqrt(_646);
        float _650 = -_648;
        bool _652 = _638 >= _650;
        int _654 = _594;
        int _656 = _590;
        int _658 = _592;
        int _660 = _594;
        if (!_652)
        {
            _662 = 0.0;
            _664 = 0.0;
            _666 = 0.0;
            _668 = 0.0;
            _670 = 0.0;
            _672 = 0.0;
            _674 = true;
        }
        else
        {
            bool _676 = _187 >= 0.0;
            float _678 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _680 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _678;
            float _682 = _255 + _622;
            float _684 = _682 * _632;
            float _686 = 1.0 / _680;
            float _688 = _686 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
            float _690 = sqrt(_688);
            bool _692 = !_676;
            if (!_692)
            {
                float _694 = fma(_684, 350.80767822265625, 53.62115478515625);
                float _696 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _698 = _630 + _696;
                float _700 = fma(_187, 350.80767822265625, 53.62115478515625);
                float _702 = _698 * _686;
                float _704 = log2(_694);
                float _706 = sqrt(_702);
                float _708 = _704 * 0.1155245304107666015625;
                float _710 = log2(_700);
                float2 _1782 = float2(_708, _706);
                float3 _712 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1782, float2(0.0), isnan(_1782))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1782, float2(0.0), isnan(_1782))).xyz;
                float _714 = _712.x;
                float _716 = _712.y;
                float _718 = _712.z;
                float _720 = _710 * 0.1155245304107666015625;
                float2 _1798 = float2(_720, _690);
                float3 _722 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1798, float2(0.0), isnan(_1798))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1798, float2(0.0), isnan(_1798))).xyz;
                float _724 = _722.x;
                float _726 = _722.y;
                float _728 = _722.z;
                float _730 = precise::max(_716, 9.9999999747524270787835121154785e-07);
                float _732 = precise::max(_718, 9.9999999747524270787835121154785e-07);
                float _734 = precise::max(_714, 9.9999999747524270787835121154785e-07);
                float _736 = 1.0 / _730;
                float _738 = 1.0 / _734;
                float _740 = 1.0 / _732;
                float _742 = _726 * _736;
                float _744 = _724 * _738;
                float _746 = _728 * _740;
                _748 = as_type<int>(_740);
                _750 = as_type<int>(_738);
                _752 = _744;
                _754 = _742;
                _756 = _746;
                _758 = true;
            }
            else
            {
                float _760 = fma(_187, -350.80767822265625, 53.62115478515625);
                float _762 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _764 = _630 + _762;
                float _766 = fma(_684, -350.80767822265625, 53.62115478515625);
                float _768 = _764 * _686;
                float _770 = log2(_760);
                float _772 = log2(_766);
                float _774 = _770 * 0.1155245304107666015625;
                float _776 = sqrt(_768);
                float2 _1862 = float2(_774, _690);
                float3 _778 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1862, float2(0.0), isnan(_1862))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1862, float2(0.0), isnan(_1862))).xyz;
                float _780 = _778.x;
                float _782 = _778.y;
                float _784 = _778.z;
                float _786 = _772 * 0.1155245304107666015625;
                float2 _1878 = float2(_786, _776);
                float3 _788 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1878, float2(0.0), isnan(_1878))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1878, float2(0.0), isnan(_1878))).xyz;
                float _790 = _788.x;
                float _792 = _788.y;
                float _794 = _788.z;
                float _796 = precise::max(_784, 9.9999999747524270787835121154785e-07);
                float _798 = precise::max(_782, 9.9999999747524270787835121154785e-07);
                float _800 = precise::max(_780, 9.9999999747524270787835121154785e-07);
                float _802 = 1.0 / _798;
                float _804 = 1.0 / _800;
                float _806 = 1.0 / _796;
                float _808 = _792 * _802;
                float _810 = _790 * _804;
                float _812 = _794 * _806;
                _748 = as_type<int>(_806);
                _750 = as_type<int>(_776);
                _654 = as_type<int>(_804);
                _752 = _810;
                _754 = _808;
                _756 = _812;
            }
            _758 = false;
            int _814 = _748;
            int _816 = _750;
            int _818 = _654;
            float _820 = _752;
            float _822 = _754;
            float _824 = _756;
            float _826 = fma(_638, 350.80767822265625, 53.62115478515625);
            float _828 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _830 = _634 + _828;
            float _832 = _830 * _686;
            float _834 = log2(_826);
            float _836 = sqrt(_832);
            float _838 = _834 * 0.1155245304107666015625;
            float2 _1946 = float2(_838, _836);
            float3 _840 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1946, float2(0.0), isnan(_1946))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1946, float2(0.0), isnan(_1946))).xyz;
            float _842 = _840.x;
            float _844 = _840.y;
            float _846 = _840.z;
            float _848 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
            float _850 = -_634;
            float _852 = _850 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _854 = precise::min(_820, 1.0);
            float _856 = precise::min(_822, 1.0);
            float _858 = _852 * 1.44269502162933349609375;
            float _860 = precise::min(_824, 1.0);
            float _862 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].z;
            float _864 = _848 * _858;
            float _866 = exp2(_864);
            float _868 = _862 * _858;
            float _870 = exp2(_868);
            float _872 = _854 * _842;
            float _874 = _856 * _844;
            float _876 = _860 * _846;
            float _878 = _872 * _866;
            float _880 = _872 * _870;
            float _882 = _874 * _866;
            float _884 = _874 * _870;
            float _886 = _876 * _866;
            float _888 = _876 * _870;
            _656 = _814;
            _658 = _816;
            _660 = _818;
            _662 = _886;
            _664 = _878;
            _666 = _882;
            _668 = _880;
            _670 = _884;
            _672 = _888;
        }
        _674 = false;
        int _890 = _656;
        int _892 = _658;
        int _894 = _660;
        float _896 = _662;
        float _898 = _664;
        float _900 = _666;
        float _902 = _668;
        float _904 = _670;
        float _906 = _672;
        int _908 = _588 + 1;
        float _910 = _315 * 0.5;
        float _912 = _596 + _896;
        float _914 = _598 + _898;
        bool _916 = _908 >= 51;
        float _918 = _600 + _900;
        _920 = fma(_912, _910, _602);
        float _922 = _604 + _902;
        float _924 = _606 + _904;
        float _926 = _608 + _906;
        _928 = fma(_914, _910, _610);
        _930 = fma(_918, _910, _612);
        _932 = fma(_922, _910, _614);
        _934 = fma(_924, _910, _616);
        _936 = fma(_926, _910, _618);
        _586 = !_916;
        _554 = _908;
        _556 = _890;
        _558 = _892;
        _560 = _894;
        _562 = _896;
        _564 = _898;
        _566 = _900;
        _568 = _920;
        _570 = _902;
        _572 = _904;
        _574 = _906;
        _576 = _928;
        _578 = _930;
        _580 = _932;
        _582 = _934;
        _584 = _936;
    } while (_586);
    float _938 = _928 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _940 = _930 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _942 = _920 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _944 = _932 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _946 = _934 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _948 = _936 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    out.m_32.x = _938;
    out.m_32.y = _940;
    out.m_32.z = _942;
    out.m_32.w = 0.0;
    out.m_34.x = _944;
    out.m_34.y = _946;
    out.m_34.z = _948;
    out.m_34.w = 0.0;
    return out;
}

