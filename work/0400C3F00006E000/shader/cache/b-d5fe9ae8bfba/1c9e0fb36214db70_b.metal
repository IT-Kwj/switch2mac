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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_37 [[user(locn3), flat]];
    float4 m_35 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _875 = float2(_71, _73);
    float2 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_875, float2(0.0), isnan(_875))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_875, float2(0.0), isnan(_875))).xy;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = in.m_37.x;
    float _85 = in.m_35.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = _83 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _99 = _69 * _89;
    float _101 = _69 * _95;
    float _103 = fma(_81, _97, _99);
    float _105 = fma(_79, _97, _101);
    float2 _928 = float2(_105, _103);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_928, float2(0.0), isnan(_928))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_928, float2(0.0), isnan(_928))).w;
    float _109 = in.m_39.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _69 * _113;
    float _129 = _69 * _119;
    float _131 = in.m_45.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_45.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _69 * _135;
    float _145 = _143 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _147 = _143 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _149 = abs(_107);
    float _151 = log2(_149);
    float _153 = _151 * 0.75;
    float _155 = exp2(_153);
    float _157 = _155 * _127;
    float _159 = _69 * _125;
    float _161 = _129 * _157;
    float _163 = 0.0 + _161;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _165 * _159;
    bool _171 = _167 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _179 = _175 || _177;
    float _181 = in.m_45.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    int _188 = as_type<int>(_145);
    if (!_179)
    {
        discard_fragment();
    }
    float _190 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _192 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _194 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _196 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _190);
    float _198 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _192);
    float _200 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _194);
    float _202 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _200);
    float _204 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _196);
    float _206 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _198);
    float _208 = _69 * _185;
    float _210 = _202 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _212 = _143 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _214 = _69 * _141;
    float _216 = fma(_208, (*spvDescriptorSet0.fp_c8)._m0[1].x, _145);
    float _218 = _204 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _220 = fma(_208, (*spvDescriptorSet0.fp_c8)._m0[0].x, _212);
    float _222 = 1.0 / _210;
    float _224 = fma(_208, (*spvDescriptorSet0.fp_c8)._m0[2].x, _147);
    float _226 = fma(_214, (*spvDescriptorSet0.fp_c8)._m0[1].z, _216);
    float _228 = fma(_214, (*spvDescriptorSet0.fp_c8)._m0[0].z, _220);
    float _230 = _206 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _232 = fma(_214, (*spvDescriptorSet0.fp_c8)._m0[2].z, _224);
    float _234 = _228 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _236 = _232 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _238 = _236 * _222;
    float _240 = -_234;
    float _242 = fma(_218, _238, _240);
    float _244 = _226 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _246 = -_244;
    float _248 = fma(_230, _238, _246);
    float _250 = abs(_242);
    float _252 = abs(_248);
    float _254 = precise::max(_250, _252);
    bool _256 = _254 >= 16.0;
    float _258 = _242;
    float _260 = _248;
    if (_256)
    {
        float _262 = _242 * 0.0625;
        _258 = _262;
    }
    float _264 = _258;
    if (_256)
    {
        float _266 = _248 * 0.0625;
        _260 = _266;
    }
    float _268 = _260;
    float _270 = abs(_264);
    bool _272 = _270 != 0.0;
    bool _274 = isnan(_270);
    bool _276 = _272 || _274;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    float _282 = abs(_268);
    bool _284 = _282 == 0.0;
    float _286 = abs(_268);
    bool _288 = _286 == 0.0;
    bool _290 = !_280;
    bool _292 = _288 && _290;
    bool _294 = false;
    if (_292)
    {
        bool _296 = as_type<int>(_268) >= 0;
        _294 = _296;
    }
    bool _298 = _294;
    int _300 = _298 ? (-1) : 0;
    if (_292)
    {
        int _302 = _298 ? 0 : 1078530011;
        _188 = _302;
    }
    int _304 = _188;
    int _306 = _304;
    if (_292)
    {
        int _308 = int(0x80000000) & as_type<int>(_264);
        int _310 = _304 | _308;
        _306 = _310;
    }
    int _312 = _306;
    bool _314 = !_280;
    bool _316 = _314 && _284;
    int _318 = _312;
    float _320 = as_type<float>(_312);
    if (!_316)
    {
        float _322 = abs(_264);
        bool _324 = _322 != as_type<float>(0x7f800000u /* inf */);
        bool _326 = isnan(_322);
        bool _328 = _324 || _326;
        bool _330 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _332 = _328 || _330;
        float _334 = abs(_268);
        bool _336 = _334 == as_type<float>(0x7f800000u /* inf */);
        float _338 = abs(_268);
        bool _340 = _338 == as_type<float>(0x7f800000u /* inf */);
        bool _342 = !_332;
        bool _344 = _340 && _342;
        if (_344)
        {
            bool _346 = as_type<int>(_268) >= 0;
            _300 = _346 ? (-1) : 0;
        }
        int _348 = _300;
        if (_344)
        {
            _318 = 1075235812;
        }
        int _350 = _318;
        int _352 = _350;
        if (_344)
        {
            int _354 = ~_348;
            int _356 = (_354 != 0) ? _350 : 1061752795;
            _352 = _356;
        }
        int _358 = _352;
        float _360 = as_type<float>(_358);
        if (_344)
        {
            int _362 = int(0x80000000) & as_type<int>(_264);
            int _364 = _358 | _362;
            _360 = as_type<float>(_364);
        }
        float _366 = _360;
        bool _368 = !_332;
        bool _370 = _368 && _336;
        _320 = _366;
        if (!_370)
        {
            float _372 = abs(_264);
            float _374 = abs(_268);
            float _376 = precise::max(_372, _374);
            float _378 = abs(_264);
            float _380 = abs(_268);
            float _382 = precise::min(_378, _380);
            float _384 = 1.0 / _376;
            float _386 = abs(_264);
            float _388 = abs(_268);
            bool _390 = _386 > _388;
            bool _392 = as_type<int>(_268) >= 0;
            float _394 = _382 * _384;
            float _396 = _394 * _394;
            float _398 = _396 + 11.33538818359375;
            float _400 = fma(_396, _398, 28.84246826171875);
            float _402 = fma(_396, _400, 19.6966705322265625);
            float _404 = fma(_396, -0.82336294651031494140625, -5.674867153167724609375);
            float _406 = abs(_264);
            float _408 = abs(_268);
            float _410 = _406 + _408;
            int _412 = as_type<int>(_264) & int(0x80000000);
            float _414 = fma(_396, _404, -6.565555095672607421875);
            float _416 = 1.0 / _402;
            bool _418 = _410 > as_type<float>(0x7f800000u /* inf */);
            bool _420 = isnan(_410);
            bool _422 = _418 || _420;
            bool _424 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _426 = _422 || _424;
            float _428 = _396 * _414;
            float _430 = _394 * _428;
            float _432 = fma(_430, _416, _394);
            float _434 = _432;
            _320 = _410;
            if (_390)
            {
                float _436 = -_432;
                float _438 = _436 + 1.57079637050628662109375;
                _434 = _438;
            }
            float _440 = _434;
            int _442 = as_type<int>(_440);
            if (!_392)
            {
                float _444 = -_440;
                float _446 = _444 + 3.1415927410125732421875;
                _442 = as_type<int>(_446);
            }
            int _448 = _442;
            if (!_426)
            {
                int _450 = _412 | _448;
                _320 = as_type<float>(_450);
            }
        }
    }
    float _452 = _320;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _456 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _454;
    float _458 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _460 = _458 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _462 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _464 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _462;
    float _466 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _468 = _466 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _470 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _472 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _470;
    float _474 = 1.0 / _460;
    float _476 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _478 = _476 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _480 = fma(_452, 0.15915493667125701904296875, 0.5);
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = 1.0 / _464;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _488 = _482 + _486;
    float _490 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _492 = _482 + _490;
    float _494 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _496 = _482 + _494;
    bool _498 = _482 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _500 = isnan(_482);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _512 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _510;
    bool _514 = _482 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _516 = isnan(_482);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = 1.0 / _468;
    float _528 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _530 = _482 + _528;
    float _532 = _488 * _474;
    float _534 = 1.0 / _472;
    float _536 = _530 * _484;
    float _538 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _540 = _482 + _538;
    float _542 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _542;
    float _546 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _548 = _546 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _550 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _552 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _550;
    float _554 = 1.0 / _478;
    float _556 = _540 * _526;
    float _558 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _560 = _558 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _562 = fma(_544, _536, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _564 = fma(_552, _536, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _566 = fma(_548, _556, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _568 = fma(_560, _556, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _570 = 1.0 / _456;
    float _572 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _574 = _482 + _572;
    float _576 = _492 * _534;
    bool _578 = _482 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _580 = isnan(_482);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _574 * _554;
    float _592 = -_588;
    float _594 = _592 + 1.0;
    bool _596 = _482 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _598 = isnan(_482);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _610 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _608;
    float _612 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _614 = _612 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _616 = _496 * _570;
    float _618 = -_606;
    float _620 = _618 + 1.0;
    float _622 = fma(_610, _536, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _624 = fma(_614, _556, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _626 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _628 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _626;
    float _630 = -_508;
    float _632 = _630 + 1.0;
    float _634 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _636 = _634 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _638 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _640 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _638;
    float _642 = fma(_628, _616, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _644 = _606 * _594;
    float _646 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _648 = _646 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    bool _650 = _482 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _652 = isnan(_482);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = _524 * _620;
    float _664 = _588 * _632;
    float _666 = fma(_512, _616, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _668 = fma(_636, _532, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _670 = _562 * _662;
    float _672 = _622 * _662;
    float _674 = -_524;
    float _676 = _674 + 1.0;
    float _678 = -_660;
    float _680 = _678 + 1.0;
    float _682 = _564 * _662;
    float _684 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _686 = _684 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _688 = fma(_676, (*spvDescriptorSet0.fp_c9)._m0[107].x, _670);
    float _690 = _508 * _680;
    float _692 = fma(_676, (*spvDescriptorSet0.fp_c9)._m0[107].z, _672);
    float _694 = fma(_676, (*spvDescriptorSet0.fp_c9)._m0[107].y, _682);
    float _696 = in.m_41.x;
    float _698 = gl_FragCoord.w;
    float _700 = _696 * _698;
    float _702 = in.m_41.y;
    float _704 = gl_FragCoord.w;
    float _706 = _702 * _704;
    float _708 = in.m_41.z;
    float _710 = gl_FragCoord.w;
    float _712 = _708 * _710;
    bool _714 = _482 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _716 = isnan(_482);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = fma(_640, _616, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _728 = fma(_566, _644, _688);
    float _730 = fma(_568, _644, _694);
    float _732 = fma(_624, _644, _692);
    float _734 = fma(_648, _532, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _736 = fma(_686, _532, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    bool _738 = _482 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _740 = isnan(_482);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_724;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _756 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _754;
    float _758 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _760 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _758;
    float _762 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _764 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _762;
    float _766 = fma(_642, _664, _728);
    float _768 = fma(_666, _664, _730);
    float _770 = fma(_726, _664, _732);
    float _772 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _774 = _772 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _776 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _778 = _776 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _780 = _660 * _752;
    float _782 = fma(_756, _576, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _784 = fma(_760, _576, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _786 = fma(_764, _576, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _788 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _790 = _788 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _792 = -_748;
    float _794 = _792 + 1.0;
    float _796 = fma(_668, _690, _766);
    float _798 = fma(_734, _690, _768);
    float _800 = fma(_736, _690, _770);
    float _802 = fma(_774, _590, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _804 = fma(_778, _590, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _806 = fma(_790, _590, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _808 = _724 * _794;
    float _810 = fma(_782, _780, _796);
    float _812 = fma(_784, _780, _798);
    float _814 = fma(_786, _780, _800);
    float _816 = _69 * _700;
    float _818 = fma(_802, _808, _810);
    float _820 = fma(_804, _808, _812);
    float _822 = fma(_806, _808, _814);
    float _824 = _69 * _706;
    float _826 = _69 * _712;
    float _828 = fma(_748, (*spvDescriptorSet0.fp_c9)._m0[113].x, _818);
    float _830 = fma(_748, (*spvDescriptorSet0.fp_c9)._m0[113].y, _820);
    float _832 = fma(_748, (*spvDescriptorSet0.fp_c9)._m0[113].z, _822);
    float _834 = _828 + _816;
    float _836 = _830 + _824;
    float _838 = _832 + _826;
    if (!_179)
    {
        out.m_48.x = _834;
        out.m_48.y = _836;
        out.m_48.z = _838;
        out.m_48.w = _161;
        return out;
    }
    float _840 = 0.0 + _167;
    float _842 = precise::clamp(_840, 0.0, 1.0);
    out.m_48.x = _834;
    out.m_48.y = _836;
    out.m_48.z = _838;
    out.m_48.w = _842;
    return out;
}

