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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_58 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_56 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = in.m_41.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_43.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _65;
    float _101 = _79 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _103 = _99 * _71;
    float _105 = _99 * _77;
    float _107 = _103 + (-0.5);
    float _109 = _105 + (-0.5);
    float _111 = abs(_107);
    float _113 = abs(_109);
    float _115 = precise::max(_111, _113);
    bool _119 = _115 >= 16.0;
    float _121 = _107;
    float _123 = _109;
    if (_119)
    {
        float _125 = fma(_103, 0.0625, -0.03125);
        _121 = _125;
    }
    float _127 = _121;
    if (_119)
    {
        float _129 = fma(_105, 0.0625, -0.03125);
        _123 = _129;
    }
    float _131 = _123;
    float _133 = -_105;
    float _135 = _133 + 0.5;
    float _137 = in.m_43.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = -_103;
    float _145 = _143 + 0.5;
    float _147 = abs(_127);
    bool _149 = _147 != 0.0;
    bool _151 = isnan(_147);
    bool _153 = _149 || _151;
    bool _155 = isnan(0.0);
    bool _157 = _153 || _155;
    float _159 = _135 * _135;
    float _161 = abs(_131);
    bool _163 = _161 == 0.0;
    float _165 = abs(_131);
    bool _167 = _165 == 0.0;
    bool _169 = !_157;
    bool _171 = _167 && _169;
    float _173 = fma(_145, _145, _159);
    float _175 = sqrt(_173);
    bool _177 = false;
    float _179 = _145;
    if (_171)
    {
        bool _181 = as_type<int>(_131) >= 0;
        _177 = _181;
    }
    bool _183 = _177;
    int _186 = 0;
    int _188 = _183 ? (-1) : 0;
    if (_171)
    {
        int _190 = _183 ? 0 : 1078530011;
        _186 = _190;
    }
    int _192 = _186;
    int _194 = _192;
    if (_171)
    {
        int _196 = int(0x80000000) & as_type<int>(_127);
        int _198 = _192 | _196;
        _179 = as_type<float>(_198);
    }
    float _200 = _179;
    bool _202 = !_157;
    bool _204 = _202 && _163;
    float _206 = _200;
    float _208 = _200;
    if (!_204)
    {
        float _210 = abs(_127);
        bool _212 = _210 != as_type<float>(0x7f800000u /* inf */);
        bool _214 = isnan(_210);
        bool _216 = _212 || _214;
        bool _218 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _220 = _216 || _218;
        float _222 = abs(_131);
        bool _224 = _222 == as_type<float>(0x7f800000u /* inf */);
        float _226 = abs(_131);
        bool _228 = _226 == as_type<float>(0x7f800000u /* inf */);
        bool _230 = !_220;
        bool _232 = _228 && _230;
        if (_232)
        {
            bool _234 = as_type<int>(_131) >= 0;
            _188 = _234 ? (-1) : 0;
        }
        int _236 = _188;
        if (_232)
        {
            _194 = 1075235812;
        }
        int _238 = _194;
        int _240 = _238;
        if (_232)
        {
            int _242 = ~_236;
            int _244 = (_242 != 0) ? _238 : 1061752795;
            _240 = _244;
        }
        int _246 = _240;
        if (_232)
        {
            int _248 = int(0x80000000) & as_type<int>(_127);
            int _250 = _246 | _248;
            _206 = as_type<float>(_250);
        }
        float _252 = _206;
        bool _254 = !_220;
        bool _256 = _254 && _224;
        _208 = _252;
        if (!_256)
        {
            float _258 = abs(_127);
            float _260 = abs(_131);
            float _262 = precise::max(_258, _260);
            float _264 = abs(_127);
            float _266 = abs(_131);
            float _268 = precise::min(_264, _266);
            float _270 = 1.0 / _262;
            float _272 = abs(_127);
            float _274 = abs(_131);
            bool _276 = _272 > _274;
            bool _278 = as_type<int>(_131) >= 0;
            float _280 = abs(_127);
            float _282 = abs(_131);
            float _284 = _280 + _282;
            int _286 = as_type<int>(_127) & int(0x80000000);
            bool _288 = _284 > as_type<float>(0x7f800000u /* inf */);
            bool _290 = isnan(_284);
            bool _292 = _288 || _290;
            bool _294 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _296 = _292 || _294;
            float _298 = _268 * _270;
            float _300 = _298 * _298;
            float _302 = _300 + 11.33538818359375;
            float _304 = fma(_300, _302, 28.84246826171875);
            float _306 = fma(_300, _304, 19.6966705322265625);
            float _308 = fma(_300, -0.82336294651031494140625, -5.674867153167724609375);
            float _310 = fma(_300, _308, -6.565555095672607421875);
            float _312 = 1.0 / _306;
            float _314 = _300 * _310;
            float _316 = _298 * _314;
            float _318 = fma(_316, _312, _298);
            float _320 = _318;
            _208 = _284;
            if (_276)
            {
                float _322 = -_318;
                float _324 = _322 + 1.57079637050628662109375;
                _320 = _324;
            }
            float _326 = _320;
            int _328 = as_type<int>(_326);
            if (!_278)
            {
                float _330 = -_326;
                float _332 = _330 + 3.1415927410125732421875;
                _328 = as_type<int>(_332);
            }
            int _334 = _328;
            if (!_296)
            {
                int _336 = _286 | _334;
                _208 = as_type<float>(_336);
            }
        }
    }
    float _338 = _208;
    float _340 = fma(_338, 0.15915493667125701904296875, 0.5);
    float _342 = fma(_175, (*spvDescriptorSet0.fp_c9)._m0[191].y, _101);
    float _344 = _99 * _91;
    float _346 = _99 * _85;
    float _348 = _340 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _350 = _340 + _342;
    float _352 = _99 * _97;
    float _354 = _99 * _141;
    float2 _1037 = float2(_346, _344);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1037, float2(0.0), isnan(_1037))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1037, float2(0.0), isnan(_1037))).w;
    float2 _1047 = float2(_348, _350);
    float _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1047, float2(0.0), isnan(_1047))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1047, float2(0.0), isnan(_1047))).w;
    float2 _1055 = float2(_352, _354);
    float _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1055, float2(0.0), isnan(_1055))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1055, float2(0.0), isnan(_1055))).w;
    float _362 = in.m_45.w;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_47.w;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_49.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = _99 * _366;
    float _382 = in.m_45.y;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_45.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = -_356;
    float _396 = _394 + _358;
    float _398 = fma(_396, 0.60000002384185791015625, _356);
    float _400 = fma(_356, 1.6666667461395263671875, -1.1666667461395263671875);
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = _380 * _398;
    float _406 = precise::max(_404, 0.449999988079071044921875);
    float _408 = precise::min(_406, 0.800000011920928955078125);
    float _410 = fma(_408, 2.8571426868438720703125, -1.28571414947509765625);
    float _412 = fma(_402, -2.0, 3.0);
    float _414 = _402 * _402;
    float _416 = fma(_412, _414, _410);
    float _418 = _99 * _372;
    float _420 = fma(_416, _418, _360);
    float _422 = _380 * _420;
    float _424 = _99 * _378;
    float _426 = 0.0 + _422;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _428 * _424;
    bool _432 = _430 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _434 = isnan(_430);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _440 = _436 || _438;
    float _442 = in.m_51.x;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_51.y;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_51.z;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_45.x;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    if (!_440)
    {
        discard_fragment();
    }
    float _466 = _99 * _386;
    float _468 = fma(_175, -1.8181817531585693359375, 1.0);
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = fma(_470, -2.0, 3.0);
    float _474 = _470 * _470;
    float _476 = _474 * _472;
    float _478 = _99 * _446;
    float _480 = _99 * _452;
    float _482 = _99 * _458;
    float _484 = _99 * _464;
    float _486 = _99 * _392;
    float _488 = fma(_416, _476, _360);
    float _490 = -_480;
    float _492 = _490 + _466;
    float _494 = -_478;
    float _496 = _494 + _484;
    float _498 = -_482;
    float _500 = _498 + _486;
    float _502 = fma(_488, _492, _480);
    float _504 = fma(_488, _496, _478);
    float _506 = fma(_488, _500, _482);
    if (!_440)
    {
        out.m_54.x = _504;
        out.m_54.y = _502;
        out.m_54.z = _506;
        out.m_54.w = _422;
        return out;
    }
    float _508 = _502 * 0.715200006961822509765625;
    float _510 = in.m_56.w;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = in.m_56.z;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = in.m_56.x;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = fma(_504, 0.2125999927520751953125, _508);
    float _530 = in.m_56.y;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = fma(_506, 0.072200000286102294921875, _528);
    bool _538 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _540 = 0.0 + _430;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = 1.0 / _536;
    float _546 = _544 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    float _550 = _99 * _514;
    float _552 = fma(_548, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _554 = _99 * _520;
    float _556 = _99 * _526;
    float _558 = _552 * _550;
    float _560 = _99 * _534;
    float _562 = fma(_506, _558, _554);
    float _564 = fma(_504, _558, _556);
    float _566 = fma(_502, _558, _560);
    float _568 = _554;
    if (!_538)
    {
        _568 = _542;
    }
    float _570 = _568;
    bool _572 = !_538;
    float _574 = _570;
    if (!_572)
    {
        float _576 = in.m_58.w;
        float _578 = gl_FragCoord.w;
        float _580 = _576 * _578;
        float _582 = in.m_58.z;
        float _584 = gl_FragCoord.w;
        float _586 = _582 * _584;
        float _588 = _99 * _580;
        float _590 = _99 * _586;
        float _592 = 1.0 / _588;
        float _594 = _590 * _592;
        float _596 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _598 = fma(_594, (*spvDescriptorSet0.fp_c8)._m0[30].w, _596);
        float _600 = 1.0 / _598;
        float _602 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _604 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _606 = fma(_600, _602, _604);
        float _608 = _606 * 8.0;
        float _610 = precise::clamp(_608, 0.0, 1.0);
        float _612 = _542 * _610;
        _574 = _612;
    }
    float _614 = _574;
    float _616 = 0.0 + _614;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    out.m_54.x = _564;
    out.m_54.y = _566;
    out.m_54.z = _562;
    out.m_54.w = _618;
    return out;
}

