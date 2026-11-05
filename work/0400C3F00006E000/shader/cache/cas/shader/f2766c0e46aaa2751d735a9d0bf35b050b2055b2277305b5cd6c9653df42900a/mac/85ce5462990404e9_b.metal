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
    float2 _850 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_850, float2(0.0), isnan(_850))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_850, float2(0.0), isnan(_850))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = in.m_36.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_36.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = 1.0 / _84;
    float _100 = _98 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _102 = _100 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _104 = _100 * (*spvDescriptorSet0.fp_c3)._m0[27].x;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _108 = _62 * _76;
    float _110 = _62 * _82;
    float _112 = abs(_102);
    float _114 = log2(_112);
    float _116 = _62 * _90;
    float _118 = _62 * _96;
    float _120 = abs(_104);
    float _122 = log2(_120);
    float _124 = _114 * _70;
    float _126 = abs(_106);
    float _128 = log2(_126);
    float _130 = exp2(_124);
    float _132 = _128 * _70;
    float _134 = -_68;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _138 = 1.0 / _136;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[8].y, _140);
    float _144 = _122 * _70;
    float _146 = _142 * _100;
    float _148 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _150 = exp2(_144);
    float _152 = _148 * _130;
    float _154 = abs(_146);
    float _156 = log2(_154);
    float _158 = _148 * _150;
    float _160 = ceil(_152);
    float _162 = _156 * _70;
    float _164 = ceil(_158);
    int _167 = int(_164);
    float _169 = exp2(_162);
    float _171 = exp2(_132);
    float _173 = _148 * _169;
    float _175 = precise::min(_148, _173);
    float _177 = _148 * _171;
    float _179 = trunc(_175);
    int _181 = int(_179);
    float _183 = ceil(_177);
    int _185 = min(_167, _181);
    float _187 = float(_185);
    int _189 = ~_185;
    int _191 = _181 + _189;
    int _193 = _191 + 1;
    float _195 = -_187;
    float _197 = _160 + _195;
    float _199 = trunc(_197);
    int _201 = int(_199);
    int _203 = min(_201, _193);
    int _205 = _185 + _203;
    float _207 = float(_205);
    int _209 = ~_205;
    int _211 = _181 + _209;
    int _213 = _211 + 1;
    float _215 = -_207;
    float _217 = _183 + _215;
    float _219 = trunc(_217);
    int _221 = int(_219);
    int _223 = min(_221, _213);
    int _225 = ~_205;
    int _227 = ~_223;
    int _229 = _181 + _225;
    int _231 = _229 + _227;
    int _233 = _231 + 2;
    int _235 = 0;
    int _237 = _167;
    int _239 = 0;
    float _241 = 0.0;
    int _243 = 0;
    int _245 = 0;
    int _247 = 0;
    int _249 = 0;
    int _251 = 0;
    int _253 = 0;
    float _255 = 0.0;
    bool _259;
    bool _526;
    float _794;
    int _812;
    do
    {
        int _261 = _235;
        int _263 = _237;
        int _265 = _239;
        float _267 = _241;
        int _269 = _243;
        int _271 = _245;
        int _273 = _247;
        int _275 = _249;
        int _277 = _251;
        int _279 = _253;
        float _281 = _255;
        int _283 = _261 * 4;
        bool _285 = _283 == 0;
        bool _287 = _283 == 4;
        bool _289 = _283 == 8;
        bool _291 = _283 == 12;
        int _293 = _263;
        int _295 = _283;
        float _297 = _267;
        float _299 = _281;
        float _301 = as_type<float>(_265);
        float _303 = _267;
        int _305 = _269;
        int _307 = _271;
        int _309 = _273;
        int _311 = _275;
        int _313 = _277;
        int _315 = _279;
        float _317 = _281;
        if (_285)
        {
            _293 = _185;
        }
        int _319 = _293;
        int _321 = _319;
        if (_287)
        {
            _321 = _203;
        }
        int _323 = _321;
        int _325 = _323;
        if (_289)
        {
            _325 = _223;
        }
        int _327 = _325;
        int _329 = _327;
        if (_291)
        {
            _329 = _233;
        }
        int _331 = _329;
        bool _333 = _331 > 0;
        _237 = _331;
        if (!_333)
        {
            _295 = _265;
        }
        int _335 = _295;
        bool _337 = !_333;
        int _339 = _335;
        if (!_337)
        {
            float _341 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x));
            int _343 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y));
            float _345 = float(uint(_261));
            float _347 = 1.0 / _341;
            float _349 = float(uint(_343));
            int _351 = abs(_261);
            float _353 = float(uint(_351));
            float _355 = 1.0 / _349;
            int _357 = as_type<int>(_347) + (-2);
            float _359 = as_type<float>(_357) * _345;
            int _361 = as_type<int>(_355) + (-2);
            float _363 = trunc(_359);
            float _365 = precise::max(_363, 0.0);
            uint _368 = uint(_365);
            float _370 = as_type<float>(_361) * _353;
            float _372 = trunc(_370);
            float _374 = precise::max(_372, 0.0);
            uint _376 = uint(_374);
            int _378 = ~int(_368);
            int _380 = _378 + 1;
            int _382 = _380 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _384 = _382 + _261;
            int _386 = -int(_376);
            float _388 = float(uint(_384));
            int _390 = _386 * _343;
            int _392 = _390 + _351;
            float _394 = as_type<float>(_357) * _388;
            float _396 = float(uint(_392));
            float _398 = trunc(_394);
            float _400 = precise::max(_398, 0.0);
            uint _402 = uint(_400);
            float _404 = as_type<float>(_361) * _396;
            float _406 = trunc(_404);
            float _408 = precise::max(_406, 0.0);
            uint _410 = uint(_408);
            int _412 = _261 << 6;
            int _414 = int(_368) + int(_402);
            int _416 = ~_414;
            int _418 = _416 + 1;
            int _420 = int(_376) + int(_410);
            int _422 = _418 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _424 = _422 + _261;
            float _426 = in.m_38.x;
            float _428 = gl_FragCoord.w;
            float _430 = _426 * _428;
            int _432 = ~_420;
            int _434 = _432 + 1;
            bool _436 = uint(_424) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            float _438 = in.m_38.z;
            float _440 = gl_FragCoord.w;
            float _442 = _438 * _440;
            int _444 = _434 * _343;
            int _446 = _444 + _351;
            bool _448 = !_436;
            int _450 = _448 ? 0 : (-1);
            float _452 = in.m_38.y;
            float _454 = gl_FragCoord.w;
            float _456 = _452 * _454;
            bool _458 = uint(_446) >= uint(_343);
            int _460 = ~_414;
            int _462 = _460 + _450;
            int _464 = _462 + 1;
            int _466 = _261 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            bool _468 = !_458;
            int _470 = _468 ? 0 : (-1);
            uint _472 = uint(int(uint(_466) >> uint(31)));
            int _474 = _464 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _476 = _474 + _261;
            bool _478 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _480 = ~_470;
            int _482 = _420 + _480;
            int _484 = _482 + 1;
            bool _486 = !_478;
            int _488 = _486 ? _476 : (-1);
            int _490 = ~int(_472);
            int _492 = _490 + 1;
            float _494 = float(_488);
            int _496 = _484 ^ _492;
            float _498 = _62 * _430;
            bool _500 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            float _502 = rint(_494);
            float _504 = precise::max(_502, 0.0);
            uint _506 = uint(_504);
            uint _508 = clamp(_506, 0u, 65535u);
            int _510 = -_492;
            int _512 = _496 + _510;
            float _514 = _62 * _442;
            float _516 = _62 * _456;
            bool _518 = !_500;
            int _520 = _518 ? _512 : (-1);
            float _522 = float(_520);
            int _524 = 0;
            do
            {
                float _528 = _297;
                float _530 = _299;
                int _532 = _524;
                float _534 = _301;
                float _536 = _528 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _538 = _412 + 160;
                uint _540 = uint(int(uint(_538) >> uint(2)));
                uint _542 = uint(int(uint(int(_540)) >> uint(2)));
                int _544 = int(_540) & 3;
                float _546 = (*spvDescriptorSet0.fp_c3)._m0[int(_542)][_544];
                int _548 = int(_540) + 1;
                uint _550 = uint(int(uint(_548) >> uint(2)));
                int _552 = _548 & 3;
                float _554 = (*spvDescriptorSet0.fp_c3)._m0[int(_550)][_552];
                float _556 = abs(_536);
                float _558 = log2(_556);
                int _560 = _412 + 176;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                uint _564 = uint(int(uint(int(_562)) >> uint(2)));
                int _566 = int(_562) & 3;
                float _568 = (*spvDescriptorSet0.fp_c3)._m0[int(_564)][_566];
                int _570 = int(_562) + 1;
                uint _572 = uint(int(uint(_570) >> uint(2)));
                int _574 = _570 & 3;
                float _576 = (*spvDescriptorSet0.fp_c3)._m0[int(_572)][_574];
                int _578 = _412 + 192;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                uint _582 = uint(int(uint(int(_580)) >> uint(2)));
                int _584 = int(_580) & 3;
                float _586 = (*spvDescriptorSet0.fp_c3)._m0[int(_582)][_584];
                int _588 = int(_580) + 1;
                uint _590 = uint(int(uint(_588) >> uint(2)));
                int _592 = _588 & 3;
                float _594 = (*spvDescriptorSet0.fp_c3)._m0[int(_590)][_592];
                float _596 = _558 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _598 = _412 + 208;
                uint _600 = uint(int(uint(_598) >> uint(2)));
                uint _602 = uint(int(uint(int(_600)) >> uint(2)));
                int _604 = int(_600) & 3;
                float _606 = (*spvDescriptorSet0.fp_c3)._m0[int(_602)][_604];
                int _608 = int(_600) + 1;
                uint _610 = uint(int(uint(_608) >> uint(2)));
                int _612 = _608 & 3;
                float _614 = (*spvDescriptorSet0.fp_c3)._m0[int(_610)][_612];
                float _616 = exp2(_596);
                int _618 = _412 + 216;
                uint _620 = uint(int(uint(_618) >> uint(2)));
                uint _622 = uint(int(uint(int(_620)) >> uint(2)));
                int _624 = int(_620) & 3;
                float _626 = (*spvDescriptorSet0.fp_c3)._m0[int(_622)][_624];
                int _628 = int(_620) + 1;
                uint _630 = uint(int(uint(_628) >> uint(2)));
                int _632 = _628 & 3;
                float _634 = (*spvDescriptorSet0.fp_c3)._m0[int(_630)][_632];
                float _636 = fma(_616, _516, _110);
                float _638 = _636 * _554;
                float _640 = _636 * _576;
                float _642 = fma(_616, _498, _108);
                float _644 = _636 * _594;
                float _646 = _636 * _614;
                float _648 = fma(_616, _514, _116);
                float _650 = fma(_642, _546, _638);
                float _652 = fma(_642, _568, _640);
                float _654 = fma(_642, _586, _644);
                float _656 = fma(_642, _606, _646);
                int _658 = _412 + 200;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                uint _662 = uint(int(uint(int(_660)) >> uint(2)));
                int _664 = int(_660) & 3;
                float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
                int _668 = int(_660) + 1;
                uint _670 = uint(int(uint(_668) >> uint(2)));
                int _672 = _668 & 3;
                float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
                float _676 = fma(_648, _626, _656);
                float _678 = fma(_118, _634, _676);
                int _680 = _412 + 168;
                uint _682 = uint(int(uint(_680) >> uint(2)));
                uint _684 = uint(int(uint(int(_682)) >> uint(2)));
                int _686 = int(_682) & 3;
                float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
                int _690 = int(_682) + 1;
                uint _692 = uint(int(uint(_690) >> uint(2)));
                int _694 = _690 & 3;
                float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
                float _698 = 1.0 / _678;
                int _700 = _412 + 184;
                uint _702 = uint(int(uint(_700) >> uint(2)));
                uint _704 = uint(int(uint(int(_702)) >> uint(2)));
                int _706 = int(_702) & 3;
                float _708 = (*spvDescriptorSet0.fp_c3)._m0[int(_704)][_706];
                int _710 = int(_702) + 1;
                uint _712 = uint(int(uint(_710) >> uint(2)));
                int _714 = _710 & 3;
                float _716 = (*spvDescriptorSet0.fp_c3)._m0[int(_712)][_714];
                float _718 = fma(_648, _666, _654);
                float _720 = fma(_118, _674, _718);
                float _722 = fma(_648, _688, _650);
                float _724 = fma(_648, _708, _652);
                float _726 = fma(_118, _696, _722);
                float _728 = _720 * _698;
                float _730 = fma(_118, _716, _724);
                float _732 = _726 * _698;
                float _734 = _730 * _698;
                float _736 = -(*spvDescriptorSet0.fp_c3)._m0[30].z;
                float _738 = _732 + _736;
                float _740 = _732 + (*spvDescriptorSet0.fp_c3)._m0[30].z;
                float _742 = -(*spvDescriptorSet0.fp_c3)._m0[30].w;
                float _744 = _734 + _742;
                float3 _1791 = float3(_732, _734, float(int(_508)));
                float3 _1795 = select(_1791, float3(0.0), isnan(_1791));
                float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1795.xy, uint(rint(_1795.z)), _728, level(_522));
                float _748 = _734 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
                float3 _1809 = float3(_738, _734, float(int(_508)));
                float3 _1811 = select(_1809, float3(0.0), isnan(_1809));
                float _750 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1811.xy, uint(rint(_1811.z)), _728, level(_522));
                float3 _1821 = float3(_732, _744, float(int(_508)));
                float3 _1823 = select(_1821, float3(0.0), isnan(_1821));
                float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1823.xy, uint(rint(_1823.z)), _728, level(_522));
                float3 _1833 = float3(_740, _734, float(int(_508)));
                float3 _1835 = select(_1833, float3(0.0), isnan(_1833));
                float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1835.xy, uint(rint(_1835.z)), _728, level(_522));
                float3 _1845 = float3(_732, _748, float(int(_508)));
                float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
                float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1847.xy, uint(rint(_1847.z)), _728, level(_522));
                float _758 = _746 + _530;
                float _760 = _758 + _750;
                float _762 = _760 + _752;
                float _764 = _762 + _754;
                float3 _1869 = float3(_738, _744, float(int(_508)));
                float3 _1871 = select(_1869, float3(0.0), isnan(_1869));
                float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1871.xy, uint(rint(_1871.z)), _728, level(_522));
                float3 _1881 = float3(_740, _744, float(int(_508)));
                float3 _1883 = select(_1881, float3(0.0), isnan(_1881));
                float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1883.xy, uint(rint(_1883.z)), _728, level(_522));
                float3 _1893 = float3(_738, _748, float(int(_508)));
                float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
                float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1895.xy, uint(rint(_1895.z)), _728, level(_522));
                float3 _1905 = float3(_740, _748, float(int(_508)));
                float3 _1907 = select(_1905, float3(0.0), isnan(_1905));
                float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1907.xy, uint(rint(_1907.z)), _728, level(_522));
                float _774 = _764 + _756;
                int _776 = _532 + 1;
                float _778 = _528 + 1.0;
                bool _780 = _776 >= _331;
                float _782 = _774 + _766;
                float _784 = _782 + _768;
                float _786 = _784 + _770;
                float _788 = _786 + _772;
                float _790 = _788 * 0.111111111938953399658203125;
                float _792 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[30].x, (*spvDescriptorSet0.fp_c3)._m0[30].y);
                _794 = fma(_792, (*spvDescriptorSet0.fp_c3)._m0[8].x, _534);
                _526 = !_780;
                _297 = _778;
                _299 = _790;
                _524 = _776;
                _301 = _794;
                _303 = _778;
                _305 = int(_508);
                _307 = as_type<int>(_772);
                _309 = int(_508);
                _311 = as_type<int>(_756);
                _313 = int(_508);
                _315 = as_type<int>(_766);
                _317 = _790;
            } while (_526);
            _339 = as_type<int>(_794);
        }
        float _796 = _303;
        int _798 = _305;
        int _800 = _307;
        int _802 = _309;
        int _804 = _311;
        int _806 = _313;
        int _808 = _315;
        float _810 = _317;
        _812 = _339;
        int _814 = _261 + 1;
        bool _816 = _814 >= 4;
        _259 = !_816;
        _235 = _814;
        _239 = _812;
        _241 = _796;
        _243 = _798;
        _245 = _800;
        _247 = _802;
        _249 = _804;
        _251 = _806;
        _253 = _808;
        _255 = _810;
    } while (_259);
    out.m_41.x = as_type<float>(_812);
    out.m_41.y = as_type<float>(_812);
    out.m_41.z = as_type<float>(_812);
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
    float2 _850 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_850, float2(0.0), isnan(_850))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_850, float2(0.0), isnan(_850))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = in.m_36.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_36.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = 1.0 / _84;
    float _100 = _98 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _102 = _100 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _104 = _100 * (*spvDescriptorSet0.fp_c3)._m0[27].x;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _108 = _62 * _76;
    float _110 = _62 * _82;
    float _112 = abs(_102);
    float _114 = log2(_112);
    float _116 = _62 * _90;
    float _118 = _62 * _96;
    float _120 = abs(_104);
    float _122 = log2(_120);
    float _124 = _114 * _70;
    float _126 = abs(_106);
    float _128 = log2(_126);
    float _130 = exp2(_124);
    float _132 = _128 * _70;
    float _134 = -_68;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _138 = 1.0 / _136;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[8].y, _140);
    float _144 = _122 * _70;
    float _146 = _142 * _100;
    float _148 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _150 = exp2(_144);
    float _152 = _148 * _130;
    float _154 = abs(_146);
    float _156 = log2(_154);
    float _158 = _148 * _150;
    float _160 = ceil(_152);
    float _162 = _156 * _70;
    float _164 = ceil(_158);
    int _167 = int(_164);
    float _169 = exp2(_162);
    float _171 = exp2(_132);
    float _173 = _148 * _169;
    float _175 = precise::min(_148, _173);
    float _177 = _148 * _171;
    float _179 = trunc(_175);
    int _181 = int(_179);
    float _183 = ceil(_177);
    int _185 = min(_167, _181);
    float _187 = float(_185);
    int _189 = ~_185;
    int _191 = _181 + _189;
    int _193 = _191 + 1;
    float _195 = -_187;
    float _197 = _160 + _195;
    float _199 = trunc(_197);
    int _201 = int(_199);
    int _203 = min(_201, _193);
    int _205 = _185 + _203;
    float _207 = float(_205);
    int _209 = ~_205;
    int _211 = _181 + _209;
    int _213 = _211 + 1;
    float _215 = -_207;
    float _217 = _183 + _215;
    float _219 = trunc(_217);
    int _221 = int(_219);
    int _223 = min(_221, _213);
    int _225 = ~_205;
    int _227 = ~_223;
    int _229 = _181 + _225;
    int _231 = _229 + _227;
    int _233 = _231 + 2;
    int _235 = 0;
    int _237 = _167;
    int _239 = 0;
    float _241 = 0.0;
    int _243 = 0;
    int _245 = 0;
    int _247 = 0;
    int _249 = 0;
    int _251 = 0;
    int _253 = 0;
    float _255 = 0.0;
    bool _259;
    bool _526;
    float _794;
    int _812;
    do
    {
        int _261 = _235;
        int _263 = _237;
        int _265 = _239;
        float _267 = _241;
        int _269 = _243;
        int _271 = _245;
        int _273 = _247;
        int _275 = _249;
        int _277 = _251;
        int _279 = _253;
        float _281 = _255;
        int _283 = _261 * 4;
        bool _285 = _283 == 0;
        bool _287 = _283 == 4;
        bool _289 = _283 == 8;
        bool _291 = _283 == 12;
        int _293 = _263;
        int _295 = _283;
        float _297 = _267;
        float _299 = _281;
        float _301 = as_type<float>(_265);
        float _303 = _267;
        int _305 = _269;
        int _307 = _271;
        int _309 = _273;
        int _311 = _275;
        int _313 = _277;
        int _315 = _279;
        float _317 = _281;
        if (_285)
        {
            _293 = _185;
        }
        int _319 = _293;
        int _321 = _319;
        if (_287)
        {
            _321 = _203;
        }
        int _323 = _321;
        int _325 = _323;
        if (_289)
        {
            _325 = _223;
        }
        int _327 = _325;
        int _329 = _327;
        if (_291)
        {
            _329 = _233;
        }
        int _331 = _329;
        bool _333 = _331 > 0;
        _237 = _331;
        if (!_333)
        {
            _295 = _265;
        }
        int _335 = _295;
        bool _337 = !_333;
        int _339 = _335;
        if (!_337)
        {
            float _341 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x));
            int _343 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y));
            float _345 = float(uint(_261));
            float _347 = 1.0 / _341;
            float _349 = float(uint(_343));
            int _351 = abs(_261);
            float _353 = float(uint(_351));
            float _355 = 1.0 / _349;
            int _357 = as_type<int>(_347) + (-2);
            float _359 = as_type<float>(_357) * _345;
            int _361 = as_type<int>(_355) + (-2);
            float _363 = trunc(_359);
            float _365 = precise::max(_363, 0.0);
            uint _368 = uint(_365);
            float _370 = as_type<float>(_361) * _353;
            float _372 = trunc(_370);
            float _374 = precise::max(_372, 0.0);
            uint _376 = uint(_374);
            int _378 = ~int(_368);
            int _380 = _378 + 1;
            int _382 = _380 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _384 = _382 + _261;
            int _386 = -int(_376);
            float _388 = float(uint(_384));
            int _390 = _386 * _343;
            int _392 = _390 + _351;
            float _394 = as_type<float>(_357) * _388;
            float _396 = float(uint(_392));
            float _398 = trunc(_394);
            float _400 = precise::max(_398, 0.0);
            uint _402 = uint(_400);
            float _404 = as_type<float>(_361) * _396;
            float _406 = trunc(_404);
            float _408 = precise::max(_406, 0.0);
            uint _410 = uint(_408);
            int _412 = _261 << 6;
            int _414 = int(_368) + int(_402);
            int _416 = ~_414;
            int _418 = _416 + 1;
            int _420 = int(_376) + int(_410);
            int _422 = _418 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _424 = _422 + _261;
            float _426 = in.m_38.x;
            float _428 = gl_FragCoord.w;
            float _430 = _426 * _428;
            int _432 = ~_420;
            int _434 = _432 + 1;
            bool _436 = uint(_424) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            float _438 = in.m_38.z;
            float _440 = gl_FragCoord.w;
            float _442 = _438 * _440;
            int _444 = _434 * _343;
            int _446 = _444 + _351;
            bool _448 = !_436;
            int _450 = _448 ? 0 : (-1);
            float _452 = in.m_38.y;
            float _454 = gl_FragCoord.w;
            float _456 = _452 * _454;
            bool _458 = uint(_446) >= uint(_343);
            int _460 = ~_414;
            int _462 = _460 + _450;
            int _464 = _462 + 1;
            int _466 = _261 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            bool _468 = !_458;
            int _470 = _468 ? 0 : (-1);
            uint _472 = uint(int(uint(_466) >> uint(31)));
            int _474 = _464 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _476 = _474 + _261;
            bool _478 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
            int _480 = ~_470;
            int _482 = _420 + _480;
            int _484 = _482 + 1;
            bool _486 = !_478;
            int _488 = _486 ? _476 : (-1);
            int _490 = ~int(_472);
            int _492 = _490 + 1;
            float _494 = float(_488);
            int _496 = _484 ^ _492;
            float _498 = _62 * _430;
            bool _500 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
            float _502 = rint(_494);
            float _504 = precise::max(_502, 0.0);
            uint _506 = uint(_504);
            uint _508 = clamp(_506, 0u, 65535u);
            int _510 = -_492;
            int _512 = _496 + _510;
            float _514 = _62 * _442;
            float _516 = _62 * _456;
            bool _518 = !_500;
            int _520 = _518 ? _512 : (-1);
            float _522 = float(_520);
            int _524 = 0;
            do
            {
                float _528 = _297;
                float _530 = _299;
                int _532 = _524;
                float _534 = _301;
                float _536 = _528 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _538 = _412 + 160;
                uint _540 = uint(int(uint(_538) >> uint(2)));
                uint _542 = uint(int(uint(int(_540)) >> uint(2)));
                int _544 = int(_540) & 3;
                float _546 = (*spvDescriptorSet0.fp_c3)._m0[int(_542)][_544];
                int _548 = int(_540) + 1;
                uint _550 = uint(int(uint(_548) >> uint(2)));
                int _552 = _548 & 3;
                float _554 = (*spvDescriptorSet0.fp_c3)._m0[int(_550)][_552];
                float _556 = abs(_536);
                float _558 = log2(_556);
                int _560 = _412 + 176;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                uint _564 = uint(int(uint(int(_562)) >> uint(2)));
                int _566 = int(_562) & 3;
                float _568 = (*spvDescriptorSet0.fp_c3)._m0[int(_564)][_566];
                int _570 = int(_562) + 1;
                uint _572 = uint(int(uint(_570) >> uint(2)));
                int _574 = _570 & 3;
                float _576 = (*spvDescriptorSet0.fp_c3)._m0[int(_572)][_574];
                int _578 = _412 + 192;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                uint _582 = uint(int(uint(int(_580)) >> uint(2)));
                int _584 = int(_580) & 3;
                float _586 = (*spvDescriptorSet0.fp_c3)._m0[int(_582)][_584];
                int _588 = int(_580) + 1;
                uint _590 = uint(int(uint(_588) >> uint(2)));
                int _592 = _588 & 3;
                float _594 = (*spvDescriptorSet0.fp_c3)._m0[int(_590)][_592];
                float _596 = _558 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _598 = _412 + 208;
                uint _600 = uint(int(uint(_598) >> uint(2)));
                uint _602 = uint(int(uint(int(_600)) >> uint(2)));
                int _604 = int(_600) & 3;
                float _606 = (*spvDescriptorSet0.fp_c3)._m0[int(_602)][_604];
                int _608 = int(_600) + 1;
                uint _610 = uint(int(uint(_608) >> uint(2)));
                int _612 = _608 & 3;
                float _614 = (*spvDescriptorSet0.fp_c3)._m0[int(_610)][_612];
                float _616 = exp2(_596);
                int _618 = _412 + 216;
                uint _620 = uint(int(uint(_618) >> uint(2)));
                uint _622 = uint(int(uint(int(_620)) >> uint(2)));
                int _624 = int(_620) & 3;
                float _626 = (*spvDescriptorSet0.fp_c3)._m0[int(_622)][_624];
                int _628 = int(_620) + 1;
                uint _630 = uint(int(uint(_628) >> uint(2)));
                int _632 = _628 & 3;
                float _634 = (*spvDescriptorSet0.fp_c3)._m0[int(_630)][_632];
                float _636 = fma(_616, _516, _110);
                float _638 = _636 * _554;
                float _640 = _636 * _576;
                float _642 = fma(_616, _498, _108);
                float _644 = _636 * _594;
                float _646 = _636 * _614;
                float _648 = fma(_616, _514, _116);
                float _650 = fma(_642, _546, _638);
                float _652 = fma(_642, _568, _640);
                float _654 = fma(_642, _586, _644);
                float _656 = fma(_642, _606, _646);
                int _658 = _412 + 200;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                uint _662 = uint(int(uint(int(_660)) >> uint(2)));
                int _664 = int(_660) & 3;
                float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
                int _668 = int(_660) + 1;
                uint _670 = uint(int(uint(_668) >> uint(2)));
                int _672 = _668 & 3;
                float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
                float _676 = fma(_648, _626, _656);
                float _678 = fma(_118, _634, _676);
                int _680 = _412 + 168;
                uint _682 = uint(int(uint(_680) >> uint(2)));
                uint _684 = uint(int(uint(int(_682)) >> uint(2)));
                int _686 = int(_682) & 3;
                float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
                int _690 = int(_682) + 1;
                uint _692 = uint(int(uint(_690) >> uint(2)));
                int _694 = _690 & 3;
                float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
                float _698 = 1.0 / _678;
                int _700 = _412 + 184;
                uint _702 = uint(int(uint(_700) >> uint(2)));
                uint _704 = uint(int(uint(int(_702)) >> uint(2)));
                int _706 = int(_702) & 3;
                float _708 = (*spvDescriptorSet0.fp_c3)._m0[int(_704)][_706];
                int _710 = int(_702) + 1;
                uint _712 = uint(int(uint(_710) >> uint(2)));
                int _714 = _710 & 3;
                float _716 = (*spvDescriptorSet0.fp_c3)._m0[int(_712)][_714];
                float _718 = fma(_648, _666, _654);
                float _720 = fma(_118, _674, _718);
                float _722 = fma(_648, _688, _650);
                float _724 = fma(_648, _708, _652);
                float _726 = fma(_118, _696, _722);
                float _728 = _720 * _698;
                float _730 = fma(_118, _716, _724);
                float _732 = _726 * _698;
                float _734 = _730 * _698;
                float _736 = -(*spvDescriptorSet0.fp_c3)._m0[30].z;
                float _738 = _732 + _736;
                float _740 = _732 + (*spvDescriptorSet0.fp_c3)._m0[30].z;
                float _742 = -(*spvDescriptorSet0.fp_c3)._m0[30].w;
                float _744 = _734 + _742;
                float3 _1791 = float3(_732, _734, float(int(_508)));
                float3 _1795 = select(_1791, float3(0.0), isnan(_1791));
                float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1795.xy, uint(rint(_1795.z)), _728, level(_522));
                float _748 = _734 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
                float3 _1809 = float3(_738, _734, float(int(_508)));
                float3 _1811 = select(_1809, float3(0.0), isnan(_1809));
                float _750 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1811.xy, uint(rint(_1811.z)), _728, level(_522));
                float3 _1821 = float3(_732, _744, float(int(_508)));
                float3 _1823 = select(_1821, float3(0.0), isnan(_1821));
                float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1823.xy, uint(rint(_1823.z)), _728, level(_522));
                float3 _1833 = float3(_740, _734, float(int(_508)));
                float3 _1835 = select(_1833, float3(0.0), isnan(_1833));
                float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1835.xy, uint(rint(_1835.z)), _728, level(_522));
                float3 _1845 = float3(_732, _748, float(int(_508)));
                float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
                float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1847.xy, uint(rint(_1847.z)), _728, level(_522));
                float _758 = _746 + _530;
                float _760 = _758 + _750;
                float _762 = _760 + _752;
                float _764 = _762 + _754;
                float3 _1869 = float3(_738, _744, float(int(_508)));
                float3 _1871 = select(_1869, float3(0.0), isnan(_1869));
                float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1871.xy, uint(rint(_1871.z)), _728, level(_522));
                float3 _1881 = float3(_740, _744, float(int(_508)));
                float3 _1883 = select(_1881, float3(0.0), isnan(_1881));
                float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1883.xy, uint(rint(_1883.z)), _728, level(_522));
                float3 _1893 = float3(_738, _748, float(int(_508)));
                float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
                float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1895.xy, uint(rint(_1895.z)), _728, level(_522));
                float3 _1905 = float3(_740, _748, float(int(_508)));
                float3 _1907 = select(_1905, float3(0.0), isnan(_1905));
                float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1907.xy, uint(rint(_1907.z)), _728, level(_522));
                float _774 = _764 + _756;
                int _776 = _532 + 1;
                float _778 = _528 + 1.0;
                bool _780 = _776 >= _331;
                float _782 = _774 + _766;
                float _784 = _782 + _768;
                float _786 = _784 + _770;
                float _788 = _786 + _772;
                float _790 = _788 * 0.111111111938953399658203125;
                float _792 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[30].x, (*spvDescriptorSet0.fp_c3)._m0[30].y);
                _794 = fma(_792, (*spvDescriptorSet0.fp_c3)._m0[8].x, _534);
                _526 = !_780;
                _297 = _778;
                _299 = _790;
                _524 = _776;
                _301 = _794;
                _303 = _778;
                _305 = int(_508);
                _307 = as_type<int>(_772);
                _309 = int(_508);
                _311 = as_type<int>(_756);
                _313 = int(_508);
                _315 = as_type<int>(_766);
                _317 = _790;
            } while (_526);
            _339 = as_type<int>(_794);
        }
        float _796 = _303;
        int _798 = _305;
        int _800 = _307;
        int _802 = _309;
        int _804 = _311;
        int _806 = _313;
        int _808 = _315;
        float _810 = _317;
        _812 = _339;
        int _814 = _261 + 1;
        bool _816 = _814 >= 4;
        _259 = !_816;
        _235 = _814;
        _239 = _812;
        _241 = _796;
        _243 = _798;
        _245 = _800;
        _247 = _802;
        _249 = _804;
        _251 = _806;
        _253 = _808;
        _255 = _810;
    } while (_259);
    out.m_41.x = as_type<float>(_812);
    out.m_41.y = as_type<float>(_812);
    out.m_41.z = as_type<float>(_812);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

