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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    constant _16* cp_c7 [[id(5)]];
    const device _29* cp_s0 [[id(6)]];
    texture2d_array<float> cp_t_tcb_C [[id(7)]];
    sampler cp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
    texture2d<float> cp_t_tcb_A [[id(11)]];
    sampler cp_t_tcb_ASmplr [[id(12)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(13)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(14)]];
    sampler cp_t_tcb_CSmplr_w [[id(15)]];
    sampler cp_t_tcb_8Smplr_w [[id(16)]];
    sampler cp_t_tcb_ASmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

static inline __attribute__((always_inline))
int _62(thread const int& _2248, thread const int& _2249, constant _10& support_buffer)
{
    int _2252 = 1 + _2249;
    float _2254 = support_buffer._m5[_2252].x;
    bool _2256 = _2254 == 1.0;
    if (_2256)
    {
        return _2248;
    }
    float _2258 = float(_2248);
    float _2260 = _2258 * _2254;
    int _2262 = int(_2260);
    return _2262;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _66 = as_type<float>(gl_WorkGroupID.y);
    float _68 = as_type<float>(gl_WorkGroupID.z);
    float _70 = as_type<float>(gl_WorkGroupID.x);
    int _72 = as_type<int>(_68) << 5;
    int _74 = _72 + as_type<int>(_66);
    int _76 = _74 << 4;
    int _78 = _76 + as_type<int>(_70);
    int _80 = _78 << 2;
    uint _83 = uint(int(uint(_80) >> uint(2)));
    float _85 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_83)]);
    float _87 = as_type<float>(gl_LocalInvocationID.x);
    float _89 = as_type<float>(gl_LocalInvocationID.y);
    int _91 = as_type<int>(_70) << 3;
    int _93 = _91 + as_type<int>(_87);
    int _95 = as_type<int>(_66) << 2;
    int _97 = _95 + as_type<int>(_89);
    bool _101 = as_type<int>(_85) != 0;
    if (!_101)
    {
        int3 _1029 = int3(_93, _97, as_type<int>(_68));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(_1029.xy), uint(_1029.z));
    }
    if (!_101)
    {
        return;
    }
    int _103 = as_type<int>(_68) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    float _105 = float(as_type<int>(_68));
    int _107 = _103 << 4;
    float _109 = rint(_105);
    float _111 = precise::max(_109, 0.0);
    uint _113 = uint(_111);
    uint _115 = clamp(_113, 0u, 65535u);
    float _117 = float(_97);
    int _119 = _107 + 4;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.cp_c3)._m0[int(_123)][_125];
    float _129 = float(_93);
    float _131 = _117 + 0.5;
    float _133 = _129 + 0.5;
    float _135 = 1.0 / _127;
    float _137 = _131 * _135;
    float _139 = _133 * _135;
    float3 _1102 = float3(_139, _137, float(int(_115)));
    float3 _1106 = select(_1102, float3(0.0), isnan(_1102));
    float3 _143 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _1106.xy, uint(rint(_1106.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _1106.xy, uint(rint(_1106.z)), level(0.0)).xyw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    int _151 = _93;
    int _153 = 4;
    int _155 = _62(_151, _153, (*spvDescriptorSet0.support_buffer));
    int _157 = _97;
    int _159 = 4;
    int _161 = _62(_157, _159, (*spvDescriptorSet0.support_buffer));
    int3 _1124 = int3(_155, _161, as_type<int>(_68));
    float4 _164 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_1124.xy), uint(_1124.z)).xyzw);
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = _164.z;
    float _172 = _164.w;
    int _174 = _107 + 12;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    uint _178 = uint(int(uint(int(_176)) >> uint(2)));
    int _180 = int(_176) & 3;
    float _182 = (*spvDescriptorSet0.cp_c3)._m0[int(_178)][_180];
    float _184 = _137 + (-0.5);
    float _186 = _139 + (-0.5);
    float _188 = _127 * _182;
    float _190 = fma(_188, _184, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _192 = fma(_188, _186, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _194 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _196 = _190 + _194;
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _200 = _192 + _198;
    float _202 = _196 * _196;
    float _204 = fma(_200, _200, _202);
    bool _206 = _147 > 0.001000000047497451305389404296875;
    float _208 = 0.0;
    float _210 = 0.0;
    float _212 = _200;
    float _214 = _204;
    float _216 = _182;
    float _218 = _145;
    if (!_206)
    {
        _208 = 0.0;
        _210 = 0.0;
    }
    float _220 = _208;
    float _222 = _210;
    float _224 = 0.0;
    float _226 = _220;
    float _228 = _222;
    if (!_206)
    {
        _224 = 0.0;
    }
    float _230 = _224;
    bool _232 = !_206;
    float _234 = _230;
    if (!_232)
    {
        float _236 = sqrt(_204);
        float _238 = fma(_236, 0.00312500004656612873077392578125, -1.0);
        float _240 = precise::clamp(_238, 0.0, 1.0);
        float _242 = fma(_236, 0.001562500023283064365386962890625, -1.0);
        float _244 = precise::clamp(_242, 0.0, 1.0);
        float _246 = fma(_236, 0.0007812500116415321826934814453125, -1.0);
        float _248 = precise::clamp(_246, 0.0, 1.0);
        float _250 = fma(_236, 0.00039062500582076609134674072265625, -1.0);
        float _252 = precise::clamp(_250, 0.0, 1.0);
        float _254 = -_240;
        float _256 = _254 + 1.0;
        float _258 = -_244;
        float _260 = _258 + 1.0;
        float _262 = -_248;
        float _264 = _262 + 1.0;
        float _266 = -_252;
        float _268 = _266 + 1.0;
        bool _270 = _256 > 0.001000000047497451305389404296875;
        bool _272 = _260 > 0.001000000047497451305389404296875;
        bool _274 = _264 > 0.001000000047497451305389404296875;
        bool _276 = _268 > 0.001000000047497451305389404296875;
        float _278 = _252;
        float _280 = _236;
        float _282 = _240;
        if (_270)
        {
            float _284 = _190 * 0.015625;
            _278 = _284;
        }
        float _286 = _278;
        float _288 = 0.0;
        if (_270)
        {
            float _290 = _192 * 0.015625;
            _288 = _290;
        }
        float _292 = _288;
        float _294 = 0.0;
        if (_272)
        {
            float _296 = _190 * 0.0078125;
            _294 = _296;
        }
        float _298 = _294;
        float _300 = 0.0;
        if (_272)
        {
            float _302 = _192 * 0.0078125;
            _300 = _302;
        }
        float _304 = _300;
        float _306 = 0.0;
        if (_272)
        {
            _306 = 1.4012984643248170709237295832899e-45;
        }
        float _308 = _306;
        if (_274)
        {
            float _310 = _190 * 0.00390625;
            _280 = _310;
        }
        float _312 = _280;
        float _314 = _286;
        float _316 = 1.0;
        float _318 = 0.0;
        if (_270)
        {
            float3 _1317 = float3(_292, _286, float(0));
            float3 _1319 = select(_1317, float3(0.0), isnan(_1317));
            float3 _320 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1319.xy, uint(rint(_1319.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1319.xy, uint(rint(_1319.z)), level(0.0)).xyz;
            float _322 = _320.x;
            float _324 = _320.y;
            float _326 = _320.z;
            _314 = _322;
            _316 = _324;
            _318 = _326;
        }
        float _328 = _314;
        float _330 = _316;
        float _332 = _318;
        float _334 = 0.0;
        if (_274)
        {
            float _336 = _192 * 0.00390625;
            _334 = _336;
        }
        float _338 = _334;
        float _340 = 0.0;
        if (_274)
        {
            _340 = 2.8025969286496341418474591665798e-45;
        }
        float _342 = _340;
        float _344 = _298;
        float _346 = 0.0;
        float _348 = 0.0;
        if (_272)
        {
            float3 _1356 = float3(_304, _298, float(as_type<int>(_308)));
            float3 _1358 = select(_1356, float3(0.0), isnan(_1356));
            float3 _350 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1358.xy, uint(rint(_1358.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1358.xy, uint(rint(_1358.z)), level(0.0)).xyz;
            float _352 = _350.x;
            float _354 = _350.y;
            float _356 = _350.z;
            _344 = _352;
            _346 = _354;
            _348 = _356;
        }
        float _358 = _344;
        float _360 = _346;
        float _362 = _348;
        if (_276)
        {
            float _364 = _190 * 0.001953125;
            _282 = _364;
        }
        float _366 = _282;
        float _368 = 0.0;
        if (_276)
        {
            float _370 = _192 * 0.001953125;
            _368 = _370;
        }
        float _372 = _368;
        float _374 = _312;
        float _376 = _248;
        float _378 = 0.0;
        if (_274)
        {
            float3 _1399 = float3(_338, _312, float(as_type<int>(_342)));
            float3 _1401 = select(_1399, float3(0.0), isnan(_1399));
            float3 _380 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1401.xy, uint(rint(_1401.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1401.xy, uint(rint(_1401.z)), level(0.0)).xyz;
            float _382 = _380.x;
            float _384 = _380.y;
            float _386 = _380.z;
            _374 = _382;
            _376 = _384;
            _378 = _386;
        }
        float _388 = _374;
        float _390 = _376;
        float _392 = _378;
        float _394 = 0.0;
        if (_276)
        {
            _394 = 4.2038953929744512127711887498697e-45;
        }
        float _396 = _394;
        float _398 = _366;
        float _400 = _244;
        float _402 = 0.0;
        if (_276)
        {
            float3 _1432 = float3(_372, _366, float(as_type<int>(_396)));
            float3 _1434 = select(_1432, float3(0.0), isnan(_1432));
            float3 _404 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1434.xy, uint(rint(_1434.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1434.xy, uint(rint(_1434.z)), level(0.0)).xyz;
            float _406 = _404.x;
            float _408 = _404.y;
            float _410 = _404.z;
            _398 = _406;
            _400 = _408;
            _402 = _410;
        }
        float _412 = _398;
        float _414 = _400;
        float _416 = _402;
        float _418 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _420 = 1.0 / (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _422 = fma(_418, 0.3183098733425140380859375, 0.079577468335628509521484375);
        float _424 = _422 * 64.0;
        float _426 = _422 * 128.0;
        float _428 = _422 * 512.0;
        float _430 = _422 * 256.0;
        float _432 = 1.0 / _424;
        float _434 = _145 * 100.0;
        float _436 = _434 * _420;
        float _438 = precise::clamp(_436, 0.0, 1.0);
        float _440 = 1.0 / _426;
        float _442 = (*spvDescriptorSet0.cp_c6)._m0[0].x * 2.0;
        float _444 = fma(_438, -2.0, 3.0);
        float _446 = _438 * _438;
        float _448 = _444 * _446;
        float _450 = 1.0 / _430;
        float _452 = 1.0 / _428;
        float _454 = _442 * _432;
        float _456 = _442 * _440;
        float _458 = _454 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _460 = precise::clamp(_458, 0.0, 1.0);
        float _462 = _434 * _454;
        float _464 = precise::clamp(_462, 0.0, 1.0);
        float _466 = _434 * _456;
        float _468 = precise::clamp(_466, 0.0, 1.0);
        float _470 = _442 * _450;
        float _472 = -_460;
        float _474 = _472 + 1.0;
        float _476 = _456 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _478 = precise::clamp(_476, 0.0, 1.0);
        float _480 = -_464;
        float _482 = _480 + 1.0;
        float _484 = -_468;
        float _486 = _484 + 1.0;
        float _488 = _474 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _490 = -_478;
        float _492 = _490 + 1.0;
        float _494 = -_482;
        float _496 = fma(_494, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _498 = _442 * _452;
        float _500 = _434 * _470;
        float _502 = precise::clamp(_500, 0.0, 1.0);
        float _504 = _470 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _506 = precise::clamp(_504, 0.0, 1.0);
        float _508 = _434 * _488;
        float _510 = _434 * _498;
        float _512 = precise::clamp(_510, 0.0, 1.0);
        float _514 = _498 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = -_506;
        float _520 = _518 + 1.0;
        float _522 = _492 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _524 = -_512;
        float _526 = _524 + 1.0;
        float _528 = -_516;
        float _530 = _528 + 1.0;
        float _532 = -_508;
        float _534 = fma(_532, _420, 1.0);
        float _536 = _520 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _538 = _434 * _522;
        float _540 = _530 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _542 = -_486;
        float _544 = fma(_542, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _546 = -_526;
        float _548 = fma(_546, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _550 = -_502;
        float _552 = _550 + 1.0;
        float _554 = -_534;
        float _556 = _496 + _554;
        float _558 = _434 * _536;
        float _560 = -_538;
        float _562 = fma(_560, _420, 1.0);
        float _564 = _434 * _540;
        float _566 = -_552;
        float _568 = fma(_566, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _570 = fma(_448, _556, _534);
        float _572 = -_558;
        float _574 = fma(_572, _420, 1.0);
        float _576 = -_562;
        float _578 = _544 + _576;
        float _580 = -_564;
        float _582 = fma(_580, _420, 1.0);
        float _584 = _564;
        float _586 = _570;
        float _588 = _578;
        if (!_270)
        {
            _584 = 0.0;
        }
        float _590 = _584;
        float _592 = _590;
        if (_270)
        {
            float _594 = _570 * _256;
            _586 = _594;
        }
        float _596 = _586;
        float _598 = fma(_448, _578, _562);
        float _600 = _598;
        if (!_270)
        {
            _588 = 0.0;
        }
        float _602 = _588;
        float _604 = _602;
        if (_272)
        {
            float _606 = _598 * _260;
            _600 = _606;
        }
        float _608 = _600;
        float _610 = _330;
        float _612 = _360;
        float _614 = _390;
        float _616 = _414;
        _216 = _412;
        if (_270)
        {
            float _618 = _256 * _330;
            _610 = _618;
        }
        float _620 = _610;
        float _622 = _620;
        if (_270)
        {
            float _624 = _332 * _596;
            _604 = _624;
        }
        float _626 = _604;
        float _628 = _626;
        if (_272)
        {
            float _630 = _260 * _360;
            _612 = _630;
        }
        float _632 = _612;
        if (_270)
        {
            float _634 = _496 * _620;
            _592 = _634;
        }
        float _636 = _592;
        float _638 = -_574;
        float _640 = _568 + _638;
        float _642 = _636;
        if (!_270)
        {
            _622 = 0.0;
        }
        float _644 = _622;
        float _646 = _644;
        if (_270)
        {
            float _648 = _328 * _596;
            _646 = _648;
        }
        float _650 = _646;
        float _652 = _650;
        if (_272)
        {
            float _654 = fma(_544, _632, _636);
            _642 = _654;
        }
        float _656 = _642;
        float _658 = fma(_448, _640, _574);
        float _660 = _658;
        float _662 = _656;
        if (_274)
        {
            float _664 = _264 * _390;
            _614 = _664;
        }
        float _666 = _614;
        if (_272)
        {
            float _668 = fma(_362, _608, _626);
            _628 = _668;
        }
        float _670 = _628;
        float _672 = -_582;
        float _674 = _548 + _672;
        float _676 = _670;
        if (_274)
        {
            float _678 = _658 * _264;
            _660 = _678;
        }
        float _680 = _660;
        if (_272)
        {
            float _682 = fma(_358, _608, _650);
            _652 = _682;
        }
        float _684 = _652;
        float _686 = _684;
        if (_274)
        {
            float _688 = fma(_568, _666, _656);
            _662 = _688;
        }
        float _690 = _662;
        float _692 = fma(_448, _674, _582);
        float _694 = _692;
        if (_274)
        {
            float _696 = fma(_392, _680, _670);
            _676 = _696;
        }
        float _698 = _676;
        if (_274)
        {
            float _700 = fma(_388, _680, _684);
            _686 = _700;
        }
        float _702 = _686;
        float _704 = _702;
        if (_276)
        {
            float _706 = _268 * _414;
            _616 = _706;
        }
        float _708 = _616;
        float _710 = _690;
        _212 = _708;
        if (_276)
        {
            float _712 = _692 * _268;
            _694 = _712;
        }
        float _714 = _694;
        float _716 = _698;
        if (_276)
        {
            float _718 = fma(_548, _708, _690);
            _710 = _718;
        }
        float _720 = _710;
        if (_276)
        {
            float _722 = fma(_412, _714, _702);
            _704 = _722;
        }
        float _724 = _704;
        if (_276)
        {
            float _726 = fma(_416, _714, _698);
            _716 = _726;
        }
        float _728 = _716;
        float _730 = _147 * _720;
        float _732 = _147 * _724;
        float _734 = _147 * _728;
        _226 = _732;
        _234 = _734;
        _214 = _728;
        _228 = _730;
    }
    float _736 = _226;
    float _738 = _234;
    float _740 = _212;
    float _742 = _214;
    float _744 = _228;
    float _746 = _216;
    float _748 = _192 + _736;
    float _750 = _190 + _738;
    float _752 = -(*spvDescriptorSet0.cp_c4)._m0[0].x;
    float _754 = _748 + _752;
    float _756 = -(*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _758 = _750 + _756;
    float _760 = fma(_754, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _762 = fma(_758, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    bool _764 = _760 >= 1.0;
    bool _766 = isnan(_760);
    bool _768 = _764 || _766;
    bool _770 = isnan(1.0);
    bool _772 = _768 || _770;
    bool _774 = _762 < 1.0;
    bool _776 = !_772;
    bool _778 = _774 && _776;
    bool _780 = _760 > 0.0;
    bool _782 = _780 && _778;
    bool _784 = _762 > 0.0;
    bool _786 = _784 && _782;
    float _788 = _742;
    float _790 = _740;
    float _792 = _746;
    float _794 = (*spvDescriptorSet0.cp_c4)._m0[1].w;
    if (!_786)
    {
        _788 = 0.0;
    }
    float _796 = _788;
    float _798 = _796;
    if (!_786)
    {
        _790 = 0.0;
        _792 = 0.0;
    }
    float _800 = _790;
    float _802 = _792;
    float _804 = _800;
    float _806 = _802;
    if (!_786)
    {
        _794 = 0.0;
    }
    float _808 = _794;
    bool _810 = !_786;
    float _812 = _808;
    if (!_810)
    {
        float _814 = _760 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _816 = _762 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _818 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _820 = _760 + _818;
        float _822 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _824 = _762 + _822;
        float2 _2035 = float2(_760, _762);
        float _826 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2035, float2(0.0), isnan(_2035)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2035, float2(0.0), isnan(_2035)), level(0.0)).x;
        float2 _2045 = float2(_814, _762);
        float _828 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2045, float2(0.0), isnan(_2045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2045, float2(0.0), isnan(_2045)), level(0.0)).x;
        float2 _2053 = float2(_820, _762);
        float _830 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2053, float2(0.0), isnan(_2053)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2053, float2(0.0), isnan(_2053)), level(0.0)).x;
        float2 _2061 = float2(_760, _816);
        float _832 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2061, float2(0.0), isnan(_2061)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2061, float2(0.0), isnan(_2061)), level(0.0)).x;
        float2 _2069 = float2(_760, _824);
        float _834 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2069, float2(0.0), isnan(_2069)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2069, float2(0.0), isnan(_2069)), level(0.0)).x;
        float _836 = _145 * 200.0;
        float _838 = (*spvDescriptorSet0.cp_c4)._m0[1].y * 2.0;
        float _840 = 1.0 / _838;
        float _842 = _836 * _840;
        float _844 = precise::clamp(_842, 0.0, 1.0);
        float _846 = fma(_844, 0.949999988079071044921875, 0.050000011920928955078125);
        float _848 = precise::max(0.0, _826);
        float _850 = _846 * _826;
        float _852 = -_830;
        float _854 = _828 + _852;
        float _856 = -_834;
        float _858 = _832 + _856;
        float _860 = _848 * (*spvDescriptorSet0.cp_c7)._m0[0].x;
        float _862 = _854 * 1.57079637050628662109375;
        float _864 = _858 * 1.57079637050628662109375;
        _798 = _862;
        _804 = _850;
        _812 = _864;
        _806 = _860;
        _218 = _846;
    }
    float _866 = _798;
    float _868 = _804;
    float _870 = _812;
    float _872 = _806;
    float _874 = _218;
    float _876 = _736 + _866;
    int _878 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].w) + (-1);
    float _880 = -_149;
    float _882 = _880 + 1.0;
    float _884 = _744 + _868;
    float _886 = _738 + _870;
    float _888 = _876 * _882;
    bool _890 = as_type<int>(_68) != _878;
    float _892 = _884 * _882;
    float _894 = _886 * _882;
    float _896 = _884;
    float _898 = _874;
    float _900 = _882;
    float _902 = _894;
    if (_890)
    {
        _896 = _888;
    }
    float _904 = _896;
    float _906 = _904;
    if (_890)
    {
        _898 = _892;
    }
    float _908 = _898;
    float _910 = _908;
    if (_890)
    {
        _900 = _872;
    }
    float _912 = _900;
    float _914 = _912;
    if (!_890)
    {
        float _916 = -_139;
        float _918 = _916 + 1.0;
        float _920 = -_137;
        float _922 = _920 + 1.0;
        float _924 = precise::min(_139, _918);
        float _926 = precise::min(_137, _922);
        float _928 = precise::min(_924, _926);
        float _930 = _928 * 10.0;
        float _932 = precise::clamp(_930, 0.0, 1.0);
        float _934 = _888 * _932;
        float _936 = _892 * _932;
        float _938 = _894 * _932;
        float _940 = _932 * _872;
        _906 = _934;
        _910 = _936;
        _902 = _938;
        _914 = _940;
    }
    float _942 = _906;
    float _944 = _910;
    float _946 = _902;
    float _948 = _914;
    float _950 = _166 + _942;
    float _952 = _168 + _944;
    float _954 = _170 + _946;
    float _956 = _172 + _948;
    int3 _2242 = int3(_93, _97, as_type<int>(_68));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_950, _952, _954, _956), uint2(_2242.xy), uint(_2242.z));
}

