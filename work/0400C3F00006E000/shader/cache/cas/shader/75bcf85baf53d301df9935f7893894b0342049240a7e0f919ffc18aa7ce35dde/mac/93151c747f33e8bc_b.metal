#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_54 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_60 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_46 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _75(thread const int& _4906, thread const int& _4907, constant _10& support_buffer)
{
    float _4910 = as_type<float>(support_buffer._m4);
    int _4912 = _4907 + as_type<int>(_4910);
    int _4914 = 1 + _4912;
    float _4916 = support_buffer._m5[_4914].x;
    float _4918 = abs(_4916);
    bool _4920 = _4918 == 1.0;
    if (_4920)
    {
        return _4906;
    }
    float _4922 = float(_4906);
    float _4924 = _4922 / _4918;
    int _4926 = int(_4924);
    return _4926;
}

static inline __attribute__((always_inline))
int _76(thread const int& _4956, thread const int& _4957, constant _10& support_buffer)
{
    float _4960 = as_type<float>(support_buffer._m4);
    int _4962 = _4957 + as_type<int>(_4960);
    int _4964 = 1 + _4962;
    float _4966 = support_buffer._m5[_4964].x;
    bool _4968 = _4966 == 1.0;
    if (_4968)
    {
        return _4956;
    }
    float _4970 = float(_4956);
    float _4972 = _4970 * _4966;
    int _4974 = int(_4972);
    return _4974;
}

