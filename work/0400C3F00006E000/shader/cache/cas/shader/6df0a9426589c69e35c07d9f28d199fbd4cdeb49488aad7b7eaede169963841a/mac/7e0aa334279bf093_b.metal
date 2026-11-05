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
    bool _676 = false;
    float _39 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _41 = (*spvDescriptorSet0.fp_c3)._m0[18].x + _39;
    float _43 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _45 = (*spvDescriptorSet0.fp_c3)._m0[18].y + _43;
    float2 _805 = float2((*spvDescriptorSet0.fp_c3)._m0[18].x, (*spvDescriptorSet0.fp_c3)._m0[18].y);
    float3 _49 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_805, float2(0.0), isnan(_805)), int2(0), component::x).xzw;
    float _51 = _49.x;
    float _53 = _49.y;
    float _55 = _49.z;
    float2 _822 = float2(_41, _45);
    float2 _59 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_822, float2(0.0), isnan(_822)), int2(0), component::x).xz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = gl_FragCoord.w;
    float _67 = in.m_29.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_29.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = -_55;
    float _83 = _53 + _81;
    float _85 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
    float _87 = -_55;
    float _89 = _51 + _87;
    float _91 = -_55;
    float _93 = _91 + _61;
    float _95 = _85 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _97 = -_55;
    float _99 = _97 + _63;
    float _101 = _83 * _93;
    float _103 = abs(_83);
    float _105 = abs(_93);
    float _107 = precise::min(_103, _105);
    float _109 = _95 * 0.0199999995529651641845703125;
    float _111 = abs(_89);
    float _113 = abs(_99);
    float _115 = precise::min(_111, _113);
    float _117 = _89 * _99;
    bool _121 = _101 > 0.0;
    float _123 = _107 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _125 = _115 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _131 = fma((*spvDescriptorSet0.fp_c3)._m0[18].y, _127, _129);
    bool _133 = _117 > 0.0;
    bool _135 = _123 > _109;
    float _137 = _131 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    bool _139 = _101 > 0.0;
    bool _141 = _139 && _135;
    bool _143 = _125 > _109;
    float _145 = fma((*spvDescriptorSet0.fp_c3)._m0[18].x, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _147 = _85 * _137;
    bool _149 = _117 > 0.0;
    bool _151 = _149 && _143;
    float _153 = _145 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _155 = _85 * _153;
    float _157 = _85;
    float _159 = _117;
    float _161 = _125;
    float _163 = _61;
    float _165 = _137;
    float _167 = (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (_141)
    {
        _157 = 1.0;
    }
    float _169 = _157;
    float _171 = _169;
    if (_141)
    {
        _159 = 0.0;
        _161 = 0.0;
    }
    float _173 = _159;
    float _175 = _161;
    float _177 = 0.0;
    float _179 = _173;
    float _181 = _175;
    if (_141)
    {
        _177 = 1.0;
    }
    float _183 = _177;
    bool _185 = _135 && _121;
    float _187 = _183;
    float _189 = _71;
    float _191 = _77;
    if (!_185)
    {
        float _193 = abs(_83);
        float _195 = abs(_93);
        bool _197 = _193 >= _195;
        float _199 = _197 ? (-1.0) : 1.0;
        float _201 = _197 ? _61 : _53;
        float _203 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[18].x);
        float _205 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        float _207 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
        float _209 = -_147;
        float _211 = fma(_137, _205, _209);
        float _213 = _207 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
        float _215 = -_205;
        float _217 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[7].w, _95);
        float _219 = -_155;
        float _221 = fma(_205, _213, _219);
        _171 = _199;
        _187 = _221;
        _179 = _217;
        _181 = _211;
        _163 = _205;
    }
    float _223 = _171;
    float _225 = _187;
    float _227 = _179;
    float _229 = _181;
    float _231 = _163;
    float _233 = _79 * _71;
    float _235 = _231;
    float _237 = _223;
    if (_151)
    {
        _165 = 0.0;
    }
    float _239 = _165;
    float _241 = _239;
    if (_151)
    {
        _189 = 0.0;
    }
    float _243 = _189;
    float _245 = _243;
    if (_151)
    {
        _235 = 1.0;
    }
    float _247 = _235;
    bool _249 = _143 && _133;
    float _251 = _247;
    if (!_249)
    {
        float _253 = abs(_89);
        float _255 = abs(_99);
        bool _257 = _253 >= _255;
        float _259 = _257 ? (-1.0) : 1.0;
        float _261 = _257 ? _63 : _51;
        float _263 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[18].y);
        float _265 = _259 * _223;
        float _267 = -_263;
        float _269 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _271 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[6].w, _269);
        float _273 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        float _275 = _271 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _277 = -_155;
        float _279 = fma(_153, _273, _277);
        float _281 = -_147;
        float _283 = fma(_273, _275, _281);
        float _285 = -_273;
        float _287 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[7].w, _95);
        _237 = _265;
        _251 = _287;
        _245 = _283;
        _241 = _279;
    }
    float _289 = _237;
    float _291 = _251;
    float _293 = _245;
    float _295 = _241;
    float _297 = _225 * _289;
    float _299 = _227 * _289;
    float _301 = -_233;
    float _303 = _301 + (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _305 = _229 * _289;
    float _307 = _297 * _291;
    float _309 = _299 * _293;
    float _311 = abs(_303);
    bool _313 = _311 >= (*spvDescriptorSet0.fp_c3)._m0[18].z;
    bool _315 = isnan(_311);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.fp_c3)._m0[18].z);
    bool _321 = _317 || _319;
    float _323 = -_307;
    float _325 = fma(_299, _295, _323);
    float _327 = _305 * _295;
    float _329 = -_309;
    float _331 = fma(_305, _291, _329);
    float _333 = _325 * _325;
    float _335 = -_327;
    float _337 = fma(_297, _293, _335);
    float _339 = fma(_331, _331, _333);
    float _341 = _79 * _77;
    float _343 = fma(_337, _337, _339);
    if (_321)
    {
        float _345 = -_341;
        float _347 = _345 + (*spvDescriptorSet0.fp_c3)._m0[18].y;
        _191 = _347;
    }
    float _349 = _191;
    float _351 = rsqrt(_343);
    float _353 = abs(_349);
    bool _355 = _353 < (*spvDescriptorSet0.fp_c3)._m0[18].z;
    bool _357 = !_321;
    bool _359 = _355 || _357;
    float _361 = _349;
    if (_359)
    {
        _361 = 1.0;
    }
    float _363 = _361;
    float _365 = _325 * _351;
    float _367 = _331 * _351;
    float _369 = _337 * _351;
    float _371 = _363;
    if (!_359)
    {
        float _373 = 1.0 / _95;
        float _375 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _377 = _375 * _373;
        float _379 = precise::min(_377, (*spvDescriptorSet0.fp_c3)._m0[10].x);
        bool _381 = _379 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _383 = !_381;
        float _385 = _377;
        if (!_383)
        {
            float _387 = _365 * _365;
            float _389 = _147 * _147;
            float _391 = -_365;
            float _393 = _147 * _391;
            bool _395 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
            float _397 = fma(_367, _367, _387);
            float _399 = fma(_155, _155, _389);
            float _401 = (*spvDescriptorSet0.fp_c3)._m0[18].y * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _403 = (*spvDescriptorSet0.fp_c3)._m0[18].x * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            bool _405 = _397 >= 0.00999999977648258209228515625;
            bool _407 = isnan(_397);
            bool _409 = _405 || _407;
            bool _411 = isnan(0.00999999977648258209228515625);
            bool _413 = _409 || _411;
            float _415 = fma(_95, _95, _399);
            float _417 = -_367;
            float _419 = fma(_155, _417, _393);
            float _421 = trunc(_401);
            int _424 = int(_421);
            float _426 = 1.0 / _415;
            float _428 = _419;
            if (!_413)
            {
                _167 = 0.0;
            }
            float _430 = _167;
            float _432 = _397;
            float _434 = _430;
            if (_413)
            {
                float _436 = rsqrt(_397);
                _432 = _436;
            }
            float _438 = _432;
            float _440 = trunc(_403);
            int _442 = int(_440);
            if (_413)
            {
                float _444 = _365 * _438;
                _434 = _444;
            }
            float _446 = _434;
            float _448 = fma(_95, _369, _419);
            if (!_413)
            {
                _428 = 1.0;
            }
            float _450 = _428;
            float _452 = _450;
            if (_413)
            {
                float _454 = -_438;
                float _456 = _367 * _454;
                _452 = _456;
            }
            float _458 = _452;
            float _460 = _448 * _448;
            float _462 = _460 * _426;
            bool _464 = !_395;
            float _466 = _458;
            _385 = _458;
            if (!_464)
            {
                int _468 = _442 * 10;
                int _470 = _442 ^ _424;
                int _472 = _424 * _468;
                int _474 = _470 * 30;
                int _476 = _474 + _472;
                float _478 = _379 * 1.77777779102325439453125;
                float _480 = float(_476);
                int _482 = 0;
                int _484 = 0;
                bool _486;
                int _668;
                do
                {
                    int _488 = _482;
                    int _490 = _484;
                    float _492 = float(_488);
                    int _494 = _488 + 1;
                    float _496 = _492 + 0.5;
                    bool _498 = _494 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                    float _500 = _496 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
                    float _502 = _500 * 2.0;
                    float _504 = fma(_502, (*spvDescriptorSet0.fp_c3)._m0[10].y, _480);
                    float _506 = _502 * _502;
                    float _508 = _504 * 0.15915493667125701904296875;
                    float _510 = _508 * 6.283185482025146484375;
                    float _512 = sin(_510);
                    float _514 = _508 * 6.283185482025146484375;
                    float _516 = cos(_514);
                    bool _518 = _512 > 0.0;
                    float _520 = -_512;
                    float _522 = _518 ? _520 : _512;
                    float _524 = -_516;
                    float _526 = _518 ? _524 : _516;
                    float _528 = _522 * _446;
                    float _530 = -_458;
                    float _532 = _522 * _530;
                    float _534 = -_458;
                    float _536 = -_528;
                    float _538 = fma(_526, _534, _536);
                    float _540 = fma(_526, _446, _532);
                    float _542 = _538 * _506;
                    float _544 = _540 * _506;
                    float _546 = _542 * _458;
                    float _548 = -_446;
                    float _550 = _542 * _548;
                    float _552 = -_544;
                    float _554 = fma(_552, _446, _546);
                    float _556 = -_544;
                    float _558 = fma(_556, _458, _550);
                    float _560 = fma(_542, _478, (*spvDescriptorSet0.fp_c3)._m0[18].y);
                    float _562 = _554 * _554;
                    float _564 = _558 * _558;
                    float _566 = -_341;
                    float _568 = _566 + _560;
                    float _570 = fma(_462, _562, _564);
                    float _572 = fma(_379, _544, (*spvDescriptorSet0.fp_c3)._m0[18].x);
                    bool _574 = _570 > _462;
                    float _576 = -_233;
                    float _578 = _576 + _572;
                    _482 = _494;
                    float _580 = _546;
                    float _582 = _542;
                    float _584 = _560;
                    float _586 = _570;
                    if (!_574)
                    {
                        float _588 = -_542;
                        float _590 = (-0.0) + _588;
                        _580 = _590;
                    }
                    float _592 = _580;
                    float _594 = _592;
                    if (_574)
                    {
                        float _596 = _558 * _446;
                        _582 = _596;
                    }
                    float _598 = _582;
                    if (_574)
                    {
                        float _600 = _558 * _458;
                        _584 = _600;
                    }
                    float _602 = _584;
                    if (!_574)
                    {
                        float _604 = -_544;
                        float _606 = (-0.0) + _604;
                        _586 = _606;
                    }
                    float _608 = _586;
                    float _610 = _608;
                    if (_574)
                    {
                        float _612 = -_458;
                        float _614 = -_598;
                        float _616 = fma(_554, _612, _614);
                        _594 = _616;
                    }
                    float _618 = _594;
                    if (_574)
                    {
                        float _620 = -_602;
                        float _622 = fma(_554, _446, _620);
                        _610 = _622;
                    }
                    float _624 = _610;
                    float _626 = _568 * _568;
                    float _628 = fma(_478, _618, (*spvDescriptorSet0.fp_c3)._m0[18].y);
                    float _630 = fma(_379, _624, (*spvDescriptorSet0.fp_c3)._m0[18].x);
                    float _632 = fma(_578, _578, _626);
                    float _634 = -_341;
                    float _636 = _634 + _628;
                    float _638 = -_233;
                    float _640 = _638 + _630;
                    float _642 = _636 * _636;
                    float _644 = sqrt(_632);
                    float _646 = fma(_640, _640, _642);
                    float _648 = sqrt(_646);
                    bool _650 = _644 >= (*spvDescriptorSet0.fp_c3)._m0[18].z;
                    bool _652 = isnan(_644);
                    bool _654 = _650 || _652;
                    bool _656 = isnan((*spvDescriptorSet0.fp_c3)._m0[18].z);
                    bool _658 = _654 || _656;
                    bool _660 = _648 < (*spvDescriptorSet0.fp_c3)._m0[18].z;
                    bool _662 = !_658;
                    bool _664 = _660 || _662;
                    bool _666 = !_664;
                    _668 = _666 ? _490 : 1;
                    _486 = !_498;
                    _484 = _668;
                } while (_486);
                int _670 = _668 & 1;
                bool _672 = _670 != 0;
                if (_672)
                {
                    _466 = 0.5;
                }
                float _674 = _466;
                _385 = _674;
                _371 = _674;
                _676 = _672;
            }
        }
        if (!_676)
        {
            float _678 = _385;
            bool _680 = _379 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
            bool _682 = isnan(_379);
            bool _684 = _680 || _682;
            bool _686 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
            bool _688 = _684 || _686;
            float _690 = _678;
            if (!_688)
            {
                _690 = 0.0;
            }
            float _692 = _690;
            bool _694 = !_688;
            _371 = _692;
            if (!_694)
            {
                float2 _1767 = float2(_233, _341);
                float _696 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1767, float2(0.0), isnan(_1767))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1767, float2(0.0), isnan(_1767))).x;
                float _698 = -_341;
                float _700 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _702 = fma(_698, (*spvDescriptorSet0.fp_c3)._m0[6].w, _700);
                float _704 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _706 = _702 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
                float _708 = _704 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
                float _710 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
                float _712 = -_147;
                float _714 = fma(_710, _706, _712);
                float _716 = -_155;
                float _718 = fma(_710, _708, _716);
                float _720 = -_710;
                float _722 = fma(_720, (*spvDescriptorSet0.fp_c3)._m0[7].w, _95);
                float _724 = _714 * _714;
                float _726 = -_714;
                float _728 = _365 * _726;
                float _730 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
                float _732 = fma(_718, _718, _724);
                float _734 = -_367;
                float _736 = fma(_734, _718, _728);
                float _738 = fma(_722, _722, _732);
                float _740 = -_369;
                float _742 = fma(_740, _722, _736);
                float _744 = -_738;
                float _746 = fma(_730, _744, 1.0);
                float _748 = _738 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _750 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _752 = _742 + _750;
                float _754 = precise::max(0.0, _746);
                float _756 = 1.0 / _748;
                float _758 = _754 * _754;
                float _760 = _754 * _758;
                float _762 = precise::max(_752, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _764 = _760 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _766 = _764 * _762;
                float _768 = _766 * _756;
                float _770 = precise::max(_768, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _772 = precise::min(_770, 1.0);
                _371 = _772;
            }
        }
    }
    _676 = false;
    float _774 = _371;
    float _776 = -_774;
    float _778 = _776 + 1.0;
    out.m_32.x = _778;
    out.m_32.y = _55;
    return out;
}

