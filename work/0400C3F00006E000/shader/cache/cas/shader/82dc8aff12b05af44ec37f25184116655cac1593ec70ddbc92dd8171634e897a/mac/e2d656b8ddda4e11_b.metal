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
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> cp_t_tcb_C [[id(4)]];
    sampler cp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> cp_i_tcb_4A_ [[id(8)]];
    texture2d<float> cp_i_tcb_4C_ [[id(9)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(10)]];
    sampler cp_t_tcb_8Smplr_w [[id(11)]];
    sampler cp_t_tcb_CSmplr_w [[id(12)]];
    sampler cp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

static inline __attribute__((always_inline))
int _48(thread const int& _2550, thread const int& _2551, constant _10& support_buffer)
{
    int _2554 = 1 + _2551;
    float _2556 = support_buffer._m5[_2554].x;
    bool _2558 = _2556 == 1.0;
    if (_2558)
    {
        return _2550;
    }
    float _2560 = float(_2550);
    float _2562 = _2560 * _2556;
    int _2564 = int(_2562);
    return _2564;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    int _51 = 0;
    int _53 = 3;
    int _55 = _48(_51, _53, (*spvDescriptorSet0.support_buffer));
    int _57 = 0;
    int _59 = 3;
    int _61 = _48(_57, _59, (*spvDescriptorSet0.support_buffer));
    float _64 = spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_55, _61))).x;
    float _66 = as_type<float>(gl_WorkGroupID.x);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    int _70 = as_type<int>(_66) << 6;
    int _72 = _70 + as_type<int>(_68);
    bool _76 = uint(_72) > as_type<uint>(_64);
    if (_76)
    {
        return;
    }
    int _78 = _72 >> 31;
    int _80 = _72 & 1023;
    int _82 = _78 & 1023;
    int _84 = _72 + _82;
    int _86 = _84 >> 10;
    int _88 = _80;
    int _90 = 4;
    int _92 = _48(_88, _90, (*spvDescriptorSet0.support_buffer));
    int _94 = _86;
    int _96 = 4;
    int _98 = _48(_94, _96, (*spvDescriptorSet0.support_buffer));
    float2 _102 = (spvDescriptorSet0.cp_i_tcb_4C_.read(uint2(int2(_92, _98))).xy);
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _106 * 8192.0;
    float _110 = _104 * 8192.0;
    float _112 = trunc(_108);
    int _114 = int(_112);
    float _116 = trunc(_110);
    int _118 = int(_116);
    float _120 = float(_114);
    float _122 = _120 + 0.5;
    float _124 = float(_118);
    float _126 = _122 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _128 = _124 + 0.5;
    float _130 = _128 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float2 _1181 = float2(_130, _126);
    float2 _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1181, float2(0.0), isnan(_1181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1181, float2(0.0), isnan(_1181)), level(0.0)).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = fma(-0.125, (*spvDescriptorSet0.cp_c3)._m0[0].w, _126);
    float _140 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _130);
    float _142 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.25, _126);
    float _144 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.25, _130);
    bool _146 = _136 > 0.0;
    float _148 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _126);
    float _150 = 0.0;
    float _152 = _126;
    float _154 = _138;
    int _156 = as_type<int>(_130);
    int _158 = as_type<int>(_134);
    float _160 = _148;
    float _162 = _142;
    if (!_146)
    {
        _150 = 0.0;
        _152 = 0.0;
    }
    float _164 = _150;
    float _166 = _152;
    bool _168 = !_146;
    float _170 = 0.0;
    float _172 = 0.0;
    float _174 = 0.0;
    float _176 = _164;
    float _178 = _166;
    if (!_168)
    {
        float2 _1242 = float2(_144, _138);
        float2 _180 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1242, float2(0.0), isnan(_1242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1242, float2(0.0), isnan(_1242)), level(0.0)).xy;
        float _182 = _180.x;
        float _184 = _180.y;
        float _186 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 1.25, _130);
        float2 _1258 = float2(_186, _138);
        float2 _188 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1258, float2(0.0), isnan(_1258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1258, float2(0.0), isnan(_1258)), level(0.0)).xy;
        float _190 = _188.x;
        float _192 = _188.y;
        float _194 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _144);
        bool _196 = _184 >= 0.800000011920928955078125;
        bool _198 = isnan(_184);
        bool _200 = _196 || _198;
        bool _202 = isnan(0.800000011920928955078125);
        bool _204 = _200 || _202;
        bool _206 = _182 != 0.0;
        bool _208 = isnan(_182);
        bool _210 = _206 || _208;
        bool _212 = isnan(0.0);
        bool _214 = _210 || _212;
        bool _216 = !_204;
        bool _218 = _214 || _216;
        bool _220 = _192 > 0.800000011920928955078125;
        bool _222 = isnan(_192);
        bool _224 = _220 || _222;
        bool _226 = isnan(0.800000011920928955078125);
        bool _228 = _224 || _226;
        bool _230 = _190 != 0.0;
        bool _232 = isnan(_190);
        bool _234 = _230 || _232;
        bool _236 = isnan(0.0);
        bool _238 = _234 || _236;
        bool _240 = !_228;
        bool _242 = _238 || _240;
        float _244 = 0.0;
        int _246 = as_type<int>(_184);
        float _248 = _186;
        int _250 = as_type<int>(_194);
        if (_218)
        {
            _244 = _182;
        }
        float _252 = _244;
        float _254 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _186);
        float _256 = 0.0;
        float _258 = _254;
        if (_218)
        {
            _256 = _184;
        }
        float _260 = _256;
        float _262 = _252;
        float _264 = _260;
        if (!_218)
        {
            float2 _1356 = float2(_194, _138);
            float2 _266 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1356, float2(0.0), isnan(_1356)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1356, float2(0.0), isnan(_1356)), level(0.0)).xy;
            float _268 = _266.x;
            float _270 = _266.y;
            _262 = _268;
            _264 = _270;
        }
        float _272 = _262;
        float _274 = _264;
        float _276 = _190;
        float _278 = _192;
        if (!_242)
        {
            float2 _1378 = float2(_254, _138);
            float2 _280 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1378, float2(0.0), isnan(_1378)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1378, float2(0.0), isnan(_1378)), level(0.0)).xy;
            float _282 = _280.x;
            float _284 = _280.y;
            _276 = _282;
            _278 = _284;
        }
        float _286 = _276;
        float _288 = _278;
        if (_218)
        {
            _246 = 1;
        }
        int _290 = _246;
        int _292 = _290;
        if (!_218)
        {
            _292 = 0;
        }
        int _294 = _292;
        int _296 = 0;
        if (_242)
        {
            _296 = 1;
        }
        int _298 = _296;
        int _300 = _298;
        if (_218)
        {
            _248 = _194;
        }
        float _302 = _248;
        float _304 = _302;
        if (!_218)
        {
            float _306 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _194);
            _304 = _306;
        }
        float _308 = _304;
        int _310 = _294 & 1;
        bool _312 = _310 != 0;
        float _314 = _308;
        if (!_242)
        {
            _300 = 0;
        }
        int _316 = _300;
        int _318 = _316 & 1;
        bool _320 = _318 != 0;
        float _322 = as_type<float>(_316);
        if (_312)
        {
            _250 = _294;
        }
        int _324 = _250;
        int _326 = _324;
        int _328 = _324;
        float _330 = _274;
        float _332 = _272;
        float _334 = _288;
        float _336 = _286;
        if (!_312)
        {
            bool _338 = _274 >= 0.800000011920928955078125;
            bool _340 = isnan(_274);
            bool _342 = _338 || _340;
            bool _344 = isnan(0.800000011920928955078125);
            bool _346 = _342 || _344;
            bool _348 = _272 != 0.0;
            bool _350 = isnan(_272);
            bool _352 = _348 || _350;
            bool _354 = isnan(0.0);
            bool _356 = _352 || _354;
            bool _358 = !_346;
            bool _360 = _356 || _358;
            if (_360)
            {
                _326 = 1;
            }
            int _362 = _326;
            _328 = _362;
            if (!_360)
            {
                float2 _1492 = float2(_308, _138);
                float2 _364 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1492, float2(0.0), isnan(_1492)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1492, float2(0.0), isnan(_1492)), level(0.0)).xy;
                float _366 = _364.x;
                float _368 = _364.y;
                float _370 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _308);
                _328 = _294;
                _314 = _370;
                _330 = _368;
                _332 = _366;
            }
        }
        int _372 = _328;
        float _374 = _314;
        float _376 = _330;
        float _378 = _332;
        int _380 = _372 & 1;
        bool _382 = _380 != 0;
        float _384 = _378;
        float _386 = _376;
        int _388 = as_type<int>(_374);
        if (!_242)
        {
            float _390 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _254);
            _258 = _390;
        }
        float _392 = _258;
        float _394 = 0.0;
        float _396 = _392;
        if (_382)
        {
            _394 = _374;
        }
        float _398 = _394;
        float _400 = _398;
        float _402 = _398;
        if (!_382)
        {
            bool _404 = _376 >= 0.800000011920928955078125;
            bool _406 = isnan(_376);
            bool _408 = _404 || _406;
            bool _410 = isnan(0.800000011920928955078125);
            bool _412 = _408 || _410;
            bool _414 = _378 != 0.0;
            bool _416 = isnan(_378);
            bool _418 = _414 || _416;
            bool _420 = isnan(0.0);
            bool _422 = _418 || _420;
            bool _424 = !_412;
            bool _426 = _422 || _424;
            if (_426)
            {
                _400 = _374;
            }
            float _428 = _400;
            _402 = _428;
            if (!_426)
            {
                float2 _1583 = float2(_374, _138);
                float2 _430 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1583, float2(0.0), isnan(_1583)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1583, float2(0.0), isnan(_1583)), level(0.0)).xy;
                float _432 = _430.x;
                float _434 = _430.y;
                float _436 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _374);
                _384 = _432;
                _386 = _434;
                _402 = _436;
            }
        }
        float _438 = _384;
        float _440 = _386;
        float _442 = _402;
        _174 = _440;
        if (_320)
        {
            _388 = _316;
        }
        int _444 = _388;
        int _446 = _444;
        int _448 = _444;
        if (!_320)
        {
            bool _450 = _288 > 0.800000011920928955078125;
            bool _452 = isnan(_288);
            bool _454 = _450 || _452;
            bool _456 = isnan(0.800000011920928955078125);
            bool _458 = _454 || _456;
            bool _460 = _286 != 0.0;
            bool _462 = isnan(_286);
            bool _464 = _460 || _462;
            bool _466 = isnan(0.0);
            bool _468 = _464 || _466;
            bool _470 = !_458;
            bool _472 = _468 || _470;
            if (_472)
            {
                _446 = 1;
            }
            int _474 = _446;
            _448 = _474;
            if (!_472)
            {
                float2 _1653 = float2(_392, _138);
                float2 _476 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1653, float2(0.0), isnan(_1653)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1653, float2(0.0), isnan(_1653)), level(0.0)).xy;
                float _478 = _476.x;
                float _480 = _476.y;
                float _482 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _392);
                _448 = _316;
                _396 = _482;
                _334 = _480;
                _336 = _478;
            }
        }
        int _484 = _448;
        float _486 = _396;
        float _488 = _334;
        float _490 = _336;
        int _492 = _484 & 1;
        bool _494 = _492 != 0;
        float _496 = _490;
        float _498 = _488;
        if (_494)
        {
            _322 = _486;
        }
        float _500 = _322;
        float _502 = _500;
        float _504 = _500;
        if (!_494)
        {
            bool _506 = _488 > 0.800000011920928955078125;
            bool _508 = isnan(_488);
            bool _510 = _506 || _508;
            bool _512 = isnan(0.800000011920928955078125);
            bool _514 = _510 || _512;
            bool _516 = _490 != 0.0;
            bool _518 = isnan(_490);
            bool _520 = _516 || _518;
            bool _522 = isnan(0.0);
            bool _524 = _520 || _522;
            bool _526 = !_514;
            bool _528 = _524 || _526;
            if (_528)
            {
                _502 = _486;
            }
            float _530 = _502;
            _504 = _530;
            if (!_528)
            {
                float2 _1731 = float2(_486, _138);
                float2 _532 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1731, float2(0.0), isnan(_1731)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1731, float2(0.0), isnan(_1731)), level(0.0)).xy;
                float _534 = _532.x;
                float _536 = _532.y;
                float _538 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _486);
                _496 = _534;
                _498 = _536;
                _504 = _538;
            }
        }
        float _540 = _496;
        float _542 = _498;
        float _544 = _504;
        float _546 = fma(_540, 0.5, 0.5234375);
        float _548 = fma(_542, 2.0, 0.03125);
        float _550 = fma(_438, 0.5, 0.0078125);
        float _552 = fma(_440, 2.0, 0.03125);
        float2 _1766 = float2(_546, _548);
        float _554 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_1766, float2(0.0), isnan(_1766)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_1766, float2(0.0), isnan(_1766)), level(0.0)).x;
        float2 _1774 = float2(_550, _552);
        float _556 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_1774, float2(0.0), isnan(_1774)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_1774, float2(0.0), isnan(_1774)), level(0.0)).x;
        float _558 = fma(_554, -2.007874011993408203125, 3.25);
        float _560 = fma(_556, -2.007874011993408203125, 3.25);
        float _562 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _564 = fma(_558, _562, _544);
        float _566 = fma(_560, (*spvDescriptorSet0.cp_c3)._m0[0].z, _442);
        float2 _1800 = float2(_564, _142);
        float _568 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1800, float2(0.0), isnan(_1800)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1800, float2(0.0), isnan(_1800)), level(0.0), int2(1, 0)).x;
        float2 _1809 = float2(_566, _142);
        float _570 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1809, float2(0.0), isnan(_1809)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1809, float2(0.0), isnan(_1809)), level(0.0)).x;
        float _572 = -_128;
        float _574 = fma(_566, (*spvDescriptorSet0.cp_c3)._m0[0].x, _572);
        float _576 = -_128;
        float _578 = fma(_564, (*spvDescriptorSet0.cp_c3)._m0[0].x, _576);
        float _580 = rint(_574);
        float _582 = rint(_578);
        float _584 = abs(_580);
        float _586 = sqrt(_584);
        float _588 = abs(_582);
        float _590 = sqrt(_588);
        float _592 = _568 * 4.0;
        float _594 = _570 * 4.0;
        float _596 = rint(_592);
        float _598 = rint(_594);
        float _600 = fma(_596, 16.0, _590);
        float _602 = fma(_600, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _604 = fma(_598, 16.0, _586);
        float _606 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _602);
        float _608 = fma(_604, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float2 _1872 = float2(_608, _606);
        float2 _610 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1872, float2(0.0), isnan(_1872)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1872, float2(0.0), isnan(_1872)), level(0.0)).xy;
        float _612 = _610.x;
        float _614 = _610.y;
        _170 = _580;
        _154 = _598;
        _172 = _566;
        _156 = 996806305;
        _176 = _612;
        _178 = _614;
    }
    float _616 = _170;
    float _618 = _154;
    float _620 = _172;
    float _622 = _174;
    int _624 = _156;
    float _626 = _176;
    float _628 = _178;
    bool _630 = _134 > 0.0;
    float _632 = _616;
    float _634 = _618;
    float _636 = _620;
    float _638 = _622;
    int _640 = _624;
    if (!_630)
    {
        _632 = 0.0;
        _634 = 0.0;
    }
    float _642 = _632;
    float _644 = _634;
    bool _646 = !_630;
    float _648 = _642;
    float _650 = _644;
    if (!_646)
    {
        float2 _1918 = float2(_140, _142);
        float2 _652 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1918, float2(0.0), isnan(_1918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1918, float2(0.0), isnan(_1918)), level(0.0)).xy;
        float _654 = _652.x;
        float _656 = _652.y;
        float2 _1930 = float2(_140, _148);
        float2 _658 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1930, float2(0.0), isnan(_1930)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1930, float2(0.0), isnan(_1930)), level(0.0)).xy;
        float _660 = _658.x;
        float _662 = _658.y;
        float _664 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _142);
        bool _666 = _654 > 0.800000011920928955078125;
        bool _668 = isnan(_654);
        bool _670 = _666 || _668;
        bool _672 = isnan(0.800000011920928955078125);
        bool _674 = _670 || _672;
        bool _676 = _656 != 0.0;
        bool _678 = isnan(_656);
        bool _680 = _676 || _678;
        bool _682 = isnan(0.0);
        bool _684 = _680 || _682;
        bool _686 = !_674;
        bool _688 = _684 || _686;
        bool _690 = _660 > 0.800000011920928955078125;
        bool _692 = isnan(_660);
        bool _694 = _690 || _692;
        bool _696 = isnan(0.800000011920928955078125);
        bool _698 = _694 || _696;
        bool _700 = _662 != 0.0;
        bool _702 = isnan(_662);
        bool _704 = _700 || _702;
        bool _706 = isnan(0.0);
        bool _708 = _704 || _706;
        bool _710 = !_698;
        bool _712 = _708 || _710;
        int _714 = as_type<int>(_654);
        if (_688)
        {
            _636 = _654;
        }
        float _716 = _636;
        if (_688)
        {
            _638 = _656;
        }
        float _718 = _638;
        float _720 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _148);
        float _722 = _716;
        float _724 = _718;
        float _726 = _720;
        if (!_688)
        {
            float2 _2022 = float2(_140, _664);
            float2 _728 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2022, float2(0.0), isnan(_2022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2022, float2(0.0), isnan(_2022)), level(0.0)).xy;
            float _730 = _728.x;
            float _732 = _728.y;
            _722 = _730;
            _724 = _732;
        }
        float _734 = _722;
        float _736 = _724;
        float _738 = _660;
        float _740 = _662;
        if (!_712)
        {
            float2 _2044 = float2(_140, _720);
            float2 _742 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2044, float2(0.0), isnan(_2044)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2044, float2(0.0), isnan(_2044)), level(0.0)).xy;
            float _744 = _742.x;
            float _746 = _742.y;
            _738 = _744;
            _740 = _746;
        }
        float _748 = _738;
        float _750 = _740;
        if (_688)
        {
            _158 = 1;
        }
        int _752 = _158;
        int _754 = _752;
        if (!_688)
        {
            _754 = 0;
        }
        int _756 = _754;
        int _758 = _756;
        if (_712)
        {
            _714 = 1;
        }
        int _760 = _714;
        int _762 = _760;
        if (_688)
        {
            _160 = _664;
        }
        float _764 = _160;
        float _766 = _764;
        if (!_688)
        {
            float _768 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _664);
            _766 = _768;
        }
        float _770 = _766;
        int _772 = _756 & 1;
        bool _774 = _772 != 0;
        float _776 = _770;
        if (!_712)
        {
            _762 = 0;
        }
        int _778 = _762;
        int _780 = _778 & 1;
        bool _782 = _780 != 0;
        if (_774)
        {
            _640 = _756;
        }
        int _784 = _640;
        int _786 = _784;
        int _788 = _784;
        float _790 = _734;
        float _792 = _736;
        float _794 = _748;
        float _796 = _750;
        if (!_774)
        {
            bool _798 = _734 > 0.800000011920928955078125;
            bool _800 = isnan(_734);
            bool _802 = _798 || _800;
            bool _804 = isnan(0.800000011920928955078125);
            bool _806 = _802 || _804;
            bool _808 = _736 != 0.0;
            bool _810 = isnan(_736);
            bool _812 = _808 || _810;
            bool _814 = isnan(0.0);
            bool _816 = _812 || _814;
            bool _818 = !_806;
            bool _820 = _816 || _818;
            if (_820)
            {
                _786 = 1;
            }
            int _822 = _786;
            _788 = _822;
            if (!_820)
            {
                float2 _2156 = float2(_140, _770);
                float2 _824 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2156, float2(0.0), isnan(_2156)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2156, float2(0.0), isnan(_2156)), level(0.0)).xy;
                float _826 = _824.x;
                float _828 = _824.y;
                float _830 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _770);
                _788 = _756;
                _776 = _830;
                _790 = _826;
                _792 = _828;
            }
        }
        int _832 = _788;
        float _834 = _776;
        float _836 = _790;
        float _838 = _792;
        int _840 = _832 & 1;
        bool _842 = _840 != 0;
        float _844 = _838;
        float _846 = _836;
        if (_712)
        {
            _162 = _720;
        }
        float _848 = _162;
        float _850 = _848;
        if (!_712)
        {
            float _852 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _720);
            _850 = _852;
        }
        float _854 = _850;
        float _856 = _854;
        if (_842)
        {
            _726 = _834;
        }
        float _858 = _726;
        float _860 = _858;
        float _862 = _858;
        if (!_842)
        {
            bool _864 = _836 > 0.800000011920928955078125;
            bool _866 = isnan(_836);
            bool _868 = _864 || _866;
            bool _870 = isnan(0.800000011920928955078125);
            bool _872 = _868 || _870;
            bool _874 = _838 != 0.0;
            bool _876 = isnan(_838);
            bool _878 = _874 || _876;
            bool _880 = isnan(0.0);
            bool _882 = _878 || _880;
            bool _884 = !_872;
            bool _886 = _882 || _884;
            if (_886)
            {
                _860 = _834;
            }
            float _888 = _860;
            _862 = _888;
            if (!_886)
            {
                float2 _2251 = float2(_140, _834);
                float2 _890 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2251, float2(0.0), isnan(_2251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2251, float2(0.0), isnan(_2251)), level(0.0)).xy;
                float _892 = _890.x;
                float _894 = _890.y;
                float _896 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _834);
                _844 = _894;
                _846 = _892;
                _862 = _896;
            }
        }
        float _898 = _844;
        float _900 = _846;
        float _902 = _862;
        if (_782)
        {
            _758 = _778;
        }
        int _904 = _758;
        int _906 = _904;
        int _908 = _904;
        if (!_782)
        {
            bool _910 = _748 > 0.800000011920928955078125;
            bool _912 = isnan(_748);
            bool _914 = _910 || _912;
            bool _916 = isnan(0.800000011920928955078125);
            bool _918 = _914 || _916;
            bool _920 = _750 != 0.0;
            bool _922 = isnan(_750);
            bool _924 = _920 || _922;
            bool _926 = isnan(0.0);
            bool _928 = _924 || _926;
            bool _930 = !_918;
            bool _932 = _928 || _930;
            if (_932)
            {
                _906 = 1;
            }
            int _934 = _906;
            _908 = _934;
            if (!_932)
            {
                float2 _2320 = float2(_140, _854);
                float2 _936 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2320, float2(0.0), isnan(_2320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2320, float2(0.0), isnan(_2320)), level(0.0)).xy;
                float _938 = _936.x;
                float _940 = _936.y;
                float _942 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _854);
                _908 = _778;
                _856 = _942;
                _794 = _938;
                _796 = _940;
            }
        }
        int _944 = _908;
        float _946 = _856;
        float _948 = _794;
        float _950 = _796;
        int _952 = _944 & 1;
        bool _954 = _952 != 0;
        float _956 = 0.0;
        float _958 = _950;
        float _960 = _948;
        if (_954)
        {
            _956 = _946;
        }
        float _962 = _956;
        float _964 = _962;
        float _966 = _962;
        if (!_954)
        {
            bool _968 = _948 > 0.800000011920928955078125;
            bool _970 = isnan(_948);
            bool _972 = _968 || _970;
            bool _974 = isnan(0.800000011920928955078125);
            bool _976 = _972 || _974;
            bool _978 = _950 != 0.0;
            bool _980 = isnan(_950);
            bool _982 = _978 || _980;
            bool _984 = isnan(0.0);
            bool _986 = _982 || _984;
            bool _988 = !_976;
            bool _990 = _986 || _988;
            if (_990)
            {
                _964 = _946;
            }
            float _992 = _964;
            _966 = _992;
            if (!_990)
            {
                float2 _2398 = float2(_140, _946);
                float2 _994 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2398, float2(0.0), isnan(_2398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2398, float2(0.0), isnan(_2398)), level(0.0)).xy;
                float _996 = _994.x;
                float _998 = _994.y;
                float _1000 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _946);
                _958 = _998;
                _960 = _996;
                _966 = _1000;
            }
        }
        float _1002 = _958;
        float _1004 = _960;
        float _1006 = _966;
        float _1008 = fma(_1002, 0.5, 0.5234375);
        float _1010 = fma(_1004, 2.0, 0.03125);
        float _1012 = fma(_898, 0.5, 0.0078125);
        float _1014 = fma(_900, 2.0, 0.03125);
        float2 _2430 = float2(_1008, _1010);
        float _1016 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2430, float2(0.0), isnan(_2430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2430, float2(0.0), isnan(_2430)), level(0.0)).x;
        float2 _2438 = float2(_1012, _1014);
        float _1018 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2438, float2(0.0), isnan(_2438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2438, float2(0.0), isnan(_2438)), level(0.0)).x;
        float _1020 = fma(_1016, -2.007874011993408203125, 3.25);
        float _1022 = fma(_1018, -2.007874011993408203125, 3.25);
        float _1024 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _1026 = fma(_1020, _1024, _1006);
        float _1028 = fma(_1022, (*spvDescriptorSet0.cp_c3)._m0[0].w, _902);
        float2 _2462 = float2(_144, _1026);
        float _1030 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2462, float2(0.0), isnan(_2462)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2462, float2(0.0), isnan(_2462)), level(0.0), int2(0, 1)).y;
        float2 _2471 = float2(_144, _1028);
        float _1032 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2471, float2(0.0), isnan(_2471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2471, float2(0.0), isnan(_2471)), level(0.0)).y;
        float _1034 = -_122;
        float _1036 = fma(_1028, (*spvDescriptorSet0.cp_c3)._m0[0].y, _1034);
        float _1038 = -_122;
        float _1040 = fma(_1026, (*spvDescriptorSet0.cp_c3)._m0[0].y, _1038);
        float _1042 = rint(_1036);
        float _1044 = rint(_1040);
        float _1046 = abs(_1042);
        float _1048 = sqrt(_1046);
        float _1050 = abs(_1044);
        float _1052 = sqrt(_1050);
        float _1054 = _1030 * 4.0;
        float _1056 = _1032 * 4.0;
        float _1058 = rint(_1054);
        float _1060 = rint(_1056);
        float _1062 = fma(_1058, 16.0, _1052);
        float _1064 = fma(_1062, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _1066 = fma(_1060, 16.0, _1048);
        float _1068 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _1064);
        float _1070 = fma(_1066, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float2 _2527 = float2(_1070, _1068);
        float2 _1072 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2527, float2(0.0), isnan(_2527)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2527, float2(0.0), isnan(_2527)), level(0.0)).xy;
        float _1074 = _1072.x;
        float _1076 = _1072.y;
        _648 = _1074;
        _650 = _1076;
    }
    float _1078 = _648;
    float _1080 = _650;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_626, _628, _1078, _1080), uint2(int2(_118, _114)));
}

