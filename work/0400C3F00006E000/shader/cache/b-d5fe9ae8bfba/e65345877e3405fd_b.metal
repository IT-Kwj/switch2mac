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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _888 = false;
    float _39 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _41 = (*spvDescriptorSet0.fp_c3)._m0[18].x + _39;
    float2 _1065 = float2((*spvDescriptorSet0.fp_c3)._m0[18].x, (*spvDescriptorSet0.fp_c3)._m0[18].y);
    float3 _45 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1065, float2(0.0), isnan(_1065)), int2(0), component::x).xzw;
    float _47 = _45.x;
    float _49 = _45.y;
    float _51 = _45.z;
    float _53 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _55 = (*spvDescriptorSet0.fp_c3)._m0[18].y + _53;
    float2 _1090 = float2(_41, _55);
    float2 _59 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1090, float2(0.0), isnan(_1090)), int2(0), component::x).xz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = gl_FragCoord.w;
    float _67 = in.m_29.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = fma((*spvDescriptorSet0.fp_c3)._m0[18].y, 2.0, -1.0);
    float _75 = fma((*spvDescriptorSet0.fp_c3)._m0[18].x, 2.0, -1.0);
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _79 = _73 * _77;
    float _81 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _83 = _73 * _81;
    float _85 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _87 = _73 * _85;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _91 = _73 * _89;
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].x, _79);
    float _95 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[3].x, _83);
    float _97 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[4].x, _87);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[5].x, _91);
    float _101 = in.m_29.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = fma(_51, 2.0, -1.0);
    float _109 = -_51;
    float _111 = _49 + _109;
    float _113 = -_51;
    float _115 = _47 + _113;
    float _117 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[5].z, _99);
    float _119 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _93);
    float _121 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[4].z, _97);
    float _123 = -_51;
    float _125 = _123 + _61;
    float _127 = _117 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _129 = -_51;
    float _131 = _129 + _63;
    float _133 = _111 * _125;
    float _135 = _115 * _131;
    float _137 = 1.0 / _127;
    bool _141 = _133 > 0.0;
    float _143 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, _95);
    float _145 = _119 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _147 = _135 > 0.0;
    float _149 = _143 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _151 = 1.0 / _65;
    float _153 = _121 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _155 = false;
    float _157 = _121;
    float _159 = _65;
    float _161 = _61;
    float _163 = _49;
    float _165 = _111;
    float _167 = (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (!_141)
    {
        _155 = false;
    }
    bool _169 = _155;
    float _171 = _145 * _137;
    float _173 = _149 * _137;
    float _175 = _153 * _137;
    bool _177 = !_141;
    bool _179 = _169;
    float _181 = 0.0;
    float _183 = _137;
    if (!_177)
    {
        float _185 = abs(_111);
        float _187 = abs(_125);
        float _189 = precise::min(_185, _187);
        float _191 = _175 * (-0.0199999995529651641845703125);
        bool _193 = _189 != 1.0;
        bool _195 = isnan(_189);
        bool _197 = _193 || _195;
        bool _199 = isnan(1.0);
        bool _201 = _197 || _199;
        float _203 = -_189;
        float _205 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _207 = 1.0 / _205;
        float _209 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _211 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[8].w, _209);
        float _213 = _201 ? _211 : 1.0;
        float _215 = _213 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _217 = _215 > _191;
        _179 = _217;
        _157 = _189;
        _159 = _207;
        _181 = _191;
        _183 = _215;
    }
    bool _219 = _179;
    float _221 = _157;
    float _223 = _159;
    float _225 = _181;
    float _227 = _183;
    float _229 = _221;
    float _231 = _223;
    float _233 = _227;
    float _235 = _225;
    bool _237 = _219;
    if (_219)
    {
        _229 = 1.0;
    }
    float _239 = _229;
    float _241 = _239;
    if (_219)
    {
        _231 = 1.0;
    }
    float _243 = _231;
    float _245 = _243;
    if (_219)
    {
        _233 = 0.0;
    }
    float _247 = _233;
    float _249 = _247;
    if (_219)
    {
        _235 = 0.0;
    }
    float _251 = _235;
    float _253 = _251;
    if (!_219)
    {
        float _255 = abs(_111);
        float _257 = abs(_125);
        bool _259 = _255 >= _257;
        float _261 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[18].y, -1.0);
        float _263 = _259 ? (-1.0) : 1.0;
        float _265 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _267 = _261 * _265;
        float _269 = _259 ? _61 : _49;
        float _271 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[18].x);
        float _273 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _275 = _261 * _273;
        float _277 = fma(_269, 2.0, -1.0);
        float _279 = fma(_271, 2.0, -1.0);
        float _281 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[5].x, _275);
        float _283 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _285 = _261 * _283;
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _289 = _261 * _287;
        float _291 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[3].x, _267);
        float _293 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[5].z, _281);
        float _295 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[3].z, _291);
        float _297 = _293 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _299 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[2].x, _285);
        float _301 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[4].x, _289);
        float _303 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[2].z, _299);
        float _305 = 1.0 / _297;
        float _307 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[4].z, _301);
        float _309 = _295 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _311 = _303 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _313 = _307 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _315 = -_171;
        float _317 = fma(_311, _305, _315);
        float _319 = -_173;
        float _321 = fma(_309, _305, _319);
        float _323 = -_175;
        float _325 = fma(_313, _305, _323);
        _237 = _259;
        _241 = _263;
        _245 = _317;
        _253 = _325;
        _249 = _321;
        _161 = _309;
        _163 = _311;
        _165 = _313;
    }
    bool _327 = _237;
    float _329 = _241;
    float _331 = _245;
    float _333 = _253;
    float _335 = _249;
    float _337 = _161;
    float _339 = _163;
    float _341 = _165;
    float _343 = _151 * _71;
    bool _345 = _327;
    float _347 = _337;
    float _349 = _339;
    float _351 = _341;
    float _353 = _329;
    if (!_147)
    {
        _345 = false;
    }
    bool _355 = _345;
    bool _357 = !_147;
    bool _359 = _355;
    if (!_357)
    {
        float _361 = abs(_115);
        float _363 = abs(_131);
        float _365 = precise::min(_361, _363);
        float _367 = _175 * (-0.0199999995529651641845703125);
        bool _369 = _365 != 1.0;
        bool _371 = isnan(_365);
        bool _373 = _369 || _371;
        bool _375 = isnan(1.0);
        bool _377 = _373 || _375;
        float _379 = -_365;
        float _381 = fma(_379, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _383 = 1.0 / _381;
        float _385 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _387 = fma(_383, (*spvDescriptorSet0.fp_c3)._m0[8].w, _385);
        float _389 = _377 ? _387 : 1.0;
        float _391 = _389 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _393 = _391 > _367;
        _359 = _393;
        _347 = _383;
        _349 = _365;
        _351 = _391;
    }
    bool _395 = _359;
    float _397 = _347;
    float _399 = _349;
    float _401 = _351;
    float _403 = _401;
    float _405 = _399;
    float _407 = _397;
    if (_395)
    {
        _403 = 0.0;
    }
    float _409 = _403;
    float _411 = _409;
    if (_395)
    {
        _405 = 0.0;
    }
    float _413 = _405;
    float _415 = _413;
    if (_395)
    {
        _407 = 1.0;
    }
    float _417 = _407;
    float _419 = _417;
    if (!_395)
    {
        float _421 = abs(_115);
        float _423 = abs(_131);
        bool _425 = _421 >= _423;
        float _427 = _425 ? (-1.0) : 1.0;
        float _429 = _425 ? _63 : _47;
        float _431 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[18].x, -1.0);
        float _433 = fma(_427, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[18].y);
        float _435 = _427 * _329;
        float _437 = fma(_429, 2.0, -1.0);
        float _439 = fma(_433, 2.0, -1.0);
        float _441 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _443 = _439 * _441;
        float _445 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _447 = _439 * _445;
        float _449 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[5].x, _443);
        float _451 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _453 = _439 * _451;
        float _455 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _457 = _439 * _455;
        float _459 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[3].x, _447);
        float _461 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[5].z, _449);
        float _463 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[3].z, _459);
        float _465 = _461 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _467 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[2].x, _453);
        float _469 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[4].x, _457);
        float _471 = 1.0 / _465;
        float _473 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[2].z, _467);
        float _475 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[4].z, _469);
        float _477 = _463 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _479 = _473 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _481 = _475 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _483 = -_171;
        float _485 = fma(_479, _471, _483);
        float _487 = -_173;
        float _489 = fma(_477, _471, _487);
        float _491 = -_175;
        float _493 = fma(_481, _471, _491);
        _353 = _435;
        _419 = _493;
        _415 = _489;
        _411 = _485;
    }
    float _495 = _353;
    float _497 = _419;
    float _499 = _415;
    float _501 = _411;
    float _503 = _331 * _495;
    float _505 = _333 * _495;
    float _507 = -_343;
    float _509 = _507 + (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _511 = _335 * _495;
    float _513 = _503 * _497;
    float _515 = _505 * _499;
    float _517 = _151 * _105;
    float _519 = abs(_509);
    bool _521 = _519 >= (*spvDescriptorSet0.fp_c3)._m0[18].z;
    bool _523 = isnan(_519);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.fp_c3)._m0[18].z);
    bool _529 = _525 || _527;
    float _531 = -_513;
    float _533 = fma(_505, _501, _531);
    float _535 = _511 * _501;
    float _537 = -_515;
    float _539 = fma(_511, _497, _537);
    float _541 = _533 * _533;
    float _543 = -_535;
    float _545 = fma(_503, _499, _543);
    float _547 = fma(_539, _539, _541);
    float _549 = fma(_545, _545, _547);
    float _551 = _547;
    if (_529)
    {
        float _553 = -_517;
        float _555 = _553 + (*spvDescriptorSet0.fp_c3)._m0[18].y;
        _551 = _555;
    }
    float _557 = _551;
    float _559 = rsqrt(_549);
    float _561 = abs(_557);
    bool _563 = _561 < (*spvDescriptorSet0.fp_c3)._m0[18].z;
    bool _565 = !_529;
    bool _567 = _563 || _565;
    float _569 = _557;
    if (_567)
    {
        _569 = 1.0;
    }
    float _571 = _569;
    float _573 = _539 * _559;
    float _575 = _533 * _559;
    float _577 = _545 * _559;
    float _579 = _571;
    if (!_567)
    {
        float _581 = 1.0 / _175;
        float _583 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _585 = -_581;
        float _587 = _583 * _585;
        float _589 = precise::min(_587, (*spvDescriptorSet0.fp_c3)._m0[10].x);
        bool _591 = _589 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _593 = !_591;
        float _595 = _587;
        if (!_593)
        {
            float _597 = _575 * _575;
            float _599 = _173 * _173;
            float _601 = (*spvDescriptorSet0.fp_c3)._m0[18].y * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            bool _603 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
            float _605 = fma(_573, _573, _597);
            float _607 = fma(_171, _171, _599);
            float _609 = (*spvDescriptorSet0.fp_c3)._m0[18].x * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            float _611 = trunc(_601);
            int _614 = int(_611);
            bool _616 = _605 >= 0.00999999977648258209228515625;
            bool _618 = isnan(_605);
            bool _620 = _616 || _618;
            bool _622 = isnan(0.00999999977648258209228515625);
            bool _624 = _620 || _622;
            float _626 = fma(_175, _175, _607);
            float _628 = -_575;
            float _630 = _173 * _628;
            float _632 = -_573;
            float _634 = fma(_171, _632, _630);
            float _636 = 1.0 / _626;
            float _638 = -_577;
            float _640 = fma(_175, _638, _634);
            float _642 = _597;
            if (!_624)
            {
                _642 = 1.0;
            }
            float _644 = _642;
            float _646 = _605;
            float _648 = _644;
            if (_624)
            {
                float _650 = rsqrt(_605);
                _646 = _650;
            }
            float _652 = _646;
            if (!_624)
            {
                _167 = 0.0;
            }
            float _654 = _167;
            float _656 = trunc(_609);
            int _658 = int(_656);
            float _660 = _654;
            if (_624)
            {
                float _662 = -_652;
                float _664 = _573 * _662;
                _648 = _664;
            }
            float _666 = _648;
            float _668 = _640 * _640;
            float _670 = _666;
            _595 = _666;
            if (_624)
            {
                float _672 = _575 * _652;
                _660 = _672;
            }
            float _674 = _660;
            float _676 = _668 * _636;
            bool _678 = !_603;
            if (!_678)
            {
                int _680 = _658 * 10;
                int _682 = _658 ^ _614;
                int _684 = _614 * _680;
                int _686 = _682 * 30;
                int _688 = _686 + _684;
                float _690 = _589 * 1.77777779102325439453125;
                float _692 = float(_688);
                int _694 = 0;
                int _696 = 0;
                bool _698;
                int _880;
                do
                {
                    int _700 = _694;
                    int _702 = _696;
                    float _704 = float(_700);
                    int _706 = _700 + 1;
                    float _708 = _704 + 0.5;
                    bool _710 = _706 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                    float _712 = _708 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
                    float _714 = _712 * 2.0;
                    float _716 = fma(_714, (*spvDescriptorSet0.fp_c3)._m0[10].y, _692);
                    float _718 = _714 * _714;
                    float _720 = _716 * 0.15915493667125701904296875;
                    float _722 = _720 * 6.283185482025146484375;
                    float _724 = sin(_722);
                    float _726 = _720 * 6.283185482025146484375;
                    float _728 = cos(_726);
                    bool _730 = _724 > 0.0;
                    float _732 = -_724;
                    float _734 = _730 ? _732 : _724;
                    float _736 = -_728;
                    float _738 = _730 ? _736 : _728;
                    float _740 = _734 * _674;
                    float _742 = -_666;
                    float _744 = _734 * _742;
                    float _746 = -_666;
                    float _748 = -_740;
                    float _750 = fma(_738, _746, _748);
                    float _752 = fma(_738, _674, _744);
                    float _754 = _750 * _718;
                    float _756 = _752 * _718;
                    float _758 = _754 * _666;
                    float _760 = -_674;
                    float _762 = _754 * _760;
                    float _764 = fma(_754, _690, (*spvDescriptorSet0.fp_c3)._m0[18].y);
                    float _766 = -_756;
                    float _768 = fma(_766, _674, _758);
                    float _770 = -_756;
                    float _772 = fma(_770, _666, _762);
                    float _774 = -_517;
                    float _776 = _774 + _764;
                    float _778 = _768 * _768;
                    float _780 = _772 * _772;
                    float _782 = fma(_676, _778, _780);
                    float _784 = fma(_589, _756, (*spvDescriptorSet0.fp_c3)._m0[18].x);
                    bool _786 = _782 > _676;
                    float _788 = -_343;
                    float _790 = _788 + _784;
                    _694 = _706;
                    float _792 = _782;
                    float _794 = _758;
                    float _796 = _772;
                    float _798 = _764;
                    if (_786)
                    {
                        float _800 = _772 * _674;
                        _792 = _800;
                    }
                    float _802 = _792;
                    if (!_786)
                    {
                        float _804 = -_754;
                        float _806 = (-0.0) + _804;
                        _794 = _806;
                    }
                    float _808 = _794;
                    float _810 = _808;
                    if (_786)
                    {
                        float _812 = _772 * _666;
                        _796 = _812;
                    }
                    float _814 = _796;
                    if (!_786)
                    {
                        float _816 = -_756;
                        float _818 = (-0.0) + _816;
                        _798 = _818;
                    }
                    float _820 = _798;
                    float _822 = _820;
                    if (_786)
                    {
                        float _824 = -_666;
                        float _826 = -_802;
                        float _828 = fma(_768, _824, _826);
                        _810 = _828;
                    }
                    float _830 = _810;
                    float _832 = _776 * _776;
                    if (_786)
                    {
                        float _834 = -_814;
                        float _836 = fma(_768, _674, _834);
                        _822 = _836;
                    }
                    float _838 = _822;
                    float _840 = fma(_690, _830, (*spvDescriptorSet0.fp_c3)._m0[18].y);
                    float _842 = fma(_790, _790, _832);
                    float _844 = fma(_589, _838, (*spvDescriptorSet0.fp_c3)._m0[18].x);
                    float _846 = -_517;
                    float _848 = _846 + _840;
                    float _850 = -_343;
                    float _852 = _850 + _844;
                    float _854 = sqrt(_842);
                    float _856 = _848 * _848;
                    float _858 = fma(_852, _852, _856);
                    float _860 = sqrt(_858);
                    bool _862 = _854 >= (*spvDescriptorSet0.fp_c3)._m0[18].z;
                    bool _864 = isnan(_854);
                    bool _866 = _862 || _864;
                    bool _868 = isnan((*spvDescriptorSet0.fp_c3)._m0[18].z);
                    bool _870 = _866 || _868;
                    bool _872 = _860 < (*spvDescriptorSet0.fp_c3)._m0[18].z;
                    bool _874 = !_870;
                    bool _876 = _872 || _874;
                    bool _878 = !_876;
                    _880 = _878 ? _702 : 1;
                    _698 = !_710;
                    _696 = _880;
                } while (_698);
                int _882 = _880 & 1;
                bool _884 = _882 != 0;
                if (_884)
                {
                    _670 = 0.5;
                }
                float _886 = _670;
                _595 = _886;
                _579 = _886;
                _888 = _884;
            }
        }
        if (!_888)
        {
            float _890 = _595;
            bool _892 = _589 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
            bool _894 = isnan(_589);
            bool _896 = _892 || _894;
            bool _898 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
            bool _900 = _896 || _898;
            float _902 = _890;
            if (!_900)
            {
                _902 = 0.0;
            }
            float _904 = _902;
            bool _906 = !_900;
            _579 = _904;
            if (!_906)
            {
                float2 _2344 = float2(_343, _517);
                float _908 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2344, float2(0.0), isnan(_2344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2344, float2(0.0), isnan(_2344))).x;
                float _910 = fma(_517, 2.0, -1.0);
                float _912 = fma(_343, 2.0, -1.0);
                float _914 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _916 = _910 * _914;
                float _918 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _920 = _910 * _918;
                float _922 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _924 = _910 * _922;
                float _926 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _928 = _910 * _926;
                float _930 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[2].x, _916);
                float _932 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[3].x, _920);
                float _934 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[4].x, _924);
                float _936 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[5].x, _928);
                float _938 = fma(_908, 2.0, -1.0);
                float _940 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[5].z, _936);
                float _942 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[3].z, _932);
                float _944 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[2].z, _930);
                float _946 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[4].z, _934);
                float _948 = _940 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _950 = _942 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _952 = _944 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _954 = _946 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _956 = 1.0 / _948;
                float _958 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
                float _960 = -_173;
                float _962 = fma(_950, _956, _960);
                float _964 = -_171;
                float _966 = fma(_952, _956, _964);
                float _968 = -_175;
                float _970 = fma(_954, _956, _968);
                float _972 = _962 * _962;
                float _974 = -_962;
                float _976 = _575 * _974;
                float _978 = fma(_966, _966, _972);
                float _980 = -_573;
                float _982 = fma(_980, _966, _976);
                float _984 = fma(_970, _970, _978);
                float _986 = -_577;
                float _988 = fma(_986, _970, _982);
                float _990 = -_984;
                float _992 = fma(_958, _990, 1.0);
                float _994 = _984 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _996 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _998 = _988 + _996;
                float _1000 = precise::max(0.0, _992);
                float _1002 = 1.0 / _994;
                float _1004 = precise::max(_998, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1006 = _1000 * _1000;
                float _1008 = _1000 * _1006;
                float _1010 = _1008 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1012 = _1010 * _1004;
                float _1014 = _1012 * _1002;
                float _1016 = precise::max(_1014, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1018 = precise::min(_1016, 1.0);
                _579 = _1018;
            }
        }
    }
    _888 = false;
    float _1020 = _579;
    float _1022 = -_51;
    float _1024 = fma(_1022, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
    float _1026 = -_1020;
    float _1028 = _1026 + 1.0;
    bool _1030 = _51 != 1.0;
    bool _1032 = isnan(_51);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(1.0);
    bool _1038 = _1034 || _1036;
    float _1040 = 1.0 / _1024;
    float _1042 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _1044 = fma(_1040, (*spvDescriptorSet0.fp_c3)._m0[8].w, _1042);
    int _1046 = _1038 ? as_type<int>(_1044) : 1065353216;
    out.m_32.x = _1028;
    out.m_32.y = as_type<float>(_1046);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _888 = false;
    float _39 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _41 = (*spvDescriptorSet0.fp_c3)._m0[18].x + _39;
    float2 _1065 = float2((*spvDescriptorSet0.fp_c3)._m0[18].x, (*spvDescriptorSet0.fp_c3)._m0[18].y);
    float3 _45 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1065, float2(0.0), isnan(_1065)), int2(0), component::x).xzw;
    float _47 = _45.x;
    float _49 = _45.y;
    float _51 = _45.z;
    float _53 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _55 = (*spvDescriptorSet0.fp_c3)._m0[18].y + _53;
    float2 _1090 = float2(_41, _55);
    float2 _59 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1090, float2(0.0), isnan(_1090)), int2(0), component::x).xz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = gl_FragCoord.w;
    float _67 = in.m_29.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = fma((*spvDescriptorSet0.fp_c3)._m0[18].y, 2.0, -1.0);
    float _75 = fma((*spvDescriptorSet0.fp_c3)._m0[18].x, 2.0, -1.0);
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _79 = _73 * _77;
    float _81 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _83 = _73 * _81;
    float _85 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _87 = _73 * _85;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _91 = _73 * _89;
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].x, _79);
    float _95 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[3].x, _83);
    float _97 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[4].x, _87);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[5].x, _91);
    float _101 = in.m_29.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = fma(_51, 2.0, -1.0);
    float _109 = -_51;
    float _111 = _49 + _109;
    float _113 = -_51;
    float _115 = _47 + _113;
    float _117 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[5].z, _99);
    float _119 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _93);
    float _121 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[4].z, _97);
    float _123 = -_51;
    float _125 = _123 + _61;
    float _127 = _117 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _129 = -_51;
    float _131 = _129 + _63;
    float _133 = _111 * _125;
    float _135 = _115 * _131;
    float _137 = 1.0 / _127;
    bool _141 = _133 > 0.0;
    float _143 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, _95);
    float _145 = _119 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _147 = _135 > 0.0;
    float _149 = _143 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _151 = 1.0 / _65;
    float _153 = _121 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _155 = false;
    float _157 = _121;
    float _159 = _65;
    float _161 = _61;
    float _163 = _49;
    float _165 = _111;
    float _167 = (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (!_141)
    {
        _155 = false;
    }
    bool _169 = _155;
    float _171 = _145 * _137;
    float _173 = _149 * _137;
    float _175 = _153 * _137;
    bool _177 = !_141;
    bool _179 = _169;
    float _181 = 0.0;
    float _183 = _137;
    if (!_177)
    {
        float _185 = abs(_111);
        float _187 = abs(_125);
        float _189 = precise::min(_185, _187);
        float _191 = _175 * (-0.0199999995529651641845703125);
        bool _193 = _189 != 1.0;
        bool _195 = isnan(_189);
        bool _197 = _193 || _195;
        bool _199 = isnan(1.0);
        bool _201 = _197 || _199;
        float _203 = -_189;
        float _205 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _207 = 1.0 / _205;
        float _209 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _211 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[8].w, _209);
        float _213 = _201 ? _211 : 1.0;
        float _215 = _213 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _217 = _215 > _191;
        _179 = _217;
        _157 = _189;
        _159 = _207;
        _181 = _191;
        _183 = _215;
    }
    bool _219 = _179;
    float _221 = _157;
    float _223 = _159;
    float _225 = _181;
    float _227 = _183;
    float _229 = _221;
    float _231 = _223;
    float _233 = _227;
    float _235 = _225;
    bool _237 = _219;
    if (_219)
    {
        _229 = 1.0;
    }
    float _239 = _229;
    float _241 = _239;
    if (_219)
    {
        _231 = 1.0;
    }
    float _243 = _231;
    float _245 = _243;
    if (_219)
    {
        _233 = 0.0;
    }
    float _247 = _233;
    float _249 = _247;
    if (_219)
    {
        _235 = 0.0;
    }
    float _251 = _235;
    float _253 = _251;
    if (!_219)
    {
        float _255 = abs(_111);
        float _257 = abs(_125);
        bool _259 = _255 >= _257;
        float _261 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[18].y, -1.0);
        float _263 = _259 ? (-1.0) : 1.0;
        float _265 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _267 = _261 * _265;
        float _269 = _259 ? _61 : _49;
        float _271 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[18].x);
        float _273 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _275 = _261 * _273;
        float _277 = fma(_269, 2.0, -1.0);
        float _279 = fma(_271, 2.0, -1.0);
        float _281 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[5].x, _275);
        float _283 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _285 = _261 * _283;
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _289 = _261 * _287;
        float _291 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[3].x, _267);
        float _293 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[5].z, _281);
        float _295 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[3].z, _291);
        float _297 = _293 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _299 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[2].x, _285);
        float _301 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[4].x, _289);
        float _303 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[2].z, _299);
        float _305 = 1.0 / _297;
        float _307 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[4].z, _301);
        float _309 = _295 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _311 = _303 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _313 = _307 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _315 = -_171;
        float _317 = fma(_311, _305, _315);
        float _319 = -_173;
        float _321 = fma(_309, _305, _319);
        float _323 = -_175;
        float _325 = fma(_313, _305, _323);
        _237 = _259;
        _241 = _263;
        _245 = _317;
        _253 = _325;
        _249 = _321;
        _161 = _309;
        _163 = _311;
        _165 = _313;
    }
    bool _327 = _237;
    float _329 = _241;
    float _331 = _245;
    float _333 = _253;
    float _335 = _249;
    float _337 = _161;
    float _339 = _163;
    float _341 = _165;
    float _343 = _151 * _71;
    bool _345 = _327;
    float _347 = _337;
    float _349 = _339;
    float _351 = _341;
    float _353 = _329;
    if (!_147)
    {
        _345 = false;
    }
    bool _355 = _345;
    bool _357 = !_147;
    bool _359 = _355;
    if (!_357)
    {
        float _361 = abs(_115);
        float _363 = abs(_131);
        float _365 = precise::min(_361, _363);
        float _367 = _175 * (-0.0199999995529651641845703125);
        bool _369 = _365 != 1.0;
        bool _371 = isnan(_365);
        bool _373 = _369 || _371;
        bool _375 = isnan(1.0);
        bool _377 = _373 || _375;
        float _379 = -_365;
        float _381 = fma(_379, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
        float _383 = 1.0 / _381;
        float _385 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
        float _387 = fma(_383, (*spvDescriptorSet0.fp_c3)._m0[8].w, _385);
        float _389 = _377 ? _387 : 1.0;
        float _391 = _389 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _393 = _391 > _367;
        _359 = _393;
        _347 = _383;
        _349 = _365;
        _351 = _391;
    }
    bool _395 = _359;
    float _397 = _347;
    float _399 = _349;
    float _401 = _351;
    float _403 = _401;
    float _405 = _399;
    float _407 = _397;
    if (_395)
    {
        _403 = 0.0;
    }
    float _409 = _403;
    float _411 = _409;
    if (_395)
    {
        _405 = 0.0;
    }
    float _413 = _405;
    float _415 = _413;
    if (_395)
    {
        _407 = 1.0;
    }
    float _417 = _407;
    float _419 = _417;
    if (!_395)
    {
        float _421 = abs(_115);
        float _423 = abs(_131);
        bool _425 = _421 >= _423;
        float _427 = _425 ? (-1.0) : 1.0;
        float _429 = _425 ? _63 : _47;
        float _431 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[18].x, -1.0);
        float _433 = fma(_427, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[18].y);
        float _435 = _427 * _329;
        float _437 = fma(_429, 2.0, -1.0);
        float _439 = fma(_433, 2.0, -1.0);
        float _441 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _443 = _439 * _441;
        float _445 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _447 = _439 * _445;
        float _449 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[5].x, _443);
        float _451 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _453 = _439 * _451;
        float _455 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _457 = _439 * _455;
        float _459 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[3].x, _447);
        float _461 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[5].z, _449);
        float _463 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[3].z, _459);
        float _465 = _461 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _467 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[2].x, _453);
        float _469 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[4].x, _457);
        float _471 = 1.0 / _465;
        float _473 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[2].z, _467);
        float _475 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[4].z, _469);
        float _477 = _463 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _479 = _473 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _481 = _475 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _483 = -_171;
        float _485 = fma(_479, _471, _483);
        float _487 = -_173;
        float _489 = fma(_477, _471, _487);
        float _491 = -_175;
        float _493 = fma(_481, _471, _491);
        _353 = _435;
        _419 = _493;
        _415 = _489;
        _411 = _485;
    }
    float _495 = _353;
    float _497 = _419;
    float _499 = _415;
    float _501 = _411;
    float _503 = _331 * _495;
    float _505 = _333 * _495;
    float _507 = -_343;
    float _509 = _507 + (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _511 = _335 * _495;
    float _513 = _503 * _497;
    float _515 = _505 * _499;
    float _517 = _151 * _105;
    float _519 = abs(_509);
    bool _521 = _519 >= (*spvDescriptorSet0.fp_c3)._m0[18].z;
    bool _523 = isnan(_519);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.fp_c3)._m0[18].z);
    bool _529 = _525 || _527;
    float _531 = -_513;
    float _533 = fma(_505, _501, _531);
    float _535 = _511 * _501;
    float _537 = -_515;
    float _539 = fma(_511, _497, _537);
    float _541 = _533 * _533;
    float _543 = -_535;
    float _545 = fma(_503, _499, _543);
    float _547 = fma(_539, _539, _541);
    float _549 = fma(_545, _545, _547);
    float _551 = _547;
    if (_529)
    {
        float _553 = -_517;
        float _555 = _553 + (*spvDescriptorSet0.fp_c3)._m0[18].y;
        _551 = _555;
    }
    float _557 = _551;
    float _559 = rsqrt(_549);
    float _561 = abs(_557);
    bool _563 = _561 < (*spvDescriptorSet0.fp_c3)._m0[18].z;
    bool _565 = !_529;
    bool _567 = _563 || _565;
    float _569 = _557;
    if (_567)
    {
        _569 = 1.0;
    }
    float _571 = _569;
    float _573 = _539 * _559;
    float _575 = _533 * _559;
    float _577 = _545 * _559;
    float _579 = _571;
    if (!_567)
    {
        float _581 = 1.0 / _175;
        float _583 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _585 = -_581;
        float _587 = _583 * _585;
        float _589 = precise::min(_587, (*spvDescriptorSet0.fp_c3)._m0[10].x);
        bool _591 = _589 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _593 = !_591;
        float _595 = _587;
        if (!_593)
        {
            float _597 = _575 * _575;
            float _599 = _173 * _173;
            float _601 = (*spvDescriptorSet0.fp_c3)._m0[18].y * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            bool _603 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
            float _605 = fma(_573, _573, _597);
            float _607 = fma(_171, _171, _599);
            float _609 = (*spvDescriptorSet0.fp_c3)._m0[18].x * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            float _611 = trunc(_601);
            int _614 = int(_611);
            bool _616 = _605 >= 0.00999999977648258209228515625;
            bool _618 = isnan(_605);
            bool _620 = _616 || _618;
            bool _622 = isnan(0.00999999977648258209228515625);
            bool _624 = _620 || _622;
            float _626 = fma(_175, _175, _607);
            float _628 = -_575;
            float _630 = _173 * _628;
            float _632 = -_573;
            float _634 = fma(_171, _632, _630);
            float _636 = 1.0 / _626;
            float _638 = -_577;
            float _640 = fma(_175, _638, _634);
            float _642 = _597;
            if (!_624)
            {
                _642 = 1.0;
            }
            float _644 = _642;
            float _646 = _605;
            float _648 = _644;
            if (_624)
            {
                float _650 = rsqrt(_605);
                _646 = _650;
            }
            float _652 = _646;
            if (!_624)
            {
                _167 = 0.0;
            }
            float _654 = _167;
            float _656 = trunc(_609);
            int _658 = int(_656);
            float _660 = _654;
            if (_624)
            {
                float _662 = -_652;
                float _664 = _573 * _662;
                _648 = _664;
            }
            float _666 = _648;
            float _668 = _640 * _640;
            float _670 = _666;
            _595 = _666;
            if (_624)
            {
                float _672 = _575 * _652;
                _660 = _672;
            }
            float _674 = _660;
            float _676 = _668 * _636;
            bool _678 = !_603;
            if (!_678)
            {
                int _680 = _658 * 10;
                int _682 = _658 ^ _614;
                int _684 = _614 * _680;
                int _686 = _682 * 30;
                int _688 = _686 + _684;
                float _690 = _589 * 1.77777779102325439453125;
                float _692 = float(_688);
                int _694 = 0;
                int _696 = 0;
                bool _698;
                int _880;
                do
                {
                    int _700 = _694;
                    int _702 = _696;
                    float _704 = float(_700);
                    int _706 = _700 + 1;
                    float _708 = _704 + 0.5;
                    bool _710 = _706 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                    float _712 = _708 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
                    float _714 = _712 * 2.0;
                    float _716 = fma(_714, (*spvDescriptorSet0.fp_c3)._m0[10].y, _692);
                    float _718 = _714 * _714;
                    float _720 = _716 * 0.15915493667125701904296875;
                    float _722 = _720 * 6.283185482025146484375;
                    float _724 = sin(_722);
                    float _726 = _720 * 6.283185482025146484375;
                    float _728 = cos(_726);
                    bool _730 = _724 > 0.0;
                    float _732 = -_724;
                    float _734 = _730 ? _732 : _724;
                    float _736 = -_728;
                    float _738 = _730 ? _736 : _728;
                    float _740 = _734 * _674;
                    float _742 = -_666;
                    float _744 = _734 * _742;
                    float _746 = -_666;
                    float _748 = -_740;
                    float _750 = fma(_738, _746, _748);
                    float _752 = fma(_738, _674, _744);
                    float _754 = _750 * _718;
                    float _756 = _752 * _718;
                    float _758 = _754 * _666;
                    float _760 = -_674;
                    float _762 = _754 * _760;
                    float _764 = fma(_754, _690, (*spvDescriptorSet0.fp_c3)._m0[18].y);
                    float _766 = -_756;
                    float _768 = fma(_766, _674, _758);
                    float _770 = -_756;
                    float _772 = fma(_770, _666, _762);
                    float _774 = -_517;
                    float _776 = _774 + _764;
                    float _778 = _768 * _768;
                    float _780 = _772 * _772;
                    float _782 = fma(_676, _778, _780);
                    float _784 = fma(_589, _756, (*spvDescriptorSet0.fp_c3)._m0[18].x);
                    bool _786 = _782 > _676;
                    float _788 = -_343;
                    float _790 = _788 + _784;
                    _694 = _706;
                    float _792 = _782;
                    float _794 = _758;
                    float _796 = _772;
                    float _798 = _764;
                    if (_786)
                    {
                        float _800 = _772 * _674;
                        _792 = _800;
                    }
                    float _802 = _792;
                    if (!_786)
                    {
                        float _804 = -_754;
                        float _806 = (-0.0) + _804;
                        _794 = _806;
                    }
                    float _808 = _794;
                    float _810 = _808;
                    if (_786)
                    {
                        float _812 = _772 * _666;
                        _796 = _812;
                    }
                    float _814 = _796;
                    if (!_786)
                    {
                        float _816 = -_756;
                        float _818 = (-0.0) + _816;
                        _798 = _818;
                    }
                    float _820 = _798;
                    float _822 = _820;
                    if (_786)
                    {
                        float _824 = -_666;
                        float _826 = -_802;
                        float _828 = fma(_768, _824, _826);
                        _810 = _828;
                    }
                    float _830 = _810;
                    float _832 = _776 * _776;
                    if (_786)
                    {
                        float _834 = -_814;
                        float _836 = fma(_768, _674, _834);
                        _822 = _836;
                    }
                    float _838 = _822;
                    float _840 = fma(_690, _830, (*spvDescriptorSet0.fp_c3)._m0[18].y);
                    float _842 = fma(_790, _790, _832);
                    float _844 = fma(_589, _838, (*spvDescriptorSet0.fp_c3)._m0[18].x);
                    float _846 = -_517;
                    float _848 = _846 + _840;
                    float _850 = -_343;
                    float _852 = _850 + _844;
                    float _854 = sqrt(_842);
                    float _856 = _848 * _848;
                    float _858 = fma(_852, _852, _856);
                    float _860 = sqrt(_858);
                    bool _862 = _854 >= (*spvDescriptorSet0.fp_c3)._m0[18].z;
                    bool _864 = isnan(_854);
                    bool _866 = _862 || _864;
                    bool _868 = isnan((*spvDescriptorSet0.fp_c3)._m0[18].z);
                    bool _870 = _866 || _868;
                    bool _872 = _860 < (*spvDescriptorSet0.fp_c3)._m0[18].z;
                    bool _874 = !_870;
                    bool _876 = _872 || _874;
                    bool _878 = !_876;
                    _880 = _878 ? _702 : 1;
                    _698 = !_710;
                    _696 = _880;
                } while (_698);
                int _882 = _880 & 1;
                bool _884 = _882 != 0;
                if (_884)
                {
                    _670 = 0.5;
                }
                float _886 = _670;
                _595 = _886;
                _579 = _886;
                _888 = _884;
            }
        }
        if (!_888)
        {
            float _890 = _595;
            bool _892 = _589 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
            bool _894 = isnan(_589);
            bool _896 = _892 || _894;
            bool _898 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
            bool _900 = _896 || _898;
            float _902 = _890;
            if (!_900)
            {
                _902 = 0.0;
            }
            float _904 = _902;
            bool _906 = !_900;
            _579 = _904;
            if (!_906)
            {
                float2 _2344 = float2(_343, _517);
                float _908 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2344, float2(0.0), isnan(_2344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2344, float2(0.0), isnan(_2344))).x;
                float _910 = fma(_517, 2.0, -1.0);
                float _912 = fma(_343, 2.0, -1.0);
                float _914 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
                float _916 = _910 * _914;
                float _918 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
                float _920 = _910 * _918;
                float _922 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _924 = _910 * _922;
                float _926 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
                float _928 = _910 * _926;
                float _930 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[2].x, _916);
                float _932 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[3].x, _920);
                float _934 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[4].x, _924);
                float _936 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[5].x, _928);
                float _938 = fma(_908, 2.0, -1.0);
                float _940 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[5].z, _936);
                float _942 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[3].z, _932);
                float _944 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[2].z, _930);
                float _946 = fma(_938, (*spvDescriptorSet0.fp_c3)._m0[4].z, _934);
                float _948 = _940 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
                float _950 = _942 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
                float _952 = _944 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _954 = _946 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
                float _956 = 1.0 / _948;
                float _958 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
                float _960 = -_173;
                float _962 = fma(_950, _956, _960);
                float _964 = -_171;
                float _966 = fma(_952, _956, _964);
                float _968 = -_175;
                float _970 = fma(_954, _956, _968);
                float _972 = _962 * _962;
                float _974 = -_962;
                float _976 = _575 * _974;
                float _978 = fma(_966, _966, _972);
                float _980 = -_573;
                float _982 = fma(_980, _966, _976);
                float _984 = fma(_970, _970, _978);
                float _986 = -_577;
                float _988 = fma(_986, _970, _982);
                float _990 = -_984;
                float _992 = fma(_958, _990, 1.0);
                float _994 = _984 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _996 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _998 = _988 + _996;
                float _1000 = precise::max(0.0, _992);
                float _1002 = 1.0 / _994;
                float _1004 = precise::max(_998, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _1006 = _1000 * _1000;
                float _1008 = _1000 * _1006;
                float _1010 = _1008 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _1012 = _1010 * _1004;
                float _1014 = _1012 * _1002;
                float _1016 = precise::max(_1014, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _1018 = precise::min(_1016, 1.0);
                _579 = _1018;
            }
        }
    }
    _888 = false;
    float _1020 = _579;
    float _1022 = -_51;
    float _1024 = fma(_1022, (*spvDescriptorSet0.fp_c3)._m0[8].z, 1.0);
    float _1026 = -_1020;
    float _1028 = _1026 + 1.0;
    bool _1030 = _51 != 1.0;
    bool _1032 = isnan(_51);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(1.0);
    bool _1038 = _1034 || _1036;
    float _1040 = 1.0 / _1024;
    float _1042 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _1044 = fma(_1040, (*spvDescriptorSet0.fp_c3)._m0[8].w, _1042);
    int _1046 = _1038 ? as_type<int>(_1044) : 1065353216;
    out.m_32.x = _1028;
    out.m_32.y = as_type<float>(_1046);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

