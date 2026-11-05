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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_33 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _850 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_850, float2(0.0), isnan(_850))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_850, float2(0.0), isnan(_850))).w;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _79;
    float _95 = _67 * _85;
    float _97 = in.m_41.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _73 * _73;
    float _111 = _109 * _93;
    float _113 = _67 * _91;
    float _115 = _95 * _111;
    float _117 = 0.0 + _115;
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _119 * _113;
    bool _125 = _121 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _127 = isnan(_121);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _133 = _129 || _131;
    float _135 = in.m_41.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    if (!_133)
    {
        discard_fragment();
    }
    float _141 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _143 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _145 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _147 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _141);
    float _149 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _143);
    float _151 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _145);
    float _153 = _67 * _139;
    float _155 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _151);
    float _157 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _147);
    float _159 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _149);
    float _161 = _67 * _101;
    float _163 = _155 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _165 = _157 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _167 = _159 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _169 = _161 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _171 = _161 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _173 = _161 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _175 = 1.0 / _163;
    float _177 = _67 * _107;
    float _179 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[0].x, _169);
    float _181 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[1].x, _171);
    float _183 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[2].x, _173);
    float _185 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[0].z, _179);
    float _187 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[1].z, _181);
    float _189 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[2].z, _183);
    float _191 = _185 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _193 = _187 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _195 = _189 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _197 = _195 * _175;
    float _199 = -_191;
    float _201 = fma(_165, _197, _199);
    float _203 = -_193;
    float _205 = fma(_167, _197, _203);
    float _207 = abs(_201);
    float _209 = abs(_205);
    float _211 = precise::max(_207, _209);
    bool _213 = _211 >= 16.0;
    float _215 = _201;
    float _217 = _205;
    int _220 = as_type<int>(_173);
    if (_213)
    {
        float _222 = _201 * 0.0625;
        _215 = _222;
    }
    float _224 = _215;
    if (_213)
    {
        float _226 = _205 * 0.0625;
        _217 = _226;
    }
    float _228 = _217;
    float _230 = abs(_224);
    bool _232 = _230 != 0.0;
    bool _234 = isnan(_230);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = abs(_228);
    bool _244 = _242 == 0.0;
    float _246 = abs(_228);
    bool _248 = _246 == 0.0;
    bool _250 = !_240;
    bool _252 = _248 && _250;
    bool _254 = false;
    if (_252)
    {
        bool _256 = as_type<int>(_228) >= 0;
        _254 = _256;
    }
    bool _258 = _254;
    int _260 = _258 ? (-1) : 0;
    if (_252)
    {
        int _262 = _258 ? 0 : 1078530011;
        _220 = _262;
    }
    int _264 = _220;
    int _266 = _264;
    if (_252)
    {
        int _268 = int(0x80000000) & as_type<int>(_224);
        int _270 = _264 | _268;
        _266 = _270;
    }
    int _272 = _266;
    bool _274 = !_240;
    bool _276 = _274 && _244;
    int _278 = _272;
    float _280 = as_type<float>(_272);
    if (!_276)
    {
        float _282 = abs(_224);
        bool _284 = _282 != as_type<float>(0x7f800000u /* inf */);
        bool _286 = isnan(_282);
        bool _288 = _284 || _286;
        bool _290 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _292 = _288 || _290;
        float _294 = abs(_228);
        bool _296 = _294 == as_type<float>(0x7f800000u /* inf */);
        float _298 = abs(_228);
        bool _300 = _298 == as_type<float>(0x7f800000u /* inf */);
        bool _302 = !_292;
        bool _304 = _300 && _302;
        if (_304)
        {
            bool _306 = as_type<int>(_228) >= 0;
            _260 = _306 ? (-1) : 0;
        }
        int _308 = _260;
        if (_304)
        {
            _278 = 1075235812;
        }
        int _310 = _278;
        int _312 = _310;
        if (_304)
        {
            int _314 = ~_308;
            int _316 = (_314 != 0) ? _310 : 1061752795;
            _312 = _316;
        }
        int _318 = _312;
        float _320 = as_type<float>(_318);
        if (_304)
        {
            int _322 = int(0x80000000) & as_type<int>(_224);
            int _324 = _318 | _322;
            _320 = as_type<float>(_324);
        }
        float _326 = _320;
        bool _328 = !_292;
        bool _330 = _328 && _296;
        _280 = _326;
        if (!_330)
        {
            float _332 = abs(_224);
            float _334 = abs(_228);
            float _336 = precise::max(_332, _334);
            float _338 = abs(_224);
            float _340 = abs(_228);
            float _342 = _338 + _340;
            float _344 = abs(_224);
            float _346 = abs(_228);
            float _348 = precise::min(_344, _346);
            float _350 = 1.0 / _336;
            float _352 = abs(_224);
            float _354 = abs(_228);
            bool _356 = _352 > _354;
            bool _358 = as_type<int>(_228) >= 0;
            bool _360 = _342 > as_type<float>(0x7f800000u /* inf */);
            bool _362 = isnan(_342);
            bool _364 = _360 || _362;
            bool _366 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _368 = _364 || _366;
            int _370 = as_type<int>(_224) & int(0x80000000);
            float _372 = _348 * _350;
            float _374 = _372 * _372;
            float _376 = _374 + 11.33538818359375;
            float _378 = fma(_374, _376, 28.84246826171875);
            float _380 = fma(_374, _378, 19.6966705322265625);
            float _382 = fma(_374, -0.82336294651031494140625, -5.674867153167724609375);
            float _384 = fma(_374, _382, -6.565555095672607421875);
            float _386 = 1.0 / _380;
            float _388 = _374 * _384;
            float _390 = _372 * _388;
            float _392 = fma(_390, _386, _372);
            float _394 = _392;
            _280 = _342;
            if (_356)
            {
                float _396 = -_392;
                float _398 = _396 + 1.57079637050628662109375;
                _394 = _398;
            }
            float _400 = _394;
            int _402 = as_type<int>(_400);
            if (!_358)
            {
                float _404 = -_400;
                float _406 = _404 + 3.1415927410125732421875;
                _402 = as_type<int>(_406);
            }
            int _408 = _402;
            if (!_368)
            {
                int _410 = _370 | _408;
                _280 = as_type<float>(_410);
            }
        }
    }
    float _412 = _280;
    float _414 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _416 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _414;
    float _418 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _420 = _418 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _422 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _424 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _422;
    float _426 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _428 = _426 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _430 = 1.0 / _416;
    float _432 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _434 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _432;
    float _436 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _438 = _436 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _440 = fma(_412, 0.15915493667125701904296875, 0.5);
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = 1.0 / _420;
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _448 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _446;
    float _450 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _452 = _442 + _450;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _456 = _442 + _454;
    float _458 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _460 = _442 + _458;
    float _462 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _466 = _442 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _468 = isnan(_442);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _424;
    float _480 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _482 = _442 + _480;
    float _484 = _452 * _430;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _488 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _486;
    bool _490 = _442 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -_476;
    float _504 = _502 + 1.0;
    float _506 = fma(_448, _484, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _508 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _510 = _508 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _512 = 1.0 / _428;
    float _514 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _516 = _442 + _514;
    float _518 = _482 * _444;
    float _520 = fma(_464, _518, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _522 = 1.0 / _438;
    float _524 = _516 * _478;
    float _526 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _528 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _526;
    float _530 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _532 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _530;
    float _534 = 1.0 / _434;
    float _536 = _456 * _512;
    float _538 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _540 = _442 + _538;
    float _542 = fma(_528, _484, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _544 = fma(_532, _484, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _546 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _548 = _546 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _550 = _442 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _552 = isnan(_442);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = _540 * _522;
    float _564 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _566 = _564 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _568 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _570 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _568;
    float _572 = fma(_548, _518, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _574 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _576 = _574 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _578 = fma(_566, _518, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _580 = fma(_570, _524, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _582 = -_560;
    float _584 = _582 + 1.0;
    float _586 = _460 * _534;
    float _588 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _590 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _588;
    float _592 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _594 = _592 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _596 = _560 * _504;
    float _598 = fma(_590, _524, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _600 = fma(_488, _524, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    bool _602 = _442 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _604 = isnan(_442);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    bool _614 = _442 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _616 = isnan(_442);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _612 * _584;
    float _628 = -_612;
    float _630 = _628 + 1.0;
    float _632 = -_624;
    float _634 = _632 + 1.0;
    bool _636 = _442 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _638 = isnan(_442);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = _624 * _630;
    float _650 = _500 * _634;
    float _652 = fma(_576, _536, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _654 = fma(_594, _536, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _656 = -_500;
    float _658 = _656 + 1.0;
    float _660 = _542 * _650;
    float _662 = _544 * _650;
    float _664 = -_646;
    float _666 = _664 + 1.0;
    float _668 = _506 * _650;
    float _670 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[107].x, _660);
    float _672 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[107].y, _662);
    float _674 = _476 * _666;
    float _676 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[107].z, _668);
    float _678 = in.m_37.x;
    float _680 = gl_FragCoord.w;
    float _682 = _678 * _680;
    float _684 = in.m_37.y;
    float _686 = gl_FragCoord.w;
    float _688 = _684 * _686;
    float _690 = in.m_37.z;
    float _692 = gl_FragCoord.w;
    float _694 = _690 * _692;
    float _696 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _698 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _696;
    float _700 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _702 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _700;
    float _704 = fma(_510, _536, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _706 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _708 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _706;
    float _710 = fma(_698, _586, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _712 = fma(_702, _586, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _714 = fma(_578, _648, _670);
    float _716 = fma(_708, _586, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _718 = fma(_572, _648, _672);
    float _720 = in.m_43.x;
    float _722 = fma(_520, _648, _676);
    bool _724 = _442 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _726 = isnan(_442);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = fma(_580, _626, _714);
    float _738 = fma(_598, _626, _718);
    float _740 = fma(_600, _626, _722);
    float _742 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _744 = _742 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _746 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _748 = _746 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _750 = -_734;
    float _752 = _750 + 1.0;
    float _754 = fma(_652, _596, _736);
    float _756 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _758 = _756 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _760 = fma(_654, _596, _738);
    float _762 = fma(_704, _596, _740);
    float _764 = fma(_744, _562, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _766 = fma(_748, _562, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _768 = _646 * _752;
    float _770 = fma(_710, _674, _754);
    float _772 = fma(_758, _562, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _774 = fma(_712, _674, _760);
    float _776 = fma(_716, _674, _762);
    float _778 = fma(_764, _768, _770);
    float _780 = _67 * _682;
    float _782 = fma(_766, _768, _774);
    float _784 = fma(_772, _768, _776);
    float _786 = _67 * _688;
    float _788 = fma(_734, (*spvDescriptorSet0.fp_c9)._m0[113].x, _778);
    float _790 = _67 * _694;
    float _792 = fma(_734, (*spvDescriptorSet0.fp_c9)._m0[113].y, _782);
    float _794 = fma(_734, (*spvDescriptorSet0.fp_c9)._m0[113].z, _784);
    float _796 = -_780;
    float _798 = _796 + _788;
    float _800 = -_786;
    float _802 = _800 + _792;
    float _804 = -_790;
    float _806 = _804 + _794;
    float _808 = fma(_720, _798, _780);
    float _810 = fma(_720, _802, _786);
    float _812 = fma(_720, _806, _790);
    if (!_133)
    {
        out.m_46.x = _808;
        out.m_46.y = _810;
        out.m_46.z = _812;
        out.m_46.w = _115;
        return out;
    }
    float _814 = 0.0 + _121;
    float _816 = precise::clamp(_814, 0.0, 1.0);
    out.m_46.x = _808;
    out.m_46.y = _810;
    out.m_46.z = _812;
    out.m_46.w = _816;
    return out;
}