static inline __attribute__((always_inline))
void _73(thread const int& _4615, thread const int& _4616, thread const int& _4617, thread int& _4618, thread int& _4619, thread int& _4620, thread int& _4621, thread int& _4622, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _4625 = _4616;
    int _4627 = _4615;
    float _4629 = 0.0 + as_type<float>(_4615);
    bool _4631 = _4629 != 0.0;
    bool _4633 = isnan(_4629);
    bool _4635 = _4631 || _4633;
    bool _4637 = isnan(0.0);
    bool _4639 = _4635 || _4637;
    int _4641 = _4639 ? (-1) : 0;
    if (!_4639)
    {
        float _4643 = as_type<float>(_4615) * 1.0;
        _4625 = as_type<int>(_4643);
    }
    int _4645 = _4625;
    bool _4647 = !_4639;
    int _4649 = _4645;
    int _4651 = _4645;
    if (!_4647)
    {
        bool _4653 = _4629 >= 0.0;
        bool _4655 = isnan(_4629);
        bool _4657 = _4653 || _4655;
        bool _4659 = isnan(0.0);
        bool _4661 = _4657 || _4659;
        _4641 = _4661 ? (-1) : 0;
        if (!_4661)
        {
            _4649 = 2147483647;
        }
        int _4663 = _4649;
        bool _4665 = !_4661;
        int _4667 = _4663;
        _4651 = _4663;
        if (!_4665)
        {
            float _4669 = abs(as_type<float>(_4615));
            float _4671 = 0.0 + _4669;
            bool _4673 = _4671 > as_type<float>(0x7f800000u /* inf */);
            bool _4675 = isnan(_4671);
            bool _4677 = _4673 || _4675;
            bool _4679 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4681 = _4677 || _4679;
            _4641 = _4681 ? (-1) : 0;
            if (_4681)
            {
                float _4683 = as_type<float>(_4615) + 1.0;
                _4667 = as_type<int>(_4683);
            }
            int _4685 = _4667;
            int _4687 = _4685;
            _4651 = _4685;
            if (!_4681)
            {
                bool _4689 = _4671 != as_type<float>(0x7f800000u /* inf */);
                bool _4691 = isnan(_4671);
                bool _4693 = _4689 || _4691;
                bool _4695 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4697 = _4693 || _4695;
                _4641 = _4697 ? (-1) : 0;
                if (!_4697)
                {
                    _4687 = _4615;
                }
                int _4699 = _4687;
                bool _4701 = !_4697;
                _4651 = _4699;
                if (!_4701)
                {
                    float _4703 = as_type<float>(_4615) * 18446744073709551616.0;
                    float _4705 = rsqrt(_4703);
                    float _4707 = _4703 * _4705;
                    float _4709 = _4705 * 0.5;
                    float _4711 = -_4707;
                    float _4713 = 0.0 + _4711;
                    float _4715 = fma(_4709, _4713, 0.5);
                    float _4717 = fma(_4707, _4715, _4707);
                    float _4719 = -_4717;
                    float _4721 = 0.0 + _4719;
                    float _4723 = fma(_4717, _4721, _4703);
                    float _4725 = fma(_4709, _4723, _4717);
                    float _4727 = _4725 * 2.3283064365386962890625e-10;
                    _4627 = as_type<int>(_4703);
                    _4651 = as_type<int>(_4727);
                }
            }
        }
    }
    int _4729 = _4627;
    int _4731 = _4651;
    int _4733 = _4641;
    _4618 = _4729;
    _4619 = _4731;
    _4620 = _4617;
    _4621 = 0;
    _4622 = _4733;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1774 = false;
    bool _760 = false;
    bool _574 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_37.w;
    float _82 = trunc(_80);
    int _84 = int(_82);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_40.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1946 = as_type<float>(_100);
        out.gl_Position.z = _1946;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_42.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _92 = _122;
    }
    float _124 = _92;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2016 = as_type<float>(_138);
        out.gl_Position.z = _2016;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    int _140 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _142 = _140;
    int _144 = 0;
    int _146 = _75(_142, _144, (*spvDescriptorSet0.support_buffer));
    float _148 = in.m_44.z;
    float _150 = in.m_46.z;
    float _152 = _118 + _148;
    float _154 = _152 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _156 = trunc(_150);
    int _158 = int(_156);
    float _160 = float(_146);
    int _162 = abs(_146);
    bool _164 = _146 == 0;
    float _166 = _154 * _160;
    float _168 = float(uint(_162));
    float _170 = trunc(_166);
    int _172 = int(_170);
    float _174 = 1.0 / _168;
    int _176 = abs(_172);
    uint _179 = uint(int(uint(_172) >> uint(31)));
    float _181 = float(uint(_176));
    int _183 = ~int(_179);
    int _185 = _183 + 1;
    int _187 = as_type<int>(_174) + (-2);
    float _189 = as_type<float>(_187) * _181;
    float _191 = trunc(_189);
    float _193 = precise::max(_191, 0.0);
    uint _195 = uint(_193);
    int _197 = ~int(_195);
    int _199 = _197 + 1;
    int _201 = _199 * _162;
    int _203 = _201 + _176;
    float _205 = float(uint(_203));
    float _207 = as_type<float>(_187) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _213 = uint(_211);
    int _215 = int(_195) + int(_213);
    int _217 = ~_215;
    int _219 = _217 + 1;
    int _221 = _219 * _162;
    int _223 = _221 + _176;
    bool _225 = uint(_223) >= uint(_162);
    bool _227 = !_225;
    int _229 = _227 ? 0 : (-1);
    int _231 = ~_215;
    int _233 = _231 + _229;
    int _235 = _233 + 1;
    int _237 = _235 * _162;
    int _239 = _237 + _176;
    int _241 = _239 ^ _185;
    int _243 = ~_185;
    int _245 = _243 + _241;
    int _247 = _245 + 1;
    bool _249 = !_164;
    int _251 = _249 ? _247 : (-1);
    int _253 = _251;
    int _255 = 0;
    int _257 = _76(_253, _255, (*spvDescriptorSet0.support_buffer));
    int _259 = _158;
    int _261 = 0;
    int _263 = _76(_259, _261, (*spvDescriptorSet0.support_buffer));
    float4 _266 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_257, _263)), 0).xyzw;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = _266.w;
    float _276 = in.m_48.w;
    float _278 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _280 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _284 = _280 || _282;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    float _290 = in.m_42.x;
    float _292 = in.m_42.y;
    float _294 = in.m_42.z;
    float _296 = in.m_37.x;
    float _298 = in.m_37.y;
    float _300 = in.m_37.z;
    float _302 = 0.0;
    float _304 = _278;
    if (!_288)
    {
        float _306 = _278 * _278;
        float _308 = _306 * 0.5;
        _302 = _308;
    }
    float _310 = _302;
    float _312 = _310;
    if (!_288)
    {
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _314;
    }
    float _316 = _312;
    bool _318 = !_288;
    float _320 = _316;
    int _322 = 0;
    if (!_318)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = _278 * _326;
        float _336 = 1.0 / _330;
        float _338 = _332 * 0.693147182464599609375;
        float _340 = exp2(_334);
        float _342 = 1.0 / _338;
        float _344 = _340 + (-1.0);
        float _346 = -_344;
        float _348 = fma(_346, _342, _278);
        float _350 = _348 * _336;
        float _352 = _350 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _352;
        _322 = as_type<int>(_342);
    }
    float _354 = _320;
    int _356 = _322;
    bool _358 = !_288;
    if (!_358)
    {
        float _360 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = log2(_360);
        float _364 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _366 = _364 + 1.0;
        float _368 = 1.0 / _366;
        float _370 = _278 * _362;
        float _372 = exp2(_370);
        float _374 = -_372;
        float _376 = _374 + 1.0;
        float _378 = _376 * _368;
        _304 = _378;
    }
    float _380 = _304;
    float _382 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _384 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _386 = _251 + 1;
    float _388 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_380, _290, _382);
    float _392 = fma(_380, _292, _384);
    int _394 = abs(_386);
    float _396 = fma(_380, _294, _388);
    float _398 = fma(_390, _276, _296);
    float _400 = fma(_392, _276, _298);
    float _402 = float(uint(_394));
    float _404 = fma(_396, _276, _300);
    uint _406 = as_type<uint>(half2(float2(_274, 0.0)));
    uint _408 = uint(int(uint(_386) >> uint(31)));
    float _410 = as_type<float>(_187) * _402;
    uint _412 = extract_bits(_406, 0u, 8u);
    int _414 = int(_412) & 255;
    uint _416 = extract_bits(_406, 8u, 8u);
    int _418 = int(_416) & 255;
    int _420 = _418 << 8;
    int _422 = _414 | _420;
    int _424 = ~int(_408);
    int _426 = _424 + 1;
    float _428 = trunc(_410);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    int _434 = ~int(_432);
    int _436 = _434 + 1;
    int _438 = _436 * _162;
    int _440 = _438 + _394;
    float _442 = float(uint(_440));
    float _444 = as_type<float>(_187) * _442;
    float _446 = trunc(_444);
    float _448 = precise::max(_446, 0.0);
    uint _450 = uint(_448);
    int _452 = int(_432) + int(_450);
    int _454 = ~_452;
    int _456 = _454 + 1;
    int _458 = _456 * _162;
    int _460 = _458 + _394;
    bool _462 = uint(_460) >= uint(_162);
    bool _464 = !_462;
    int _466 = _464 ? 0 : (-1);
    bool _468 = _422 >= 32768;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _472 = ~_452;
    int _474 = _472 + _466;
    int _476 = _474 + 1;
    float _478 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _480 = _476 * _162;
    int _482 = _480 + _394;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _486 = _482 ^ _426;
    float _488 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _490 = ~_426;
    int _492 = _490 + _486;
    int _494 = _492 + 1;
    int _496 = _422 + (-1024);
    int _498 = _496;
    float _500 = _400;
    float _502 = _398;
    float _504 = _404;
    if (_468)
    {
        int _506 = ~_422;
        int _508 = _506 + 33792;
        int _510 = _508 + 1;
        _498 = _510;
    }
    int _512 = _498;
    bool _514 = !_164;
    int _516 = _514 ? _494 : (-1);
    int _518 = _512 + 30719;
    float _520 = float(_518);
    float _522 = fma(_520, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = abs(_522);
    float _528 = -_526;
    float _530 = _528 + 1.0;
    float _532 = abs(_522);
    float _534 = fma(_532, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _536 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _538 = _522 < 0.0;
    float _540 = float(_538);
    int _542 = as_type<int>(_530) + (-218103808);
    float _544 = abs(_522);
    float _546 = fma(_544, _534, -0.212114393711090087890625);
    bool _548 = uint(_542) >= 1920991232u;
    float _550 = abs(_522);
    float _552 = fma(_550, _546, 1.570728778839111328125);
    bool _554 = !_548;
    float _572;
    if (!_554)
    {
        int _556 = as_type<int>(_530);
        int _558 = _356;
        int _560 = 2368;
        int _562;
        int _564;
        int _566;
        int _568;
        int _570;
        _73(_556, _558, _560, _562, _564, _566, _568, _570, out.gl_Position, out.gl_PointSize);
        _572 = as_type<float>(_564);
        _574 = true;
    }
    else
    {
        float _576 = rsqrt(_530);
        float _578 = _530 * _576;
        float _580 = _576 * 0.5;
        float _582 = -_578;
        float _584 = 0.0 + _582;
        float _586 = fma(_580, _584, 0.5);
        float _588 = fma(_578, _586, _578);
        float _590 = -_588;
        float _592 = 0.0 + _590;
        float _594 = fma(_588, _592, _530);
        float _596 = fma(_580, _594, _588);
        _572 = _596;
    }
    _574 = false;
    float _598 = _572;
    int _600 = _516;
    int _602 = 0;
    int _604 = _76(_600, _602, (*spvDescriptorSet0.support_buffer));
    int _606 = _158;
    int _608 = 0;
    int _610 = _76(_606, _608, (*spvDescriptorSet0.support_buffer));
    float4 _612 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_604, _610)), 0).xyzw;
    float _614 = _612.x;
    float _616 = _612.y;
    float _618 = _612.z;
    float _620 = _612.w;
    float _622 = _552 * _598;
    float _624 = _540 * 2.0;
    float _626 = _520 * 3.883221149444580078125;
    float _628 = floor(_166);
    float _630 = -_624;
    float _632 = fma(_622, _630, _622);
    float _634 = _626 * 0.15915493667125701904296875;
    float _636 = fma(_540, 3.1415927410125732421875, _632);
    float _638 = _634 * 6.283185482025146484375;
    float _640 = cos(_638);
    float _642 = _636 * 0.15915493667125701904296875;
    float _644 = _642 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = -_628;
    float _650 = _166 + _648;
    float _652 = _634 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = _646 * _640;
    float _658 = _646 * _654;
    uint _660 = as_type<uint>(half2(float2(_620, 0.0)));
    float _662 = -_268;
    float _664 = _662 + _614;
    float _666 = -_270;
    float _668 = _666 + _616;
    float _670 = -_272;
    float _672 = _670 + _618;
    uint _674 = extract_bits(_660, 0u, 8u);
    int _676 = int(_674) & 255;
    uint _678 = extract_bits(_660, 8u, 8u);
    int _680 = int(_678) & 255;
    int _682 = _680 << 8;
    int _684 = _676 | _682;
    float _686 = fma(_650, _664, _268);
    float _688 = fma(_650, _668, _270);
    float _690 = fma(_650, _672, _272);
    bool _692 = _684 >= 32768;
    int _694 = _684 + (-1024);
    int _696 = _694;
    float _698 = _650;
    if (_692)
    {
        int _700 = ~_684;
        int _702 = _700 + 33792;
        int _704 = _702 + 1;
        _696 = _704;
    }
    int _706 = _696;
    int _708 = _706 + 30719;
    float _710 = float(_708);
    float _712 = fma(_710, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _714 = abs(_712);
    float _716 = -_714;
    float _718 = _716 + 1.0;
    float _720 = abs(_712);
    float _722 = fma(_720, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _724 = _712 < 0.0;
    float _726 = float(_724);
    int _728 = as_type<int>(_718) + (-218103808);
    float _730 = abs(_712);
    float _732 = fma(_730, _722, -0.212114393711090087890625);
    bool _734 = uint(_728) >= 1920991232u;
    float _736 = abs(_712);
    float _738 = fma(_736, _732, 1.570728778839111328125);
    bool _740 = !_734;
    float _758;
    if (!_740)
    {
        int _742 = as_type<int>(_718);
        int _744 = as_type<int>(_664);
        int _746 = 3264;
        int _748;
        int _750;
        int _752;
        int _754;
        int _756;
        _73(_742, _744, _746, _748, _750, _752, _754, _756, out.gl_Position, out.gl_PointSize);
        _758 = as_type<float>(_750);
        _760 = true;
    }
    else
    {
        float _762 = rsqrt(_718);
        float _764 = _718 * _762;
        float _766 = _762 * 0.5;
        float _768 = -_764;
        float _770 = 0.0 + _768;
        float _772 = fma(_766, _770, 0.5);
        float _774 = fma(_764, _772, _764);
        float _776 = -_774;
        float _778 = 0.0 + _776;
        float _780 = fma(_774, _778, _718);
        float _782 = fma(_766, _780, _774);
        _758 = _782;
    }
    _760 = false;
    float _784 = _758;
    float _786 = in.m_44.x;
    float _788 = in.m_44.y;
    float _790 = in.m_44.z;
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    float _796 = _738 * _784;
    float _798 = _710 * 3.883221149444580078125;
    float _800 = -_522;
    float _802 = _800 + _712;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _806 = 1.0 + _804;
    float _808 = fma(_650, _802, _522);
    float _810 = 1.0 / _806;
    bool _812 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _820 = _816 || _818;
    float _822 = _794 * _118;
    bool _824 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _826 = isnan(1.0);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _832 = _828 || _830;
    float _834 = exp2(_822);
    float _836 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _838 = _790 * 2.0;
    float _840 = _788 * 2.0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _852 = _850 != 0;
    float _854 = floor(_838);
    float _856 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _860 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _862 = _788 + _790;
    float _864 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _856);
    float _866 = _786 * 2.0;
    float _868 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _858);
    float _870 = _862 + (-1.0);
    float _872 = floor(_840);
    float _874 = _788 + _786;
    float _876 = -_834;
    float _878 = _876 + 1.0;
    bool _880 = !_844;
    int _882 = _880 ? 0 : 1;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _886 = _874 + (-1.0);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _898 = _896 != 0;
    float _900 = floor(_866);
    bool _902 = !_852;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _908 = _854 > 0.0;
    float _910 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _860);
    float _912 = _820 ? _878 : 0.0;
    bool _914 = _854 >= 0.0;
    bool _916 = isnan(_854);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _926 = !_848;
    int _928 = _926 ? 0 : 1;
    float _930 = _808;
    if (_832)
    {
        float _932 = _912 * _810;
        _120 = _932;
    }
    float _934 = _120;
    int _936 = _922 ? 0 : 1;
    bool _938 = _872 > 0.0;
    bool _940 = _900 >= 0.0;
    bool _942 = isnan(_900);
    bool _944 = _940 || _942;
    bool _946 = isnan(0.0);
    bool _948 = _944 || _946;
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _864);
    bool _952 = _872 >= 0.0;
    bool _954 = isnan(_872);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = _934 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _966 = ~_936;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = _962 * _924;
    bool _974 = !_898;
    int _976 = _974 ? 0 : 1;
    float _978 = _934 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _980 = _970;
    if (!_908)
    {
        int _982 = ~_936;
        int _984 = _982 + 1;
        _980 = _984;
    }
    int _986 = _980;
    float _988 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[203].x, _972);
    int _990 = _948 ? 0 : 1;
    float _992 = rsqrt(_950);
    int _994 = _960 ? 0 : 1;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1002 = _1000 != 0;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1006 = _1004 != 0;
    bool _1008 = _900 > 0.0;
    float _1010 = _978 * _964;
    int _1012 = ~_990;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    float _1018 = floor(_988);
    int _1020 = ~_994;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _868);
    float _1028 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1010);
    int _1030 = _1024;
    int _1032 = _1016;
    if (!_938)
    {
        int _1034 = ~_994;
        int _1036 = _1034 + 1;
        _1030 = _1036;
    }
    int _1038 = _1030;
    bool _1040 = !_1006;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _688 * _992;
    if (!_1008)
    {
        int _1046 = ~_990;
        int _1048 = _1046 + 1;
        _1032 = _1048;
    }
    int _1050 = _1032;
    float _1052 = floor(_1028);
    bool _1054 = !_1002;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = float(_1050);
    float _1060 = _988 + 0.25;
    float _1062 = float(_986);
    int _1064 = abs(_1056);
    float _1066 = floor(_1060);
    int _1068 = abs(_1042);
    float _1070 = -_1018;
    float _1072 = _988 + _1070;
    float _1074 = _1028 + 0.25;
    bool _1076 = !_998;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _988 * 6.283185482025146484375;
    float _1082 = float(_1064);
    float _1084 = rsqrt(_1026);
    int _1086 = abs(_1078);
    bool _1088 = _1072 >= 0.5;
    bool _1090 = isnan(_1072);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.5);
    bool _1096 = _1092 || _1094;
    float _1098 = _1082 * _1058;
    int _1100 = abs(_928);
    float _1102 = -_1052;
    float _1104 = _1028 + _1102;
    float _1106 = float(_1038);
    float _1108 = -_1066;
    float _1110 = _1060 + _1108;
    float _1112 = floor(_1074);
    bool _1114 = !_1096;
    float _1116 = _1114 ? 0.5 : (-0.5);
    float _1118 = _1080 * 0.15915493667125701904296875;
    float _1120 = float(_1086);
    float _1122 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1124 = _1122 * 2.0;
    bool _1126 = _1104 >= 0.5;
    bool _1128 = isnan(_1104);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    float _1136 = _1118 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    float _1140 = float(_1100);
    float _1142 = _1120 * _1062;
    bool _1144 = _1110 > 0.5;
    float _1146 = -_1112;
    float _1148 = _1074 + _1146;
    int _1150 = abs(_882);
    float _1152 = _1140 * _1124;
    float _1154 = _1028 * 6.283185482025146484375;
    bool _1156 = !_894;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = in.m_50.x;
    float _1162 = in.m_50.y;
    float _1164 = in.m_50.z;
    float _1166 = float(_1068);
    float _1168 = _1154 * 0.15915493667125701904296875;
    int _1170 = abs(_1158);
    float _1172 = _1142 * (-2.0);
    bool _1174 = !_1134;
    float _1176 = _1174 ? 0.5 : (-0.5);
    float _1178 = _1166 * _1106;
    float _1180 = _1110;
    float _1182 = _1148;
    if (_1144)
    {
        float _1184 = -_1110;
        float _1186 = _1184 + 1.0;
        _1180 = _1186;
    }
    float _1188 = _1180;
    bool _1190 = _1148 > 0.5;
    float _1192 = _1168 * 6.283185482025146484375;
    float _1194 = sin(_1192);
    float _1196 = float(_1170);
    float _1198 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1200 = _1198 * 2.0;
    float _1202 = float(_1150);
    float _1204 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1206 = abs(_904);
    float _1208 = fma(_1188, 4.0, -1.0);
    float _1210 = _1196 * _1200;
    bool _1212 = !_890;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = fma(_1202, _1204, _1152);
    float _1218 = float(_1206);
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1222 = _1098 * (-2.0);
    int _1224 = abs(_1214);
    if (_1190)
    {
        float _1226 = -_1148;
        float _1228 = _1226 + 1.0;
        _1182 = _1228;
    }
    float _1230 = _1182;
    float _1232 = fma(_1218, _1220, _1216);
    float _1234 = fma(_884, _1222, _884);
    float _1236 = fma(_1222, _1162, _1162);
    float _1238 = float(_1224);
    float _1240 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1242 = abs(_976);
    float _1244 = fma(_1230, 4.0, -1.0);
    float _1246 = fma(_1232, 3.1415927410125732421875, _1160);
    float _1248 = _788 + (-0.5);
    float _1250 = float(_1242);
    float _1252 = fma(_1238, _1240, _1210);
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1256 = _786 + (-0.5);
    float _1258 = fma(_1246, _1172, _1246);
    float _1260 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1236);
    float _1262 = fma(_906, _1172, _906);
    float _1264 = fma(_1250, _1254, _1252);
    float _1266 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1258);
    float _1268 = fma(_1234, _934, _1260);
    float _1270 = _786 + _790;
    float _1272 = fma(_1264, 3.1415927410125732421875, _1164);
    float _1274 = fma(_1262, _934, _1266);
    float _1276 = in.m_48.x;
    float _1278 = in.m_48.y;
    float _1280 = in.m_48.z;
    float _1282 = _1270 + (-1.0);
    float _1284 = _1178 * (-2.0);
    float _1286 = _790 + (-0.5);
    float _1288 = rsqrt(_910);
    float _1290 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = fma(_1272, _1284, _1272);
    float _1294 = _1274 * 0.15915493667125701904296875;
    float _1296 = _1268 * 0.15915493667125701904296875;
    float _1298 = fma(_1290, _1284, _1290);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1292);
    float _1302 = sqrt(_910);
    float _1304 = fma(_1298, _934, _1300);
    float _1306 = _1294 * 6.283185482025146484375;
    float _1308 = sin(_1306);
    float _1310 = _1304 * 0.15915493667125701904296875;
    float _1312 = _686 * _1288;
    float _1314 = _690 * _1084;
    float _1316 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1320 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1322 = _1294 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = _1302 * _1312;
    float _1330 = _1302 * _1044;
    float _1332 = _1302 * _1314;
    float _1334 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1328);
    float _1340 = _1310 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1330);
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1332);
    float _1348 = _1338 * _1326;
    bool _1350 = _1330 != 0.0;
    bool _1352 = isnan(_1330);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    float _1360 = _1344 * _1334;
    float _1362 = _1310 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    bool _1366 = _1328 == 0.0;
    bool _1368 = !_1358;
    bool _1370 = _1366 && _1368;
    bool _1372 = _1332 == 0.0;
    bool _1374 = _1372 && _1370;
    float _1376 = _1296 * 6.283185482025146484375;
    float _1378 = cos(_1376);
    float _1380 = _1346 * _1336;
    float _1382 = _1324 * _1342;
    float _1384 = _1308 * _1342;
    float _1386 = _1296 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1324 * _1364;
    if (!_1374)
    {
        float _1392 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[17].y, _808);
        _930 = _1392;
    }
    float _1394 = _930;
    float _1396 = _1308 * _1378;
    float _1398 = _1308 * _1364;
    float _1400 = _1342 * _1378;
    float _1402 = _1364 * _1378;
    float _1404 = _1324 * _1378;
    float _1406 = _1396 * _1360;
    float _1408 = -_1382;
    float _1410 = fma(_1388, _1398, _1408);
    float _1412 = fma(_1388, _1384, _1390);
    float _1414 = fma(_1388, _1390, _1384);
    float _1416 = -_1388;
    float _1418 = fma(_1416, _1348, _1406);
    float _1420 = _1410 * _1360;
    float _1422 = _1412 * _1360;
    float _1424 = -_1398;
    float _1426 = fma(_1388, _1382, _1424);
    float _1428 = fma(_1402, _1348, _1420);
    float _1430 = fma(_1400, _1348, _1422);
    float _1432 = fma(_1404, _1380, _1418);
    float _1434 = _1410 * _1394;
    float _1436 = fma(_1414, _1380, _1428);
    float _1438 = fma(_1426, _1380, _1430);
    float _1440 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1444 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1448 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1450 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1452 = _1440 * _1440;
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1450);
    float _1460 = fma(_1442, _1442, _1452);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1454);
    float _1464 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1456);
    float _1466 = fma(_1444, _1444, _1460);
    float _1468 = _1462 * _1462;
    float _1470 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1458);
    float _1472 = rsqrt(_1466);
    float _1474 = fma(_1464, _1464, _1468);
    float _1476 = fma(_1470, _1470, _1474);
    float _1478 = _726 * 2.0;
    float _1480 = sqrt(_1466);
    float _1482 = -_1478;
    float _1484 = fma(_796, _1482, _796);
    float _1486 = _400 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1488 = fma(_726, 3.1415927410125732421875, _1484);
    float _1490 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1486);
    float _1492 = rsqrt(_1476);
    float _1494 = _1440 * _1472;
    float _1496 = _1442 * _1472;
    float _1498 = _1444 * _1472;
    float _1500 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    float _1502 = _1488 * 0.15915493667125701904296875;
    float _1504 = _400 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1506 = _1502 * 6.283185482025146484375;
    float _1508 = sin(_1506);
    float _1510 = _1462 * _1492;
    float _1512 = _1464 * _1492;
    float _1514 = _1494 * _1510;
    float _1516 = fma(_1496, _1512, _1514);
    float _1518 = _1470 * _1492;
    float _1520 = fma(_1498, _1518, _1516);
    float _1522 = _798 * 0.15915493667125701904296875;
    float _1524 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1504);
    float _1526 = _1520 * _1480;
    float _1528 = _1522 * 6.283185482025146484375;
    float _1530 = cos(_1528);
    float _1532 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1524);
    float _1534 = fma(_1496, _1526, _1464);
    float _1536 = fma(_1498, _1526, _1470);
    float _1538 = _1500 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1542 = fma(_1494, _1526, _1462);
    float _1544 = _1522 * 6.283185482025146484375;
    float _1546 = sin(_1544);
    float _1548 = _1538 + _1534;
    float _1550 = _1540 + _1536;
    float _1552 = _1396 * _1394;
    float _1554 = _1412 * _1394;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1562 = _1550 + _1560;
    float _1564 = -_656;
    float _1566 = fma(_1508, _1530, _1564);
    float _1568 = _1558 * _1558;
    float _1570 = _1562 * _1562;
    float _1572 = _400 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1574 = fma(_650, _1566, _656);
    float _1576 = _1568 + _1570;
    float _1578 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1572);
    float _1580 = -_658;
    float _1582 = fma(_1508, _1546, _1580);
    float _1584 = _1574;
    float _1586 = _1394;
    if (!_1374)
    {
        float _1588 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1574);
        _1584 = _1588;
    }
    float _1590 = _1584;
    float _1592 = sqrt(_1576);
    float _1594 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1578);
    float _1596 = fma(_650, _1582, _658);
    float _1598 = _1594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1600 = _1596;
    if (!_1374)
    {
        float _1602 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = _1598 + _1542;
    bool _1608 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1608)
    {
        _698 = _1570;
    }
    float _1610 = _698;
    float _1612 = _1610;
    if (!_1608)
    {
        _1586 = _1568;
    }
    float _1614 = _1586;
    float _1616 = _1614;
    if (!_1608)
    {
        _500 = _1548;
    }
    float _1618 = _500;
    float _1620 = _1618;
    if (!_1608)
    {
        _502 = _1550;
    }
    float _1622 = _502;
    float _1624 = _1622;
    if (!_1608)
    {
        _504 = _1606;
    }
    float _1626 = _504;
    bool _1628 = !_1608;
    float _1630 = _1626;
    if (!_1628)
    {
        float _1632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1636 = _1592 + _1634;
        float _1638 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = rsqrt(_1576);
        float _1642 = _1636 * _1632;
        float _1644 = _1642 * 0.15915493667125701904296875;
        float _1646 = _1644 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = cos(_1650);
        float _1654 = fma(_1648, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1656 = _1640 * _1654;
        float _1658 = _1652 + (-1.0);
        float _1660 = _1558 * _1656;
        float _1662 = _1562 * _1656;
        float _1664 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1668 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1670 = _1660 * _1660;
        float _1672 = fma(_1606, _1652, _1664);
        float _1674 = _1662 * _1662;
        _1630 = _1672;
        _1616 = _1670;
        _1612 = _1674;
        _1620 = _1666;
        _1624 = _1668;
    }
    float _1676 = _1630;
    float _1678 = _1616;
    float _1680 = _1612;
    float _1682 = _1620;
    float _1684 = _1624;
    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1688 = _1676 + _1686;
    float _1690 = fma(_1400, _1590, _1554);
    float _1692 = -_1388;
    float _1694 = fma(_1692, _1590, _1552);
    float _1696 = fma(_1402, _1590, _1434);
    float _1698 = fma(_1688, _1688, _1678);
    float _1700 = fma(_1426, _1604, _1690);
    float _1702 = fma(_1404, _1604, _1694);
    float _1704 = fma(_1414, _1604, _1696);
    float _1706 = _1698 + _1680;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1712 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_52.x = _536;
    out.m_52.y = _488;
    out.m_52.z = _478;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1708);
    float _1716 = sqrt(_1706);
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1710);
    float _1720 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1712);
    float _1722 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1714);
    float _1724 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1718);
    float _1726 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1720);
    out.m_54.x = _1722;
    out.m_54.y = _1724;
    out.m_54.z = _1726;
    bool _1728 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1730 = isnan(_1716);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1736 = _1732 || _1734;
    float _1738 = _1702;
    if (!_1736)
    {
        _1738 = 1.0;
    }
    float _1740 = _1738;
    bool _1742 = !_1736;
    float _1744 = _1740;
    if (!_1742)
    {
        bool _1746 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1748 = isnan(_1716);
        bool _1750 = _1746 || _1748;
        bool _1752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1754 = _1750 || _1752;
        if (!_1754)
        {
            float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1758 = _1716 + _1756;
            float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1762 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1760;
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1768 = 1.0 / _1762;
            float _1770 = _1758 * _1768;
            float _1772 = fma(_1770, _1766, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1744 = _1772;
            _1774 = true;
        }
        else
        {
            bool _1776 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1778 = isnan(_1716);
            bool _1780 = _1776 || _1778;
            bool _1782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1784 = _1780 || _1782;
            if (!_1784)
            {
                float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1788 = _1716 + _1786;
                float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1792 = _1790 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1798 = 1.0 / _1792;
                float _1800 = _1788 * _1798;
                float _1802 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1744 = _1802;
                _1774 = true;
            }
            else
            {
                _1744 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1774 = false;
    float _1804 = _1744;
    float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1808 = _1676 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1812 = _1682 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1816 = _1684 + _1814;
    out.m_56.x = _1538;
    out.m_56.y = _1598;
    out.m_56.z = _1540;
    float _1818 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1820 = fma(_1812, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1822 = fma(_1816, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_40.x = 1.0;
    float _1824 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1826 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1828 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1824);
    float _1834 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1836 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1828);
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1830);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1832);
    float _1842 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1834);
    float _1844 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1836);
    float _1846 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1838);
    float _1848 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1858 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1860 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1862 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1856);
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1858);
    float _1868 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1860);
    float _1870 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1862);
    float _1872 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1866);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1868);
    float _1878 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1870);
    float _1880 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1884 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1886 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1876);
    float _1888 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1878);
    out.m_58.x = _1820;
    out.m_58.y = _1818;
    out.m_58.z = _1822;
    out.m_60.w = _1882;
    out.gl_Position.x = _1884;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _1886;
    out.gl_Position.w = _1888;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1774 = false;
    bool _760 = false;
    bool _574 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_37.w;
    float _82 = trunc(_80);
    int _84 = int(_82);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_40.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1946 = as_type<float>(_100);
        out.gl_Position.z = _1946;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_42.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _92 = _122;
    }
    float _124 = _92;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2016 = as_type<float>(_138);
        out.gl_Position.z = _2016;
    }
    if (_130)
    {
        return out;
    }
    int _140 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _142 = _140;
    int _144 = 0;
    int _146 = _75(_142, _144, (*spvDescriptorSet0.support_buffer));
    float _148 = in.m_44.z;
    float _150 = in.m_46.z;
    float _152 = _118 + _148;
    float _154 = _152 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _156 = trunc(_150);
    int _158 = int(_156);
    float _160 = float(_146);
    int _162 = abs(_146);
    bool _164 = _146 == 0;
    float _166 = _154 * _160;
    float _168 = float(uint(_162));
    float _170 = trunc(_166);
    int _172 = int(_170);
    float _174 = 1.0 / _168;
    int _176 = abs(_172);
    uint _179 = uint(int(uint(_172) >> uint(31)));
    float _181 = float(uint(_176));
    int _183 = ~int(_179);
    int _185 = _183 + 1;
    int _187 = as_type<int>(_174) + (-2);
    float _189 = as_type<float>(_187) * _181;
    float _191 = trunc(_189);
    float _193 = precise::max(_191, 0.0);
    uint _195 = uint(_193);
    int _197 = ~int(_195);
    int _199 = _197 + 1;
    int _201 = _199 * _162;
    int _203 = _201 + _176;
    float _205 = float(uint(_203));
    float _207 = as_type<float>(_187) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _213 = uint(_211);
    int _215 = int(_195) + int(_213);
    int _217 = ~_215;
    int _219 = _217 + 1;
    int _221 = _219 * _162;
    int _223 = _221 + _176;
    bool _225 = uint(_223) >= uint(_162);
    bool _227 = !_225;
    int _229 = _227 ? 0 : (-1);
    int _231 = ~_215;
    int _233 = _231 + _229;
    int _235 = _233 + 1;
    int _237 = _235 * _162;
    int _239 = _237 + _176;
    int _241 = _239 ^ _185;
    int _243 = ~_185;
    int _245 = _243 + _241;
    int _247 = _245 + 1;
    bool _249 = !_164;
    int _251 = _249 ? _247 : (-1);
    int _253 = _251;
    int _255 = 0;
    int _257 = _76(_253, _255, (*spvDescriptorSet0.support_buffer));
    int _259 = _158;
    int _261 = 0;
    int _263 = _76(_259, _261, (*spvDescriptorSet0.support_buffer));
    float4 _266 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_257, _263)), 0).xyzw;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = _266.w;
    float _276 = in.m_48.w;
    float _278 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _280 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _284 = _280 || _282;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    float _290 = in.m_42.x;
    float _292 = in.m_42.y;
    float _294 = in.m_42.z;
    float _296 = in.m_37.x;
    float _298 = in.m_37.y;
    float _300 = in.m_37.z;
    float _302 = 0.0;
    float _304 = _278;
    if (!_288)
    {
        float _306 = _278 * _278;
        float _308 = _306 * 0.5;
        _302 = _308;
    }
    float _310 = _302;
    float _312 = _310;
    if (!_288)
    {
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _314;
    }
    float _316 = _312;
    bool _318 = !_288;
    float _320 = _316;
    int _322 = 0;
    if (!_318)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = _278 * _326;
        float _336 = 1.0 / _330;
        float _338 = _332 * 0.693147182464599609375;
        float _340 = exp2(_334);
        float _342 = 1.0 / _338;
        float _344 = _340 + (-1.0);
        float _346 = -_344;
        float _348 = fma(_346, _342, _278);
        float _350 = _348 * _336;
        float _352 = _350 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _352;
        _322 = as_type<int>(_342);
    }
    float _354 = _320;
    int _356 = _322;
    bool _358 = !_288;
    if (!_358)
    {
        float _360 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = log2(_360);
        float _364 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _366 = _364 + 1.0;
        float _368 = 1.0 / _366;
        float _370 = _278 * _362;
        float _372 = exp2(_370);
        float _374 = -_372;
        float _376 = _374 + 1.0;
        float _378 = _376 * _368;
        _304 = _378;
    }
    float _380 = _304;
    float _382 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _384 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _386 = _251 + 1;
    float _388 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_380, _290, _382);
    float _392 = fma(_380, _292, _384);
    int _394 = abs(_386);
    float _396 = fma(_380, _294, _388);
    float _398 = fma(_390, _276, _296);
    float _400 = fma(_392, _276, _298);
    float _402 = float(uint(_394));
    float _404 = fma(_396, _276, _300);
    uint _406 = as_type<uint>(half2(float2(_274, 0.0)));
    uint _408 = uint(int(uint(_386) >> uint(31)));
    float _410 = as_type<float>(_187) * _402;
    uint _412 = extract_bits(_406, 0u, 8u);
    int _414 = int(_412) & 255;
    uint _416 = extract_bits(_406, 8u, 8u);
    int _418 = int(_416) & 255;
    int _420 = _418 << 8;
    int _422 = _414 | _420;
    int _424 = ~int(_408);
    int _426 = _424 + 1;
    float _428 = trunc(_410);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    int _434 = ~int(_432);
    int _436 = _434 + 1;
    int _438 = _436 * _162;
    int _440 = _438 + _394;
    float _442 = float(uint(_440));
    float _444 = as_type<float>(_187) * _442;
    float _446 = trunc(_444);
    float _448 = precise::max(_446, 0.0);
    uint _450 = uint(_448);
    int _452 = int(_432) + int(_450);
    int _454 = ~_452;
    int _456 = _454 + 1;
    int _458 = _456 * _162;
    int _460 = _458 + _394;
    bool _462 = uint(_460) >= uint(_162);
    bool _464 = !_462;
    int _466 = _464 ? 0 : (-1);
    bool _468 = _422 >= 32768;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _472 = ~_452;
    int _474 = _472 + _466;
    int _476 = _474 + 1;
    float _478 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _480 = _476 * _162;
    int _482 = _480 + _394;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _486 = _482 ^ _426;
    float _488 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _490 = ~_426;
    int _492 = _490 + _486;
    int _494 = _492 + 1;
    int _496 = _422 + (-1024);
    int _498 = _496;
    float _500 = _400;
    float _502 = _398;
    float _504 = _404;
    if (_468)
    {
        int _506 = ~_422;
        int _508 = _506 + 33792;
        int _510 = _508 + 1;
        _498 = _510;
    }
    int _512 = _498;
    bool _514 = !_164;
    int _516 = _514 ? _494 : (-1);
    int _518 = _512 + 30719;
    float _520 = float(_518);
    float _522 = fma(_520, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = abs(_522);
    float _528 = -_526;
    float _530 = _528 + 1.0;
    float _532 = abs(_522);
    float _534 = fma(_532, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _536 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _538 = _522 < 0.0;
    float _540 = float(_538);
    int _542 = as_type<int>(_530) + (-218103808);
    float _544 = abs(_522);
    float _546 = fma(_544, _534, -0.212114393711090087890625);
    bool _548 = uint(_542) >= 1920991232u;
    float _550 = abs(_522);
    float _552 = fma(_550, _546, 1.570728778839111328125);
    bool _554 = !_548;
    float _572;
    if (!_554)
    {
        int _556 = as_type<int>(_530);
        int _558 = _356;
        int _560 = 2368;
        int _562;
        int _564;
        int _566;
        int _568;
        int _570;
        _73(_556, _558, _560, _562, _564, _566, _568, _570, out.gl_Position, out.gl_PointSize);
        _572 = as_type<float>(_564);
        _574 = true;
    }
    else
    {
        float _576 = rsqrt(_530);
        float _578 = _530 * _576;
        float _580 = _576 * 0.5;
        float _582 = -_578;
        float _584 = 0.0 + _582;
        float _586 = fma(_580, _584, 0.5);
        float _588 = fma(_578, _586, _578);
        float _590 = -_588;
        float _592 = 0.0 + _590;
        float _594 = fma(_588, _592, _530);
        float _596 = fma(_580, _594, _588);
        _572 = _596;
    }
    _574 = false;
    float _598 = _572;
    int _600 = _516;
    int _602 = 0;
    int _604 = _76(_600, _602, (*spvDescriptorSet0.support_buffer));
    int _606 = _158;
    int _608 = 0;
    int _610 = _76(_606, _608, (*spvDescriptorSet0.support_buffer));
    float4 _612 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_604, _610)), 0).xyzw;
    float _614 = _612.x;
    float _616 = _612.y;
    float _618 = _612.z;
    float _620 = _612.w;
    float _622 = _552 * _598;
    float _624 = _540 * 2.0;
    float _626 = _520 * 3.883221149444580078125;
    float _628 = floor(_166);
    float _630 = -_624;
    float _632 = fma(_622, _630, _622);
    float _634 = _626 * 0.15915493667125701904296875;
    float _636 = fma(_540, 3.1415927410125732421875, _632);
    float _638 = _634 * 6.283185482025146484375;
    float _640 = cos(_638);
    float _642 = _636 * 0.15915493667125701904296875;
    float _644 = _642 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = -_628;
    float _650 = _166 + _648;
    float _652 = _634 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = _646 * _640;
    float _658 = _646 * _654;
    uint _660 = as_type<uint>(half2(float2(_620, 0.0)));
    float _662 = -_268;
    float _664 = _662 + _614;
    float _666 = -_270;
    float _668 = _666 + _616;
    float _670 = -_272;
    float _672 = _670 + _618;
    uint _674 = extract_bits(_660, 0u, 8u);
    int _676 = int(_674) & 255;
    uint _678 = extract_bits(_660, 8u, 8u);
    int _680 = int(_678) & 255;
    int _682 = _680 << 8;
    int _684 = _676 | _682;
    float _686 = fma(_650, _664, _268);
    float _688 = fma(_650, _668, _270);
    float _690 = fma(_650, _672, _272);
    bool _692 = _684 >= 32768;
    int _694 = _684 + (-1024);
    int _696 = _694;
    float _698 = _650;
    if (_692)
    {
        int _700 = ~_684;
        int _702 = _700 + 33792;
        int _704 = _702 + 1;
        _696 = _704;
    }
    int _706 = _696;
    int _708 = _706 + 30719;
    float _710 = float(_708);
    float _712 = fma(_710, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _714 = abs(_712);
    float _716 = -_714;
    float _718 = _716 + 1.0;
    float _720 = abs(_712);
    float _722 = fma(_720, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _724 = _712 < 0.0;
    float _726 = float(_724);
    int _728 = as_type<int>(_718) + (-218103808);
    float _730 = abs(_712);
    float _732 = fma(_730, _722, -0.212114393711090087890625);
    bool _734 = uint(_728) >= 1920991232u;
    float _736 = abs(_712);
    float _738 = fma(_736, _732, 1.570728778839111328125);
    bool _740 = !_734;
    float _758;
    if (!_740)
    {
        int _742 = as_type<int>(_718);
        int _744 = as_type<int>(_664);
        int _746 = 3264;
        int _748;
        int _750;
        int _752;
        int _754;
        int _756;
        _73(_742, _744, _746, _748, _750, _752, _754, _756, out.gl_Position, out.gl_PointSize);
        _758 = as_type<float>(_750);
        _760 = true;
    }
    else
    {
        float _762 = rsqrt(_718);
        float _764 = _718 * _762;
        float _766 = _762 * 0.5;
        float _768 = -_764;
        float _770 = 0.0 + _768;
        float _772 = fma(_766, _770, 0.5);
        float _774 = fma(_764, _772, _764);
        float _776 = -_774;
        float _778 = 0.0 + _776;
        float _780 = fma(_774, _778, _718);
        float _782 = fma(_766, _780, _774);
        _758 = _782;
    }
    _760 = false;
    float _784 = _758;
    float _786 = in.m_44.x;
    float _788 = in.m_44.y;
    float _790 = in.m_44.z;
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    float _796 = _738 * _784;
    float _798 = _710 * 3.883221149444580078125;
    float _800 = -_522;
    float _802 = _800 + _712;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _806 = 1.0 + _804;
    float _808 = fma(_650, _802, _522);
    float _810 = 1.0 / _806;
    bool _812 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _820 = _816 || _818;
    float _822 = _794 * _118;
    bool _824 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _826 = isnan(1.0);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _832 = _828 || _830;
    float _834 = exp2(_822);
    float _836 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _838 = _790 * 2.0;
    float _840 = _788 * 2.0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _852 = _850 != 0;
    float _854 = floor(_838);
    float _856 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _860 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _862 = _788 + _790;
    float _864 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _856);
    float _866 = _786 * 2.0;
    float _868 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _858);
    float _870 = _862 + (-1.0);
    float _872 = floor(_840);
    float _874 = _788 + _786;
    float _876 = -_834;
    float _878 = _876 + 1.0;
    bool _880 = !_844;
    int _882 = _880 ? 0 : 1;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _886 = _874 + (-1.0);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _898 = _896 != 0;
    float _900 = floor(_866);
    bool _902 = !_852;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _908 = _854 > 0.0;
    float _910 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _860);
    float _912 = _820 ? _878 : 0.0;
    bool _914 = _854 >= 0.0;
    bool _916 = isnan(_854);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _926 = !_848;
    int _928 = _926 ? 0 : 1;
    float _930 = _808;
    if (_832)
    {
        float _932 = _912 * _810;
        _120 = _932;
    }
    float _934 = _120;
    int _936 = _922 ? 0 : 1;
    bool _938 = _872 > 0.0;
    bool _940 = _900 >= 0.0;
    bool _942 = isnan(_900);
    bool _944 = _940 || _942;
    bool _946 = isnan(0.0);
    bool _948 = _944 || _946;
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _864);
    bool _952 = _872 >= 0.0;
    bool _954 = isnan(_872);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = _934 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _966 = ~_936;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = _962 * _924;
    bool _974 = !_898;
    int _976 = _974 ? 0 : 1;
    float _978 = _934 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _980 = _970;
    if (!_908)
    {
        int _982 = ~_936;
        int _984 = _982 + 1;
        _980 = _984;
    }
    int _986 = _980;
    float _988 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[203].x, _972);
    int _990 = _948 ? 0 : 1;
    float _992 = rsqrt(_950);
    int _994 = _960 ? 0 : 1;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1002 = _1000 != 0;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1006 = _1004 != 0;
    bool _1008 = _900 > 0.0;
    float _1010 = _978 * _964;
    int _1012 = ~_990;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    float _1018 = floor(_988);
    int _1020 = ~_994;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _868);
    float _1028 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1010);
    int _1030 = _1024;
    int _1032 = _1016;
    if (!_938)
    {
        int _1034 = ~_994;
        int _1036 = _1034 + 1;
        _1030 = _1036;
    }
    int _1038 = _1030;
    bool _1040 = !_1006;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _688 * _992;
    if (!_1008)
    {
        int _1046 = ~_990;
        int _1048 = _1046 + 1;
        _1032 = _1048;
    }
    int _1050 = _1032;
    float _1052 = floor(_1028);
    bool _1054 = !_1002;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = float(_1050);
    float _1060 = _988 + 0.25;
    float _1062 = float(_986);
    int _1064 = abs(_1056);
    float _1066 = floor(_1060);
    int _1068 = abs(_1042);
    float _1070 = -_1018;
    float _1072 = _988 + _1070;
    float _1074 = _1028 + 0.25;
    bool _1076 = !_998;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _988 * 6.283185482025146484375;
    float _1082 = float(_1064);
    float _1084 = rsqrt(_1026);
    int _1086 = abs(_1078);
    bool _1088 = _1072 >= 0.5;
    bool _1090 = isnan(_1072);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.5);
    bool _1096 = _1092 || _1094;
    float _1098 = _1082 * _1058;
    int _1100 = abs(_928);
    float _1102 = -_1052;
    float _1104 = _1028 + _1102;
    float _1106 = float(_1038);
    float _1108 = -_1066;
    float _1110 = _1060 + _1108;
    float _1112 = floor(_1074);
    bool _1114 = !_1096;
    float _1116 = _1114 ? 0.5 : (-0.5);
    float _1118 = _1080 * 0.15915493667125701904296875;
    float _1120 = float(_1086);
    float _1122 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1124 = _1122 * 2.0;
    bool _1126 = _1104 >= 0.5;
    bool _1128 = isnan(_1104);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    float _1136 = _1118 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    float _1140 = float(_1100);
    float _1142 = _1120 * _1062;
    bool _1144 = _1110 > 0.5;
    float _1146 = -_1112;
    float _1148 = _1074 + _1146;
    int _1150 = abs(_882);
    float _1152 = _1140 * _1124;
    float _1154 = _1028 * 6.283185482025146484375;
    bool _1156 = !_894;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = in.m_50.x;
    float _1162 = in.m_50.y;
    float _1164 = in.m_50.z;
    float _1166 = float(_1068);
    float _1168 = _1154 * 0.15915493667125701904296875;
    int _1170 = abs(_1158);
    float _1172 = _1142 * (-2.0);
    bool _1174 = !_1134;
    float _1176 = _1174 ? 0.5 : (-0.5);
    float _1178 = _1166 * _1106;
    float _1180 = _1110;
    float _1182 = _1148;
    if (_1144)
    {
        float _1184 = -_1110;
        float _1186 = _1184 + 1.0;
        _1180 = _1186;
    }
    float _1188 = _1180;
    bool _1190 = _1148 > 0.5;
    float _1192 = _1168 * 6.283185482025146484375;
    float _1194 = sin(_1192);
    float _1196 = float(_1170);
    float _1198 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1200 = _1198 * 2.0;
    float _1202 = float(_1150);
    float _1204 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1206 = abs(_904);
    float _1208 = fma(_1188, 4.0, -1.0);
    float _1210 = _1196 * _1200;
    bool _1212 = !_890;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = fma(_1202, _1204, _1152);
    float _1218 = float(_1206);
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1222 = _1098 * (-2.0);
    int _1224 = abs(_1214);
    if (_1190)
    {
        float _1226 = -_1148;
        float _1228 = _1226 + 1.0;
        _1182 = _1228;
    }
    float _1230 = _1182;
    float _1232 = fma(_1218, _1220, _1216);
    float _1234 = fma(_884, _1222, _884);
    float _1236 = fma(_1222, _1162, _1162);
    float _1238 = float(_1224);
    float _1240 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1242 = abs(_976);
    float _1244 = fma(_1230, 4.0, -1.0);
    float _1246 = fma(_1232, 3.1415927410125732421875, _1160);
    float _1248 = _788 + (-0.5);
    float _1250 = float(_1242);
    float _1252 = fma(_1238, _1240, _1210);
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1256 = _786 + (-0.5);
    float _1258 = fma(_1246, _1172, _1246);
    float _1260 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1236);
    float _1262 = fma(_906, _1172, _906);
    float _1264 = fma(_1250, _1254, _1252);
    float _1266 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1258);
    float _1268 = fma(_1234, _934, _1260);
    float _1270 = _786 + _790;
    float _1272 = fma(_1264, 3.1415927410125732421875, _1164);
    float _1274 = fma(_1262, _934, _1266);
    float _1276 = in.m_48.x;
    float _1278 = in.m_48.y;
    float _1280 = in.m_48.z;
    float _1282 = _1270 + (-1.0);
    float _1284 = _1178 * (-2.0);
    float _1286 = _790 + (-0.5);
    float _1288 = rsqrt(_910);
    float _1290 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = fma(_1272, _1284, _1272);
    float _1294 = _1274 * 0.15915493667125701904296875;
    float _1296 = _1268 * 0.15915493667125701904296875;
    float _1298 = fma(_1290, _1284, _1290);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1292);
    float _1302 = sqrt(_910);
    float _1304 = fma(_1298, _934, _1300);
    float _1306 = _1294 * 6.283185482025146484375;
    float _1308 = sin(_1306);
    float _1310 = _1304 * 0.15915493667125701904296875;
    float _1312 = _686 * _1288;
    float _1314 = _690 * _1084;
    float _1316 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1320 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1322 = _1294 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = _1302 * _1312;
    float _1330 = _1302 * _1044;
    float _1332 = _1302 * _1314;
    float _1334 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1328);
    float _1340 = _1310 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1330);
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1332);
    float _1348 = _1338 * _1326;
    bool _1350 = _1330 != 0.0;
    bool _1352 = isnan(_1330);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    float _1360 = _1344 * _1334;
    float _1362 = _1310 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    bool _1366 = _1328 == 0.0;
    bool _1368 = !_1358;
    bool _1370 = _1366 && _1368;
    bool _1372 = _1332 == 0.0;
    bool _1374 = _1372 && _1370;
    float _1376 = _1296 * 6.283185482025146484375;
    float _1378 = cos(_1376);
    float _1380 = _1346 * _1336;
    float _1382 = _1324 * _1342;
    float _1384 = _1308 * _1342;
    float _1386 = _1296 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1324 * _1364;
    if (!_1374)
    {
        float _1392 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[17].y, _808);
        _930 = _1392;
    }
    float _1394 = _930;
    float _1396 = _1308 * _1378;
    float _1398 = _1308 * _1364;
    float _1400 = _1342 * _1378;
    float _1402 = _1364 * _1378;
    float _1404 = _1324 * _1378;
    float _1406 = _1396 * _1360;
    float _1408 = -_1382;
    float _1410 = fma(_1388, _1398, _1408);
    float _1412 = fma(_1388, _1384, _1390);
    float _1414 = fma(_1388, _1390, _1384);
    float _1416 = -_1388;
    float _1418 = fma(_1416, _1348, _1406);
    float _1420 = _1410 * _1360;
    float _1422 = _1412 * _1360;
    float _1424 = -_1398;
    float _1426 = fma(_1388, _1382, _1424);
    float _1428 = fma(_1402, _1348, _1420);
    float _1430 = fma(_1400, _1348, _1422);
    float _1432 = fma(_1404, _1380, _1418);
    float _1434 = _1410 * _1394;
    float _1436 = fma(_1414, _1380, _1428);
    float _1438 = fma(_1426, _1380, _1430);
    float _1440 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1444 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1448 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1450 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1452 = _1440 * _1440;
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1450);
    float _1460 = fma(_1442, _1442, _1452);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1454);
    float _1464 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1456);
    float _1466 = fma(_1444, _1444, _1460);
    float _1468 = _1462 * _1462;
    float _1470 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1458);
    float _1472 = rsqrt(_1466);
    float _1474 = fma(_1464, _1464, _1468);
    float _1476 = fma(_1470, _1470, _1474);
    float _1478 = _726 * 2.0;
    float _1480 = sqrt(_1466);
    float _1482 = -_1478;
    float _1484 = fma(_796, _1482, _796);
    float _1486 = _400 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1488 = fma(_726, 3.1415927410125732421875, _1484);
    float _1490 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1486);
    float _1492 = rsqrt(_1476);
    float _1494 = _1440 * _1472;
    float _1496 = _1442 * _1472;
    float _1498 = _1444 * _1472;
    float _1500 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    float _1502 = _1488 * 0.15915493667125701904296875;
    float _1504 = _400 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1506 = _1502 * 6.283185482025146484375;
    float _1508 = sin(_1506);
    float _1510 = _1462 * _1492;
    float _1512 = _1464 * _1492;
    float _1514 = _1494 * _1510;
    float _1516 = fma(_1496, _1512, _1514);
    float _1518 = _1470 * _1492;
    float _1520 = fma(_1498, _1518, _1516);
    float _1522 = _798 * 0.15915493667125701904296875;
    float _1524 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1504);
    float _1526 = _1520 * _1480;
    float _1528 = _1522 * 6.283185482025146484375;
    float _1530 = cos(_1528);
    float _1532 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1524);
    float _1534 = fma(_1496, _1526, _1464);
    float _1536 = fma(_1498, _1526, _1470);
    float _1538 = _1500 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1542 = fma(_1494, _1526, _1462);
    float _1544 = _1522 * 6.283185482025146484375;
    float _1546 = sin(_1544);
    float _1548 = _1538 + _1534;
    float _1550 = _1540 + _1536;
    float _1552 = _1396 * _1394;
    float _1554 = _1412 * _1394;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1562 = _1550 + _1560;
    float _1564 = -_656;
    float _1566 = fma(_1508, _1530, _1564);
    float _1568 = _1558 * _1558;
    float _1570 = _1562 * _1562;
    float _1572 = _400 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1574 = fma(_650, _1566, _656);
    float _1576 = _1568 + _1570;
    float _1578 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1572);
    float _1580 = -_658;
    float _1582 = fma(_1508, _1546, _1580);
    float _1584 = _1574;
    float _1586 = _1394;
    if (!_1374)
    {
        float _1588 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1574);
        _1584 = _1588;
    }
    float _1590 = _1584;
    float _1592 = sqrt(_1576);
    float _1594 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1578);
    float _1596 = fma(_650, _1582, _658);
    float _1598 = _1594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1600 = _1596;
    if (!_1374)
    {
        float _1602 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = _1598 + _1542;
    bool _1608 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1608)
    {
        _698 = _1570;
    }
    float _1610 = _698;
    float _1612 = _1610;
    if (!_1608)
    {
        _1586 = _1568;
    }
    float _1614 = _1586;
    float _1616 = _1614;
    if (!_1608)
    {
        _500 = _1548;
    }
    float _1618 = _500;
    float _1620 = _1618;
    if (!_1608)
    {
        _502 = _1550;
    }
    float _1622 = _502;
    float _1624 = _1622;
    if (!_1608)
    {
        _504 = _1606;
    }
    float _1626 = _504;
    bool _1628 = !_1608;
    float _1630 = _1626;
    if (!_1628)
    {
        float _1632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1636 = _1592 + _1634;
        float _1638 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = rsqrt(_1576);
        float _1642 = _1636 * _1632;
        float _1644 = _1642 * 0.15915493667125701904296875;
        float _1646 = _1644 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = cos(_1650);
        float _1654 = fma(_1648, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1656 = _1640 * _1654;
        float _1658 = _1652 + (-1.0);
        float _1660 = _1558 * _1656;
        float _1662 = _1562 * _1656;
        float _1664 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1668 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1670 = _1660 * _1660;
        float _1672 = fma(_1606, _1652, _1664);
        float _1674 = _1662 * _1662;
        _1630 = _1672;
        _1616 = _1670;
        _1612 = _1674;
        _1620 = _1666;
        _1624 = _1668;
    }
    float _1676 = _1630;
    float _1678 = _1616;
    float _1680 = _1612;
    float _1682 = _1620;
    float _1684 = _1624;
    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1688 = _1676 + _1686;
    float _1690 = fma(_1400, _1590, _1554);
    float _1692 = -_1388;
    float _1694 = fma(_1692, _1590, _1552);
    float _1696 = fma(_1402, _1590, _1434);
    float _1698 = fma(_1688, _1688, _1678);
    float _1700 = fma(_1426, _1604, _1690);
    float _1702 = fma(_1404, _1604, _1694);
    float _1704 = fma(_1414, _1604, _1696);
    float _1706 = _1698 + _1680;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1712 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_52.x = _536;
    out.m_52.y = _488;
    out.m_52.z = _478;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1708);
    float _1716 = sqrt(_1706);
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1710);
    float _1720 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1712);
    float _1722 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1714);
    float _1724 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1718);
    float _1726 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1720);
    out.m_54.x = _1722;
    out.m_54.y = _1724;
    out.m_54.z = _1726;
    bool _1728 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1730 = isnan(_1716);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1736 = _1732 || _1734;
    float _1738 = _1702;
    if (!_1736)
    {
        _1738 = 1.0;
    }
    float _1740 = _1738;
    bool _1742 = !_1736;
    float _1744 = _1740;
    if (!_1742)
    {
        bool _1746 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1748 = isnan(_1716);
        bool _1750 = _1746 || _1748;
        bool _1752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1754 = _1750 || _1752;
        if (!_1754)
        {
            float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1758 = _1716 + _1756;
            float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1762 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1760;
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1768 = 1.0 / _1762;
            float _1770 = _1758 * _1768;
            float _1772 = fma(_1770, _1766, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1744 = _1772;
            _1774 = true;
        }
        else
        {
            bool _1776 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1778 = isnan(_1716);
            bool _1780 = _1776 || _1778;
            bool _1782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1784 = _1780 || _1782;
            if (!_1784)
            {
                float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1788 = _1716 + _1786;
                float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1792 = _1790 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1798 = 1.0 / _1792;
                float _1800 = _1788 * _1798;
                float _1802 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1744 = _1802;
                _1774 = true;
            }
            else
            {
                _1744 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1774 = false;
    float _1804 = _1744;
    float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1808 = _1676 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1812 = _1682 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1816 = _1684 + _1814;
    out.m_56.x = _1538;
    out.m_56.y = _1598;
    out.m_56.z = _1540;
    float _1818 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1820 = fma(_1812, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1822 = fma(_1816, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_40.x = 1.0;
    float _1824 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1826 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1828 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1824);
    float _1834 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1836 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1828);
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1830);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1832);
    float _1842 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1834);
    float _1844 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1836);
    float _1846 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1838);
    float _1848 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1858 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1860 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1862 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1856);
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1858);
    float _1868 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1860);
    float _1870 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1862);
    float _1872 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1866);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1868);
    float _1878 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1870);
    float _1880 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1884 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1886 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1876);
    float _1888 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1878);
    out.m_58.x = _1820;
    out.m_58.y = _1818;
    out.m_58.z = _1822;
    out.m_60.w = _1882;
    out.gl_Position.x = _1884;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _1886;
    out.gl_Position.w = _1888;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1774 = false;
    bool _760 = false;
    bool _574 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_37.w;
    float _82 = trunc(_80);
    int _84 = int(_82);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_40.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1946 = as_type<float>(_100);
        out.gl_Position.z = _1946;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_42.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _92 = _122;
    }
    float _124 = _92;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2016 = as_type<float>(_138);
        out.gl_Position.z = _2016;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    int _140 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _142 = _140;
    int _144 = 0;
    int _146 = _75(_142, _144, (*spvDescriptorSet0.support_buffer));
    float _148 = in.m_44.z;
    float _150 = in.m_46.z;
    float _152 = _118 + _148;
    float _154 = _152 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _156 = trunc(_150);
    int _158 = int(_156);
    float _160 = float(_146);
    int _162 = abs(_146);
    bool _164 = _146 == 0;
    float _166 = _154 * _160;
    float _168 = float(uint(_162));
    float _170 = trunc(_166);
    int _172 = int(_170);
    float _174 = 1.0 / _168;
    int _176 = abs(_172);
    uint _179 = uint(int(uint(_172) >> uint(31)));
    float _181 = float(uint(_176));
    int _183 = ~int(_179);
    int _185 = _183 + 1;
    int _187 = as_type<int>(_174) + (-2);
    float _189 = as_type<float>(_187) * _181;
    float _191 = trunc(_189);
    float _193 = precise::max(_191, 0.0);
    uint _195 = uint(_193);
    int _197 = ~int(_195);
    int _199 = _197 + 1;
    int _201 = _199 * _162;
    int _203 = _201 + _176;
    float _205 = float(uint(_203));
    float _207 = as_type<float>(_187) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _213 = uint(_211);
    int _215 = int(_195) + int(_213);
    int _217 = ~_215;
    int _219 = _217 + 1;
    int _221 = _219 * _162;
    int _223 = _221 + _176;
    bool _225 = uint(_223) >= uint(_162);
    bool _227 = !_225;
    int _229 = _227 ? 0 : (-1);
    int _231 = ~_215;
    int _233 = _231 + _229;
    int _235 = _233 + 1;
    int _237 = _235 * _162;
    int _239 = _237 + _176;
    int _241 = _239 ^ _185;
    int _243 = ~_185;
    int _245 = _243 + _241;
    int _247 = _245 + 1;
    bool _249 = !_164;
    int _251 = _249 ? _247 : (-1);
    int _253 = _251;
    int _255 = 0;
    int _257 = _76(_253, _255, (*spvDescriptorSet0.support_buffer));
    int _259 = _158;
    int _261 = 0;
    int _263 = _76(_259, _261, (*spvDescriptorSet0.support_buffer));
    float4 _266 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_257, _263)), 0).xyzw;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = _266.w;
    float _276 = in.m_48.w;
    float _278 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _280 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _284 = _280 || _282;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    float _290 = in.m_42.x;
    float _292 = in.m_42.y;
    float _294 = in.m_42.z;
    float _296 = in.m_37.x;
    float _298 = in.m_37.y;
    float _300 = in.m_37.z;
    float _302 = 0.0;
    float _304 = _278;
    if (!_288)
    {
        float _306 = _278 * _278;
        float _308 = _306 * 0.5;
        _302 = _308;
    }
    float _310 = _302;
    float _312 = _310;
    if (!_288)
    {
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _314;
    }
    float _316 = _312;
    bool _318 = !_288;
    float _320 = _316;
    int _322 = 0;
    if (!_318)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = _278 * _326;
        float _336 = 1.0 / _330;
        float _338 = _332 * 0.693147182464599609375;
        float _340 = exp2(_334);
        float _342 = 1.0 / _338;
        float _344 = _340 + (-1.0);
        float _346 = -_344;
        float _348 = fma(_346, _342, _278);
        float _350 = _348 * _336;
        float _352 = _350 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _352;
        _322 = as_type<int>(_342);
    }
    float _354 = _320;
    int _356 = _322;
    bool _358 = !_288;
    if (!_358)
    {
        float _360 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = log2(_360);
        float _364 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _366 = _364 + 1.0;
        float _368 = 1.0 / _366;
        float _370 = _278 * _362;
        float _372 = exp2(_370);
        float _374 = -_372;
        float _376 = _374 + 1.0;
        float _378 = _376 * _368;
        _304 = _378;
    }
    float _380 = _304;
    float _382 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _384 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _386 = _251 + 1;
    float _388 = _354 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_380, _290, _382);
    float _392 = fma(_380, _292, _384);
    int _394 = abs(_386);
    float _396 = fma(_380, _294, _388);
    float _398 = fma(_390, _276, _296);
    float _400 = fma(_392, _276, _298);
    float _402 = float(uint(_394));
    float _404 = fma(_396, _276, _300);
    uint _406 = as_type<uint>(half2(float2(_274, 0.0)));
    uint _408 = uint(int(uint(_386) >> uint(31)));
    float _410 = as_type<float>(_187) * _402;
    uint _412 = extract_bits(_406, 0u, 8u);
    int _414 = int(_412) & 255;
    uint _416 = extract_bits(_406, 8u, 8u);
    int _418 = int(_416) & 255;
    int _420 = _418 << 8;
    int _422 = _414 | _420;
    int _424 = ~int(_408);
    int _426 = _424 + 1;
    float _428 = trunc(_410);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    int _434 = ~int(_432);
    int _436 = _434 + 1;
    int _438 = _436 * _162;
    int _440 = _438 + _394;
    float _442 = float(uint(_440));
    float _444 = as_type<float>(_187) * _442;
    float _446 = trunc(_444);
    float _448 = precise::max(_446, 0.0);
    uint _450 = uint(_448);
    int _452 = int(_432) + int(_450);
    int _454 = ~_452;
    int _456 = _454 + 1;
    int _458 = _456 * _162;
    int _460 = _458 + _394;
    bool _462 = uint(_460) >= uint(_162);
    bool _464 = !_462;
    int _466 = _464 ? 0 : (-1);
    bool _468 = _422 >= 32768;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _472 = ~_452;
    int _474 = _472 + _466;
    int _476 = _474 + 1;
    float _478 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _480 = _476 * _162;
    int _482 = _480 + _394;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _486 = _482 ^ _426;
    float _488 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _490 = ~_426;
    int _492 = _490 + _486;
    int _494 = _492 + 1;
    int _496 = _422 + (-1024);
    int _498 = _496;
    float _500 = _400;
    float _502 = _398;
    float _504 = _404;
    if (_468)
    {
        int _506 = ~_422;
        int _508 = _506 + 33792;
        int _510 = _508 + 1;
        _498 = _510;
    }
    int _512 = _498;
    bool _514 = !_164;
    int _516 = _514 ? _494 : (-1);
    int _518 = _512 + 30719;
    float _520 = float(_518);
    float _522 = fma(_520, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = abs(_522);
    float _528 = -_526;
    float _530 = _528 + 1.0;
    float _532 = abs(_522);
    float _534 = fma(_532, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _536 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _538 = _522 < 0.0;
    float _540 = float(_538);
    int _542 = as_type<int>(_530) + (-218103808);
    float _544 = abs(_522);
    float _546 = fma(_544, _534, -0.212114393711090087890625);
    bool _548 = uint(_542) >= 1920991232u;
    float _550 = abs(_522);
    float _552 = fma(_550, _546, 1.570728778839111328125);
    bool _554 = !_548;
    float _572;
    if (!_554)
    {
        int _556 = as_type<int>(_530);
        int _558 = _356;
        int _560 = 2368;
        int _562;
        int _564;
        int _566;
        int _568;
        int _570;
        _73(_556, _558, _560, _562, _564, _566, _568, _570, out.gl_Position, out.gl_PointSize);
        _572 = as_type<float>(_564);
        _574 = true;
    }
    else
    {
        float _576 = rsqrt(_530);
        float _578 = _530 * _576;
        float _580 = _576 * 0.5;
        float _582 = -_578;
        float _584 = 0.0 + _582;
        float _586 = fma(_580, _584, 0.5);
        float _588 = fma(_578, _586, _578);
        float _590 = -_588;
        float _592 = 0.0 + _590;
        float _594 = fma(_588, _592, _530);
        float _596 = fma(_580, _594, _588);
        _572 = _596;
    }
    _574 = false;
    float _598 = _572;
    int _600 = _516;
    int _602 = 0;
    int _604 = _76(_600, _602, (*spvDescriptorSet0.support_buffer));
    int _606 = _158;
    int _608 = 0;
    int _610 = _76(_606, _608, (*spvDescriptorSet0.support_buffer));
    float4 _612 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_604, _610)), 0).xyzw;
    float _614 = _612.x;
    float _616 = _612.y;
    float _618 = _612.z;
    float _620 = _612.w;
    float _622 = _552 * _598;
    float _624 = _540 * 2.0;
    float _626 = _520 * 3.883221149444580078125;
    float _628 = floor(_166);
    float _630 = -_624;
    float _632 = fma(_622, _630, _622);
    float _634 = _626 * 0.15915493667125701904296875;
    float _636 = fma(_540, 3.1415927410125732421875, _632);
    float _638 = _634 * 6.283185482025146484375;
    float _640 = cos(_638);
    float _642 = _636 * 0.15915493667125701904296875;
    float _644 = _642 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = -_628;
    float _650 = _166 + _648;
    float _652 = _634 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = _646 * _640;
    float _658 = _646 * _654;
    uint _660 = as_type<uint>(half2(float2(_620, 0.0)));
    float _662 = -_268;
    float _664 = _662 + _614;
    float _666 = -_270;
    float _668 = _666 + _616;
    float _670 = -_272;
    float _672 = _670 + _618;
    uint _674 = extract_bits(_660, 0u, 8u);
    int _676 = int(_674) & 255;
    uint _678 = extract_bits(_660, 8u, 8u);
    int _680 = int(_678) & 255;
    int _682 = _680 << 8;
    int _684 = _676 | _682;
    float _686 = fma(_650, _664, _268);
    float _688 = fma(_650, _668, _270);
    float _690 = fma(_650, _672, _272);
    bool _692 = _684 >= 32768;
    int _694 = _684 + (-1024);
    int _696 = _694;
    float _698 = _650;
    if (_692)
    {
        int _700 = ~_684;
        int _702 = _700 + 33792;
        int _704 = _702 + 1;
        _696 = _704;
    }
    int _706 = _696;
    int _708 = _706 + 30719;
    float _710 = float(_708);
    float _712 = fma(_710, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _714 = abs(_712);
    float _716 = -_714;
    float _718 = _716 + 1.0;
    float _720 = abs(_712);
    float _722 = fma(_720, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _724 = _712 < 0.0;
    float _726 = float(_724);
    int _728 = as_type<int>(_718) + (-218103808);
    float _730 = abs(_712);
    float _732 = fma(_730, _722, -0.212114393711090087890625);
    bool _734 = uint(_728) >= 1920991232u;
    float _736 = abs(_712);
    float _738 = fma(_736, _732, 1.570728778839111328125);
    bool _740 = !_734;
    float _758;
    if (!_740)
    {
        int _742 = as_type<int>(_718);
        int _744 = as_type<int>(_664);
        int _746 = 3264;
        int _748;
        int _750;
        int _752;
        int _754;
        int _756;
        _73(_742, _744, _746, _748, _750, _752, _754, _756, out.gl_Position, out.gl_PointSize);
        _758 = as_type<float>(_750);
        _760 = true;
    }
    else
    {
        float _762 = rsqrt(_718);
        float _764 = _718 * _762;
        float _766 = _762 * 0.5;
        float _768 = -_764;
        float _770 = 0.0 + _768;
        float _772 = fma(_766, _770, 0.5);
        float _774 = fma(_764, _772, _764);
        float _776 = -_774;
        float _778 = 0.0 + _776;
        float _780 = fma(_774, _778, _718);
        float _782 = fma(_766, _780, _774);
        _758 = _782;
    }
    _760 = false;
    float _784 = _758;
    float _786 = in.m_44.x;
    float _788 = in.m_44.y;
    float _790 = in.m_44.z;
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    float _796 = _738 * _784;
    float _798 = _710 * 3.883221149444580078125;
    float _800 = -_522;
    float _802 = _800 + _712;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _806 = 1.0 + _804;
    float _808 = fma(_650, _802, _522);
    float _810 = 1.0 / _806;
    bool _812 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _820 = _816 || _818;
    float _822 = _794 * _118;
    bool _824 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _826 = isnan(1.0);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _832 = _828 || _830;
    float _834 = exp2(_822);
    float _836 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _838 = _790 * 2.0;
    float _840 = _788 * 2.0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _852 = _850 != 0;
    float _854 = floor(_838);
    float _856 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _858 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _860 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _862 = _788 + _790;
    float _864 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _856);
    float _866 = _786 * 2.0;
    float _868 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _858);
    float _870 = _862 + (-1.0);
    float _872 = floor(_840);
    float _874 = _788 + _786;
    float _876 = -_834;
    float _878 = _876 + 1.0;
    bool _880 = !_844;
    int _882 = _880 ? 0 : 1;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _886 = _874 + (-1.0);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _898 = _896 != 0;
    float _900 = floor(_866);
    bool _902 = !_852;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _908 = _854 > 0.0;
    float _910 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _860);
    float _912 = _820 ? _878 : 0.0;
    bool _914 = _854 >= 0.0;
    bool _916 = isnan(_854);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _926 = !_848;
    int _928 = _926 ? 0 : 1;
    float _930 = _808;
    if (_832)
    {
        float _932 = _912 * _810;
        _120 = _932;
    }
    float _934 = _120;
    int _936 = _922 ? 0 : 1;
    bool _938 = _872 > 0.0;
    bool _940 = _900 >= 0.0;
    bool _942 = isnan(_900);
    bool _944 = _940 || _942;
    bool _946 = isnan(0.0);
    bool _948 = _944 || _946;
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _864);
    bool _952 = _872 >= 0.0;
    bool _954 = isnan(_872);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = _934 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _966 = ~_936;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = _962 * _924;
    bool _974 = !_898;
    int _976 = _974 ? 0 : 1;
    float _978 = _934 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _980 = _970;
    if (!_908)
    {
        int _982 = ~_936;
        int _984 = _982 + 1;
        _980 = _984;
    }
    int _986 = _980;
    float _988 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[203].x, _972);
    int _990 = _948 ? 0 : 1;
    float _992 = rsqrt(_950);
    int _994 = _960 ? 0 : 1;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1002 = _1000 != 0;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1006 = _1004 != 0;
    bool _1008 = _900 > 0.0;
    float _1010 = _978 * _964;
    int _1012 = ~_990;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    float _1018 = floor(_988);
    int _1020 = ~_994;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _868);
    float _1028 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1010);
    int _1030 = _1024;
    int _1032 = _1016;
    if (!_938)
    {
        int _1034 = ~_994;
        int _1036 = _1034 + 1;
        _1030 = _1036;
    }
    int _1038 = _1030;
    bool _1040 = !_1006;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _688 * _992;
    if (!_1008)
    {
        int _1046 = ~_990;
        int _1048 = _1046 + 1;
        _1032 = _1048;
    }
    int _1050 = _1032;
    float _1052 = floor(_1028);
    bool _1054 = !_1002;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = float(_1050);
    float _1060 = _988 + 0.25;
    float _1062 = float(_986);
    int _1064 = abs(_1056);
    float _1066 = floor(_1060);
    int _1068 = abs(_1042);
    float _1070 = -_1018;
    float _1072 = _988 + _1070;
    float _1074 = _1028 + 0.25;
    bool _1076 = !_998;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _988 * 6.283185482025146484375;
    float _1082 = float(_1064);
    float _1084 = rsqrt(_1026);
    int _1086 = abs(_1078);
    bool _1088 = _1072 >= 0.5;
    bool _1090 = isnan(_1072);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.5);
    bool _1096 = _1092 || _1094;
    float _1098 = _1082 * _1058;
    int _1100 = abs(_928);
    float _1102 = -_1052;
    float _1104 = _1028 + _1102;
    float _1106 = float(_1038);
    float _1108 = -_1066;
    float _1110 = _1060 + _1108;
    float _1112 = floor(_1074);
    bool _1114 = !_1096;
    float _1116 = _1114 ? 0.5 : (-0.5);
    float _1118 = _1080 * 0.15915493667125701904296875;
    float _1120 = float(_1086);
    float _1122 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1124 = _1122 * 2.0;
    bool _1126 = _1104 >= 0.5;
    bool _1128 = isnan(_1104);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    float _1136 = _1118 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    float _1140 = float(_1100);
    float _1142 = _1120 * _1062;
    bool _1144 = _1110 > 0.5;
    float _1146 = -_1112;
    float _1148 = _1074 + _1146;
    int _1150 = abs(_882);
    float _1152 = _1140 * _1124;
    float _1154 = _1028 * 6.283185482025146484375;
    bool _1156 = !_894;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = in.m_50.x;
    float _1162 = in.m_50.y;
    float _1164 = in.m_50.z;
    float _1166 = float(_1068);
    float _1168 = _1154 * 0.15915493667125701904296875;
    int _1170 = abs(_1158);
    float _1172 = _1142 * (-2.0);
    bool _1174 = !_1134;
    float _1176 = _1174 ? 0.5 : (-0.5);
    float _1178 = _1166 * _1106;
    float _1180 = _1110;
    float _1182 = _1148;
    if (_1144)
    {
        float _1184 = -_1110;
        float _1186 = _1184 + 1.0;
        _1180 = _1186;
    }
    float _1188 = _1180;
    bool _1190 = _1148 > 0.5;
    float _1192 = _1168 * 6.283185482025146484375;
    float _1194 = sin(_1192);
    float _1196 = float(_1170);
    float _1198 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1200 = _1198 * 2.0;
    float _1202 = float(_1150);
    float _1204 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1206 = abs(_904);
    float _1208 = fma(_1188, 4.0, -1.0);
    float _1210 = _1196 * _1200;
    bool _1212 = !_890;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = fma(_1202, _1204, _1152);
    float _1218 = float(_1206);
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1222 = _1098 * (-2.0);
    int _1224 = abs(_1214);
    if (_1190)
    {
        float _1226 = -_1148;
        float _1228 = _1226 + 1.0;
        _1182 = _1228;
    }
    float _1230 = _1182;
    float _1232 = fma(_1218, _1220, _1216);
    float _1234 = fma(_884, _1222, _884);
    float _1236 = fma(_1222, _1162, _1162);
    float _1238 = float(_1224);
    float _1240 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1242 = abs(_976);
    float _1244 = fma(_1230, 4.0, -1.0);
    float _1246 = fma(_1232, 3.1415927410125732421875, _1160);
    float _1248 = _788 + (-0.5);
    float _1250 = float(_1242);
    float _1252 = fma(_1238, _1240, _1210);
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1256 = _786 + (-0.5);
    float _1258 = fma(_1246, _1172, _1246);
    float _1260 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1236);
    float _1262 = fma(_906, _1172, _906);
    float _1264 = fma(_1250, _1254, _1252);
    float _1266 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1258);
    float _1268 = fma(_1234, _934, _1260);
    float _1270 = _786 + _790;
    float _1272 = fma(_1264, 3.1415927410125732421875, _1164);
    float _1274 = fma(_1262, _934, _1266);
    float _1276 = in.m_48.x;
    float _1278 = in.m_48.y;
    float _1280 = in.m_48.z;
    float _1282 = _1270 + (-1.0);
    float _1284 = _1178 * (-2.0);
    float _1286 = _790 + (-0.5);
    float _1288 = rsqrt(_910);
    float _1290 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = fma(_1272, _1284, _1272);
    float _1294 = _1274 * 0.15915493667125701904296875;
    float _1296 = _1268 * 0.15915493667125701904296875;
    float _1298 = fma(_1290, _1284, _1290);
    float _1300 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1292);
    float _1302 = sqrt(_910);
    float _1304 = fma(_1298, _934, _1300);
    float _1306 = _1294 * 6.283185482025146484375;
    float _1308 = sin(_1306);
    float _1310 = _1304 * 0.15915493667125701904296875;
    float _1312 = _686 * _1288;
    float _1314 = _690 * _1084;
    float _1316 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1320 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1322 = _1294 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = _1302 * _1312;
    float _1330 = _1302 * _1044;
    float _1332 = _1302 * _1314;
    float _1334 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1328);
    float _1340 = _1310 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1330);
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1332);
    float _1348 = _1338 * _1326;
    bool _1350 = _1330 != 0.0;
    bool _1352 = isnan(_1330);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    float _1360 = _1344 * _1334;
    float _1362 = _1310 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    bool _1366 = _1328 == 0.0;
    bool _1368 = !_1358;
    bool _1370 = _1366 && _1368;
    bool _1372 = _1332 == 0.0;
    bool _1374 = _1372 && _1370;
    float _1376 = _1296 * 6.283185482025146484375;
    float _1378 = cos(_1376);
    float _1380 = _1346 * _1336;
    float _1382 = _1324 * _1342;
    float _1384 = _1308 * _1342;
    float _1386 = _1296 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1324 * _1364;
    if (!_1374)
    {
        float _1392 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[17].y, _808);
        _930 = _1392;
    }
    float _1394 = _930;
    float _1396 = _1308 * _1378;
    float _1398 = _1308 * _1364;
    float _1400 = _1342 * _1378;
    float _1402 = _1364 * _1378;
    float _1404 = _1324 * _1378;
    float _1406 = _1396 * _1360;
    float _1408 = -_1382;
    float _1410 = fma(_1388, _1398, _1408);
    float _1412 = fma(_1388, _1384, _1390);
    float _1414 = fma(_1388, _1390, _1384);
    float _1416 = -_1388;
    float _1418 = fma(_1416, _1348, _1406);
    float _1420 = _1410 * _1360;
    float _1422 = _1412 * _1360;
    float _1424 = -_1398;
    float _1426 = fma(_1388, _1382, _1424);
    float _1428 = fma(_1402, _1348, _1420);
    float _1430 = fma(_1400, _1348, _1422);
    float _1432 = fma(_1404, _1380, _1418);
    float _1434 = _1410 * _1394;
    float _1436 = fma(_1414, _1380, _1428);
    float _1438 = fma(_1426, _1380, _1430);
    float _1440 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1444 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1448 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1450 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1452 = _1440 * _1440;
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1450);
    float _1460 = fma(_1442, _1442, _1452);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1454);
    float _1464 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1456);
    float _1466 = fma(_1444, _1444, _1460);
    float _1468 = _1462 * _1462;
    float _1470 = fma(_1432, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1458);
    float _1472 = rsqrt(_1466);
    float _1474 = fma(_1464, _1464, _1468);
    float _1476 = fma(_1470, _1470, _1474);
    float _1478 = _726 * 2.0;
    float _1480 = sqrt(_1466);
    float _1482 = -_1478;
    float _1484 = fma(_796, _1482, _796);
    float _1486 = _400 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1488 = fma(_726, 3.1415927410125732421875, _1484);
    float _1490 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1486);
    float _1492 = rsqrt(_1476);
    float _1494 = _1440 * _1472;
    float _1496 = _1442 * _1472;
    float _1498 = _1444 * _1472;
    float _1500 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    float _1502 = _1488 * 0.15915493667125701904296875;
    float _1504 = _400 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1506 = _1502 * 6.283185482025146484375;
    float _1508 = sin(_1506);
    float _1510 = _1462 * _1492;
    float _1512 = _1464 * _1492;
    float _1514 = _1494 * _1510;
    float _1516 = fma(_1496, _1512, _1514);
    float _1518 = _1470 * _1492;
    float _1520 = fma(_1498, _1518, _1516);
    float _1522 = _798 * 0.15915493667125701904296875;
    float _1524 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1504);
    float _1526 = _1520 * _1480;
    float _1528 = _1522 * 6.283185482025146484375;
    float _1530 = cos(_1528);
    float _1532 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1524);
    float _1534 = fma(_1496, _1526, _1464);
    float _1536 = fma(_1498, _1526, _1470);
    float _1538 = _1500 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1542 = fma(_1494, _1526, _1462);
    float _1544 = _1522 * 6.283185482025146484375;
    float _1546 = sin(_1544);
    float _1548 = _1538 + _1534;
    float _1550 = _1540 + _1536;
    float _1552 = _1396 * _1394;
    float _1554 = _1412 * _1394;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1562 = _1550 + _1560;
    float _1564 = -_656;
    float _1566 = fma(_1508, _1530, _1564);
    float _1568 = _1558 * _1558;
    float _1570 = _1562 * _1562;
    float _1572 = _400 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1574 = fma(_650, _1566, _656);
    float _1576 = _1568 + _1570;
    float _1578 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1572);
    float _1580 = -_658;
    float _1582 = fma(_1508, _1546, _1580);
    float _1584 = _1574;
    float _1586 = _1394;
    if (!_1374)
    {
        float _1588 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1574);
        _1584 = _1588;
    }
    float _1590 = _1584;
    float _1592 = sqrt(_1576);
    float _1594 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1578);
    float _1596 = fma(_650, _1582, _658);
    float _1598 = _1594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1600 = _1596;
    if (!_1374)
    {
        float _1602 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = _1598 + _1542;
    bool _1608 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1608)
    {
        _698 = _1570;
    }
    float _1610 = _698;
    float _1612 = _1610;
    if (!_1608)
    {
        _1586 = _1568;
    }
    float _1614 = _1586;
    float _1616 = _1614;
    if (!_1608)
    {
        _500 = _1548;
    }
    float _1618 = _500;
    float _1620 = _1618;
    if (!_1608)
    {
        _502 = _1550;
    }
    float _1622 = _502;
    float _1624 = _1622;
    if (!_1608)
    {
        _504 = _1606;
    }
    float _1626 = _504;
    bool _1628 = !_1608;
    float _1630 = _1626;
    if (!_1628)
    {
        float _1632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1636 = _1592 + _1634;
        float _1638 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = rsqrt(_1576);
        float _1642 = _1636 * _1632;
        float _1644 = _1642 * 0.15915493667125701904296875;
        float _1646 = _1644 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = cos(_1650);
        float _1654 = fma(_1648, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1656 = _1640 * _1654;
        float _1658 = _1652 + (-1.0);
        float _1660 = _1558 * _1656;
        float _1662 = _1562 * _1656;
        float _1664 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1668 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1670 = _1660 * _1660;
        float _1672 = fma(_1606, _1652, _1664);
        float _1674 = _1662 * _1662;
        _1630 = _1672;
        _1616 = _1670;
        _1612 = _1674;
        _1620 = _1666;
        _1624 = _1668;
    }
    float _1676 = _1630;
    float _1678 = _1616;
    float _1680 = _1612;
    float _1682 = _1620;
    float _1684 = _1624;
    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1688 = _1676 + _1686;
    float _1690 = fma(_1400, _1590, _1554);
    float _1692 = -_1388;
    float _1694 = fma(_1692, _1590, _1552);
    float _1696 = fma(_1402, _1590, _1434);
    float _1698 = fma(_1688, _1688, _1678);
    float _1700 = fma(_1426, _1604, _1690);
    float _1702 = fma(_1404, _1604, _1694);
    float _1704 = fma(_1414, _1604, _1696);
    float _1706 = _1698 + _1680;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1712 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_52.x = _536;
    out.m_52.y = _488;
    out.m_52.z = _478;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1708);
    float _1716 = sqrt(_1706);
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1710);
    float _1720 = fma(_1704, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1712);
    float _1722 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1714);
    float _1724 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1718);
    float _1726 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1720);
    out.m_54.x = _1722;
    out.m_54.y = _1724;
    out.m_54.z = _1726;
    bool _1728 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1730 = isnan(_1716);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1736 = _1732 || _1734;
    float _1738 = _1702;
    if (!_1736)
    {
        _1738 = 1.0;
    }
    float _1740 = _1738;
    bool _1742 = !_1736;
    float _1744 = _1740;
    if (!_1742)
    {
        bool _1746 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1748 = isnan(_1716);
        bool _1750 = _1746 || _1748;
        bool _1752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1754 = _1750 || _1752;
        if (!_1754)
        {
            float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1758 = _1716 + _1756;
            float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1762 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1760;
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1768 = 1.0 / _1762;
            float _1770 = _1758 * _1768;
            float _1772 = fma(_1770, _1766, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1744 = _1772;
            _1774 = true;
        }
        else
        {
            bool _1776 = _1716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1778 = isnan(_1716);
            bool _1780 = _1776 || _1778;
            bool _1782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1784 = _1780 || _1782;
            if (!_1784)
            {
                float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1788 = _1716 + _1786;
                float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1792 = _1790 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1798 = 1.0 / _1792;
                float _1800 = _1788 * _1798;
                float _1802 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1744 = _1802;
                _1774 = true;
            }
            else
            {
                _1744 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1774 = false;
    float _1804 = _1744;
    float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1808 = _1676 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1812 = _1682 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1816 = _1684 + _1814;
    out.m_56.x = _1538;
    out.m_56.y = _1598;
    out.m_56.z = _1540;
    float _1818 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1820 = fma(_1812, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1822 = fma(_1816, _1804, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_40.x = 1.0;
    float _1824 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1826 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1828 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1824);
    float _1834 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1836 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1828);
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1830);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1832);
    float _1842 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1834);
    float _1844 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1836);
    float _1846 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1838);
    float _1848 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1858 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1860 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1862 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1856);
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1858);
    float _1868 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1860);
    float _1870 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1862);
    float _1872 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1866);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1868);
    float _1878 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1870);
    float _1880 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1882 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1884 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1874);
    float _1886 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1876);
    float _1888 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1878);
    out.m_58.x = _1820;
    out.m_58.y = _1818;
    out.m_58.z = _1822;
    out.m_60.w = _1882;
    out.gl_Position.x = _1884;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _1886;
    out.gl_Position.w = _1888;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

