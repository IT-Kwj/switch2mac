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
    constant _16* cp_c4 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    texture2d_array<float> cp_t_tcb_A [[id(4)]];
    sampler cp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(8)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(9)]];
    sampler cp_t_tcb_ASmplr_w [[id(10)]];
    sampler cp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

static inline __attribute__((always_inline))
int _48(thread const int& _1793, thread const int& _1794, constant _10& support_buffer)
{
    int _1797 = 1 + _1794;
    float _1799 = support_buffer._m5[_1797].x;
    bool _1801 = _1799 == 1.0;
    if (_1801)
    {
        return _1793;
    }
    float _1803 = float(_1793);
    float _1805 = _1803 * _1799;
    int _1807 = int(_1805);
    return _1807;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _52 = as_type<float>(gl_WorkGroupID.z);
    float _54 = as_type<float>(gl_WorkGroupID.y);
    float _56 = as_type<float>(gl_LocalInvocationID.y);
    float _58 = as_type<float>(gl_LocalInvocationID.x);
    int _60 = as_type<int>(_52) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    float _62 = float(as_type<int>(_52));
    int _64 = _60 << 4;
    float _66 = as_type<float>(gl_WorkGroupID.x);
    float _68 = rint(_62);
    float _70 = precise::max(_68, 0.0);
    uint _73 = uint(_70);
    uint _75 = clamp(_73, 0u, 65535u);
    int _77 = _64 + 4;
    uint _79 = uint(int(uint(_77) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c3)._m0[int(_81)][_83];
    int _87 = as_type<int>(_54) << 2;
    int _89 = _87 + as_type<int>(_56);
    float _91 = float(_89);
    float _93 = _91 + 0.5;
    int _95 = as_type<int>(_66) << 3;
    int _97 = _95 + as_type<int>(_58);
    float _99 = 1.0 / _85;
    float _101 = float(_97);
    float _103 = _101 + 0.5;
    float _105 = _93 * _99;
    float _107 = _103 * _99;
    float3 _870 = float3(_107, _105, float(int(_75)));
    float3 _874 = select(_870, float3(0.0), isnan(_870));
    float3 _111 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _874.xy, uint(rint(_874.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _874.xy, uint(rint(_874.z)), level(0.0)).xyw;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    int _119 = _97;
    int _121 = 2;
    int _123 = _48(_119, _121, (*spvDescriptorSet0.support_buffer));
    int _125 = _89;
    int _127 = 2;
    int _129 = _48(_125, _127, (*spvDescriptorSet0.support_buffer));
    int3 _893 = int3(_123, _129, as_type<int>(_52));
    float4 _132 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_893.xy), uint(_893.z)).xyzw);
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    int _142 = _64 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    uint _146 = uint(int(uint(int(_144)) >> uint(2)));
    int _148 = int(_144) & 3;
    float _150 = (*spvDescriptorSet0.cp_c3)._m0[int(_146)][_148];
    float _152 = _107 + (-0.5);
    float _154 = _85 * _150;
    float _156 = _105 + (-0.5);
    float _158 = fma(_154, _156, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _160 = fma(_154, _152, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _162 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _164 = _158 + _162;
    float _166 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _168 = _160 + _166;
    float _170 = _164 * _164;
    float _172 = fma(_168, _168, _170);
    bool _176 = _115 > 0.001000000047497451305389404296875;
    float _178 = _170;
    float _180 = _168;
    float _182 = as_type<float>(_64);
    float _184 = _117;
    if (!_176)
    {
        _178 = 0.0;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_176)
    {
        _180 = 0.0;
        _182 = 0.0;
    }
    float _190 = _180;
    float _192 = _182;
    bool _194 = !_176;
    float _196 = _190;
    float _198 = _192;
    if (!_194)
    {
        float _200 = sqrt(_172);
        float _202 = fma(_200, 0.00312500004656612873077392578125, -1.0);
        float _204 = precise::clamp(_202, 0.0, 1.0);
        float _206 = fma(_200, 0.001562500023283064365386962890625, -1.0);
        float _208 = precise::clamp(_206, 0.0, 1.0);
        float _210 = fma(_200, 0.0007812500116415321826934814453125, -1.0);
        float _212 = precise::clamp(_210, 0.0, 1.0);
        float _214 = fma(_200, 0.00039062500582076609134674072265625, -1.0);
        float _216 = precise::clamp(_214, 0.0, 1.0);
        float _218 = -_204;
        float _220 = _218 + 1.0;
        float _222 = -_208;
        float _224 = _222 + 1.0;
        float _226 = -_212;
        float _228 = _226 + 1.0;
        float _230 = -_216;
        float _232 = _230 + 1.0;
        bool _234 = _220 > 0.001000000047497451305389404296875;
        bool _236 = _224 > 0.001000000047497451305389404296875;
        bool _238 = _228 > 0.001000000047497451305389404296875;
        bool _240 = _232 > 0.001000000047497451305389404296875;
        float _242 = _200;
        float _244 = _216;
        float _246 = _212;
        float _248 = _204;
        if (_234)
        {
            float _250 = _158 * 0.015625;
            _242 = _250;
        }
        float _252 = _242;
        float _254 = 0.0;
        if (_234)
        {
            float _256 = _160 * 0.015625;
            _254 = _256;
        }
        float _258 = _254;
        if (_236)
        {
            float _260 = _158 * 0.0078125;
            _244 = _260;
        }
        float _262 = _244;
        float _264 = 0.0;
        if (_236)
        {
            float _266 = _160 * 0.0078125;
            _264 = _266;
        }
        float _268 = _264;
        if (_238)
        {
            float _270 = _158 * 0.00390625;
            _246 = _270;
        }
        float _272 = _246;
        float _274 = 0.0;
        if (_236)
        {
            _274 = 1.4012984643248170709237295832899e-45;
        }
        float _276 = _274;
        if (_240)
        {
            float _278 = _158 * 0.001953125;
            _248 = _278;
        }
        float _280 = _248;
        float _282 = 0.0;
        if (_238)
        {
            float _284 = _160 * 0.00390625;
            _282 = _284;
        }
        float _286 = _282;
        float _288 = _158;
        float _290 = _252;
        float _292 = 0.0;
        if (_234)
        {
            float3 _1104 = float3(_258, _252, float(0));
            float3 _1106 = select(_1104, float3(0.0), isnan(_1104));
            float3 _294 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1106.xy, uint(rint(_1106.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1106.xy, uint(rint(_1106.z)), level(0.0)).xyz;
            float _296 = _294.x;
            float _298 = _294.y;
            float _300 = _294.z;
            _288 = _296;
            _290 = _298;
            _292 = _300;
        }
        float _302 = _288;
        float _304 = _290;
        float _306 = _292;
        float _308 = _262;
        float _310 = 0.0;
        float _312 = 0.0;
        if (_236)
        {
            float3 _1131 = float3(_268, _262, float(as_type<int>(_276)));
            float3 _1133 = select(_1131, float3(0.0), isnan(_1131));
            float3 _314 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1133.xy, uint(rint(_1133.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1133.xy, uint(rint(_1133.z)), level(0.0)).xyz;
            float _316 = _314.x;
            float _318 = _314.y;
            float _320 = _314.z;
            _308 = _316;
            _310 = _318;
            _312 = _320;
        }
        float _322 = _308;
        float _324 = _310;
        float _326 = _312;
        float _328 = 0.0;
        if (_238)
        {
            _328 = 2.8025969286496341418474591665798e-45;
        }
        float _330 = _328;
        float _332 = 0.0;
        if (_240)
        {
            float _334 = _160 * 0.001953125;
            _332 = _334;
        }
        float _336 = _332;
        float _338 = 0.0;
        if (_240)
        {
            _338 = 4.2038953929744512127711887498697e-45;
        }
        float _340 = _338;
        float _342 = _272;
        float _344 = _160;
        float _346 = 0.0;
        if (_238)
        {
            float3 _1176 = float3(_286, _272, float(as_type<int>(_330)));
            float3 _1178 = select(_1176, float3(0.0), isnan(_1176));
            float3 _348 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1178.xy, uint(rint(_1178.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1178.xy, uint(rint(_1178.z)), level(0.0)).xyz;
            float _350 = _348.x;
            float _352 = _348.y;
            float _354 = _348.z;
            _342 = _350;
            _344 = _352;
            _346 = _354;
        }
        float _356 = _342;
        float _358 = _344;
        float _360 = _346;
        float _362 = _280;
        float _364 = _208;
        float _366 = _336;
        if (_240)
        {
            float3 _1205 = float3(_336, _280, float(as_type<int>(_340)));
            float3 _1207 = select(_1205, float3(0.0), isnan(_1205));
            float3 _368 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1207.xy, uint(rint(_1207.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1207.xy, uint(rint(_1207.z)), level(0.0)).xyz;
            float _370 = _368.x;
            float _372 = _368.y;
            float _374 = _368.z;
            _362 = _370;
            _364 = _372;
            _366 = _374;
        }
        float _376 = _362;
        float _378 = _364;
        float _380 = _366;
        float _382 = 1.0 / (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _384 = _113 * 100.0;
        float _386 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _388 = fma(_382, 0.3183098733425140380859375, 0.079577468335628509521484375);
        float _390 = _388 * 64.0;
        float _392 = _388 * 128.0;
        float _394 = _388 * 256.0;
        float _396 = _388 * 512.0;
        float _398 = 1.0 / _390;
        float _400 = _384 * _386;
        float _402 = precise::clamp(_400, 0.0, 1.0);
        float _404 = fma(_402, -2.0, 3.0);
        float _406 = _402 * _402;
        float _408 = 1.0 / _392;
        float _410 = (*spvDescriptorSet0.cp_c5)._m0[0].x * 2.0;
        float _412 = _404 * _406;
        float _414 = 1.0 / _394;
        float _416 = 1.0 / _396;
        float _418 = _410 * _398;
        float _420 = _410 * _408;
        float _422 = _384 * _420;
        float _424 = precise::clamp(_422, 0.0, 1.0);
        float _426 = _420 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _428 = precise::clamp(_426, 0.0, 1.0);
        float _430 = _410 * _414;
        float _432 = -_424;
        float _434 = _432 + 1.0;
        float _436 = -_428;
        float _438 = _436 + 1.0;
        float _440 = _384 * _430;
        float _442 = precise::clamp(_440, 0.0, 1.0);
        float _444 = _430 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _446 = precise::clamp(_444, 0.0, 1.0);
        float _448 = -_434;
        float _450 = fma(_448, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _452 = _438 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _454 = _410 * _416;
        float _456 = _384 * _418;
        float _458 = precise::clamp(_456, 0.0, 1.0);
        float _460 = _418 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _462 = precise::clamp(_460, 0.0, 1.0);
        float _464 = -_446;
        float _466 = _464 + 1.0;
        float _468 = _384 * _454;
        float _470 = precise::clamp(_468, 0.0, 1.0);
        float _472 = _454 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _474 = precise::clamp(_472, 0.0, 1.0);
        float _476 = -_462;
        float _478 = _476 + 1.0;
        float _480 = -_458;
        float _482 = _480 + 1.0;
        float _484 = _466 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _486 = -_474;
        float _488 = _486 + 1.0;
        float _490 = _478 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _492 = -_482;
        float _494 = fma(_492, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _496 = _384 * _452;
        float _498 = _488 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _500 = _384 * _490;
        float _502 = -_442;
        float _504 = _502 + 1.0;
        float _506 = _384 * _484;
        float _508 = _384 * _498;
        float _510 = -_500;
        float _512 = fma(_510, _386, 1.0);
        float _514 = -_496;
        float _516 = fma(_514, _386, 1.0);
        float _518 = -_504;
        float _520 = fma(_518, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _522 = -_508;
        float _524 = fma(_522, _386, 1.0);
        float _526 = -_512;
        float _528 = _494 + _526;
        float _530 = -_506;
        float _532 = fma(_530, _386, 1.0);
        float _534 = -_516;
        float _536 = _450 + _534;
        float _538 = -_470;
        float _540 = _538 + 1.0;
        float _542 = fma(_412, _528, _512);
        float _544 = -_532;
        float _546 = _520 + _544;
        float _548 = fma(_412, _536, _516);
        float _550 = -_540;
        float _552 = fma(_550, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _554 = _542;
        float _556 = _532;
        float _558 = _548;
        float _560 = _516;
        float _562 = _512;
        if (_234)
        {
            float _564 = _542 * _220;
            _554 = _564;
        }
        float _566 = _554;
        float _568 = fma(_412, _546, _532);
        float _570 = _568;
        if (!_234)
        {
            _556 = 0.0;
        }
        float _572 = _556;
        float _574 = _572;
        if (_236)
        {
            float _576 = _548 * _224;
            _558 = _576;
        }
        float _578 = _558;
        if (!_234)
        {
            _560 = 0.0;
        }
        float _580 = _560;
        float _582 = _580;
        if (_238)
        {
            float _584 = _568 * _228;
            _570 = _584;
        }
        float _586 = _570;
        float _588 = -_524;
        float _590 = _552 + _588;
        float _592 = fma(_412, _590, _524);
        float _594 = _592;
        if (_240)
        {
            float _596 = _592 * _232;
            _594 = _596;
        }
        float _598 = _594;
        float _600 = _304;
        float _602 = _324;
        float _604 = _358;
        float _606 = _378;
        if (_234)
        {
            float _608 = _220 * _304;
            _562 = _608;
        }
        float _610 = _562;
        if (!_234)
        {
            _600 = 0.0;
        }
        float _612 = _600;
        float _614 = _612;
        if (_236)
        {
            float _616 = _224 * _324;
            _602 = _616;
        }
        float _618 = _602;
        if (_234)
        {
            float _620 = _302 * _566;
            _614 = _620;
        }
        float _622 = _614;
        float _624 = _622;
        if (_234)
        {
            float _626 = _494 * _610;
            _574 = _626;
        }
        float _628 = _574;
        float _630 = _628;
        if (_234)
        {
            float _632 = _306 * _566;
            _582 = _632;
        }
        float _634 = _582;
        float _636 = _634;
        if (_238)
        {
            float _638 = _228 * _358;
            _604 = _638;
        }
        float _640 = _604;
        if (_236)
        {
            float _642 = fma(_322, _578, _622);
            _624 = _642;
        }
        float _644 = _624;
        float _646 = _644;
        if (_236)
        {
            float _648 = fma(_450, _618, _628);
            _630 = _648;
        }
        float _650 = _630;
        float _652 = _650;
        if (_236)
        {
            float _654 = fma(_326, _578, _634);
            _636 = _654;
        }
        float _656 = _636;
        float _658 = _656;
        if (_238)
        {
            float _660 = fma(_356, _586, _644);
            _646 = _660;
        }
        float _662 = _646;
        if (_238)
        {
            float _664 = fma(_520, _640, _650);
            _652 = _664;
        }
        float _666 = _652;
        if (_240)
        {
            float _668 = _232 * _378;
            _606 = _668;
        }
        float _670 = _606;
        if (_238)
        {
            float _672 = fma(_360, _586, _656);
            _658 = _672;
        }
        float _674 = _658;
        float _676 = _674;
        float _678 = _662;
        float _680 = _666;
        if (_240)
        {
            float _682 = fma(_380, _598, _674);
            _676 = _682;
        }
        float _684 = _676;
        if (_240)
        {
            float _686 = fma(_376, _598, _662);
            _678 = _686;
        }
        float _688 = _678;
        if (_240)
        {
            float _690 = fma(_552, _670, _666);
            _680 = _690;
        }
        float _692 = _680;
        float _694 = _115 * _684;
        float _696 = _115 * _692;
        float _698 = _115 * _688;
        _188 = _698;
        _196 = _696;
        _198 = _694;
    }
    float _700 = _188;
    float _702 = _196;
    float _704 = _198;
    float _706 = -_117;
    float _708 = _706 + 1.0;
    int _710 = (-2) + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    int _712 = _710 + 1;
    float _714 = _708 * _700;
    float _716 = _708 * _702;
    float _718 = _708 * _704;
    bool _720 = as_type<int>(_52) != _712;
    float _722 = _702;
    float _724 = _718;
    if (_720)
    {
        _722 = _714;
    }
    float _726 = _722;
    float _728 = _726;
    if (_720)
    {
        _184 = _716;
    }
    float _730 = _184;
    float _732 = _730;
    if (!_720)
    {
        float _734 = -_107;
        float _736 = _734 + 1.0;
        float _738 = -_105;
        float _740 = _738 + 1.0;
        float _742 = precise::min(_107, _736);
        float _744 = precise::min(_105, _740);
        float _746 = precise::min(_742, _744);
        float _748 = _746 * 10.0;
        float _750 = precise::clamp(_748, 0.0, 1.0);
        float _752 = _714 * _750;
        float _754 = _716 * _750;
        float _756 = _718 * _750;
        _728 = _752;
        _732 = _754;
        _724 = _756;
    }
    float _758 = _728;
    float _760 = _732;
    float _762 = _724;
    float _764 = _134 + _758;
    float _766 = _136 + _760;
    float _768 = _138 + _762;
    int3 _1787 = int3(_97, _89, as_type<int>(_52));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_764, _766, _768, _140), uint2(_1787.xy), uint(_1787.z));
}

