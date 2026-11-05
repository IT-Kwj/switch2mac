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
int _48(thread const int& _4848, thread const int& _4849, constant _10& support_buffer)
{
    int _4852 = 1 + _4849;
    float _4854 = support_buffer._m5[_4852].x;
    bool _4856 = _4854 == 1.0;
    if (_4856)
    {
        return _4848;
    }
    float _4858 = float(_4848);
    float _4860 = _4858 * _4854;
    int _4862 = int(_4860);
    return _4862;
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
    float2 _2169 = float2(_130, _126);
    float2 _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2169, float2(0.0), isnan(_2169)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2169, float2(0.0), isnan(_2169)), level(0.0)).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _126);
    float _140 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.25, _126);
    float _142 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _130);
    bool _144 = _136 > 0.0;
    float _146 = fma(-0.125, (*spvDescriptorSet0.cp_c3)._m0[0].w, _126);
    float _148 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.25, _130);
    float _150 = 0.0;
    float _152 = _126;
    int _154 = as_type<int>(_130);
    float _156 = _138;
    int _158 = as_type<int>(_140);
    if (!_144)
    {
        _150 = 0.0;
        _152 = 0.0;
    }
    float _160 = _150;
    float _162 = _152;
    bool _164 = !_144;
    float _166 = 0.0;
    float _168 = 0.0;
    float _170 = 0.0;
    float _172 = 0.0;
    float _174 = _160;
    float _176 = _162;
    if (!_164)
    {
        float _178 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 1.25, _130);
        float2 _2232 = float2(_148, _146);
        float2 _180 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2232, float2(0.0), isnan(_2232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2232, float2(0.0), isnan(_2232)), level(0.0)).xy;
        float _182 = _180.x;
        float _184 = _180.y;
        float2 _2244 = float2(_178, _146);
        float2 _186 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2244, float2(0.0), isnan(_2244)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2244, float2(0.0), isnan(_2244)), level(0.0)).xy;
        float _188 = _186.x;
        float _190 = _186.y;
        float _192 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _148);
        float _194 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _178);
        bool _196 = _184 >= 0.800000011920928955078125;
        bool _198 = isnan(_184);
        bool _200 = _196 || _198;
        bool _202 = isnan(0.800000011920928955078125);
        bool _204 = _200 || _202;
        bool _206 = _190 > 0.800000011920928955078125;
        bool _208 = isnan(_190);
        bool _210 = _206 || _208;
        bool _212 = isnan(0.800000011920928955078125);
        bool _214 = _210 || _212;
        bool _216 = _182 != 0.0;
        bool _218 = isnan(_182);
        bool _220 = _216 || _218;
        bool _222 = isnan(0.0);
        bool _224 = _220 || _222;
        bool _226 = !_204;
        bool _228 = _224 || _226;
        bool _230 = _188 != 0.0;
        bool _232 = isnan(_188);
        bool _234 = _230 || _232;
        bool _236 = isnan(0.0);
        bool _238 = _234 || _236;
        bool _240 = !_214;
        bool _242 = _238 || _240;
        float _244 = 0.0;
        float _246 = _182;
        float _248 = _184;
        float _250 = _178;
        int _252 = as_type<int>(_192);
        float _254 = _194;
        float _256 = _188;
        if (_228)
        {
            _244 = _182;
        }
        float _258 = _244;
        float _260 = 0.0;
        if (_228)
        {
            _260 = _184;
        }
        float _262 = _260;
        if (_242)
        {
            _246 = _188;
        }
        float _264 = _246;
        if (_242)
        {
            _248 = _190;
        }
        float _266 = _248;
        float _268 = _258;
        float _270 = _262;
        if (!_228)
        {
            float2 _2353 = float2(_192, _146);
            float2 _272 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2353, float2(0.0), isnan(_2353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2353, float2(0.0), isnan(_2353)), level(0.0)).xy;
            float _274 = _272.x;
            float _276 = _272.y;
            _268 = _274;
            _270 = _276;
        }
        float _278 = _268;
        float _280 = _270;
        float _282 = _264;
        float _284 = _266;
        if (!_242)
        {
            float2 _2375 = float2(_194, _146);
            float2 _286 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2375, float2(0.0), isnan(_2375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2375, float2(0.0), isnan(_2375)), level(0.0)).xy;
            float _288 = _286.x;
            float _290 = _286.y;
            _282 = _288;
            _284 = _290;
        }
        float _292 = _282;
        float _294 = _284;
        int _296 = 0;
        if (_228)
        {
            _296 = 1;
        }
        int _298 = _296;
        int _300 = _298;
        if (!_228)
        {
            _300 = 0;
        }
        int _302 = _300;
        int _304 = _302;
        if (_228)
        {
            _250 = _192;
        }
        float _306 = _250;
        float _308 = _306;
        if (!_228)
        {
            float _310 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _192);
            _308 = _310;
        }
        float _312 = _308;
        int _314 = _302 & 1;
        bool _316 = _314 != 0;
        int _318 = 0;
        float _320 = _312;
        if (_316)
        {
            _318 = _302;
        }
        int _322 = _318;
        int _324 = _322;
        int _326 = _322;
        float _328 = _280;
        float _330 = _278;
        float _332 = _294;
        float _334 = _292;
        if (!_316)
        {
            bool _336 = _280 >= 0.800000011920928955078125;
            bool _338 = isnan(_280);
            bool _340 = _336 || _338;
            bool _342 = isnan(0.800000011920928955078125);
            bool _344 = _340 || _342;
            bool _346 = _278 != 0.0;
            bool _348 = isnan(_278);
            bool _350 = _346 || _348;
            bool _352 = isnan(0.0);
            bool _354 = _350 || _352;
            bool _356 = !_344;
            bool _358 = _354 || _356;
            if (_358)
            {
                _324 = 1;
            }
            int _360 = _324;
            _326 = _360;
            if (!_358)
            {
                float2 _2474 = float2(_312, _146);
                float2 _362 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2474, float2(0.0), isnan(_2474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2474, float2(0.0), isnan(_2474)), level(0.0)).xy;
                float _364 = _362.x;
                float _366 = _362.y;
                float _368 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _312);
                _326 = _302;
                _328 = _366;
                _330 = _364;
                _320 = _368;
            }
        }
        int _370 = _326;
        float _372 = _328;
        float _374 = _330;
        float _376 = _320;
        int _378 = _370 & 1;
        bool _380 = _378 != 0;
        float _382 = _372;
        float _384 = _374;
        float _386 = _376;
        int _388 = _370;
        if (_380)
        {
            _252 = _370;
        }
        int _390 = _252;
        int _392 = _390;
        int _394 = _390;
        if (!_380)
        {
            bool _396 = _372 >= 0.800000011920928955078125;
            bool _398 = isnan(_372);
            bool _400 = _396 || _398;
            bool _402 = isnan(0.800000011920928955078125);
            bool _404 = _400 || _402;
            bool _406 = _374 != 0.0;
            bool _408 = isnan(_374);
            bool _410 = _406 || _408;
            bool _412 = isnan(0.0);
            bool _414 = _410 || _412;
            bool _416 = !_404;
            bool _418 = _414 || _416;
            if (_418)
            {
                _392 = 1;
            }
            int _420 = _392;
            _394 = _420;
            if (!_418)
            {
                float2 _2553 = float2(_376, _146);
                float2 _422 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2553, float2(0.0), isnan(_2553)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2553, float2(0.0), isnan(_2553)), level(0.0)).xy;
                float _424 = _422.x;
                float _426 = _422.y;
                float _428 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _376);
                _394 = _370;
                _382 = _426;
                _384 = _424;
                _386 = _428;
            }
        }
        int _430 = _394;
        float _432 = _382;
        float _434 = _384;
        float _436 = _386;
        int _438 = _430 & 1;
        bool _440 = _438 != 0;
        float _442 = _432;
        float _444 = _434;
        float _446 = _436;
        int _448 = _430;
        if (_440)
        {
            _304 = _430;
        }
        int _450 = _304;
        int _452 = _450;
        int _454 = _450;
        if (!_440)
        {
            bool _456 = _432 >= 0.800000011920928955078125;
            bool _458 = isnan(_432);
            bool _460 = _456 || _458;
            bool _462 = isnan(0.800000011920928955078125);
            bool _464 = _460 || _462;
            bool _466 = _434 != 0.0;
            bool _468 = isnan(_434);
            bool _470 = _466 || _468;
            bool _472 = isnan(0.0);
            bool _474 = _470 || _472;
            bool _476 = !_464;
            bool _478 = _474 || _476;
            if (_478)
            {
                _452 = 1;
            }
            int _480 = _452;
            _454 = _480;
            if (!_478)
            {
                float2 _2632 = float2(_436, _146);
                float2 _482 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2632, float2(0.0), isnan(_2632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2632, float2(0.0), isnan(_2632)), level(0.0)).xy;
                float _484 = _482.x;
                float _486 = _482.y;
                float _488 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _436);
                _454 = _430;
                _442 = _486;
                _444 = _484;
                _446 = _488;
            }
        }
        int _490 = _454;
        float _492 = _442;
        float _494 = _444;
        float _496 = _446;
        int _498 = _490 & 1;
        bool _500 = _498 != 0;
        float _502 = _492;
        float _504 = _494;
        float _506 = _496;
        int _508 = _490;
        if (_500)
        {
            _448 = _490;
        }
        int _510 = _448;
        int _512 = _510;
        int _514 = _510;
        if (!_500)
        {
            bool _516 = _492 >= 0.800000011920928955078125;
            bool _518 = isnan(_492);
            bool _520 = _516 || _518;
            bool _522 = isnan(0.800000011920928955078125);
            bool _524 = _520 || _522;
            bool _526 = _494 != 0.0;
            bool _528 = isnan(_494);
            bool _530 = _526 || _528;
            bool _532 = isnan(0.0);
            bool _534 = _530 || _532;
            bool _536 = !_524;
            bool _538 = _534 || _536;
            if (_538)
            {
                _512 = 1;
            }
            int _540 = _512;
            _514 = _540;
            if (!_538)
            {
                float2 _2711 = float2(_496, _146);
                float2 _542 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2711, float2(0.0), isnan(_2711)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2711, float2(0.0), isnan(_2711)), level(0.0)).xy;
                float _544 = _542.x;
                float _546 = _542.y;
                float _548 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _496);
                _514 = _490;
                _502 = _546;
                _504 = _544;
                _506 = _548;
            }
        }
        int _550 = _514;
        float _552 = _502;
        float _554 = _504;
        float _556 = _506;
        int _558 = _550 & 1;
        bool _560 = _558 != 0;
        float _562 = _556;
        float _564 = _554;
        float _566 = _552;
        float _568 = as_type<float>(_550);
        if (_242)
        {
            _388 = 1;
        }
        int _570 = _388;
        int _572 = _570;
        if (!_242)
        {
            _572 = 0;
        }
        int _574 = _572;
        int _576 = _574 & 1;
        bool _578 = _576 != 0;
        int _580 = _574;
        if (_560)
        {
            _508 = _550;
        }
        int _582 = _508;
        int _584 = _582;
        int _586 = _582;
        if (!_560)
        {
            bool _588 = _552 >= 0.800000011920928955078125;
            bool _590 = isnan(_552);
            bool _592 = _588 || _590;
            bool _594 = isnan(0.800000011920928955078125);
            bool _596 = _592 || _594;
            bool _598 = _554 != 0.0;
            bool _600 = isnan(_554);
            bool _602 = _598 || _600;
            bool _604 = isnan(0.0);
            bool _606 = _602 || _604;
            bool _608 = !_596;
            bool _610 = _606 || _608;
            if (_610)
            {
                _584 = 1;
            }
            int _612 = _584;
            _586 = _612;
            if (!_610)
            {
                float2 _2806 = float2(_556, _146);
                float2 _614 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2806, float2(0.0), isnan(_2806)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2806, float2(0.0), isnan(_2806)), level(0.0)).xy;
                float _616 = _614.x;
                float _618 = _614.y;
                float _620 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _556);
                _586 = _550;
                _562 = _620;
                _564 = _616;
                _566 = _618;
            }
        }
        int _622 = _586;
        float _624 = _562;
        float _626 = _564;
        float _628 = _566;
        int _630 = _622 & 1;
        bool _632 = _630 != 0;
        float _634 = as_type<float>(_622);
        int _636 = as_type<int>(_624);
        if (!_242)
        {
            float _638 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _194);
            _254 = _638;
        }
        float _640 = _254;
        float _642 = _640;
        if (_632)
        {
            _256 = _624;
        }
        float _644 = _256;
        float _646 = _644;
        float _648 = _644;
        if (_632)
        {
            _568 = _626;
        }
        float _650 = _568;
        float _652 = _650;
        float _654 = _650;
        if (_632)
        {
            _634 = _628;
        }
        float _656 = _634;
        float _658 = _656;
        float _660 = _656;
        if (!_632)
        {
            bool _662 = _628 >= 0.800000011920928955078125;
            bool _664 = isnan(_628);
            bool _666 = _662 || _664;
            bool _668 = isnan(0.800000011920928955078125);
            bool _670 = _666 || _668;
            bool _672 = _626 != 0.0;
            bool _674 = isnan(_626);
            bool _676 = _672 || _674;
            bool _678 = isnan(0.0);
            bool _680 = _676 || _678;
            bool _682 = !_670;
            bool _684 = _680 || _682;
            if (_684)
            {
                _652 = _626;
            }
            float _686 = _652;
            _654 = _686;
            if (_684)
            {
                _658 = _628;
            }
            float _688 = _658;
            _660 = _688;
            if (_684)
            {
                _646 = _624;
            }
            float _690 = _646;
            _648 = _690;
            if (!_684)
            {
                float2 _2923 = float2(_624, _146);
                float2 _692 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2923, float2(0.0), isnan(_2923)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2923, float2(0.0), isnan(_2923)), level(0.0)).xy;
                float _694 = _692.x;
                float _696 = _692.y;
                float _698 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _624);
                _654 = _694;
                _660 = _696;
                _648 = _698;
            }
        }
        float _700 = _654;
        float _702 = _660;
        float _704 = _648;
        if (_578)
        {
            _636 = _574;
        }
        int _706 = _636;
        int _708 = _706;
        int _710 = _706;
        if (!_578)
        {
            bool _712 = _294 > 0.800000011920928955078125;
            bool _714 = isnan(_294);
            bool _716 = _712 || _714;
            bool _718 = isnan(0.800000011920928955078125);
            bool _720 = _716 || _718;
            bool _722 = _292 != 0.0;
            bool _724 = isnan(_292);
            bool _726 = _722 || _724;
            bool _728 = isnan(0.0);
            bool _730 = _726 || _728;
            bool _732 = !_720;
            bool _734 = _730 || _732;
            if (_734)
            {
                _708 = 1;
            }
            int _736 = _708;
            _710 = _736;
            if (!_734)
            {
                float2 _2992 = float2(_640, _146);
                float2 _738 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2992, float2(0.0), isnan(_2992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2992, float2(0.0), isnan(_2992)), level(0.0)).xy;
                float _740 = _738.x;
                float _742 = _738.y;
                float _744 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _640);
                _710 = _574;
                _332 = _742;
                _334 = _740;
                _642 = _744;
            }
        }
        int _746 = _710;
        float _748 = _332;
        float _750 = _334;
        float _752 = _642;
        int _754 = _746 & 1;
        bool _756 = _754 != 0;
        float _758 = _748;
        float _760 = _750;
        float _762 = _752;
        int _764 = _746;
        if (_756)
        {
            _580 = _746;
        }
        int _766 = _580;
        int _768 = _766;
        int _770 = _766;
        if (!_756)
        {
            bool _772 = _748 > 0.800000011920928955078125;
            bool _774 = isnan(_748);
            bool _776 = _772 || _774;
            bool _778 = isnan(0.800000011920928955078125);
            bool _780 = _776 || _778;
            bool _782 = _750 != 0.0;
            bool _784 = isnan(_750);
            bool _786 = _782 || _784;
            bool _788 = isnan(0.0);
            bool _790 = _786 || _788;
            bool _792 = !_780;
            bool _794 = _790 || _792;
            if (_794)
            {
                _768 = 1;
            }
            int _796 = _768;
            _770 = _796;
            if (!_794)
            {
                float2 _3071 = float2(_752, _146);
                float2 _798 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3071, float2(0.0), isnan(_3071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3071, float2(0.0), isnan(_3071)), level(0.0)).xy;
                float _800 = _798.x;
                float _802 = _798.y;
                float _804 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _752);
                _770 = _746;
                _758 = _802;
                _760 = _800;
                _762 = _804;
            }
        }
        int _806 = _770;
        float _808 = _758;
        float _810 = _760;
        float _812 = _762;
        int _814 = _806 & 1;
        bool _816 = _814 != 0;
        float _818 = _808;
        float _820 = _810;
        float _822 = _812;
        int _824 = _806;
        if (_816)
        {
            _764 = _806;
        }
        int _826 = _764;
        int _828 = _826;
        int _830 = _826;
        if (!_816)
        {
            bool _832 = _808 > 0.800000011920928955078125;
            bool _834 = isnan(_808);
            bool _836 = _832 || _834;
            bool _838 = isnan(0.800000011920928955078125);
            bool _840 = _836 || _838;
            bool _842 = _810 != 0.0;
            bool _844 = isnan(_810);
            bool _846 = _842 || _844;
            bool _848 = isnan(0.0);
            bool _850 = _846 || _848;
            bool _852 = !_840;
            bool _854 = _850 || _852;
            if (_854)
            {
                _828 = 1;
            }
            int _856 = _828;
            _830 = _856;
            if (!_854)
            {
                float2 _3150 = float2(_812, _146);
                float2 _858 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3150, float2(0.0), isnan(_3150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3150, float2(0.0), isnan(_3150)), level(0.0)).xy;
                float _860 = _858.x;
                float _862 = _858.y;
                float _864 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _812);
                _830 = _806;
                _818 = _862;
                _820 = _860;
                _822 = _864;
            }
        }
        int _866 = _830;
        float _868 = _818;
        float _870 = _820;
        float _872 = _822;
        int _874 = _866 & 1;
        bool _876 = _874 != 0;
        float _878 = _868;
        float _880 = _870;
        float _882 = _872;
        int _884 = _866;
        if (_876)
        {
            _824 = _866;
        }
        int _886 = _824;
        int _888 = _886;
        int _890 = _886;
        if (!_876)
        {
            bool _892 = _868 > 0.800000011920928955078125;
            bool _894 = isnan(_868);
            bool _896 = _892 || _894;
            bool _898 = isnan(0.800000011920928955078125);
            bool _900 = _896 || _898;
            bool _902 = _870 != 0.0;
            bool _904 = isnan(_870);
            bool _906 = _902 || _904;
            bool _908 = isnan(0.0);
            bool _910 = _906 || _908;
            bool _912 = !_900;
            bool _914 = _910 || _912;
            if (_914)
            {
                _888 = 1;
            }
            int _916 = _888;
            _890 = _916;
            if (!_914)
            {
                float2 _3229 = float2(_872, _146);
                float2 _918 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3229, float2(0.0), isnan(_3229)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3229, float2(0.0), isnan(_3229)), level(0.0)).xy;
                float _920 = _918.x;
                float _922 = _918.y;
                float _924 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _872);
                _890 = _866;
                _878 = _922;
                _880 = _920;
                _882 = _924;
            }
        }
        int _926 = _890;
        float _928 = _878;
        float _930 = _880;
        float _932 = _882;
        int _934 = _926 & 1;
        bool _936 = _934 != 0;
        float _938 = _928;
        float _940 = _930;
        float _942 = _932;
        if (_936)
        {
            _884 = _926;
        }
        int _944 = _884;
        int _946 = _944;
        int _948 = _944;
        if (!_936)
        {
            bool _950 = _928 > 0.800000011920928955078125;
            bool _952 = isnan(_928);
            bool _954 = _950 || _952;
            bool _956 = isnan(0.800000011920928955078125);
            bool _958 = _954 || _956;
            bool _960 = _930 != 0.0;
            bool _962 = isnan(_930);
            bool _964 = _960 || _962;
            bool _966 = isnan(0.0);
            bool _968 = _964 || _966;
            bool _970 = !_958;
            bool _972 = _968 || _970;
            if (_972)
            {
                _946 = 1;
            }
            int _974 = _946;
            _948 = _974;
            if (!_972)
            {
                float2 _3307 = float2(_932, _146);
                float2 _976 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3307, float2(0.0), isnan(_3307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3307, float2(0.0), isnan(_3307)), level(0.0)).xy;
                float _978 = _976.x;
                float _980 = _976.y;
                float _982 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _932);
                _948 = _926;
                _938 = _980;
                _940 = _978;
                _942 = _982;
            }
        }
        int _984 = _948;
        float _986 = _938;
        float _988 = _940;
        float _990 = _942;
        int _992 = _984 & 1;
        bool _994 = _992 != 0;
        float _996 = _988;
        float _998 = _986;
        float _1000 = _990;
        if (!_994)
        {
            bool _1002 = _986 > 0.800000011920928955078125;
            bool _1004 = isnan(_986);
            bool _1006 = _1002 || _1004;
            bool _1008 = isnan(0.800000011920928955078125);
            bool _1010 = _1006 || _1008;
            bool _1012 = _988 != 0.0;
            bool _1014 = isnan(_988);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan(0.0);
            bool _1020 = _1016 || _1018;
            bool _1022 = !_1010;
            bool _1024 = _1020 || _1022;
            if (!_1024)
            {
                float2 _3373 = float2(_990, _146);
                float2 _1026 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).xy;
                float _1028 = _1026.x;
                float _1030 = _1026.y;
                float _1032 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _990);
                _996 = _1028;
                _998 = _1030;
                _1000 = _1032;
            }
        }
        float _1034 = _996;
        float _1036 = _998;
        float _1038 = _1000;
        float _1040 = fma(_1034, 0.5, 0.5234375);
        float _1042 = fma(_1036, 2.0, 0.03125);
        float _1044 = fma(_700, 0.5, 0.0078125);
        float _1046 = fma(_702, 2.0, 0.03125);
        float2 _3408 = float2(_1040, _1042);
        float _1048 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_3408, float2(0.0), isnan(_3408)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_3408, float2(0.0), isnan(_3408)), level(0.0)).x;
        float2 _3416 = float2(_1044, _1046);
        float _1050 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_3416, float2(0.0), isnan(_3416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_3416, float2(0.0), isnan(_3416)), level(0.0)).x;
        float _1052 = fma(_1048, -2.007874011993408203125, 3.25);
        float _1054 = fma(_1050, -2.007874011993408203125, 3.25);
        float _1056 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _1058 = fma(_1052, _1056, _1038);
        float _1060 = fma(_1054, (*spvDescriptorSet0.cp_c3)._m0[0].z, _704);
        float2 _3442 = float2(_1058, _140);
        float _1062 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3442, float2(0.0), isnan(_3442)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3442, float2(0.0), isnan(_3442)), level(0.0), int2(1, 0)).x;
        float2 _3451 = float2(_1060, _140);
        float _1064 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3451, float2(0.0), isnan(_3451)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3451, float2(0.0), isnan(_3451)), level(0.0)).x;
        float _1066 = -_128;
        float _1068 = fma(_1060, (*spvDescriptorSet0.cp_c3)._m0[0].x, _1066);
        float _1070 = -_128;
        float _1072 = fma(_1058, (*spvDescriptorSet0.cp_c3)._m0[0].x, _1070);
        float _1074 = rint(_1068);
        float _1076 = rint(_1072);
        float _1078 = abs(_1074);
        float _1080 = sqrt(_1078);
        float _1082 = abs(_1076);
        float _1084 = sqrt(_1082);
        float _1086 = _1062 * 4.0;
        float _1088 = _1064 * 4.0;
        float _1090 = rint(_1086);
        float _1092 = rint(_1088);
        float _1094 = fma(_1090, 16.0, _1084);
        float _1096 = fma(_1094, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _1098 = fma(_1092, 16.0, _1080);
        float _1100 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _1096);
        float _1102 = fma(_1098, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _3514 = float2(_1102, _1100);
        float2 _1104 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_3514, float2(0.0), isnan(_3514)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_3514, float2(0.0), isnan(_3514)), level(0.0)).xy;
        float _1106 = _1104.x;
        float _1108 = _1104.y;
        _166 = _1092;
        _168 = 0.001785714295692741870880126953125;
        _170 = _1060;
        _172 = _1064;
        _154 = 1003277517;
        _174 = _1106;
        _176 = _1108;
    }
    float _1110 = _166;
    float _1112 = _168;
    float _1114 = _170;
    float _1116 = _172;
    int _1118 = _154;
    float _1120 = _174;
    float _1122 = _176;
    bool _1124 = _134 > 0.0;
    float _1126 = _1110;
    float _1128 = _1112;
    float _1130 = _1114;
    float _1132 = _1116;
    int _1134 = _1118;
    if (!_1124)
    {
        _1126 = 0.0;
        _1128 = 0.0;
    }
    float _1136 = _1126;
    float _1138 = _1128;
    bool _1140 = !_1124;
    float _1142 = _1136;
    float _1144 = _1138;
    if (!_1140)
    {
        float2 _3560 = float2(_142, _140);
        float2 _1146 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3560, float2(0.0), isnan(_3560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3560, float2(0.0), isnan(_3560)), level(0.0)).xy;
        float _1148 = _1146.x;
        float _1150 = _1146.y;
        float2 _3572 = float2(_142, _138);
        float2 _1152 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3572, float2(0.0), isnan(_3572)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3572, float2(0.0), isnan(_3572)), level(0.0)).xy;
        float _1154 = _1152.x;
        float _1156 = _1152.y;
        float _1158 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _140);
        float _1160 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _138);
        bool _1162 = _1148 > 0.800000011920928955078125;
        bool _1164 = isnan(_1148);
        bool _1166 = _1162 || _1164;
        bool _1168 = isnan(0.800000011920928955078125);
        bool _1170 = _1166 || _1168;
        bool _1172 = _1154 > 0.800000011920928955078125;
        bool _1174 = isnan(_1154);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan(0.800000011920928955078125);
        bool _1180 = _1176 || _1178;
        bool _1182 = _1150 != 0.0;
        bool _1184 = isnan(_1150);
        bool _1186 = _1182 || _1184;
        bool _1188 = isnan(0.0);
        bool _1190 = _1186 || _1188;
        bool _1192 = !_1170;
        bool _1194 = _1190 || _1192;
        bool _1196 = _1156 != 0.0;
        bool _1198 = isnan(_1156);
        bool _1200 = _1196 || _1198;
        bool _1202 = isnan(0.0);
        bool _1204 = _1200 || _1202;
        bool _1206 = !_1180;
        bool _1208 = _1204 || _1206;
        float _1210 = _1148;
        float _1212 = _1150;
        int _1214 = as_type<int>(_1154);
        float _1216 = _1160;
        float _1218 = _1158;
        if (_1194)
        {
            _1130 = _1148;
        }
        float _1220 = _1130;
        if (_1194)
        {
            _1132 = _1150;
        }
        float _1222 = _1132;
        if (_1208)
        {
            _1210 = _1154;
        }
        float _1224 = _1210;
        if (_1208)
        {
            _1212 = _1156;
        }
        float _1226 = _1212;
        float _1228 = _1220;
        float _1230 = _1222;
        if (!_1194)
        {
            float2 _3677 = float2(_142, _1158);
            float2 _1232 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3677, float2(0.0), isnan(_3677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3677, float2(0.0), isnan(_3677)), level(0.0)).xy;
            float _1234 = _1232.x;
            float _1236 = _1232.y;
            _1228 = _1234;
            _1230 = _1236;
        }
        float _1238 = _1228;
        float _1240 = _1230;
        float _1242 = _1224;
        float _1244 = _1226;
        if (!_1208)
        {
            float2 _3699 = float2(_142, _1160);
            float2 _1246 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3699, float2(0.0), isnan(_3699)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3699, float2(0.0), isnan(_3699)), level(0.0)).xy;
            float _1248 = _1246.x;
            float _1250 = _1246.y;
            _1242 = _1248;
            _1244 = _1250;
        }
        float _1252 = _1242;
        float _1254 = _1244;
        if (_1194)
        {
            _1134 = 1;
        }
        int _1256 = _1134;
        int _1258 = _1256;
        if (!_1194)
        {
            _1258 = 0;
        }
        int _1260 = _1258;
        int _1262 = _1260;
        if (_1194)
        {
            _156 = _1158;
        }
        float _1264 = _156;
        float _1266 = _1264;
        if (!_1194)
        {
            float _1268 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1158);
            _1266 = _1268;
        }
        float _1270 = _1266;
        int _1272 = _1260 & 1;
        bool _1274 = _1272 != 0;
        float _1276 = _1270;
        if (_1274)
        {
            _158 = _1260;
        }
        int _1278 = _158;
        int _1280 = _1278;
        int _1282 = _1278;
        float _1284 = _1238;
        float _1286 = _1240;
        float _1288 = _1252;
        float _1290 = _1254;
        if (!_1274)
        {
            bool _1292 = _1238 > 0.800000011920928955078125;
            bool _1294 = isnan(_1238);
            bool _1296 = _1292 || _1294;
            bool _1298 = isnan(0.800000011920928955078125);
            bool _1300 = _1296 || _1298;
            bool _1302 = _1240 != 0.0;
            bool _1304 = isnan(_1240);
            bool _1306 = _1302 || _1304;
            bool _1308 = isnan(0.0);
            bool _1310 = _1306 || _1308;
            bool _1312 = !_1300;
            bool _1314 = _1310 || _1312;
            if (_1314)
            {
                _1280 = 1;
            }
            int _1316 = _1280;
            _1282 = _1316;
            if (!_1314)
            {
                float2 _3797 = float2(_142, _1270);
                float2 _1318 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3797, float2(0.0), isnan(_3797)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3797, float2(0.0), isnan(_3797)), level(0.0)).xy;
                float _1320 = _1318.x;
                float _1322 = _1318.y;
                float _1324 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1270);
                _1282 = _1260;
                _1284 = _1320;
                _1286 = _1322;
                _1276 = _1324;
            }
        }
        int _1326 = _1282;
        float _1328 = _1284;
        float _1330 = _1286;
        float _1332 = _1276;
        int _1334 = _1326 & 1;
        bool _1336 = _1334 != 0;
        float _1338 = _1328;
        float _1340 = _1330;
        float _1342 = _1332;
        int _1344 = _1326;
        if (_1336)
        {
            _1262 = _1326;
        }
        int _1346 = _1262;
        int _1348 = _1346;
        int _1350 = _1346;
        if (!_1336)
        {
            bool _1352 = _1328 > 0.800000011920928955078125;
            bool _1354 = isnan(_1328);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan(0.800000011920928955078125);
            bool _1360 = _1356 || _1358;
            bool _1362 = _1330 != 0.0;
            bool _1364 = isnan(_1330);
            bool _1366 = _1362 || _1364;
            bool _1368 = isnan(0.0);
            bool _1370 = _1366 || _1368;
            bool _1372 = !_1360;
            bool _1374 = _1370 || _1372;
            if (_1374)
            {
                _1348 = 1;
            }
            int _1376 = _1348;
            _1350 = _1376;
            if (!_1374)
            {
                float2 _3876 = float2(_142, _1332);
                float2 _1378 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3876, float2(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3876, float2(0.0), isnan(_3876)), level(0.0)).xy;
                float _1380 = _1378.x;
                float _1382 = _1378.y;
                float _1384 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1332);
                _1350 = _1326;
                _1338 = _1380;
                _1340 = _1382;
                _1342 = _1384;
            }
        }
        int _1386 = _1350;
        float _1388 = _1338;
        float _1390 = _1340;
        float _1392 = _1342;
        int _1394 = _1386 & 1;
        bool _1396 = _1394 != 0;
        float _1398 = _1388;
        float _1400 = _1390;
        float _1402 = _1392;
        int _1404 = _1386;
        if (_1396)
        {
            _1344 = _1386;
        }
        int _1406 = _1344;
        int _1408 = _1406;
        int _1410 = _1406;
        if (!_1396)
        {
            bool _1412 = _1388 > 0.800000011920928955078125;
            bool _1414 = isnan(_1388);
            bool _1416 = _1412 || _1414;
            bool _1418 = isnan(0.800000011920928955078125);
            bool _1420 = _1416 || _1418;
            bool _1422 = _1390 != 0.0;
            bool _1424 = isnan(_1390);
            bool _1426 = _1422 || _1424;
            bool _1428 = isnan(0.0);
            bool _1430 = _1426 || _1428;
            bool _1432 = !_1420;
            bool _1434 = _1430 || _1432;
            if (_1434)
            {
                _1408 = 1;
            }
            int _1436 = _1408;
            _1410 = _1436;
            if (!_1434)
            {
                float2 _3955 = float2(_142, _1392);
                float2 _1438 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3955, float2(0.0), isnan(_3955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3955, float2(0.0), isnan(_3955)), level(0.0)).xy;
                float _1440 = _1438.x;
                float _1442 = _1438.y;
                float _1444 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1392);
                _1410 = _1386;
                _1398 = _1440;
                _1400 = _1442;
                _1402 = _1444;
            }
        }
        int _1446 = _1410;
        float _1448 = _1398;
        float _1450 = _1400;
        float _1452 = _1402;
        int _1454 = _1446 & 1;
        bool _1456 = _1454 != 0;
        float _1458 = _1448;
        float _1460 = _1450;
        float _1462 = _1452;
        int _1464 = _1446;
        if (_1456)
        {
            _1404 = _1446;
        }
        int _1466 = _1404;
        int _1468 = _1466;
        int _1470 = _1466;
        if (!_1456)
        {
            bool _1472 = _1448 > 0.800000011920928955078125;
            bool _1474 = isnan(_1448);
            bool _1476 = _1472 || _1474;
            bool _1478 = isnan(0.800000011920928955078125);
            bool _1480 = _1476 || _1478;
            bool _1482 = _1450 != 0.0;
            bool _1484 = isnan(_1450);
            bool _1486 = _1482 || _1484;
            bool _1488 = isnan(0.0);
            bool _1490 = _1486 || _1488;
            bool _1492 = !_1480;
            bool _1494 = _1490 || _1492;
            if (_1494)
            {
                _1468 = 1;
            }
            int _1496 = _1468;
            _1470 = _1496;
            if (!_1494)
            {
                float2 _4034 = float2(_142, _1452);
                float2 _1498 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4034, float2(0.0), isnan(_4034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4034, float2(0.0), isnan(_4034)), level(0.0)).xy;
                float _1500 = _1498.x;
                float _1502 = _1498.y;
                float _1504 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1452);
                _1470 = _1446;
                _1458 = _1500;
                _1460 = _1502;
                _1462 = _1504;
            }
        }
        int _1506 = _1470;
        float _1508 = _1458;
        float _1510 = _1460;
        float _1512 = _1462;
        int _1514 = _1506 & 1;
        bool _1516 = _1514 != 0;
        float _1518 = _1512;
        float _1520 = _1508;
        float _1522 = _1510;
        float _1524 = as_type<float>(_1506);
        if (_1208)
        {
            _1214 = 1;
        }
        int _1526 = _1214;
        int _1528 = _1526;
        if (!_1208)
        {
            _1528 = 0;
        }
        int _1530 = _1528;
        int _1532 = _1530 & 1;
        bool _1534 = _1532 != 0;
        int _1536 = _1530;
        if (_1516)
        {
            _1464 = _1506;
        }
        int _1538 = _1464;
        int _1540 = _1538;
        int _1542 = _1538;
        if (!_1516)
        {
            bool _1544 = _1508 > 0.800000011920928955078125;
            bool _1546 = isnan(_1508);
            bool _1548 = _1544 || _1546;
            bool _1550 = isnan(0.800000011920928955078125);
            bool _1552 = _1548 || _1550;
            bool _1554 = _1510 != 0.0;
            bool _1556 = isnan(_1510);
            bool _1558 = _1554 || _1556;
            bool _1560 = isnan(0.0);
            bool _1562 = _1558 || _1560;
            bool _1564 = !_1552;
            bool _1566 = _1562 || _1564;
            if (_1566)
            {
                _1540 = 1;
            }
            int _1568 = _1540;
            _1542 = _1568;
            if (!_1566)
            {
                float2 _4129 = float2(_142, _1512);
                float2 _1570 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4129, float2(0.0), isnan(_4129)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4129, float2(0.0), isnan(_4129)), level(0.0)).xy;
                float _1572 = _1570.x;
                float _1574 = _1570.y;
                float _1576 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1512);
                _1542 = _1506;
                _1518 = _1576;
                _1520 = _1572;
                _1522 = _1574;
            }
        }
        int _1578 = _1542;
        float _1580 = _1518;
        float _1582 = _1520;
        float _1584 = _1522;
        int _1586 = _1578 & 1;
        bool _1588 = _1586 != 0;
        float _1590 = as_type<float>(_1578);
        int _1592 = as_type<int>(_1580);
        if (!_1208)
        {
            float _1594 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1160);
            _1216 = _1594;
        }
        float _1596 = _1216;
        float _1598 = _1596;
        if (_1588)
        {
            _1218 = _1580;
        }
        float _1600 = _1218;
        float _1602 = _1600;
        float _1604 = _1600;
        if (_1588)
        {
            _1524 = _1582;
        }
        float _1606 = _1524;
        float _1608 = _1606;
        float _1610 = _1606;
        if (_1588)
        {
            _1590 = _1584;
        }
        float _1612 = _1590;
        float _1614 = _1612;
        float _1616 = _1612;
        if (!_1588)
        {
            bool _1618 = _1582 > 0.800000011920928955078125;
            bool _1620 = isnan(_1582);
            bool _1622 = _1618 || _1620;
            bool _1624 = isnan(0.800000011920928955078125);
            bool _1626 = _1622 || _1624;
            bool _1628 = _1584 != 0.0;
            bool _1630 = isnan(_1584);
            bool _1632 = _1628 || _1630;
            bool _1634 = isnan(0.0);
            bool _1636 = _1632 || _1634;
            bool _1638 = !_1626;
            bool _1640 = _1636 || _1638;
            if (_1640)
            {
                _1608 = _1582;
            }
            float _1642 = _1608;
            _1610 = _1642;
            if (_1640)
            {
                _1614 = _1584;
            }
            float _1644 = _1614;
            _1616 = _1644;
            if (_1640)
            {
                _1602 = _1580;
            }
            float _1646 = _1602;
            _1604 = _1646;
            if (!_1640)
            {
                float2 _4246 = float2(_142, _1580);
                float2 _1648 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4246, float2(0.0), isnan(_4246)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4246, float2(0.0), isnan(_4246)), level(0.0)).xy;
                float _1650 = _1648.x;
                float _1652 = _1648.y;
                float _1654 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _1580);
                _1610 = _1650;
                _1616 = _1652;
                _1604 = _1654;
            }
        }
        float _1656 = _1610;
        float _1658 = _1616;
        float _1660 = _1604;
        if (_1534)
        {
            _1592 = _1530;
        }
        int _1662 = _1592;
        int _1664 = _1662;
        int _1666 = _1662;
        if (!_1534)
        {
            bool _1668 = _1252 > 0.800000011920928955078125;
            bool _1670 = isnan(_1252);
            bool _1672 = _1668 || _1670;
            bool _1674 = isnan(0.800000011920928955078125);
            bool _1676 = _1672 || _1674;
            bool _1678 = _1254 != 0.0;
            bool _1680 = isnan(_1254);
            bool _1682 = _1678 || _1680;
            bool _1684 = isnan(0.0);
            bool _1686 = _1682 || _1684;
            bool _1688 = !_1676;
            bool _1690 = _1686 || _1688;
            if (_1690)
            {
                _1664 = 1;
            }
            int _1692 = _1664;
            _1666 = _1692;
            if (!_1690)
            {
                float2 _4315 = float2(_142, _1596);
                float2 _1694 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4315, float2(0.0), isnan(_4315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4315, float2(0.0), isnan(_4315)), level(0.0)).xy;
                float _1696 = _1694.x;
                float _1698 = _1694.y;
                float _1700 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1596);
                _1666 = _1530;
                _1288 = _1696;
                _1290 = _1698;
                _1598 = _1700;
            }
        }
        int _1702 = _1666;
        float _1704 = _1288;
        float _1706 = _1290;
        float _1708 = _1598;
        int _1710 = _1702 & 1;
        bool _1712 = _1710 != 0;
        float _1714 = _1704;
        float _1716 = _1706;
        float _1718 = _1708;
        int _1720 = _1702;
        if (_1712)
        {
            _1536 = _1702;
        }
        int _1722 = _1536;
        int _1724 = _1722;
        int _1726 = _1722;
        if (!_1712)
        {
            bool _1728 = _1704 > 0.800000011920928955078125;
            bool _1730 = isnan(_1704);
            bool _1732 = _1728 || _1730;
            bool _1734 = isnan(0.800000011920928955078125);
            bool _1736 = _1732 || _1734;
            bool _1738 = _1706 != 0.0;
            bool _1740 = isnan(_1706);
            bool _1742 = _1738 || _1740;
            bool _1744 = isnan(0.0);
            bool _1746 = _1742 || _1744;
            bool _1748 = !_1736;
            bool _1750 = _1746 || _1748;
            if (_1750)
            {
                _1724 = 1;
            }
            int _1752 = _1724;
            _1726 = _1752;
            if (!_1750)
            {
                float2 _4394 = float2(_142, _1708);
                float2 _1754 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4394, float2(0.0), isnan(_4394)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4394, float2(0.0), isnan(_4394)), level(0.0)).xy;
                float _1756 = _1754.x;
                float _1758 = _1754.y;
                float _1760 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1708);
                _1726 = _1702;
                _1714 = _1756;
                _1716 = _1758;
                _1718 = _1760;
            }
        }
        int _1762 = _1726;
        float _1764 = _1714;
        float _1766 = _1716;
        float _1768 = _1718;
        int _1770 = _1762 & 1;
        bool _1772 = _1770 != 0;
        float _1774 = _1764;
        float _1776 = _1766;
        float _1778 = _1768;
        int _1780 = _1762;
        if (_1772)
        {
            _1720 = _1762;
        }
        int _1782 = _1720;
        int _1784 = _1782;
        int _1786 = _1782;
        if (!_1772)
        {
            bool _1788 = _1764 > 0.800000011920928955078125;
            bool _1790 = isnan(_1764);
            bool _1792 = _1788 || _1790;
            bool _1794 = isnan(0.800000011920928955078125);
            bool _1796 = _1792 || _1794;
            bool _1798 = _1766 != 0.0;
            bool _1800 = isnan(_1766);
            bool _1802 = _1798 || _1800;
            bool _1804 = isnan(0.0);
            bool _1806 = _1802 || _1804;
            bool _1808 = !_1796;
            bool _1810 = _1806 || _1808;
            if (_1810)
            {
                _1784 = 1;
            }
            int _1812 = _1784;
            _1786 = _1812;
            if (!_1810)
            {
                float2 _4473 = float2(_142, _1768);
                float2 _1814 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4473, float2(0.0), isnan(_4473)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4473, float2(0.0), isnan(_4473)), level(0.0)).xy;
                float _1816 = _1814.x;
                float _1818 = _1814.y;
                float _1820 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1768);
                _1786 = _1762;
                _1774 = _1816;
                _1776 = _1818;
                _1778 = _1820;
            }
        }
        int _1822 = _1786;
        float _1824 = _1774;
        float _1826 = _1776;
        float _1828 = _1778;
        int _1830 = _1822 & 1;
        bool _1832 = _1830 != 0;
        float _1834 = _1824;
        float _1836 = _1826;
        float _1838 = _1828;
        int _1840 = _1822;
        if (_1832)
        {
            _1780 = _1822;
        }
        int _1842 = _1780;
        int _1844 = _1842;
        int _1846 = _1842;
        if (!_1832)
        {
            bool _1848 = _1824 > 0.800000011920928955078125;
            bool _1850 = isnan(_1824);
            bool _1852 = _1848 || _1850;
            bool _1854 = isnan(0.800000011920928955078125);
            bool _1856 = _1852 || _1854;
            bool _1858 = _1826 != 0.0;
            bool _1860 = isnan(_1826);
            bool _1862 = _1858 || _1860;
            bool _1864 = isnan(0.0);
            bool _1866 = _1862 || _1864;
            bool _1868 = !_1856;
            bool _1870 = _1866 || _1868;
            if (_1870)
            {
                _1844 = 1;
            }
            int _1872 = _1844;
            _1846 = _1872;
            if (!_1870)
            {
                float2 _4552 = float2(_142, _1828);
                float2 _1874 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4552, float2(0.0), isnan(_4552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4552, float2(0.0), isnan(_4552)), level(0.0)).xy;
                float _1876 = _1874.x;
                float _1878 = _1874.y;
                float _1880 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1828);
                _1846 = _1822;
                _1834 = _1876;
                _1836 = _1878;
                _1838 = _1880;
            }
        }
        int _1882 = _1846;
        float _1884 = _1834;
        float _1886 = _1836;
        float _1888 = _1838;
        int _1890 = _1882 & 1;
        bool _1892 = _1890 != 0;
        float _1894 = _1884;
        float _1896 = _1886;
        float _1898 = _1888;
        if (_1892)
        {
            _1840 = _1882;
        }
        int _1900 = _1840;
        int _1902 = _1900;
        int _1904 = _1900;
        if (!_1892)
        {
            bool _1906 = _1884 > 0.800000011920928955078125;
            bool _1908 = isnan(_1884);
            bool _1910 = _1906 || _1908;
            bool _1912 = isnan(0.800000011920928955078125);
            bool _1914 = _1910 || _1912;
            bool _1916 = _1886 != 0.0;
            bool _1918 = isnan(_1886);
            bool _1920 = _1916 || _1918;
            bool _1922 = isnan(0.0);
            bool _1924 = _1920 || _1922;
            bool _1926 = !_1914;
            bool _1928 = _1924 || _1926;
            if (_1928)
            {
                _1902 = 1;
            }
            int _1930 = _1902;
            _1904 = _1930;
            if (!_1928)
            {
                float2 _4630 = float2(_142, _1888);
                float2 _1932 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4630, float2(0.0), isnan(_4630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4630, float2(0.0), isnan(_4630)), level(0.0)).xy;
                float _1934 = _1932.x;
                float _1936 = _1932.y;
                float _1938 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1888);
                _1904 = _1882;
                _1894 = _1934;
                _1896 = _1936;
                _1898 = _1938;
            }
        }
        int _1940 = _1904;
        float _1942 = _1894;
        float _1944 = _1896;
        float _1946 = _1898;
        int _1948 = _1940 & 1;
        bool _1950 = _1948 != 0;
        float _1952 = _1944;
        float _1954 = _1942;
        float _1956 = _1946;
        if (!_1950)
        {
            bool _1958 = _1942 > 0.800000011920928955078125;
            bool _1960 = isnan(_1942);
            bool _1962 = _1958 || _1960;
            bool _1964 = isnan(0.800000011920928955078125);
            bool _1966 = _1962 || _1964;
            bool _1968 = _1944 != 0.0;
            bool _1970 = isnan(_1944);
            bool _1972 = _1968 || _1970;
            bool _1974 = isnan(0.0);
            bool _1976 = _1972 || _1974;
            bool _1978 = !_1966;
            bool _1980 = _1976 || _1978;
            if (!_1980)
            {
                float2 _4696 = float2(_142, _1946);
                float2 _1982 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4696, float2(0.0), isnan(_4696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4696, float2(0.0), isnan(_4696)), level(0.0)).xy;
                float _1984 = _1982.x;
                float _1986 = _1982.y;
                float _1988 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _1946);
                _1952 = _1986;
                _1954 = _1984;
                _1956 = _1988;
            }
        }
        float _1990 = _1952;
        float _1992 = _1954;
        float _1994 = _1956;
        float _1996 = fma(_1990, 0.5, 0.5234375);
        float _1998 = fma(_1992, 2.0, 0.03125);
        float _2000 = fma(_1656, 2.0, 0.03125);
        float _2002 = fma(_1658, 0.5, 0.0078125);
        float2 _4728 = float2(_1996, _1998);
        float _2004 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_4728, float2(0.0), isnan(_4728)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_4728, float2(0.0), isnan(_4728)), level(0.0)).x;
        float2 _4736 = float2(_2002, _2000);
        float _2006 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_4736, float2(0.0), isnan(_4736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_4736, float2(0.0), isnan(_4736)), level(0.0)).x;
        float _2008 = fma(_2004, -2.007874011993408203125, 3.25);
        float _2010 = fma(_2006, -2.007874011993408203125, 3.25);
        float _2012 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _2014 = fma(_2008, _2012, _1994);
        float _2016 = fma(_2010, (*spvDescriptorSet0.cp_c3)._m0[0].w, _1660);
        float2 _4760 = float2(_148, _2014);
        float _2018 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4760, float2(0.0), isnan(_4760)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4760, float2(0.0), isnan(_4760)), level(0.0), int2(0, 1)).y;
        float2 _4769 = float2(_148, _2016);
        float _2020 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4769, float2(0.0), isnan(_4769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4769, float2(0.0), isnan(_4769)), level(0.0)).y;
        float _2022 = -_122;
        float _2024 = fma(_2016, (*spvDescriptorSet0.cp_c3)._m0[0].y, _2022);
        float _2026 = -_122;
        float _2028 = fma(_2014, (*spvDescriptorSet0.cp_c3)._m0[0].y, _2026);
        float _2030 = rint(_2024);
        float _2032 = rint(_2028);
        float _2034 = abs(_2030);
        float _2036 = sqrt(_2034);
        float _2038 = abs(_2032);
        float _2040 = sqrt(_2038);
        float _2042 = _2018 * 4.0;
        float _2044 = _2020 * 4.0;
        float _2046 = rint(_2042);
        float _2048 = rint(_2044);
        float _2050 = fma(_2046, 16.0, _2040);
        float _2052 = fma(_2050, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _2054 = fma(_2048, 16.0, _2036);
        float _2056 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _2052);
        float _2058 = fma(_2054, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _4825 = float2(_2058, _2056);
        float2 _2060 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_4825, float2(0.0), isnan(_4825)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_4825, float2(0.0), isnan(_4825)), level(0.0)).xy;
        float _2062 = _2060.x;
        float _2064 = _2060.y;
        _1142 = _2062;
        _1144 = _2064;
    }
    float _2066 = _1142;
    float _2068 = _1144;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1120, _1122, _2066, _2068), uint2(int2(_118, _114)));
}

