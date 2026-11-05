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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _820 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_820, float2(0.0), isnan(_820))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_820, float2(0.0), isnan(_820))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = in.m_36.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _84;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _96 = _94 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[27].x;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _102 = _62 * _76;
    float _104 = abs(_96);
    float _106 = log2(_104);
    float _108 = _62 * _90;
    float _110 = abs(_98);
    float _112 = log2(_110);
    float _114 = abs(_100);
    float _116 = log2(_114);
    float _118 = _106 * _70;
    float _120 = exp2(_118);
    float _122 = _116 * _70;
    float _124 = -_68;
    float _126 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _128 = 1.0 / _126;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[8].y, _130);
    float _134 = _112 * _70;
    float _136 = _132 * _94;
    float _138 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _140 = exp2(_134);
    float _142 = _138 * _120;
    float _144 = abs(_136);
    float _146 = log2(_144);
    float _148 = _138 * _140;
    float _150 = ceil(_142);
    float _152 = _146 * _70;
    float _154 = ceil(_148);
    int _157 = int(_154);
    float _159 = exp2(_152);
    float _161 = exp2(_122);
    float _163 = _138 * _159;
    float _165 = in.m_36.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _138 * _161;
    float _173 = precise::min(_138, _163);
    float _175 = trunc(_173);
    int _177 = int(_175);
    float _179 = ceil(_171);
    int _181 = min(_157, _177);
    float _183 = float(_181);
    float _185 = _62 * _169;
    int _187 = ~_181;
    int _189 = _177 + _187;
    int _191 = _189 + 1;
    float _193 = -_183;
    float _195 = _150 + _193;
    float _197 = trunc(_195);
    int _199 = int(_197);
    int _201 = min(_199, _191);
    int _203 = _181 + _201;
    float _205 = float(_203);
    int _207 = ~_203;
    int _209 = _177 + _207;
    int _211 = _209 + 1;
    float _213 = -_205;
    float _215 = _179 + _213;
    float _217 = _62 * _82;
    float _219 = trunc(_215);
    int _221 = int(_219);
    int _223 = min(_221, _211);
    int _225 = ~_203;
    int _227 = ~_223;
    int _229 = _177 + _225;
    int _231 = _229 + _227;
    int _233 = _231 + 2;
    int _235 = 0;
    int _237 = 0;
    int _239 = 0;
    int _241 = 0;
    int _243 = 0;
    float _245 = 0.0;
    int _247 = 0;
    int _249 = 0;
    int _251 = 0;
    int _253 = 0;
    int _255 = 0;
    bool _259;
    bool _524;
    float _764;
    int _782;
    do
    {
        int _261 = _235;
        int _263 = _237;
        int _265 = _239;
        int _267 = _241;
        int _269 = _243;
        float _271 = _245;
        int _273 = _247;
        int _275 = _249;
        int _277 = _251;
        int _279 = _253;
        int _281 = _255;
        int _283 = _261 * 4;
        bool _285 = _283 == 0;
        bool _287 = _283 == 4;
        bool _289 = _283 == 8;
        bool _291 = _283 == 12;
        int _293 = _263;
        int _295 = _283;
        float _297 = _271;
        float _299 = as_type<float>(_265);
        int _301 = _267;
        int _303 = _269;
        float _305 = _271;
        int _307 = _273;
        int _309 = _275;
        int _311 = _277;
        int _313 = _279;
        int _315 = _281;
        if (_285)
        {
            _293 = _181;
        }
        int _317 = _293;
        int _319 = _317;
        if (_287)
        {
            _319 = _201;
        }
        int _321 = _319;
        int _323 = _321;
        if (_289)
        {
            _323 = _223;
        }
        int _325 = _323;
        int _327 = _325;
        if (_291)
        {
            _327 = _233;
        }
        int _329 = _327;
        bool _331 = _329 > 0;
        _237 = _329;
        if (!_331)
        {
            _295 = _265;
        }
        int _333 = _295;
        bool _335 = !_331;
        int _337 = _333;
        if (!_335)
        {
            float _339 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x));
            float _341 = in.m_38.y;
            float _343 = gl_FragCoord.w;
            float _345 = _341 * _343;
            int _347 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y));
            float _349 = in.m_38.z;
            float _351 = gl_FragCoord.w;
            float _353 = _349 * _351;
            float _355 = float(uint(_261));
            float _357 = 1.0 / _339;
            float _359 = float(uint(_347));
            int _361 = abs(_261);
            float _363 = float(uint(_361));
            float _365 = 1.0 / _359;
            int _367 = _261 << 6;
            int _369 = as_type<int>(_357) + (-2);
            float _371 = as_type<float>(_369) * _355;
            int _373 = as_type<int>(_365) + (-2);
            float _375 = trunc(_371);
            float _377 = precise::max(_375, 0.0);
            uint _380 = uint(_377);
            float _382 = _62 * _345;
            float _384 = as_type<float>(_373) * _363;
            float _386 = _62 * _353;
            float _388 = trunc(_384);
            float _390 = precise::max(_388, 0.0);
            uint _392 = uint(_390);
            int _394 = ~int(_380);
            int _396 = _394 + 1;
            int _398 = _396 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _400 = _398 + _261;
            int _402 = -int(_392);
            float _404 = float(uint(_400));
            int _406 = _402 * _347;
            int _408 = _406 + _361;
            float _410 = as_type<float>(_369) * _404;
            float _412 = float(uint(_408));
            float _414 = trunc(_410);
            float _416 = precise::max(_414, 0.0);
            uint _418 = uint(_416);
            float _420 = as_type<float>(_373) * _412;
            float _422 = trunc(_420);
            float _424 = precise::max(_422, 0.0);
            uint _426 = uint(_424);
            int _428 = int(_380) + int(_418);
            float _430 = in.m_38.x;
            float _432 = gl_FragCoord.w;
            float _434 = _430 * _432;
            int _436 = ~_428;
            int _438 = _436 + 1;
            int _440 = int(_392) + int(_426);
            int _442 = _438 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _444 = _442 + _261;
            int _446 = ~_440;
            int _448 = _446 + 1;
            bool _450 = uint(_444) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _452 = _448 * _347;
            int _454 = _452 + _361;
            bool _456 = !_450;
            int _458 = _456 ? 0 : (-1);
            bool _460 = uint(_454) >= uint(_347);
            int _462 = ~_428;
            int _464 = _462 + _458;
            int _466 = _464 + 1;
            int _468 = _261 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            bool _470 = !_460;
            int _472 = _470 ? 0 : (-1);
            uint _474 = uint(int(uint(_468) >> uint(31)));
            int _476 = _466 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _478 = _476 + _261;
            bool _480 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            float _482 = _62 * _434;
            int _484 = ~_472;
            int _486 = _440 + _484;
            int _488 = _486 + 1;
            bool _490 = !_480;
            int _492 = _490 ? _478 : (-1);
            int _494 = ~int(_474);
            int _496 = _494 + 1;
            float _498 = float(_492);
            int _500 = _488 ^ _496;
            bool _502 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            float _504 = rint(_498);
            float _506 = precise::max(_504, 0.0);
            uint _508 = uint(_506);
            uint _510 = clamp(_508, 0u, 65535u);
            int _512 = -_496;
            int _514 = _500 + _512;
            bool _516 = !_502;
            int _518 = _516 ? _514 : (-1);
            float _520 = float(_518);
            int _522 = 0;
            _301 = as_type<int>(_382);
            _303 = as_type<int>(_386);
            do
            {
                float _526 = _297;
                int _528 = _522;
                float _530 = _299;
                float _532 = _526 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _534 = _367 + 176;
                uint _536 = uint(int(uint(_534) >> uint(2)));
                uint _538 = uint(int(uint(int(_536)) >> uint(2)));
                int _540 = int(_536) & 3;
                float _542 = (*spvDescriptorSet0.fp_c3)._m0[int(_538)][_540];
                int _544 = int(_536) + 1;
                uint _546 = uint(int(uint(_544) >> uint(2)));
                int _548 = _544 & 3;
                float _550 = (*spvDescriptorSet0.fp_c3)._m0[int(_546)][_548];
                float _552 = abs(_532);
                float _554 = log2(_552);
                int _556 = _367 + 208;
                uint _558 = uint(int(uint(_556) >> uint(2)));
                uint _560 = uint(int(uint(int(_558)) >> uint(2)));
                int _562 = int(_558) & 3;
                float _564 = (*spvDescriptorSet0.fp_c3)._m0[int(_560)][_562];
                int _566 = int(_558) + 1;
                uint _568 = uint(int(uint(_566) >> uint(2)));
                int _570 = _566 & 3;
                float _572 = (*spvDescriptorSet0.fp_c3)._m0[int(_568)][_570];
                int _574 = _367 + 160;
                uint _576 = uint(int(uint(_574) >> uint(2)));
                uint _578 = uint(int(uint(int(_576)) >> uint(2)));
                int _580 = int(_576) & 3;
                float _582 = (*spvDescriptorSet0.fp_c3)._m0[int(_578)][_580];
                int _584 = int(_576) + 1;
                uint _586 = uint(int(uint(_584) >> uint(2)));
                int _588 = _584 & 3;
                float _590 = (*spvDescriptorSet0.fp_c3)._m0[int(_586)][_588];
                float _592 = _554 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _594 = _367 + 192;
                uint _596 = uint(int(uint(_594) >> uint(2)));
                uint _598 = uint(int(uint(int(_596)) >> uint(2)));
                int _600 = int(_596) & 3;
                float _602 = (*spvDescriptorSet0.fp_c3)._m0[int(_598)][_600];
                int _604 = int(_596) + 1;
                uint _606 = uint(int(uint(_604) >> uint(2)));
                int _608 = _604 & 3;
                float _610 = (*spvDescriptorSet0.fp_c3)._m0[int(_606)][_608];
                float _612 = exp2(_592);
                int _614 = _367 + 216;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                uint _618 = uint(int(uint(int(_616)) >> uint(2)));
                int _620 = int(_616) & 3;
                float _622 = (*spvDescriptorSet0.fp_c3)._m0[int(_618)][_620];
                int _624 = int(_616) + 1;
                uint _626 = uint(int(uint(_624) >> uint(2)));
                int _628 = _624 & 3;
                float _630 = (*spvDescriptorSet0.fp_c3)._m0[int(_626)][_628];
                float _632 = fma(_612, _382, _185);
                float _634 = fma(_612, _482, _102);
                float _636 = fma(_612, _386, _217);
                float _638 = _632 * _550;
                float _640 = _632 * _572;
                float _642 = _632 * _590;
                float _644 = _632 * _610;
                float _646 = fma(_634, _542, _638);
                float _648 = fma(_634, _564, _640);
                int _650 = _367 + 184;
                uint _652 = uint(int(uint(_650) >> uint(2)));
                uint _654 = uint(int(uint(int(_652)) >> uint(2)));
                int _656 = int(_652) & 3;
                float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
                int _660 = int(_652) + 1;
                uint _662 = uint(int(uint(_660) >> uint(2)));
                int _664 = _660 & 3;
                float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
                float _668 = fma(_634, _582, _642);
                float _670 = fma(_634, _602, _644);
                float _672 = fma(_636, _622, _648);
                float _674 = fma(_108, _630, _672);
                int _676 = _367 + 168;
                uint _678 = uint(int(uint(_676) >> uint(2)));
                uint _680 = uint(int(uint(int(_678)) >> uint(2)));
                int _682 = int(_678) & 3;
                float _684 = (*spvDescriptorSet0.fp_c3)._m0[int(_680)][_682];
                int _686 = int(_678) + 1;
                uint _688 = uint(int(uint(_686) >> uint(2)));
                int _690 = _686 & 3;
                float _692 = (*spvDescriptorSet0.fp_c3)._m0[int(_688)][_690];
                float _694 = 1.0 / _674;
                int _696 = _367 + 200;
                uint _698 = uint(int(uint(_696) >> uint(2)));
                uint _700 = uint(int(uint(int(_698)) >> uint(2)));
                int _702 = int(_698) & 3;
                float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
                int _706 = int(_698) + 1;
                uint _708 = uint(int(uint(_706) >> uint(2)));
                int _710 = _706 & 3;
                float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
                float _714 = fma(_636, _658, _646);
                float _716 = fma(_108, _666, _714);
                float _718 = fma(_636, _684, _668);
                float _720 = _716 * _694;
                float _722 = fma(_108, _692, _718);
                float _724 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[30].w, _720);
                float _726 = fma(_636, _704, _670);
                float _728 = _722 * _694;
                float _730 = fma(_108, _712, _726);
                float _732 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[30].z, _728);
                float _734 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[30].z, _728);
                float _736 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[30].w, _720);
                float _738 = _730 * _694;
                float3 _1764 = float3(_732, _724, float(int(_510)));
                float3 _1768 = select(_1764, float3(0.0), isnan(_1764));
                float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1768.xy, uint(rint(_1768.z)), _738, level(_520));
                float3 _1778 = float3(_734, _724, float(int(_510)));
                float3 _1780 = select(_1778, float3(0.0), isnan(_1778));
                float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1780.xy, uint(rint(_1780.z)), _738, level(_520));
                float3 _1790 = float3(_732, _736, float(int(_510)));
                float3 _1792 = select(_1790, float3(0.0), isnan(_1790));
                float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1792.xy, uint(rint(_1792.z)), _738, level(_520));
                float3 _1802 = float3(_734, _736, float(int(_510)));
                float3 _1804 = select(_1802, float3(0.0), isnan(_1802));
                float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1804.xy, uint(rint(_1804.z)), _738, level(_520));
                int _748 = _528 + 1;
                float _750 = _526 + 1.0;
                bool _752 = _748 >= _329;
                float _754 = _740 + _742;
                float _756 = _754 + _744;
                float _758 = _756 + _746;
                float _760 = _758 * 0.25;
                float _762 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[30].x, (*spvDescriptorSet0.fp_c3)._m0[30].y);
                _764 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[8].x, _530);
                _524 = !_752;
                _297 = _750;
                _522 = _748;
                _299 = _764;
                _305 = _750;
                _307 = as_type<int>(_762);
                _309 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[30].x);
                _311 = as_type<int>(_726);
                _313 = as_type<int>(_712);
                _315 = int(_510);
            } while (_524);
            _337 = as_type<int>(_764);
        }
        int _766 = _301;
        int _768 = _303;
        float _770 = _305;
        int _772 = _307;
        int _774 = _309;
        int _776 = _311;
        int _778 = _313;
        int _780 = _315;
        _782 = _337;
        int _784 = _261 + 1;
        bool _786 = _784 >= 4;
        _259 = !_786;
        _235 = _784;
        _239 = _782;
        _241 = _766;
        _243 = _768;
        _245 = _770;
        _247 = _772;
        _249 = _774;
        _251 = _776;
        _253 = _778;
        _255 = _780;
    } while (_259);
    out.m_41.x = as_type<float>(_782);
    out.m_41.y = as_type<float>(_782);
    out.m_41.z = as_type<float>(_782);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _820 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_820, float2(0.0), isnan(_820))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_820, float2(0.0), isnan(_820))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = in.m_36.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _84;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _96 = _94 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[27].x;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _102 = _62 * _76;
    float _104 = abs(_96);
    float _106 = log2(_104);
    float _108 = _62 * _90;
    float _110 = abs(_98);
    float _112 = log2(_110);
    float _114 = abs(_100);
    float _116 = log2(_114);
    float _118 = _106 * _70;
    float _120 = exp2(_118);
    float _122 = _116 * _70;
    float _124 = -_68;
    float _126 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _128 = 1.0 / _126;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[8].y, _130);
    float _134 = _112 * _70;
    float _136 = _132 * _94;
    float _138 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _140 = exp2(_134);
    float _142 = _138 * _120;
    float _144 = abs(_136);
    float _146 = log2(_144);
    float _148 = _138 * _140;
    float _150 = ceil(_142);
    float _152 = _146 * _70;
    float _154 = ceil(_148);
    int _157 = int(_154);
    float _159 = exp2(_152);
    float _161 = exp2(_122);
    float _163 = _138 * _159;
    float _165 = in.m_36.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _138 * _161;
    float _173 = precise::min(_138, _163);
    float _175 = trunc(_173);
    int _177 = int(_175);
    float _179 = ceil(_171);
    int _181 = min(_157, _177);
    float _183 = float(_181);
    float _185 = _62 * _169;
    int _187 = ~_181;
    int _189 = _177 + _187;
    int _191 = _189 + 1;
    float _193 = -_183;
    float _195 = _150 + _193;
    float _197 = trunc(_195);
    int _199 = int(_197);
    int _201 = min(_199, _191);
    int _203 = _181 + _201;
    float _205 = float(_203);
    int _207 = ~_203;
    int _209 = _177 + _207;
    int _211 = _209 + 1;
    float _213 = -_205;
    float _215 = _179 + _213;
    float _217 = _62 * _82;
    float _219 = trunc(_215);
    int _221 = int(_219);
    int _223 = min(_221, _211);
    int _225 = ~_203;
    int _227 = ~_223;
    int _229 = _177 + _225;
    int _231 = _229 + _227;
    int _233 = _231 + 2;
    int _235 = 0;
    int _237 = 0;
    int _239 = 0;
    int _241 = 0;
    int _243 = 0;
    float _245 = 0.0;
    int _247 = 0;
    int _249 = 0;
    int _251 = 0;
    int _253 = 0;
    int _255 = 0;
    bool _259;
    bool _524;
    float _764;
    int _782;
    do
    {
        int _261 = _235;
        int _263 = _237;
        int _265 = _239;
        int _267 = _241;
        int _269 = _243;
        float _271 = _245;
        int _273 = _247;
        int _275 = _249;
        int _277 = _251;
        int _279 = _253;
        int _281 = _255;
        int _283 = _261 * 4;
        bool _285 = _283 == 0;
        bool _287 = _283 == 4;
        bool _289 = _283 == 8;
        bool _291 = _283 == 12;
        int _293 = _263;
        int _295 = _283;
        float _297 = _271;
        float _299 = as_type<float>(_265);
        int _301 = _267;
        int _303 = _269;
        float _305 = _271;
        int _307 = _273;
        int _309 = _275;
        int _311 = _277;
        int _313 = _279;
        int _315 = _281;
        if (_285)
        {
            _293 = _181;
        }
        int _317 = _293;
        int _319 = _317;
        if (_287)
        {
            _319 = _201;
        }
        int _321 = _319;
        int _323 = _321;
        if (_289)
        {
            _323 = _223;
        }
        int _325 = _323;
        int _327 = _325;
        if (_291)
        {
            _327 = _233;
        }
        int _329 = _327;
        bool _331 = _329 > 0;
        _237 = _329;
        if (!_331)
        {
            _295 = _265;
        }
        int _333 = _295;
        bool _335 = !_331;
        int _337 = _333;
        if (!_335)
        {
            float _339 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x));
            float _341 = in.m_38.y;
            float _343 = gl_FragCoord.w;
            float _345 = _341 * _343;
            int _347 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y));
            float _349 = in.m_38.z;
            float _351 = gl_FragCoord.w;
            float _353 = _349 * _351;
            float _355 = float(uint(_261));
            float _357 = 1.0 / _339;
            float _359 = float(uint(_347));
            int _361 = abs(_261);
            float _363 = float(uint(_361));
            float _365 = 1.0 / _359;
            int _367 = _261 << 6;
            int _369 = as_type<int>(_357) + (-2);
            float _371 = as_type<float>(_369) * _355;
            int _373 = as_type<int>(_365) + (-2);
            float _375 = trunc(_371);
            float _377 = precise::max(_375, 0.0);
            uint _380 = uint(_377);
            float _382 = _62 * _345;
            float _384 = as_type<float>(_373) * _363;
            float _386 = _62 * _353;
            float _388 = trunc(_384);
            float _390 = precise::max(_388, 0.0);
            uint _392 = uint(_390);
            int _394 = ~int(_380);
            int _396 = _394 + 1;
            int _398 = _396 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _400 = _398 + _261;
            int _402 = -int(_392);
            float _404 = float(uint(_400));
            int _406 = _402 * _347;
            int _408 = _406 + _361;
            float _410 = as_type<float>(_369) * _404;
            float _412 = float(uint(_408));
            float _414 = trunc(_410);
            float _416 = precise::max(_414, 0.0);
            uint _418 = uint(_416);
            float _420 = as_type<float>(_373) * _412;
            float _422 = trunc(_420);
            float _424 = precise::max(_422, 0.0);
            uint _426 = uint(_424);
            int _428 = int(_380) + int(_418);
            float _430 = in.m_38.x;
            float _432 = gl_FragCoord.w;
            float _434 = _430 * _432;
            int _436 = ~_428;
            int _438 = _436 + 1;
            int _440 = int(_392) + int(_426);
            int _442 = _438 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _444 = _442 + _261;
            int _446 = ~_440;
            int _448 = _446 + 1;
            bool _450 = uint(_444) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _452 = _448 * _347;
            int _454 = _452 + _361;
            bool _456 = !_450;
            int _458 = _456 ? 0 : (-1);
            bool _460 = uint(_454) >= uint(_347);
            int _462 = ~_428;
            int _464 = _462 + _458;
            int _466 = _464 + 1;
            int _468 = _261 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            bool _470 = !_460;
            int _472 = _470 ? 0 : (-1);
            uint _474 = uint(int(uint(_468) >> uint(31)));
            int _476 = _466 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _478 = _476 + _261;
            bool _480 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            float _482 = _62 * _434;
            int _484 = ~_472;
            int _486 = _440 + _484;
            int _488 = _486 + 1;
            bool _490 = !_480;
            int _492 = _490 ? _478 : (-1);
            int _494 = ~int(_474);
            int _496 = _494 + 1;
            float _498 = float(_492);
            int _500 = _488 ^ _496;
            bool _502 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            float _504 = rint(_498);
            float _506 = precise::max(_504, 0.0);
            uint _508 = uint(_506);
            uint _510 = clamp(_508, 0u, 65535u);
            int _512 = -_496;
            int _514 = _500 + _512;
            bool _516 = !_502;
            int _518 = _516 ? _514 : (-1);
            float _520 = float(_518);
            int _522 = 0;
            _301 = as_type<int>(_382);
            _303 = as_type<int>(_386);
            do
            {
                float _526 = _297;
                int _528 = _522;
                float _530 = _299;
                float _532 = _526 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _534 = _367 + 176;
                uint _536 = uint(int(uint(_534) >> uint(2)));
                uint _538 = uint(int(uint(int(_536)) >> uint(2)));
                int _540 = int(_536) & 3;
                float _542 = (*spvDescriptorSet0.fp_c3)._m0[int(_538)][_540];
                int _544 = int(_536) + 1;
                uint _546 = uint(int(uint(_544) >> uint(2)));
                int _548 = _544 & 3;
                float _550 = (*spvDescriptorSet0.fp_c3)._m0[int(_546)][_548];
                float _552 = abs(_532);
                float _554 = log2(_552);
                int _556 = _367 + 208;
                uint _558 = uint(int(uint(_556) >> uint(2)));
                uint _560 = uint(int(uint(int(_558)) >> uint(2)));
                int _562 = int(_558) & 3;
                float _564 = (*spvDescriptorSet0.fp_c3)._m0[int(_560)][_562];
                int _566 = int(_558) + 1;
                uint _568 = uint(int(uint(_566) >> uint(2)));
                int _570 = _566 & 3;
                float _572 = (*spvDescriptorSet0.fp_c3)._m0[int(_568)][_570];
                int _574 = _367 + 160;
                uint _576 = uint(int(uint(_574) >> uint(2)));
                uint _578 = uint(int(uint(int(_576)) >> uint(2)));
                int _580 = int(_576) & 3;
                float _582 = (*spvDescriptorSet0.fp_c3)._m0[int(_578)][_580];
                int _584 = int(_576) + 1;
                uint _586 = uint(int(uint(_584) >> uint(2)));
                int _588 = _584 & 3;
                float _590 = (*spvDescriptorSet0.fp_c3)._m0[int(_586)][_588];
                float _592 = _554 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _594 = _367 + 192;
                uint _596 = uint(int(uint(_594) >> uint(2)));
                uint _598 = uint(int(uint(int(_596)) >> uint(2)));
                int _600 = int(_596) & 3;
                float _602 = (*spvDescriptorSet0.fp_c3)._m0[int(_598)][_600];
                int _604 = int(_596) + 1;
                uint _606 = uint(int(uint(_604) >> uint(2)));
                int _608 = _604 & 3;
                float _610 = (*spvDescriptorSet0.fp_c3)._m0[int(_606)][_608];
                float _612 = exp2(_592);
                int _614 = _367 + 216;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                uint _618 = uint(int(uint(int(_616)) >> uint(2)));
                int _620 = int(_616) & 3;
                float _622 = (*spvDescriptorSet0.fp_c3)._m0[int(_618)][_620];
                int _624 = int(_616) + 1;
                uint _626 = uint(int(uint(_624) >> uint(2)));
                int _628 = _624 & 3;
                float _630 = (*spvDescriptorSet0.fp_c3)._m0[int(_626)][_628];
                float _632 = fma(_612, _382, _185);
                float _634 = fma(_612, _482, _102);
                float _636 = fma(_612, _386, _217);
                float _638 = _632 * _550;
                float _640 = _632 * _572;
                float _642 = _632 * _590;
                float _644 = _632 * _610;
                float _646 = fma(_634, _542, _638);
                float _648 = fma(_634, _564, _640);
                int _650 = _367 + 184;
                uint _652 = uint(int(uint(_650) >> uint(2)));
                uint _654 = uint(int(uint(int(_652)) >> uint(2)));
                int _656 = int(_652) & 3;
                float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
                int _660 = int(_652) + 1;
                uint _662 = uint(int(uint(_660) >> uint(2)));
                int _664 = _660 & 3;
                float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
                float _668 = fma(_634, _582, _642);
                float _670 = fma(_634, _602, _644);
                float _672 = fma(_636, _622, _648);
                float _674 = fma(_108, _630, _672);
                int _676 = _367 + 168;
                uint _678 = uint(int(uint(_676) >> uint(2)));
                uint _680 = uint(int(uint(int(_678)) >> uint(2)));
                int _682 = int(_678) & 3;
                float _684 = (*spvDescriptorSet0.fp_c3)._m0[int(_680)][_682];
                int _686 = int(_678) + 1;
                uint _688 = uint(int(uint(_686) >> uint(2)));
                int _690 = _686 & 3;
                float _692 = (*spvDescriptorSet0.fp_c3)._m0[int(_688)][_690];
                float _694 = 1.0 / _674;
                int _696 = _367 + 200;
                uint _698 = uint(int(uint(_696) >> uint(2)));
                uint _700 = uint(int(uint(int(_698)) >> uint(2)));
                int _702 = int(_698) & 3;
                float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
                int _706 = int(_698) + 1;
                uint _708 = uint(int(uint(_706) >> uint(2)));
                int _710 = _706 & 3;
                float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
                float _714 = fma(_636, _658, _646);
                float _716 = fma(_108, _666, _714);
                float _718 = fma(_636, _684, _668);
                float _720 = _716 * _694;
                float _722 = fma(_108, _692, _718);
                float _724 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[30].w, _720);
                float _726 = fma(_636, _704, _670);
                float _728 = _722 * _694;
                float _730 = fma(_108, _712, _726);
                float _732 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[30].z, _728);
                float _734 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[30].z, _728);
                float _736 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[30].w, _720);
                float _738 = _730 * _694;
                float3 _1764 = float3(_732, _724, float(int(_510)));
                float3 _1768 = select(_1764, float3(0.0), isnan(_1764));
                float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1768.xy, uint(rint(_1768.z)), _738, level(_520));
                float3 _1778 = float3(_734, _724, float(int(_510)));
                float3 _1780 = select(_1778, float3(0.0), isnan(_1778));
                float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1780.xy, uint(rint(_1780.z)), _738, level(_520));
                float3 _1790 = float3(_732, _736, float(int(_510)));
                float3 _1792 = select(_1790, float3(0.0), isnan(_1790));
                float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1792.xy, uint(rint(_1792.z)), _738, level(_520));
                float3 _1802 = float3(_734, _736, float(int(_510)));
                float3 _1804 = select(_1802, float3(0.0), isnan(_1802));
                float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1804.xy, uint(rint(_1804.z)), _738, level(_520));
                int _748 = _528 + 1;
                float _750 = _526 + 1.0;
                bool _752 = _748 >= _329;
                float _754 = _740 + _742;
                float _756 = _754 + _744;
                float _758 = _756 + _746;
                float _760 = _758 * 0.25;
                float _762 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[30].x, (*spvDescriptorSet0.fp_c3)._m0[30].y);
                _764 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[8].x, _530);
                _524 = !_752;
                _297 = _750;
                _522 = _748;
                _299 = _764;
                _305 = _750;
                _307 = as_type<int>(_762);
                _309 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[30].x);
                _311 = as_type<int>(_726);
                _313 = as_type<int>(_712);
                _315 = int(_510);
            } while (_524);
            _337 = as_type<int>(_764);
        }
        int _766 = _301;
        int _768 = _303;
        float _770 = _305;
        int _772 = _307;
        int _774 = _309;
        int _776 = _311;
        int _778 = _313;
        int _780 = _315;
        _782 = _337;
        int _784 = _261 + 1;
        bool _786 = _784 >= 4;
        _259 = !_786;
        _235 = _784;
        _239 = _782;
        _241 = _766;
        _243 = _768;
        _245 = _770;
        _247 = _772;
        _249 = _774;
        _251 = _776;
        _253 = _778;
        _255 = _780;
    } while (_259);
    out.m_41.x = as_type<float>(_782);
    out.m_41.y = as_type<float>(_782);
    out.m_41.z = as_type<float>(_782);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

