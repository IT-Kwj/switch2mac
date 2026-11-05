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
int _48(thread const int& _4825, thread const int& _4826, constant _10& support_buffer)
{
    int _4829 = 1 + _4826;
    float _4831 = support_buffer._m5[_4829].x;
    bool _4833 = _4831 == 1.0;
    if (_4833)
    {
        return _4825;
    }
    float _4835 = float(_4825);
    float _4837 = _4835 * _4831;
    int _4839 = int(_4837);
    return _4839;
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
    int _70 = as_type<int>(_66) * 64;
    int _72 = _70 + as_type<int>(_68);
    bool _76 = uint(_72) > as_type<uint>(_64);
    if (_76)
    {
        return;
    }
    int _78 = _72 >> 31;
    int _80 = _78 & 1023;
    int _82 = _72 + _80;
    int _84 = _72 & 1023;
    int _86 = _82 >> 10;
    int _88 = _84;
    int _90 = 4;
    int _92 = _48(_88, _90, (*spvDescriptorSet0.support_buffer));
    int _94 = _86;
    int _96 = 4;
    int _98 = _48(_94, _96, (*spvDescriptorSet0.support_buffer));
    float2 _102 = (spvDescriptorSet0.cp_i_tcb_4C_.read(uint2(int2(_92, _98))).xy);
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = float(as_type<int>(_104));
    float _110 = float(as_type<int>(_106));
    float _112 = _108 + 0.5;
    float _114 = _110 + 0.5;
    float _116 = _112 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _118 = _114 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float2 _2145 = float2(_116, _118);
    float2 _120 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2145, float2(0.0), isnan(_2145)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2145, float2(0.0), isnan(_2145)), level(0.0)).xy;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = fma(-0.25, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
    float _128 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.25, _118);
    bool _130 = _124 > 0.0;
    float _132 = 0.0;
    float _134 = 0.0;
    float _136 = _112;
    float _138 = _116;
    float _140 = _128;
    if (!_130)
    {
        _132 = 0.0;
        _134 = 0.0;
    }
    float _142 = _132;
    float _144 = _134;
    bool _146 = !_130;
    float _148 = 0.0;
    float _150 = 0.0;
    float _152 = 0.0;
    int _154 = 0;
    float _156 = _142;
    float _158 = _144;
    if (!_146)
    {
        float _160 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.125, _118);
        float _162 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 1.25, _116);
        float2 _2198 = float2(_126, _160);
        float2 _164 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2198, float2(0.0), isnan(_2198)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2198, float2(0.0), isnan(_2198)), level(0.0)).xy;
        float _166 = _164.x;
        float _168 = _164.y;
        float2 _2210 = float2(_162, _160);
        float2 _170 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2210, float2(0.0), isnan(_2210)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2210, float2(0.0), isnan(_2210)), level(0.0)).xy;
        float _172 = _170.x;
        float _174 = _170.y;
        float _176 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _126);
        float _178 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _162);
        bool _180 = _168 >= 0.800000011920928955078125;
        bool _182 = isnan(_168);
        bool _184 = _180 || _182;
        bool _186 = isnan(0.800000011920928955078125);
        bool _188 = _184 || _186;
        bool _190 = _174 > 0.800000011920928955078125;
        bool _192 = isnan(_174);
        bool _194 = _190 || _192;
        bool _196 = isnan(0.800000011920928955078125);
        bool _198 = _194 || _196;
        bool _200 = _166 != 0.0;
        bool _202 = isnan(_166);
        bool _204 = _200 || _202;
        bool _206 = isnan(0.0);
        bool _208 = _204 || _206;
        bool _210 = !_188;
        bool _212 = _208 || _210;
        bool _214 = _172 != 0.0;
        bool _216 = isnan(_172);
        bool _218 = _214 || _216;
        bool _220 = isnan(0.0);
        bool _222 = _218 || _220;
        bool _224 = !_198;
        bool _226 = _222 || _224;
        float _228 = 0.0;
        float _230 = _166;
        float _232 = _168;
        float _234 = _172;
        int _236 = as_type<int>(_174);
        int _238 = as_type<int>(_176);
        float _240 = _162;
        float _242 = _178;
        if (_212)
        {
            _228 = _166;
        }
        float _244 = _228;
        float _246 = 0.0;
        if (_212)
        {
            _246 = _168;
        }
        float _248 = _246;
        if (_226)
        {
            _230 = _172;
        }
        float _250 = _230;
        if (_226)
        {
            _232 = _174;
        }
        float _252 = _232;
        float _254 = _244;
        float _256 = _248;
        if (!_212)
        {
            float2 _2321 = float2(_176, _160);
            float2 _258 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2321, float2(0.0), isnan(_2321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2321, float2(0.0), isnan(_2321)), level(0.0)).xy;
            float _260 = _258.x;
            float _262 = _258.y;
            _254 = _260;
            _256 = _262;
        }
        float _264 = _254;
        float _266 = _256;
        float _268 = _250;
        float _270 = _252;
        if (!_226)
        {
            float2 _2343 = float2(_178, _160);
            float2 _272 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2343, float2(0.0), isnan(_2343)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2343, float2(0.0), isnan(_2343)), level(0.0)).xy;
            float _274 = _272.x;
            float _276 = _272.y;
            _268 = _274;
            _270 = _276;
        }
        float _278 = _268;
        float _280 = _270;
        int _282 = 0;
        if (_212)
        {
            _282 = 1;
        }
        int _284 = _282;
        int _286 = _284;
        if (!_212)
        {
            _286 = 0;
        }
        int _288 = _286;
        int _290 = _288;
        if (_212)
        {
            _234 = _176;
        }
        float _292 = _234;
        float _294 = _292;
        if (!_212)
        {
            float _296 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _176);
            _294 = _296;
        }
        float _298 = _294;
        int _300 = _288 & 1;
        bool _302 = _300 != 0;
        float _304 = _298;
        if (_302)
        {
            _236 = _288;
        }
        int _306 = _236;
        int _308 = _306;
        int _310 = _306;
        float _312 = _266;
        float _314 = _264;
        float _316 = _280;
        float _318 = _278;
        if (!_302)
        {
            bool _320 = _266 >= 0.800000011920928955078125;
            bool _322 = isnan(_266);
            bool _324 = _320 || _322;
            bool _326 = isnan(0.800000011920928955078125);
            bool _328 = _324 || _326;
            bool _330 = _264 != 0.0;
            bool _332 = isnan(_264);
            bool _334 = _330 || _332;
            bool _336 = isnan(0.0);
            bool _338 = _334 || _336;
            bool _340 = !_328;
            bool _342 = _338 || _340;
            if (_342)
            {
                _308 = 1;
            }
            int _344 = _308;
            _310 = _344;
            if (!_342)
            {
                float2 _2442 = float2(_298, _160);
                float2 _346 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2442, float2(0.0), isnan(_2442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2442, float2(0.0), isnan(_2442)), level(0.0)).xy;
                float _348 = _346.x;
                float _350 = _346.y;
                float _352 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _298);
                _310 = _288;
                _312 = _350;
                _314 = _348;
                _304 = _352;
            }
        }
        int _354 = _310;
        float _356 = _312;
        float _358 = _314;
        float _360 = _304;
        int _362 = _354 & 1;
        bool _364 = _362 != 0;
        float _366 = _356;
        float _368 = _358;
        float _370 = _360;
        float _372 = as_type<float>(_354);
        if (_364)
        {
            _238 = _354;
        }
        int _374 = _238;
        int _376 = _374;
        int _378 = _374;
        if (!_364)
        {
            bool _380 = _356 >= 0.800000011920928955078125;
            bool _382 = isnan(_356);
            bool _384 = _380 || _382;
            bool _386 = isnan(0.800000011920928955078125);
            bool _388 = _384 || _386;
            bool _390 = _358 != 0.0;
            bool _392 = isnan(_358);
            bool _394 = _390 || _392;
            bool _396 = isnan(0.0);
            bool _398 = _394 || _396;
            bool _400 = !_388;
            bool _402 = _398 || _400;
            if (_402)
            {
                _376 = 1;
            }
            int _404 = _376;
            _378 = _404;
            if (!_402)
            {
                float2 _2522 = float2(_360, _160);
                float2 _406 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2522, float2(0.0), isnan(_2522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2522, float2(0.0), isnan(_2522)), level(0.0)).xy;
                float _408 = _406.x;
                float _410 = _406.y;
                float _412 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _360);
                _378 = _354;
                _366 = _410;
                _368 = _408;
                _370 = _412;
            }
        }
        int _414 = _378;
        float _416 = _366;
        float _418 = _368;
        float _420 = _370;
        int _422 = _414 & 1;
        bool _424 = _422 != 0;
        float _426 = _416;
        float _428 = _418;
        float _430 = _420;
        int _432 = _414;
        if (_424)
        {
            _290 = _414;
        }
        int _434 = _290;
        int _436 = _434;
        int _438 = _434;
        if (!_424)
        {
            bool _440 = _416 >= 0.800000011920928955078125;
            bool _442 = isnan(_416);
            bool _444 = _440 || _442;
            bool _446 = isnan(0.800000011920928955078125);
            bool _448 = _444 || _446;
            bool _450 = _418 != 0.0;
            bool _452 = isnan(_418);
            bool _454 = _450 || _452;
            bool _456 = isnan(0.0);
            bool _458 = _454 || _456;
            bool _460 = !_448;
            bool _462 = _458 || _460;
            if (_462)
            {
                _436 = 1;
            }
            int _464 = _436;
            _438 = _464;
            if (!_462)
            {
                float2 _2601 = float2(_420, _160);
                float2 _466 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2601, float2(0.0), isnan(_2601)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2601, float2(0.0), isnan(_2601)), level(0.0)).xy;
                float _468 = _466.x;
                float _470 = _466.y;
                float _472 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _420);
                _438 = _414;
                _426 = _470;
                _428 = _468;
                _430 = _472;
            }
        }
        int _474 = _438;
        float _476 = _426;
        float _478 = _428;
        float _480 = _430;
        int _482 = _474 & 1;
        bool _484 = _482 != 0;
        float _486 = _480;
        float _488 = _476;
        float _490 = _478;
        int _492 = _474;
        if (_484)
        {
            _432 = _474;
        }
        int _494 = _432;
        int _496 = _494;
        int _498 = _494;
        if (!_484)
        {
            bool _500 = _476 >= 0.800000011920928955078125;
            bool _502 = isnan(_476);
            bool _504 = _500 || _502;
            bool _506 = isnan(0.800000011920928955078125);
            bool _508 = _504 || _506;
            bool _510 = _478 != 0.0;
            bool _512 = isnan(_478);
            bool _514 = _510 || _512;
            bool _516 = isnan(0.0);
            bool _518 = _514 || _516;
            bool _520 = !_508;
            bool _522 = _518 || _520;
            if (_522)
            {
                _496 = 1;
            }
            int _524 = _496;
            _498 = _524;
            if (!_522)
            {
                float2 _2680 = float2(_480, _160);
                float2 _526 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2680, float2(0.0), isnan(_2680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2680, float2(0.0), isnan(_2680)), level(0.0)).xy;
                float _528 = _526.x;
                float _530 = _526.y;
                float _532 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _480);
                _498 = _474;
                _486 = _532;
                _488 = _530;
                _490 = _528;
            }
        }
        int _534 = _498;
        float _536 = _486;
        float _538 = _488;
        float _540 = _490;
        int _542 = _534 & 1;
        bool _544 = _542 != 0;
        int _546 = 0;
        float _548 = _540;
        float _550 = _538;
        float _552 = _536;
        int _554 = _534;
        if (_226)
        {
            _546 = 1;
        }
        int _556 = _546;
        int _558 = _556;
        if (!_226)
        {
            _558 = 0;
        }
        int _560 = _558;
        int _562 = _560 & 1;
        bool _564 = _562 != 0;
        if (_544)
        {
            _240 = _536;
        }
        float _566 = _240;
        float _568 = _566;
        float _570 = _566;
        if (_544)
        {
            _492 = _534;
        }
        int _572 = _492;
        int _574 = _572;
        int _576 = _572;
        if (!_544)
        {
            bool _578 = _538 >= 0.800000011920928955078125;
            bool _580 = isnan(_538);
            bool _582 = _578 || _580;
            bool _584 = isnan(0.800000011920928955078125);
            bool _586 = _582 || _584;
            bool _588 = _540 != 0.0;
            bool _590 = isnan(_540);
            bool _592 = _588 || _590;
            bool _594 = isnan(0.0);
            bool _596 = _592 || _594;
            bool _598 = !_586;
            bool _600 = _596 || _598;
            if (_600)
            {
                _568 = _536;
            }
            float _602 = _568;
            _570 = _602;
            if (_600)
            {
                _574 = 1;
            }
            int _604 = _574;
            _576 = _604;
            if (!_600)
            {
                float2 _2786 = float2(_536, _160);
                float2 _606 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2786, float2(0.0), isnan(_2786)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2786, float2(0.0), isnan(_2786)), level(0.0)).xy;
                float _608 = _606.x;
                float _610 = _606.y;
                float _612 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _536);
                _576 = _534;
                _548 = _608;
                _550 = _610;
                _570 = _612;
            }
        }
        int _614 = _576;
        float _616 = _548;
        float _618 = _550;
        float _620 = _570;
        int _622 = _614 & 1;
        bool _624 = _622 != 0;
        float _626 = _620;
        int _628 = _614;
        if (!_226)
        {
            float _630 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _178);
            _242 = _630;
        }
        float _632 = _242;
        float _634 = _632;
        if (_624)
        {
            _552 = _616;
        }
        float _636 = _552;
        float _638 = _636;
        float _640 = _636;
        if (_624)
        {
            _372 = _618;
        }
        float _642 = _372;
        float _644 = _642;
        float _646 = _642;
        if (!_624)
        {
            bool _648 = _618 >= 0.800000011920928955078125;
            bool _650 = isnan(_618);
            bool _652 = _648 || _650;
            bool _654 = isnan(0.800000011920928955078125);
            bool _656 = _652 || _654;
            bool _658 = _616 != 0.0;
            bool _660 = isnan(_616);
            bool _662 = _658 || _660;
            bool _664 = isnan(0.0);
            bool _666 = _662 || _664;
            bool _668 = !_656;
            bool _670 = _666 || _668;
            if (_670)
            {
                _638 = _616;
            }
            float _672 = _638;
            _640 = _672;
            if (_670)
            {
                _644 = _618;
            }
            float _674 = _644;
            _646 = _674;
            if (!_670)
            {
                float2 _2888 = float2(_620, _160);
                float2 _676 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2888, float2(0.0), isnan(_2888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2888, float2(0.0), isnan(_2888)), level(0.0)).xy;
                float _678 = _676.x;
                float _680 = _676.y;
                float _682 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _620);
                _640 = _678;
                _646 = _680;
                _626 = _682;
            }
        }
        float _684 = _640;
        float _686 = _646;
        float _688 = _626;
        if (_564)
        {
            _554 = _560;
        }
        int _690 = _554;
        int _692 = _690;
        int _694 = _690;
        if (!_564)
        {
            bool _696 = _280 > 0.800000011920928955078125;
            bool _698 = isnan(_280);
            bool _700 = _696 || _698;
            bool _702 = isnan(0.800000011920928955078125);
            bool _704 = _700 || _702;
            bool _706 = _278 != 0.0;
            bool _708 = isnan(_278);
            bool _710 = _706 || _708;
            bool _712 = isnan(0.0);
            bool _714 = _710 || _712;
            bool _716 = !_704;
            bool _718 = _714 || _716;
            if (_718)
            {
                _692 = 1;
            }
            int _720 = _692;
            _694 = _720;
            if (!_718)
            {
                float2 _2957 = float2(_632, _160);
                float2 _722 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2957, float2(0.0), isnan(_2957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2957, float2(0.0), isnan(_2957)), level(0.0)).xy;
                float _724 = _722.x;
                float _726 = _722.y;
                float _728 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _632);
                _694 = _560;
                _316 = _726;
                _318 = _724;
                _634 = _728;
            }
        }
        int _730 = _694;
        float _732 = _316;
        float _734 = _318;
        float _736 = _634;
        int _738 = _730 & 1;
        bool _740 = _738 != 0;
        float _742 = _732;
        float _744 = _734;
        float _746 = _736;
        int _748 = _730;
        if (_740)
        {
            _628 = _730;
        }
        int _750 = _628;
        int _752 = _750;
        int _754 = _750;
        if (!_740)
        {
            bool _756 = _732 > 0.800000011920928955078125;
            bool _758 = isnan(_732);
            bool _760 = _756 || _758;
            bool _762 = isnan(0.800000011920928955078125);
            bool _764 = _760 || _762;
            bool _766 = _734 != 0.0;
            bool _768 = isnan(_734);
            bool _770 = _766 || _768;
            bool _772 = isnan(0.0);
            bool _774 = _770 || _772;
            bool _776 = !_764;
            bool _778 = _774 || _776;
            if (_778)
            {
                _752 = 1;
            }
            int _780 = _752;
            _754 = _780;
            if (!_778)
            {
                float2 _3036 = float2(_736, _160);
                float2 _782 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3036, float2(0.0), isnan(_3036)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3036, float2(0.0), isnan(_3036)), level(0.0)).xy;
                float _784 = _782.x;
                float _786 = _782.y;
                float _788 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _736);
                _754 = _730;
                _742 = _786;
                _744 = _784;
                _746 = _788;
            }
        }
        int _790 = _754;
        float _792 = _742;
        float _794 = _744;
        float _796 = _746;
        int _798 = _790 & 1;
        bool _800 = _798 != 0;
        float _802 = _792;
        float _804 = _794;
        float _806 = _796;
        int _808 = _790;
        if (_800)
        {
            _748 = _790;
        }
        int _810 = _748;
        int _812 = _810;
        int _814 = _810;
        if (!_800)
        {
            bool _816 = _792 > 0.800000011920928955078125;
            bool _818 = isnan(_792);
            bool _820 = _816 || _818;
            bool _822 = isnan(0.800000011920928955078125);
            bool _824 = _820 || _822;
            bool _826 = _794 != 0.0;
            bool _828 = isnan(_794);
            bool _830 = _826 || _828;
            bool _832 = isnan(0.0);
            bool _834 = _830 || _832;
            bool _836 = !_824;
            bool _838 = _834 || _836;
            if (_838)
            {
                _812 = 1;
            }
            int _840 = _812;
            _814 = _840;
            if (!_838)
            {
                float2 _3115 = float2(_796, _160);
                float2 _842 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3115, float2(0.0), isnan(_3115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3115, float2(0.0), isnan(_3115)), level(0.0)).xy;
                float _844 = _842.x;
                float _846 = _842.y;
                float _848 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _796);
                _814 = _790;
                _802 = _846;
                _804 = _844;
                _806 = _848;
            }
        }
        int _850 = _814;
        float _852 = _802;
        float _854 = _804;
        float _856 = _806;
        int _858 = _850 & 1;
        bool _860 = _858 != 0;
        float _862 = _852;
        float _864 = _854;
        float _866 = _856;
        int _868 = _850;
        if (_860)
        {
            _808 = _850;
        }
        int _870 = _808;
        int _872 = _870;
        int _874 = _870;
        if (!_860)
        {
            bool _876 = _852 > 0.800000011920928955078125;
            bool _878 = isnan(_852);
            bool _880 = _876 || _878;
            bool _882 = isnan(0.800000011920928955078125);
            bool _884 = _880 || _882;
            bool _886 = _854 != 0.0;
            bool _888 = isnan(_854);
            bool _890 = _886 || _888;
            bool _892 = isnan(0.0);
            bool _894 = _890 || _892;
            bool _896 = !_884;
            bool _898 = _894 || _896;
            if (_898)
            {
                _872 = 1;
            }
            int _900 = _872;
            _874 = _900;
            if (!_898)
            {
                float2 _3194 = float2(_856, _160);
                float2 _902 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3194, float2(0.0), isnan(_3194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3194, float2(0.0), isnan(_3194)), level(0.0)).xy;
                float _904 = _902.x;
                float _906 = _902.y;
                float _908 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _856);
                _874 = _850;
                _862 = _906;
                _864 = _904;
                _866 = _908;
            }
        }
        int _910 = _874;
        float _912 = _862;
        float _914 = _864;
        float _916 = _866;
        int _918 = _910 & 1;
        bool _920 = _918 != 0;
        float _922 = _912;
        float _924 = _914;
        float _926 = _916;
        if (_920)
        {
            _868 = _910;
        }
        int _928 = _868;
        int _930 = _928;
        int _932 = _928;
        if (!_920)
        {
            bool _934 = _912 > 0.800000011920928955078125;
            bool _936 = isnan(_912);
            bool _938 = _934 || _936;
            bool _940 = isnan(0.800000011920928955078125);
            bool _942 = _938 || _940;
            bool _944 = _914 != 0.0;
            bool _946 = isnan(_914);
            bool _948 = _944 || _946;
            bool _950 = isnan(0.0);
            bool _952 = _948 || _950;
            bool _954 = !_942;
            bool _956 = _952 || _954;
            if (_956)
            {
                _930 = 1;
            }
            int _958 = _930;
            _932 = _958;
            if (!_956)
            {
                float2 _3272 = float2(_916, _160);
                float2 _960 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3272, float2(0.0), isnan(_3272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3272, float2(0.0), isnan(_3272)), level(0.0)).xy;
                float _962 = _960.x;
                float _964 = _960.y;
                float _966 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _916);
                _932 = _910;
                _922 = _964;
                _924 = _962;
                _926 = _966;
            }
        }
        int _968 = _932;
        float _970 = _922;
        float _972 = _924;
        float _974 = _926;
        int _976 = _968 & 1;
        bool _978 = _976 != 0;
        float _980 = _972;
        float _982 = _970;
        float _984 = _974;
        if (!_978)
        {
            bool _986 = _970 > 0.800000011920928955078125;
            bool _988 = isnan(_970);
            bool _990 = _986 || _988;
            bool _992 = isnan(0.800000011920928955078125);
            bool _994 = _990 || _992;
            bool _996 = _972 != 0.0;
            bool _998 = isnan(_972);
            bool _1000 = _996 || _998;
            bool _1002 = isnan(0.0);
            bool _1004 = _1000 || _1002;
            bool _1006 = !_994;
            bool _1008 = _1004 || _1006;
            if (!_1008)
            {
                float2 _3338 = float2(_974, _160);
                float2 _1010 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3338, float2(0.0), isnan(_3338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3338, float2(0.0), isnan(_3338)), level(0.0)).xy;
                float _1012 = _1010.x;
                float _1014 = _1010.y;
                float _1016 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _974);
                _980 = _1012;
                _982 = _1014;
                _984 = _1016;
            }
        }
        float _1018 = _980;
        float _1020 = _982;
        float _1022 = _984;
        float _1024 = fma(_1018, 0.5, 0.5234375);
        float _1026 = fma(_1020, 2.0, 0.03125);
        float _1028 = fma(_684, 0.5, 0.0078125);
        float _1030 = fma(_686, 2.0, 0.03125);
        float2 _3373 = float2(_1024, _1026);
        float _1032 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).x;
        float2 _3381 = float2(_1028, _1030);
        float _1034 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_3381, float2(0.0), isnan(_3381)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_3381, float2(0.0), isnan(_3381)), level(0.0)).x;
        float _1036 = fma(_1032, -2.007874011993408203125, 3.25);
        float _1038 = fma(_1034, -2.007874011993408203125, 3.25);
        float _1040 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _1042 = fma(_1036, _1040, _1022);
        float _1044 = fma(_1038, (*spvDescriptorSet0.cp_c3)._m0[0].z, _688);
        float2 _3407 = float2(_1042, _128);
        float _1046 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3407, float2(0.0), isnan(_3407)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3407, float2(0.0), isnan(_3407)), level(0.0), int2(1, 0)).x;
        float2 _3416 = float2(_1044, _128);
        float _1048 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3416, float2(0.0), isnan(_3416)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3416, float2(0.0), isnan(_3416)), level(0.0)).x;
        float _1050 = -_112;
        float _1052 = fma(_1044, (*spvDescriptorSet0.cp_c3)._m0[0].x, _1050);
        float _1054 = -_112;
        float _1056 = fma(_1042, (*spvDescriptorSet0.cp_c3)._m0[0].x, _1054);
        float _1058 = rint(_1052);
        float _1060 = rint(_1056);
        float _1062 = abs(_1058);
        float _1064 = sqrt(_1062);
        float _1066 = abs(_1060);
        float _1068 = sqrt(_1066);
        float _1070 = _1046 * 4.0;
        float _1072 = _1048 * 4.0;
        float _1074 = rint(_1070);
        float _1076 = rint(_1072);
        float _1078 = fma(_1074, 16.0, _1068);
        float _1080 = fma(_1078, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _1082 = fma(_1076, 16.0, _1064);
        float _1084 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _1080);
        float _1086 = fma(_1082, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float2 _3479 = float2(_1086, _1084);
        float2 _1088 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_3479, float2(0.0), isnan(_3479)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_3479, float2(0.0), isnan(_3479)), level(0.0)).xy;
        float _1090 = _1088.x;
        float _1092 = _1088.y;
        _136 = _1060;
        _148 = _1048;
        _150 = 1.4012984643248170709237295832899e-45;
        _152 = 0.00357142859138548374176025390625;
        _154 = as_type<int>(_1070);
        _156 = _1090;
        _158 = _1092;
    }
    float _1094 = _136;
    float _1096 = _148;
    float _1098 = _150;
    float _1100 = _152;
    int _1102 = _154;
    float _1104 = _156;
    float _1106 = _158;
    bool _1108 = _122 > 0.0;
    float _1110 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _116);
    float _1112 = _1094;
    float _1114 = _1096;
    float _1116 = _1098;
    float _1118 = _1100;
    int _1120 = _1102;
    if (!_1108)
    {
        _138 = 0.0;
        _1112 = 0.0;
    }
    float _1122 = _138;
    float _1124 = _1112;
    bool _1126 = !_1108;
    float _1128 = _1122;
    float _1130 = _1124;
    if (!_1126)
    {
        float _1132 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _118);
        float2 _3534 = float2(_1110, _128);
        float2 _1134 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3534, float2(0.0), isnan(_3534)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3534, float2(0.0), isnan(_3534)), level(0.0)).xy;
        float _1136 = _1134.x;
        float _1138 = _1134.y;
        float2 _3546 = float2(_1110, _1132);
        float2 _1140 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3546, float2(0.0), isnan(_3546)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3546, float2(0.0), isnan(_3546)), level(0.0)).xy;
        float _1142 = _1140.x;
        float _1144 = _1140.y;
        float _1146 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _128);
        float _1148 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1132);
        bool _1150 = _1136 > 0.800000011920928955078125;
        bool _1152 = isnan(_1136);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan(0.800000011920928955078125);
        bool _1158 = _1154 || _1156;
        bool _1160 = _1142 > 0.800000011920928955078125;
        bool _1162 = isnan(_1142);
        bool _1164 = _1160 || _1162;
        bool _1166 = isnan(0.800000011920928955078125);
        bool _1168 = _1164 || _1166;
        bool _1170 = _1138 != 0.0;
        bool _1172 = isnan(_1138);
        bool _1174 = _1170 || _1172;
        bool _1176 = isnan(0.0);
        bool _1178 = _1174 || _1176;
        bool _1180 = !_1158;
        bool _1182 = _1178 || _1180;
        bool _1184 = _1144 != 0.0;
        bool _1186 = isnan(_1144);
        bool _1188 = _1184 || _1186;
        bool _1190 = isnan(0.0);
        bool _1192 = _1188 || _1190;
        bool _1194 = !_1168;
        bool _1196 = _1192 || _1194;
        int _1198 = as_type<int>(_1136);
        float _1200 = _1138;
        int _1202 = as_type<int>(_1132);
        int _1204 = as_type<int>(_1146);
        float _1206 = _1148;
        if (_1182)
        {
            _1114 = _1136;
        }
        float _1208 = _1114;
        if (_1182)
        {
            _1116 = _1138;
        }
        float _1210 = _1116;
        if (_1196)
        {
            _1118 = _1142;
        }
        float _1212 = _1118;
        if (_1196)
        {
            _140 = _1144;
        }
        float _1214 = _140;
        float _1216 = _1208;
        float _1218 = _1210;
        if (!_1182)
        {
            float2 _3653 = float2(_1110, _1146);
            float2 _1220 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3653, float2(0.0), isnan(_3653)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3653, float2(0.0), isnan(_3653)), level(0.0)).xy;
            float _1222 = _1220.x;
            float _1224 = _1220.y;
            _1216 = _1222;
            _1218 = _1224;
        }
        float _1226 = _1216;
        float _1228 = _1218;
        float _1230 = _1212;
        float _1232 = _1214;
        if (!_1196)
        {
            float2 _3675 = float2(_1110, _1148);
            float2 _1234 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3675, float2(0.0), isnan(_3675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3675, float2(0.0), isnan(_3675)), level(0.0)).xy;
            float _1236 = _1234.x;
            float _1238 = _1234.y;
            _1230 = _1236;
            _1232 = _1238;
        }
        float _1240 = _1230;
        float _1242 = _1232;
        if (_1182)
        {
            _1198 = 1;
        }
        int _1244 = _1198;
        int _1246 = _1244;
        if (!_1182)
        {
            _1246 = 0;
        }
        int _1248 = _1246;
        int _1250 = _1248;
        if (_1182)
        {
            _1200 = _1146;
        }
        float _1252 = _1200;
        float _1254 = _1252;
        if (!_1182)
        {
            float _1256 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1146);
            _1254 = _1256;
        }
        float _1258 = _1254;
        int _1260 = _1248 & 1;
        bool _1262 = _1260 != 0;
        float _1264 = _1258;
        if (_1262)
        {
            _1202 = _1248;
        }
        int _1266 = _1202;
        int _1268 = _1266;
        int _1270 = _1266;
        float _1272 = _1226;
        float _1274 = _1228;
        float _1276 = _1240;
        float _1278 = _1242;
        if (!_1262)
        {
            bool _1280 = _1226 > 0.800000011920928955078125;
            bool _1282 = isnan(_1226);
            bool _1284 = _1280 || _1282;
            bool _1286 = isnan(0.800000011920928955078125);
            bool _1288 = _1284 || _1286;
            bool _1290 = _1228 != 0.0;
            bool _1292 = isnan(_1228);
            bool _1294 = _1290 || _1292;
            bool _1296 = isnan(0.0);
            bool _1298 = _1294 || _1296;
            bool _1300 = !_1288;
            bool _1302 = _1298 || _1300;
            if (_1302)
            {
                _1268 = 1;
            }
            int _1304 = _1268;
            _1270 = _1304;
            if (!_1302)
            {
                float2 _3773 = float2(_1110, _1258);
                float2 _1306 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3773, float2(0.0), isnan(_3773)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3773, float2(0.0), isnan(_3773)), level(0.0)).xy;
                float _1308 = _1306.x;
                float _1310 = _1306.y;
                float _1312 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1258);
                _1270 = _1248;
                _1272 = _1308;
                _1274 = _1310;
                _1264 = _1312;
            }
        }
        int _1314 = _1270;
        float _1316 = _1272;
        float _1318 = _1274;
        float _1320 = _1264;
        int _1322 = _1314 & 1;
        bool _1324 = _1322 != 0;
        float _1326 = _1316;
        float _1328 = _1318;
        float _1330 = _1320;
        float _1332 = as_type<float>(_1314);
        if (_1324)
        {
            _1204 = _1314;
        }
        int _1334 = _1204;
        int _1336 = _1334;
        int _1338 = _1334;
        if (!_1324)
        {
            bool _1340 = _1316 > 0.800000011920928955078125;
            bool _1342 = isnan(_1316);
            bool _1344 = _1340 || _1342;
            bool _1346 = isnan(0.800000011920928955078125);
            bool _1348 = _1344 || _1346;
            bool _1350 = _1318 != 0.0;
            bool _1352 = isnan(_1318);
            bool _1354 = _1350 || _1352;
            bool _1356 = isnan(0.0);
            bool _1358 = _1354 || _1356;
            bool _1360 = !_1348;
            bool _1362 = _1358 || _1360;
            if (_1362)
            {
                _1336 = 1;
            }
            int _1364 = _1336;
            _1338 = _1364;
            if (!_1362)
            {
                float2 _3853 = float2(_1110, _1320);
                float2 _1366 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3853, float2(0.0), isnan(_3853)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3853, float2(0.0), isnan(_3853)), level(0.0)).xy;
                float _1368 = _1366.x;
                float _1370 = _1366.y;
                float _1372 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1320);
                _1338 = _1314;
                _1326 = _1368;
                _1328 = _1370;
                _1330 = _1372;
            }
        }
        int _1374 = _1338;
        float _1376 = _1326;
        float _1378 = _1328;
        float _1380 = _1330;
        int _1382 = _1374 & 1;
        bool _1384 = _1382 != 0;
        float _1386 = _1376;
        float _1388 = _1378;
        float _1390 = _1380;
        int _1392 = _1374;
        if (_1384)
        {
            _1250 = _1374;
        }
        int _1394 = _1250;
        int _1396 = _1394;
        int _1398 = _1394;
        if (!_1384)
        {
            bool _1400 = _1376 > 0.800000011920928955078125;
            bool _1402 = isnan(_1376);
            bool _1404 = _1400 || _1402;
            bool _1406 = isnan(0.800000011920928955078125);
            bool _1408 = _1404 || _1406;
            bool _1410 = _1378 != 0.0;
            bool _1412 = isnan(_1378);
            bool _1414 = _1410 || _1412;
            bool _1416 = isnan(0.0);
            bool _1418 = _1414 || _1416;
            bool _1420 = !_1408;
            bool _1422 = _1418 || _1420;
            if (_1422)
            {
                _1396 = 1;
            }
            int _1424 = _1396;
            _1398 = _1424;
            if (!_1422)
            {
                float2 _3932 = float2(_1110, _1380);
                float2 _1426 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3932, float2(0.0), isnan(_3932)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3932, float2(0.0), isnan(_3932)), level(0.0)).xy;
                float _1428 = _1426.x;
                float _1430 = _1426.y;
                float _1432 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1380);
                _1398 = _1374;
                _1386 = _1428;
                _1388 = _1430;
                _1390 = _1432;
            }
        }
        int _1434 = _1398;
        float _1436 = _1386;
        float _1438 = _1388;
        float _1440 = _1390;
        int _1442 = _1434 & 1;
        bool _1444 = _1442 != 0;
        float _1446 = _1440;
        float _1448 = _1436;
        float _1450 = _1438;
        int _1452 = _1434;
        if (_1444)
        {
            _1392 = _1434;
        }
        int _1454 = _1392;
        int _1456 = _1454;
        int _1458 = _1454;
        if (!_1444)
        {
            bool _1460 = _1436 > 0.800000011920928955078125;
            bool _1462 = isnan(_1436);
            bool _1464 = _1460 || _1462;
            bool _1466 = isnan(0.800000011920928955078125);
            bool _1468 = _1464 || _1466;
            bool _1470 = _1438 != 0.0;
            bool _1472 = isnan(_1438);
            bool _1474 = _1470 || _1472;
            bool _1476 = isnan(0.0);
            bool _1478 = _1474 || _1476;
            bool _1480 = !_1468;
            bool _1482 = _1478 || _1480;
            if (_1482)
            {
                _1456 = 1;
            }
            int _1484 = _1456;
            _1458 = _1484;
            if (!_1482)
            {
                float2 _4011 = float2(_1110, _1440);
                float2 _1486 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4011, float2(0.0), isnan(_4011)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4011, float2(0.0), isnan(_4011)), level(0.0)).xy;
                float _1488 = _1486.x;
                float _1490 = _1486.y;
                float _1492 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1440);
                _1458 = _1434;
                _1446 = _1492;
                _1448 = _1488;
                _1450 = _1490;
            }
        }
        int _1494 = _1458;
        float _1496 = _1446;
        float _1498 = _1448;
        float _1500 = _1450;
        int _1502 = _1494 & 1;
        bool _1504 = _1502 != 0;
        float _1506 = _1498;
        float _1508 = _1500;
        float _1510 = _1496;
        int _1512 = _1494;
        if (_1196)
        {
            _1120 = 1;
        }
        int _1514 = _1120;
        int _1516 = _1514;
        if (!_1196)
        {
            _1516 = 0;
        }
        int _1518 = _1516;
        int _1520 = _1518 & 1;
        bool _1522 = _1520 != 0;
        int _1524 = _1518;
        if (_1504)
        {
            _1332 = _1496;
        }
        float _1526 = _1332;
        float _1528 = _1526;
        float _1530 = _1526;
        if (_1504)
        {
            _1452 = _1494;
        }
        int _1532 = _1452;
        int _1534 = _1532;
        int _1536 = _1532;
        if (!_1504)
        {
            bool _1538 = _1498 > 0.800000011920928955078125;
            bool _1540 = isnan(_1498);
            bool _1542 = _1538 || _1540;
            bool _1544 = isnan(0.800000011920928955078125);
            bool _1546 = _1542 || _1544;
            bool _1548 = _1500 != 0.0;
            bool _1550 = isnan(_1500);
            bool _1552 = _1548 || _1550;
            bool _1554 = isnan(0.0);
            bool _1556 = _1552 || _1554;
            bool _1558 = !_1546;
            bool _1560 = _1556 || _1558;
            if (_1560)
            {
                _1528 = _1496;
            }
            float _1562 = _1528;
            _1530 = _1562;
            if (_1560)
            {
                _1534 = 1;
            }
            int _1564 = _1534;
            _1536 = _1564;
            if (!_1560)
            {
                float2 _4118 = float2(_1110, _1496);
                float2 _1566 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4118, float2(0.0), isnan(_4118)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4118, float2(0.0), isnan(_4118)), level(0.0)).xy;
                float _1568 = _1566.x;
                float _1570 = _1566.y;
                float _1572 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1496);
                _1536 = _1494;
                _1506 = _1568;
                _1508 = _1570;
                _1530 = _1572;
            }
        }
        int _1574 = _1536;
        float _1576 = _1506;
        float _1578 = _1508;
        float _1580 = _1530;
        int _1582 = _1574 & 1;
        bool _1584 = _1582 != 0;
        float _1586 = as_type<float>(_1574);
        float _1588 = _1580;
        if (!_1196)
        {
            float _1590 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1148);
            _1206 = _1590;
        }
        float _1592 = _1206;
        float _1594 = _1592;
        if (_1584)
        {
            _1586 = _1576;
        }
        float _1596 = _1586;
        float _1598 = _1596;
        float _1600 = _1596;
        if (_1584)
        {
            _1510 = _1578;
        }
        float _1602 = _1510;
        float _1604 = _1602;
        float _1606 = _1602;
        if (!_1584)
        {
            bool _1608 = _1576 > 0.800000011920928955078125;
            bool _1610 = isnan(_1576);
            bool _1612 = _1608 || _1610;
            bool _1614 = isnan(0.800000011920928955078125);
            bool _1616 = _1612 || _1614;
            bool _1618 = _1578 != 0.0;
            bool _1620 = isnan(_1578);
            bool _1622 = _1618 || _1620;
            bool _1624 = isnan(0.0);
            bool _1626 = _1622 || _1624;
            bool _1628 = !_1616;
            bool _1630 = _1626 || _1628;
            if (_1630)
            {
                _1598 = _1576;
            }
            float _1632 = _1598;
            _1600 = _1632;
            if (_1630)
            {
                _1604 = _1578;
            }
            float _1634 = _1604;
            _1606 = _1634;
            if (!_1630)
            {
                float2 _4221 = float2(_1110, _1580);
                float2 _1636 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4221, float2(0.0), isnan(_4221)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4221, float2(0.0), isnan(_4221)), level(0.0)).xy;
                float _1638 = _1636.x;
                float _1640 = _1636.y;
                float _1642 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1580);
                _1600 = _1638;
                _1606 = _1640;
                _1588 = _1642;
            }
        }
        float _1644 = _1600;
        float _1646 = _1606;
        float _1648 = _1588;
        if (_1522)
        {
            _1512 = _1518;
        }
        int _1650 = _1512;
        int _1652 = _1650;
        int _1654 = _1650;
        if (!_1522)
        {
            bool _1656 = _1240 > 0.800000011920928955078125;
            bool _1658 = isnan(_1240);
            bool _1660 = _1656 || _1658;
            bool _1662 = isnan(0.800000011920928955078125);
            bool _1664 = _1660 || _1662;
            bool _1666 = _1242 != 0.0;
            bool _1668 = isnan(_1242);
            bool _1670 = _1666 || _1668;
            bool _1672 = isnan(0.0);
            bool _1674 = _1670 || _1672;
            bool _1676 = !_1664;
            bool _1678 = _1674 || _1676;
            if (_1678)
            {
                _1652 = 1;
            }
            int _1680 = _1652;
            _1654 = _1680;
            if (!_1678)
            {
                float2 _4290 = float2(_1110, _1592);
                float2 _1682 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4290, float2(0.0), isnan(_4290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4290, float2(0.0), isnan(_4290)), level(0.0)).xy;
                float _1684 = _1682.x;
                float _1686 = _1682.y;
                float _1688 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1592);
                _1654 = _1518;
                _1276 = _1684;
                _1278 = _1686;
                _1594 = _1688;
            }
        }
        int _1690 = _1654;
        float _1692 = _1276;
        float _1694 = _1278;
        float _1696 = _1594;
        int _1698 = _1690 & 1;
        bool _1700 = _1698 != 0;
        float _1702 = _1692;
        float _1704 = _1694;
        float _1706 = _1696;
        int _1708 = _1690;
        if (_1700)
        {
            _1524 = _1690;
        }
        int _1710 = _1524;
        int _1712 = _1710;
        int _1714 = _1710;
        if (!_1700)
        {
            bool _1716 = _1692 > 0.800000011920928955078125;
            bool _1718 = isnan(_1692);
            bool _1720 = _1716 || _1718;
            bool _1722 = isnan(0.800000011920928955078125);
            bool _1724 = _1720 || _1722;
            bool _1726 = _1694 != 0.0;
            bool _1728 = isnan(_1694);
            bool _1730 = _1726 || _1728;
            bool _1732 = isnan(0.0);
            bool _1734 = _1730 || _1732;
            bool _1736 = !_1724;
            bool _1738 = _1734 || _1736;
            if (_1738)
            {
                _1712 = 1;
            }
            int _1740 = _1712;
            _1714 = _1740;
            if (!_1738)
            {
                float2 _4369 = float2(_1110, _1696);
                float2 _1742 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4369, float2(0.0), isnan(_4369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4369, float2(0.0), isnan(_4369)), level(0.0)).xy;
                float _1744 = _1742.x;
                float _1746 = _1742.y;
                float _1748 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1696);
                _1714 = _1690;
                _1702 = _1744;
                _1704 = _1746;
                _1706 = _1748;
            }
        }
        int _1750 = _1714;
        float _1752 = _1702;
        float _1754 = _1704;
        float _1756 = _1706;
        int _1758 = _1750 & 1;
        bool _1760 = _1758 != 0;
        float _1762 = _1752;
        float _1764 = _1754;
        float _1766 = _1756;
        int _1768 = _1750;
        if (_1760)
        {
            _1708 = _1750;
        }
        int _1770 = _1708;
        int _1772 = _1770;
        int _1774 = _1770;
        if (!_1760)
        {
            bool _1776 = _1752 > 0.800000011920928955078125;
            bool _1778 = isnan(_1752);
            bool _1780 = _1776 || _1778;
            bool _1782 = isnan(0.800000011920928955078125);
            bool _1784 = _1780 || _1782;
            bool _1786 = _1754 != 0.0;
            bool _1788 = isnan(_1754);
            bool _1790 = _1786 || _1788;
            bool _1792 = isnan(0.0);
            bool _1794 = _1790 || _1792;
            bool _1796 = !_1784;
            bool _1798 = _1794 || _1796;
            if (_1798)
            {
                _1772 = 1;
            }
            int _1800 = _1772;
            _1774 = _1800;
            if (!_1798)
            {
                float2 _4448 = float2(_1110, _1756);
                float2 _1802 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4448, float2(0.0), isnan(_4448)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4448, float2(0.0), isnan(_4448)), level(0.0)).xy;
                float _1804 = _1802.x;
                float _1806 = _1802.y;
                float _1808 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1756);
                _1774 = _1750;
                _1762 = _1804;
                _1764 = _1806;
                _1766 = _1808;
            }
        }
        int _1810 = _1774;
        float _1812 = _1762;
        float _1814 = _1764;
        float _1816 = _1766;
        int _1818 = _1810 & 1;
        bool _1820 = _1818 != 0;
        float _1822 = _1812;
        float _1824 = _1814;
        float _1826 = _1816;
        int _1828 = _1810;
        if (_1820)
        {
            _1768 = _1810;
        }
        int _1830 = _1768;
        int _1832 = _1830;
        int _1834 = _1830;
        if (!_1820)
        {
            bool _1836 = _1812 > 0.800000011920928955078125;
            bool _1838 = isnan(_1812);
            bool _1840 = _1836 || _1838;
            bool _1842 = isnan(0.800000011920928955078125);
            bool _1844 = _1840 || _1842;
            bool _1846 = _1814 != 0.0;
            bool _1848 = isnan(_1814);
            bool _1850 = _1846 || _1848;
            bool _1852 = isnan(0.0);
            bool _1854 = _1850 || _1852;
            bool _1856 = !_1844;
            bool _1858 = _1854 || _1856;
            if (_1858)
            {
                _1832 = 1;
            }
            int _1860 = _1832;
            _1834 = _1860;
            if (!_1858)
            {
                float2 _4527 = float2(_1110, _1816);
                float2 _1862 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4527, float2(0.0), isnan(_4527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4527, float2(0.0), isnan(_4527)), level(0.0)).xy;
                float _1864 = _1862.x;
                float _1866 = _1862.y;
                float _1868 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1816);
                _1834 = _1810;
                _1822 = _1864;
                _1824 = _1866;
                _1826 = _1868;
            }
        }
        int _1870 = _1834;
        float _1872 = _1822;
        float _1874 = _1824;
        float _1876 = _1826;
        int _1878 = _1870 & 1;
        bool _1880 = _1878 != 0;
        float _1882 = _1872;
        float _1884 = _1874;
        float _1886 = _1876;
        if (_1880)
        {
            _1828 = _1870;
        }
        int _1888 = _1828;
        int _1890 = _1888;
        int _1892 = _1888;
        if (!_1880)
        {
            bool _1894 = _1872 > 0.800000011920928955078125;
            bool _1896 = isnan(_1872);
            bool _1898 = _1894 || _1896;
            bool _1900 = isnan(0.800000011920928955078125);
            bool _1902 = _1898 || _1900;
            bool _1904 = _1874 != 0.0;
            bool _1906 = isnan(_1874);
            bool _1908 = _1904 || _1906;
            bool _1910 = isnan(0.0);
            bool _1912 = _1908 || _1910;
            bool _1914 = !_1902;
            bool _1916 = _1912 || _1914;
            if (_1916)
            {
                _1890 = 1;
            }
            int _1918 = _1890;
            _1892 = _1918;
            if (!_1916)
            {
                float2 _4605 = float2(_1110, _1876);
                float2 _1920 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4605, float2(0.0), isnan(_4605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4605, float2(0.0), isnan(_4605)), level(0.0)).xy;
                float _1922 = _1920.x;
                float _1924 = _1920.y;
                float _1926 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1876);
                _1892 = _1870;
                _1882 = _1922;
                _1884 = _1924;
                _1886 = _1926;
            }
        }
        int _1928 = _1892;
        float _1930 = _1882;
        float _1932 = _1884;
        float _1934 = _1886;
        int _1936 = _1928 & 1;
        bool _1938 = _1936 != 0;
        float _1940 = _1932;
        float _1942 = _1930;
        float _1944 = _1934;
        if (!_1938)
        {
            bool _1946 = _1930 > 0.800000011920928955078125;
            bool _1948 = isnan(_1930);
            bool _1950 = _1946 || _1948;
            bool _1952 = isnan(0.800000011920928955078125);
            bool _1954 = _1950 || _1952;
            bool _1956 = _1932 != 0.0;
            bool _1958 = isnan(_1932);
            bool _1960 = _1956 || _1958;
            bool _1962 = isnan(0.0);
            bool _1964 = _1960 || _1962;
            bool _1966 = !_1954;
            bool _1968 = _1964 || _1966;
            if (!_1968)
            {
                float2 _4671 = float2(_1110, _1934);
                float2 _1970 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4671, float2(0.0), isnan(_4671)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4671, float2(0.0), isnan(_4671)), level(0.0)).xy;
                float _1972 = _1970.x;
                float _1974 = _1970.y;
                float _1976 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1934);
                _1940 = _1974;
                _1942 = _1972;
                _1944 = _1976;
            }
        }
        float _1978 = _1940;
        float _1980 = _1942;
        float _1982 = _1944;
        float _1984 = fma(_1978, 0.5, 0.5234375);
        float _1986 = fma(_1980, 2.0, 0.03125);
        float _1988 = fma(_1644, 2.0, 0.03125);
        float _1990 = fma(_1646, 0.5, 0.0078125);
        float2 _4703 = float2(_1984, _1986);
        float _1992 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_4703, float2(0.0), isnan(_4703)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_4703, float2(0.0), isnan(_4703)), level(0.0)).x;
        float2 _4711 = float2(_1990, _1988);
        float _1994 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_4711, float2(0.0), isnan(_4711)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_4711, float2(0.0), isnan(_4711)), level(0.0)).x;
        float _1996 = fma(_1992, -2.007874011993408203125, 3.25);
        float _1998 = fma(_1994, -2.007874011993408203125, 3.25);
        float _2000 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _2002 = fma(_1996, _2000, _1982);
        float _2004 = fma(_1998, (*spvDescriptorSet0.cp_c3)._m0[0].w, _1648);
        float2 _4735 = float2(_126, _2002);
        float _2006 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4735, float2(0.0), isnan(_4735)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4735, float2(0.0), isnan(_4735)), level(0.0), int2(0, 1)).y;
        float2 _4744 = float2(_126, _2004);
        float _2008 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4744, float2(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4744, float2(0.0), isnan(_4744)), level(0.0)).y;
        float _2010 = -_114;
        float _2012 = fma(_2004, (*spvDescriptorSet0.cp_c3)._m0[0].y, _2010);
        float _2014 = -_114;
        float _2016 = fma(_2002, (*spvDescriptorSet0.cp_c3)._m0[0].y, _2014);
        float _2018 = rint(_2012);
        float _2020 = rint(_2016);
        float _2022 = abs(_2018);
        float _2024 = sqrt(_2022);
        float _2026 = abs(_2020);
        float _2028 = sqrt(_2026);
        float _2030 = _2006 * 4.0;
        float _2032 = _2008 * 4.0;
        float _2034 = rint(_2030);
        float _2036 = rint(_2032);
        float _2038 = fma(_2034, 16.0, _2028);
        float _2040 = fma(_2038, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _2042 = fma(_2036, 16.0, _2024);
        float _2044 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _2040);
        float _2046 = fma(_2042, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float2 _4800 = float2(_2046, _2044);
        float2 _2048 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_4800, float2(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_4800, float2(0.0), isnan(_4800)), level(0.0)).xy;
        float _2050 = _2048.x;
        float _2052 = _2048.y;
        _1128 = _2050;
        _1130 = _2052;
    }
    float _2054 = _1128;
    float _2056 = _1130;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1104, _1106, _2054, _2056), uint2(int2(as_type<int>(_104), as_type<int>(_106))));
}

