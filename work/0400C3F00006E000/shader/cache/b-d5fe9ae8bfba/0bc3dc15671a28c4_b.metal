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
    float4 m_56 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = in.m_41.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_43.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _63;
    float _99 = _77 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _101 = _97 * _69;
    float _103 = _97 * _75;
    float _105 = _101 + (-0.5);
    float _107 = _103 + (-0.5);
    float _109 = abs(_105);
    float _111 = abs(_107);
    float _113 = precise::max(_109, _111);
    bool _117 = _113 >= 16.0;
    float _119 = _105;
    float _121 = _107;
    if (_117)
    {
        float _123 = fma(_101, 0.0625, -0.03125);
        _119 = _123;
    }
    float _125 = _119;
    if (_117)
    {
        float _127 = fma(_103, 0.0625, -0.03125);
        _121 = _127;
    }
    float _129 = _121;
    float _131 = -_103;
    float _133 = _131 + 0.5;
    float _135 = in.m_43.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = -_101;
    float _143 = _141 + 0.5;
    float _145 = abs(_125);
    bool _147 = _145 != 0.0;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan(0.0);
    bool _155 = _151 || _153;
    float _157 = _133 * _133;
    float _159 = abs(_129);
    bool _161 = _159 == 0.0;
    float _163 = abs(_129);
    bool _165 = _163 == 0.0;
    bool _167 = !_155;
    bool _169 = _165 && _167;
    float _171 = fma(_143, _143, _157);
    float _173 = sqrt(_171);
    bool _175 = false;
    float _177 = _143;
    if (_169)
    {
        bool _179 = as_type<int>(_129) >= 0;
        _175 = _179;
    }
    bool _181 = _175;
    int _184 = 0;
    int _186 = _181 ? (-1) : 0;
    if (_169)
    {
        int _188 = _181 ? 0 : 1078530011;
        _184 = _188;
    }
    int _190 = _184;
    int _192 = _190;
    if (_169)
    {
        int _194 = int(0x80000000) & as_type<int>(_125);
        int _196 = _190 | _194;
        _177 = as_type<float>(_196);
    }
    float _198 = _177;
    bool _200 = !_155;
    bool _202 = _200 && _161;
    float _204 = _198;
    float _206 = _198;
    if (!_202)
    {
        float _208 = abs(_125);
        bool _210 = _208 != as_type<float>(0x7f800000u /* inf */);
        bool _212 = isnan(_208);
        bool _214 = _210 || _212;
        bool _216 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _218 = _214 || _216;
        float _220 = abs(_129);
        bool _222 = _220 == as_type<float>(0x7f800000u /* inf */);
        float _224 = abs(_129);
        bool _226 = _224 == as_type<float>(0x7f800000u /* inf */);
        bool _228 = !_218;
        bool _230 = _226 && _228;
        if (_230)
        {
            bool _232 = as_type<int>(_129) >= 0;
            _186 = _232 ? (-1) : 0;
        }
        int _234 = _186;
        if (_230)
        {
            _192 = 1075235812;
        }
        int _236 = _192;
        int _238 = _236;
        if (_230)
        {
            int _240 = ~_234;
            int _242 = (_240 != 0) ? _236 : 1061752795;
            _238 = _242;
        }
        int _244 = _238;
        if (_230)
        {
            int _246 = int(0x80000000) & as_type<int>(_125);
            int _248 = _244 | _246;
            _204 = as_type<float>(_248);
        }
        float _250 = _204;
        bool _252 = !_218;
        bool _254 = _252 && _222;
        _206 = _250;
        if (!_254)
        {
            float _256 = abs(_125);
            float _258 = abs(_129);
            float _260 = precise::max(_256, _258);
            float _262 = abs(_125);
            float _264 = abs(_129);
            float _266 = precise::min(_262, _264);
            float _268 = 1.0 / _260;
            float _270 = abs(_125);
            float _272 = abs(_129);
            bool _274 = _270 > _272;
            bool _276 = as_type<int>(_129) >= 0;
            float _278 = abs(_125);
            float _280 = abs(_129);
            float _282 = _278 + _280;
            int _284 = as_type<int>(_125) & int(0x80000000);
            bool _286 = _282 > as_type<float>(0x7f800000u /* inf */);
            bool _288 = isnan(_282);
            bool _290 = _286 || _288;
            bool _292 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _294 = _290 || _292;
            float _296 = _266 * _268;
            float _298 = _296 * _296;
            float _300 = _298 + 11.33538818359375;
            float _302 = fma(_298, _300, 28.84246826171875);
            float _304 = fma(_298, _302, 19.6966705322265625);
            float _306 = fma(_298, -0.82336294651031494140625, -5.674867153167724609375);
            float _308 = fma(_298, _306, -6.565555095672607421875);
            float _310 = 1.0 / _304;
            float _312 = _298 * _308;
            float _314 = _296 * _312;
            float _316 = fma(_314, _310, _296);
            float _318 = _316;
            _206 = _282;
            if (_274)
            {
                float _320 = -_316;
                float _322 = _320 + 1.57079637050628662109375;
                _318 = _322;
            }
            float _324 = _318;
            int _326 = as_type<int>(_324);
            if (!_276)
            {
                float _328 = -_324;
                float _330 = _328 + 3.1415927410125732421875;
                _326 = as_type<int>(_330);
            }
            int _332 = _326;
            if (!_294)
            {
                int _334 = _284 | _332;
                _206 = as_type<float>(_334);
            }
        }
    }
    float _336 = _206;
    float _338 = fma(_336, 0.15915493667125701904296875, 0.5);
    float _340 = fma(_173, (*spvDescriptorSet0.fp_c9)._m0[191].y, _99);
    float _342 = _97 * _89;
    float _344 = _97 * _83;
    float _346 = _338 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _348 = _338 + _340;
    float _350 = _97 * _95;
    float _352 = _97 * _139;
    float2 _1001 = float2(_344, _342);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1001, float2(0.0), isnan(_1001))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1001, float2(0.0), isnan(_1001))).w;
    float2 _1011 = float2(_346, _348);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1011, float2(0.0), isnan(_1011))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1011, float2(0.0), isnan(_1011))).w;
    float2 _1019 = float2(_350, _352);
    float _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1019, float2(0.0), isnan(_1019))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1019, float2(0.0), isnan(_1019))).w;
    float _360 = in.m_45.w;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_47.w;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_49.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = _97 * _364;
    float _380 = in.m_45.y;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_45.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = -_354;
    float _394 = _392 + _356;
    float _396 = fma(_394, 0.60000002384185791015625, _354);
    float _398 = fma(_354, 1.6666667461395263671875, -1.1666667461395263671875);
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _378 * _396;
    float _404 = precise::max(_402, 0.449999988079071044921875);
    float _406 = precise::min(_404, 0.800000011920928955078125);
    float _408 = fma(_406, 2.8571426868438720703125, -1.28571414947509765625);
    float _410 = fma(_400, -2.0, 3.0);
    float _412 = _400 * _400;
    float _414 = fma(_410, _412, _408);
    float _416 = _97 * _370;
    float _418 = fma(_414, _416, _358);
    float _420 = _378 * _418;
    float _422 = _97 * _376;
    float _424 = 0.0 + _420;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _426 * _422;
    bool _430 = _428 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _432 = isnan(_428);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _438 = _434 || _436;
    float _440 = in.m_51.x;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_51.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_51.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_45.x;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    if (!_438)
    {
        discard_fragment();
    }
    float _464 = _97 * _384;
    float _466 = fma(_173, -1.8181817531585693359375, 1.0);
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = fma(_468, -2.0, 3.0);
    float _472 = _468 * _468;
    float _474 = _472 * _470;
    float _476 = _97 * _444;
    float _478 = _97 * _450;
    float _480 = _97 * _456;
    float _482 = _97 * _462;
    float _484 = _97 * _390;
    float _486 = fma(_414, _474, _358);
    float _488 = -_478;
    float _490 = _488 + _464;
    float _492 = -_476;
    float _494 = _492 + _482;
    float _496 = -_480;
    float _498 = _496 + _484;
    float _500 = fma(_486, _490, _478);
    float _502 = fma(_486, _494, _476);
    float _504 = fma(_486, _498, _480);
    if (!_438)
    {
        out.m_54.x = _502;
        out.m_54.y = _500;
        out.m_54.z = _504;
        out.m_54.w = _420;
        return out;
    }
    float _506 = _500 * 0.715200006961822509765625;
    float _508 = fma(_502, 0.2125999927520751953125, _506);
    bool _510 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _512 = fma(_504, 0.072200000286102294921875, _508);
    float _514 = 1.0 / _512;
    float _516 = _514 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _518 = precise::clamp(_516, 0.0, 1.0);
    float _520 = fma(_518, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _522 = 0.0 + _428;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = _502 * _520;
    float _528 = _500 * _520;
    float _530 = _504 * _520;
    float _532 = _520;
    if (!_510)
    {
        _532 = _524;
    }
    float _534 = _532;
    bool _536 = !_510;
    float _538 = _534;
    if (!_536)
    {
        float _540 = in.m_56.w;
        float _542 = gl_FragCoord.w;
        float _544 = _540 * _542;
        float _546 = in.m_56.z;
        float _548 = gl_FragCoord.w;
        float _550 = _546 * _548;
        float _552 = _97 * _544;
        float _554 = _97 * _550;
        float _556 = 1.0 / _552;
        float _558 = _554 * _556;
        float _560 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _562 = fma(_558, (*spvDescriptorSet0.fp_c8)._m0[30].w, _560);
        float _564 = 1.0 / _562;
        float _566 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _568 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _570 = fma(_564, _566, _568);
        float _572 = _570 * 8.0;
        float _574 = precise::clamp(_572, 0.0, 1.0);
        float _576 = _524 * _574;
        _538 = _576;
    }
    float _578 = _538;
    float _580 = 0.0 + _578;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    out.m_54.x = _526;
    out.m_54.y = _528;
    out.m_54.z = _530;
    out.m_54.w = _582;
    return out;
}

