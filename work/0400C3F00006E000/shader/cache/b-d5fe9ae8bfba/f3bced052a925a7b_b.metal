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
int _48(thread const int& _2566, thread const int& _2567, constant _10& support_buffer)
{
    int _2570 = 1 + _2567;
    float _2572 = support_buffer._m5[_2570].x;
    bool _2574 = _2572 == 1.0;
    if (_2574)
    {
        return _2566;
    }
    float _2576 = float(_2566);
    float _2578 = _2576 * _2572;
    int _2580 = int(_2578);
    return _2580;
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
    float2 _1177 = float2(_116, _118);
    float2 _120 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1177, float2(0.0), isnan(_1177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1177, float2(0.0), isnan(_1177)), level(0.0)).xy;
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
    float _154 = 0.0;
    int _156 = 0;
    float _158 = 0.0;
    float _160 = _142;
    float _162 = _144;
    if (!_146)
    {
        float _164 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.125, _118);
        float _166 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 1.25, _116);
        float2 _1230 = float2(_126, _164);
        float2 _168 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1230, float2(0.0), isnan(_1230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1230, float2(0.0), isnan(_1230)), level(0.0)).xy;
        float _170 = _168.x;
        float _172 = _168.y;
        float2 _1242 = float2(_166, _164);
        float2 _174 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1242, float2(0.0), isnan(_1242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1242, float2(0.0), isnan(_1242)), level(0.0)).xy;
        float _176 = _174.x;
        float _178 = _174.y;
        float _180 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _126);
        bool _182 = _172 >= 0.800000011920928955078125;
        bool _184 = isnan(_172);
        bool _186 = _182 || _184;
        bool _188 = isnan(0.800000011920928955078125);
        bool _190 = _186 || _188;
        bool _192 = _178 > 0.800000011920928955078125;
        bool _194 = isnan(_178);
        bool _196 = _192 || _194;
        bool _198 = isnan(0.800000011920928955078125);
        bool _200 = _196 || _198;
        bool _202 = _170 != 0.0;
        bool _204 = isnan(_170);
        bool _206 = _202 || _204;
        bool _208 = isnan(0.0);
        bool _210 = _206 || _208;
        bool _212 = !_190;
        bool _214 = _210 || _212;
        bool _216 = _176 != 0.0;
        bool _218 = isnan(_176);
        bool _220 = _216 || _218;
        bool _222 = isnan(0.0);
        bool _224 = _220 || _222;
        bool _226 = !_200;
        bool _228 = _224 || _226;
        float _230 = 0.0;
        int _232 = as_type<int>(_172);
        float _234 = _176;
        int _236 = as_type<int>(_180);
        float _238 = _166;
        if (_214)
        {
            _230 = _170;
        }
        float _240 = _230;
        float _242 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _166);
        float _244 = 0.0;
        float _246 = _242;
        if (_214)
        {
            _244 = _172;
        }
        float _248 = _244;
        float _250 = 0.0;
        if (_228)
        {
            _250 = _176;
        }
        float _252 = _250;
        float _254 = 0.0;
        if (_228)
        {
            _254 = _178;
        }
        float _256 = _254;
        float _258 = _240;
        float _260 = _248;
        if (!_214)
        {
            float2 _1351 = float2(_180, _164);
            float2 _262 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1351, float2(0.0), isnan(_1351)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1351, float2(0.0), isnan(_1351)), level(0.0)).xy;
            float _264 = _262.x;
            float _266 = _262.y;
            _258 = _264;
            _260 = _266;
        }
        float _268 = _258;
        float _270 = _260;
        float _272 = _252;
        float _274 = _256;
        if (!_228)
        {
            float2 _1373 = float2(_242, _164);
            float2 _276 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1373, float2(0.0), isnan(_1373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1373, float2(0.0), isnan(_1373)), level(0.0)).xy;
            float _278 = _276.x;
            float _280 = _276.y;
            _272 = _278;
            _274 = _280;
        }
        float _282 = _272;
        float _284 = _274;
        if (_214)
        {
            _232 = 1;
        }
        int _286 = _232;
        int _288 = _286;
        if (_214)
        {
            _234 = _180;
        }
        float _290 = _234;
        float _292 = _290;
        if (!_214)
        {
            _288 = 0;
        }
        int _294 = _288;
        if (!_214)
        {
            float _296 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _180);
            _292 = _296;
        }
        float _298 = _292;
        int _300 = 0;
        float _302 = _298;
        if (_228)
        {
            _300 = 1;
        }
        int _304 = _300;
        int _306 = _304;
        if (!_228)
        {
            _306 = 0;
        }
        int _308 = _306;
        int _310 = _294 & 1;
        bool _312 = _310 != 0;
        int _314 = _308 & 1;
        bool _316 = _314 != 0;
        if (_312)
        {
            _236 = _294;
        }
        int _318 = _236;
        int _320 = _318;
        int _322 = _318;
        float _324 = _270;
        float _326 = _268;
        float _328 = _284;
        float _330 = _282;
        if (!_312)
        {
            bool _332 = _270 >= 0.800000011920928955078125;
            bool _334 = isnan(_270);
            bool _336 = _332 || _334;
            bool _338 = isnan(0.800000011920928955078125);
            bool _340 = _336 || _338;
            bool _342 = _268 != 0.0;
            bool _344 = isnan(_268);
            bool _346 = _342 || _344;
            bool _348 = isnan(0.0);
            bool _350 = _346 || _348;
            bool _352 = !_340;
            bool _354 = _350 || _352;
            if (_354)
            {
                _320 = 1;
            }
            int _356 = _320;
            _322 = _356;
            if (!_354)
            {
                float2 _1485 = float2(_298, _164);
                float2 _358 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1485, float2(0.0), isnan(_1485)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1485, float2(0.0), isnan(_1485)), level(0.0)).xy;
                float _360 = _358.x;
                float _362 = _358.y;
                float _364 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _298);
                _322 = _294;
                _302 = _364;
                _324 = _362;
                _326 = _360;
            }
        }
        int _366 = _322;
        float _368 = _302;
        float _370 = _324;
        float _372 = _326;
        int _374 = _366 & 1;
        bool _376 = _374 != 0;
        float _378 = _372;
        float _380 = _370;
        int _382 = _366;
        if (!_228)
        {
            float _384 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _242);
            _246 = _384;
        }
        float _386 = _246;
        float _388 = _386;
        if (_376)
        {
            _238 = _368;
        }
        float _390 = _238;
        float _392 = _390;
        float _394 = _390;
        if (!_376)
        {
            bool _396 = _370 >= 0.800000011920928955078125;
            bool _398 = isnan(_370);
            bool _400 = _396 || _398;
            bool _402 = isnan(0.800000011920928955078125);
            bool _404 = _400 || _402;
            bool _406 = _372 != 0.0;
            bool _408 = isnan(_372);
            bool _410 = _406 || _408;
            bool _412 = isnan(0.0);
            bool _414 = _410 || _412;
            bool _416 = !_404;
            bool _418 = _414 || _416;
            if (_418)
            {
                _392 = _368;
            }
            float _420 = _392;
            _394 = _420;
            if (!_418)
            {
                float2 _1575 = float2(_368, _164);
                float2 _422 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1575, float2(0.0), isnan(_1575)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1575, float2(0.0), isnan(_1575)), level(0.0)).xy;
                float _424 = _422.x;
                float _426 = _422.y;
                float _428 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _368);
                _378 = _424;
                _380 = _426;
                _394 = _428;
            }
        }
        float _430 = _378;
        float _432 = _380;
        float _434 = _394;
        if (_316)
        {
            _382 = _308;
        }
        int _436 = _382;
        int _438 = _436;
        int _440 = _436;
        if (!_316)
        {
            bool _442 = _284 > 0.800000011920928955078125;
            bool _444 = isnan(_284);
            bool _446 = _442 || _444;
            bool _448 = isnan(0.800000011920928955078125);
            bool _450 = _446 || _448;
            bool _452 = _282 != 0.0;
            bool _454 = isnan(_282);
            bool _456 = _452 || _454;
            bool _458 = isnan(0.0);
            bool _460 = _456 || _458;
            bool _462 = !_450;
            bool _464 = _460 || _462;
            if (_464)
            {
                _438 = 1;
            }
            int _466 = _438;
            _440 = _466;
            if (!_464)
            {
                float2 _1644 = float2(_386, _164);
                float2 _468 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1644, float2(0.0), isnan(_1644)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1644, float2(0.0), isnan(_1644)), level(0.0)).xy;
                float _470 = _468.x;
                float _472 = _468.y;
                float _474 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _386);
                _440 = _308;
                _388 = _474;
                _328 = _472;
                _330 = _470;
            }
        }
        int _476 = _440;
        float _478 = _388;
        float _480 = _328;
        float _482 = _330;
        int _484 = _476 & 1;
        bool _486 = _484 != 0;
        float _488 = 0.0;
        float _490 = _482;
        float _492 = _480;
        if (_486)
        {
            _488 = _478;
        }
        float _494 = _488;
        float _496 = _494;
        float _498 = _494;
        if (!_486)
        {
            bool _500 = _480 > 0.800000011920928955078125;
            bool _502 = isnan(_480);
            bool _504 = _500 || _502;
            bool _506 = isnan(0.800000011920928955078125);
            bool _508 = _504 || _506;
            bool _510 = _482 != 0.0;
            bool _512 = isnan(_482);
            bool _514 = _510 || _512;
            bool _516 = isnan(0.0);
            bool _518 = _514 || _516;
            bool _520 = !_508;
            bool _522 = _518 || _520;
            if (_522)
            {
                _496 = _478;
            }
            float _524 = _496;
            _498 = _524;
            if (!_522)
            {
                float2 _1722 = float2(_478, _164);
                float2 _526 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1722, float2(0.0), isnan(_1722)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1722, float2(0.0), isnan(_1722)), level(0.0)).xy;
                float _528 = _526.x;
                float _530 = _526.y;
                float _532 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _478);
                _490 = _528;
                _492 = _530;
                _498 = _532;
            }
        }
        float _534 = _490;
        float _536 = _492;
        float _538 = _498;
        float _540 = fma(_534, 0.5, 0.5234375);
        float _542 = fma(_536, 2.0, 0.03125);
        float _544 = fma(_430, 0.5, 0.0078125);
        float _546 = fma(_432, 2.0, 0.03125);
        float2 _1757 = float2(_540, _542);
        float _548 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_1757, float2(0.0), isnan(_1757)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_1757, float2(0.0), isnan(_1757)), level(0.0)).x;
        float2 _1765 = float2(_544, _546);
        float _550 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_1765, float2(0.0), isnan(_1765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_1765, float2(0.0), isnan(_1765)), level(0.0)).x;
        float _552 = fma(_548, -2.007874011993408203125, 3.25);
        float _554 = fma(_550, -2.007874011993408203125, 3.25);
        float _556 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _558 = fma(_552, _556, _538);
        float _560 = fma(_554, (*spvDescriptorSet0.cp_c3)._m0[0].z, _434);
        float2 _1791 = float2(_558, _128);
        float _562 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1791, float2(0.0), isnan(_1791)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1791, float2(0.0), isnan(_1791)), level(0.0), int2(1, 0)).x;
        float2 _1800 = float2(_560, _128);
        float _564 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1800, float2(0.0), isnan(_1800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1800, float2(0.0), isnan(_1800)), level(0.0)).x;
        float _566 = -_112;
        float _568 = fma(_560, (*spvDescriptorSet0.cp_c3)._m0[0].x, _566);
        float _570 = -_112;
        float _572 = fma(_558, (*spvDescriptorSet0.cp_c3)._m0[0].x, _570);
        float _574 = rint(_568);
        float _576 = rint(_572);
        float _578 = abs(_574);
        float _580 = sqrt(_578);
        float _582 = abs(_576);
        float _584 = sqrt(_582);
        float _586 = _562 * 4.0;
        float _588 = _564 * 4.0;
        float _590 = rint(_586);
        float _592 = rint(_588);
        float _594 = fma(_590, 16.0, _584);
        float _596 = fma(_594, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _598 = fma(_592, 16.0, _580);
        float _600 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _596);
        float _602 = fma(_598, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _1863 = float2(_602, _600);
        float2 _604 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1863, float2(0.0), isnan(_1863)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1863, float2(0.0), isnan(_1863)), level(0.0)).xy;
        float _606 = _604.x;
        float _608 = _604.y;
        _136 = _576;
        _148 = _542;
        _150 = 0.001785714295692741870880126953125;
        _152 = _564;
        _154 = (*spvDescriptorSet0.cp_c3)._m0[3].y;
        _156 = as_type<int>(_602);
        _158 = _560;
        _160 = _606;
        _162 = _608;
    }
    float _610 = _136;
    float _612 = _148;
    float _614 = _150;
    float _616 = _152;
    float _618 = _154;
    int _620 = _156;
    float _622 = _158;
    float _624 = _160;
    float _626 = _162;
    bool _628 = _122 > 0.0;
    float _630 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _116);
    float _632 = _610;
    float _634 = _612;
    float _636 = _614;
    float _638 = _616;
    float _640 = _618;
    int _642 = _620;
    float _644 = _622;
    if (!_628)
    {
        _138 = 0.0;
        _632 = 0.0;
    }
    float _646 = _138;
    float _648 = _632;
    bool _650 = !_628;
    float _652 = _646;
    float _654 = _648;
    if (!_650)
    {
        float _656 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _118);
        float2 _1925 = float2(_630, _128);
        float2 _658 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1925, float2(0.0), isnan(_1925)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1925, float2(0.0), isnan(_1925)), level(0.0)).xy;
        float _660 = _658.x;
        float _662 = _658.y;
        float2 _1937 = float2(_630, _656);
        float2 _664 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1937, float2(0.0), isnan(_1937)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1937, float2(0.0), isnan(_1937)), level(0.0)).xy;
        float _666 = _664.x;
        float _668 = _664.y;
        float _670 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _128);
        bool _672 = _660 > 0.800000011920928955078125;
        bool _674 = isnan(_660);
        bool _676 = _672 || _674;
        bool _678 = isnan(0.800000011920928955078125);
        bool _680 = _676 || _678;
        bool _682 = _666 > 0.800000011920928955078125;
        bool _684 = isnan(_666);
        bool _686 = _682 || _684;
        bool _688 = isnan(0.800000011920928955078125);
        bool _690 = _686 || _688;
        bool _692 = _662 != 0.0;
        bool _694 = isnan(_662);
        bool _696 = _692 || _694;
        bool _698 = isnan(0.0);
        bool _700 = _696 || _698;
        bool _702 = !_680;
        bool _704 = _700 || _702;
        bool _706 = _668 != 0.0;
        bool _708 = isnan(_668);
        bool _710 = _706 || _708;
        bool _712 = isnan(0.0);
        bool _714 = _710 || _712;
        bool _716 = !_690;
        bool _718 = _714 || _716;
        int _720 = as_type<int>(_660);
        int _722 = as_type<int>(_670);
        float _724 = _668;
        if (_704)
        {
            _634 = _660;
        }
        float _726 = _634;
        if (_704)
        {
            _636 = _662;
        }
        float _728 = _636;
        if (_718)
        {
            _638 = _666;
        }
        float _730 = _638;
        if (_718)
        {
            _640 = _668;
        }
        float _732 = _640;
        float _734 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _656);
        float _736 = _726;
        float _738 = _728;
        float _740 = _734;
        if (!_704)
        {
            float2 _2042 = float2(_630, _670);
            float2 _742 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2042, float2(0.0), isnan(_2042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2042, float2(0.0), isnan(_2042)), level(0.0)).xy;
            float _744 = _742.x;
            float _746 = _742.y;
            _736 = _744;
            _738 = _746;
        }
        float _748 = _736;
        float _750 = _738;
        float _752 = _730;
        float _754 = _732;
        if (!_718)
        {
            float2 _2064 = float2(_630, _734);
            float2 _756 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2064, float2(0.0), isnan(_2064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2064, float2(0.0), isnan(_2064)), level(0.0)).xy;
            float _758 = _756.x;
            float _760 = _756.y;
            _752 = _758;
            _754 = _760;
        }
        float _762 = _752;
        float _764 = _754;
        if (_704)
        {
            _642 = 1;
        }
        int _766 = _642;
        int _768 = _766;
        if (_704)
        {
            _140 = _670;
        }
        float _770 = _140;
        float _772 = _770;
        if (!_704)
        {
            _768 = 0;
        }
        int _774 = _768;
        if (!_704)
        {
            float _776 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _670);
            _772 = _776;
        }
        float _778 = _772;
        float _780 = _778;
        if (_718)
        {
            _720 = 1;
        }
        int _782 = _720;
        int _784 = _782;
        if (!_718)
        {
            _784 = 0;
        }
        int _786 = _784;
        int _788 = _774 & 1;
        bool _790 = _788 != 0;
        int _792 = _786 & 1;
        bool _794 = _792 != 0;
        if (_790)
        {
            _722 = _774;
        }
        int _796 = _722;
        int _798 = _796;
        int _800 = _796;
        float _802 = _748;
        float _804 = _750;
        float _806 = _762;
        float _808 = _764;
        if (!_790)
        {
            bool _810 = _748 > 0.800000011920928955078125;
            bool _812 = isnan(_748);
            bool _814 = _810 || _812;
            bool _816 = isnan(0.800000011920928955078125);
            bool _818 = _814 || _816;
            bool _820 = _750 != 0.0;
            bool _822 = isnan(_750);
            bool _824 = _820 || _822;
            bool _826 = isnan(0.0);
            bool _828 = _824 || _826;
            bool _830 = !_818;
            bool _832 = _828 || _830;
            if (_832)
            {
                _798 = 1;
            }
            int _834 = _798;
            _800 = _834;
            if (!_832)
            {
                float2 _2175 = float2(_630, _778);
                float2 _836 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2175, float2(0.0), isnan(_2175)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2175, float2(0.0), isnan(_2175)), level(0.0)).xy;
                float _838 = _836.x;
                float _840 = _836.y;
                float _842 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _778);
                _800 = _774;
                _780 = _842;
                _802 = _838;
                _804 = _840;
            }
        }
        int _844 = _800;
        float _846 = _780;
        float _848 = _802;
        float _850 = _804;
        int _852 = _844 & 1;
        bool _854 = _852 != 0;
        float _856 = _850;
        float _858 = _848;
        int _860 = _844;
        if (!_718)
        {
            float _862 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _734);
            _740 = _862;
        }
        float _864 = _740;
        float _866 = _864;
        if (_854)
        {
            _724 = _846;
        }
        float _868 = _724;
        float _870 = _868;
        float _872 = _868;
        if (!_854)
        {
            bool _874 = _848 > 0.800000011920928955078125;
            bool _876 = isnan(_848);
            bool _878 = _874 || _876;
            bool _880 = isnan(0.800000011920928955078125);
            bool _882 = _878 || _880;
            bool _884 = _850 != 0.0;
            bool _886 = isnan(_850);
            bool _888 = _884 || _886;
            bool _890 = isnan(0.0);
            bool _892 = _888 || _890;
            bool _894 = !_882;
            bool _896 = _892 || _894;
            if (_896)
            {
                _870 = _846;
            }
            float _898 = _870;
            _872 = _898;
            if (!_896)
            {
                float2 _2265 = float2(_630, _846);
                float2 _900 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2265, float2(0.0), isnan(_2265)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2265, float2(0.0), isnan(_2265)), level(0.0)).xy;
                float _902 = _900.x;
                float _904 = _900.y;
                float _906 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _846);
                _856 = _904;
                _858 = _902;
                _872 = _906;
            }
        }
        float _908 = _856;
        float _910 = _858;
        float _912 = _872;
        if (_794)
        {
            _860 = _786;
        }
        int _914 = _860;
        int _916 = _914;
        int _918 = _914;
        if (!_794)
        {
            bool _920 = _762 > 0.800000011920928955078125;
            bool _922 = isnan(_762);
            bool _924 = _920 || _922;
            bool _926 = isnan(0.800000011920928955078125);
            bool _928 = _924 || _926;
            bool _930 = _764 != 0.0;
            bool _932 = isnan(_764);
            bool _934 = _930 || _932;
            bool _936 = isnan(0.0);
            bool _938 = _934 || _936;
            bool _940 = !_928;
            bool _942 = _938 || _940;
            if (_942)
            {
                _916 = 1;
            }
            int _944 = _916;
            _918 = _944;
            if (!_942)
            {
                float2 _2334 = float2(_630, _864);
                float2 _946 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2334, float2(0.0), isnan(_2334)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2334, float2(0.0), isnan(_2334)), level(0.0)).xy;
                float _948 = _946.x;
                float _950 = _946.y;
                float _952 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _864);
                _918 = _786;
                _866 = _952;
                _806 = _948;
                _808 = _950;
            }
        }
        int _954 = _918;
        float _956 = _866;
        float _958 = _806;
        float _960 = _808;
        int _962 = _954 & 1;
        bool _964 = _962 != 0;
        float _966 = _960;
        float _968 = _958;
        if (_964)
        {
            _644 = _956;
        }
        float _970 = _644;
        float _972 = _970;
        float _974 = _970;
        if (!_964)
        {
            bool _976 = _958 > 0.800000011920928955078125;
            bool _978 = isnan(_958);
            bool _980 = _976 || _978;
            bool _982 = isnan(0.800000011920928955078125);
            bool _984 = _980 || _982;
            bool _986 = _960 != 0.0;
            bool _988 = isnan(_960);
            bool _990 = _986 || _988;
            bool _992 = isnan(0.0);
            bool _994 = _990 || _992;
            bool _996 = !_984;
            bool _998 = _994 || _996;
            if (_998)
            {
                _972 = _956;
            }
            float _1000 = _972;
            _974 = _1000;
            if (!_998)
            {
                float2 _2412 = float2(_630, _956);
                float2 _1002 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2412, float2(0.0), isnan(_2412)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2412, float2(0.0), isnan(_2412)), level(0.0)).xy;
                float _1004 = _1002.x;
                float _1006 = _1002.y;
                float _1008 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _956);
                _966 = _1006;
                _968 = _1004;
                _974 = _1008;
            }
        }
        float _1010 = _966;
        float _1012 = _968;
        float _1014 = _974;
        float _1016 = fma(_1010, 0.5, 0.5234375);
        float _1018 = fma(_1012, 2.0, 0.03125);
        float _1020 = fma(_908, 0.5, 0.0078125);
        float _1022 = fma(_910, 2.0, 0.03125);
        float2 _2444 = float2(_1016, _1018);
        float _1024 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2444, float2(0.0), isnan(_2444)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2444, float2(0.0), isnan(_2444)), level(0.0)).x;
        float2 _2452 = float2(_1020, _1022);
        float _1026 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2452, float2(0.0), isnan(_2452)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2452, float2(0.0), isnan(_2452)), level(0.0)).x;
        float _1028 = fma(_1024, -2.007874011993408203125, 3.25);
        float _1030 = fma(_1026, -2.007874011993408203125, 3.25);
        float _1032 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _1034 = fma(_1028, _1032, _1014);
        float _1036 = fma(_1030, (*spvDescriptorSet0.cp_c3)._m0[0].w, _912);
        float2 _2476 = float2(_126, _1034);
        float _1038 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2476, float2(0.0), isnan(_2476)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2476, float2(0.0), isnan(_2476)), level(0.0), int2(0, 1)).y;
        float2 _2485 = float2(_126, _1036);
        float _1040 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2485, float2(0.0), isnan(_2485)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2485, float2(0.0), isnan(_2485)), level(0.0)).y;
        float _1042 = -_114;
        float _1044 = fma(_1036, (*spvDescriptorSet0.cp_c3)._m0[0].y, _1042);
        float _1046 = -_114;
        float _1048 = fma(_1034, (*spvDescriptorSet0.cp_c3)._m0[0].y, _1046);
        float _1050 = rint(_1044);
        float _1052 = rint(_1048);
        float _1054 = abs(_1050);
        float _1056 = sqrt(_1054);
        float _1058 = abs(_1052);
        float _1060 = sqrt(_1058);
        float _1062 = _1038 * 4.0;
        float _1064 = _1040 * 4.0;
        float _1066 = rint(_1062);
        float _1068 = rint(_1064);
        float _1070 = fma(_1066, 16.0, _1060);
        float _1072 = fma(_1070, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _1074 = fma(_1068, 16.0, _1056);
        float _1076 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _1072);
        float _1078 = fma(_1074, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _2541 = float2(_1078, _1076);
        float2 _1080 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2541, float2(0.0), isnan(_2541)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2541, float2(0.0), isnan(_2541)), level(0.0)).xy;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        _652 = _1082;
        _654 = _1084;
    }
    float _1086 = _652;
    float _1088 = _654;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_624, _626, _1086, _1088), uint2(int2(as_type<int>(_104), as_type<int>(_106))));
}

