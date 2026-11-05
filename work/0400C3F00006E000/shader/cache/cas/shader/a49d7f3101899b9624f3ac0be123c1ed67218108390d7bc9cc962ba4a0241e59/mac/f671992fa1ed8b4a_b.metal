#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    texture2d_array<float> cp_t_tcb_10 [[id(2)]];
    sampler cp_t_tcb_10Smplr [[id(3)]];
    texture2d_array<float> cp_t_tcb_E [[id(4)]];
    sampler cp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
    texture2d_array<float> cp_t_tcb_12 [[id(10)]];
    sampler cp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> cp_t_tcb_A [[id(12)]];
    sampler cp_t_tcb_ASmplr [[id(13)]];
    texture2d<float> cp_t_tcb_14 [[id(14)]];
    sampler cp_t_tcb_14Smplr [[id(15)]];
    texture3d<float, access::write> cp_i_tcb_48_ [[id(16)]];
    texture3d<float, access::write> cp_i_tcb_4A_ [[id(17)]];
    sampler cp_t_tcb_CSmplr_w [[id(18)]];
    sampler cp_t_tcb_8Smplr_w [[id(19)]];
    sampler cp_t_tcb_12Smplr_w [[id(20)]];
    sampler cp_t_tcb_ASmplr_w [[id(21)]];
    sampler cp_t_tcb_14Smplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    threadgroup spvUnsafeArray<uint, 576> _26;
    bool _2067 = false;
    float _68 = as_type<float>(gl_WorkGroupID.y);
    float _70 = as_type<float>(gl_LocalInvocationID.y);
    float _72 = as_type<float>(gl_WorkGroupID.x);
    float _74 = as_type<float>(gl_LocalInvocationID.x);
    int _77 = as_type<int>(_68) << 2;
    int _79 = _77 + as_type<int>(_70);
    int _81 = as_type<int>(_72) << 2;
    int _83 = _81 + as_type<int>(_74);
    float _85 = float(uint(_79));
    float _87 = float(uint(_83));
    float _89 = _85 + 0.5;
    float _91 = _87 + 0.5;
    float _93 = -_89;
    float _95 = fma(_93, (*spvDescriptorSet0.cp_c4)._m0[0].y, 0.5);
    float _97 = fma(_91, (*spvDescriptorSet0.cp_c4)._m0[0].x, -0.5);
    float _99 = fma(_95, (*spvDescriptorSet0.cp_c3)._m0[4].y, (*spvDescriptorSet0.cp_c3)._m0[4].w);
    float _101 = as_type<float>(gl_LocalInvocationID.z);
    float _103 = fma(_97, (*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _105 = _99 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _107 = _99 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _109 = _99 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _111 = fma(_103, (*spvDescriptorSet0.cp_c3)._m0[1].x, _105);
    float _113 = fma(_103, (*spvDescriptorSet0.cp_c3)._m0[0].x, _107);
    float _115 = fma(_103, (*spvDescriptorSet0.cp_c3)._m0[2].x, _109);
    float _117 = -(*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _119 = _111 + _117;
    float _121 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _123 = _113 + _121;
    float _125 = -(*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _127 = _115 + _125;
    float _129 = _119 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _131 = _123 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _133 = _127 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _135 = -(*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _137 = _129 + _135;
    float _139 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _141 = _131 + _139;
    float _143 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _145 = _133 + _143;
    float _147 = _137 * _137;
    float _149 = fma(_141, _141, _147);
    float _151 = fma(_145, _145, _149);
    float _153 = rsqrt(_151);
    float _155 = _141 * _153;
    float _157 = _145 * _153;
    float _159 = _137 * _153;
    float _161 = _155 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _163 = _157 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _165 = (*spvDescriptorSet0.cp_c3)._m0[3].y + (-220.0);
    float _167 = _161 * _161;
    float _169 = _163 * _163;
    float _171 = precise::max(0.0, _165);
    float _173 = _167 + _169;
    float _175 = sqrt(_173);
    float _177 = -_159;
    float _179 = -_171;
    float _181 = fma(_177, (*spvDescriptorSet0.cp_c3)._m0[8].w, _179);
    bool _185 = _175 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _187 = _153;
    float _189 = _181;
    float _191 = _169;
    if (!_185)
    {
        _187 = _167;
    }
    float _193 = _187;
    bool _195 = !_185;
    float _197 = _193;
    if (!_195)
    {
        float _199 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _201 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _203 = _175 + _201;
        float _205 = _181 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _207 = rsqrt(_173);
        float _209 = _203 * _199;
        float _211 = _209 * 0.15915493667125701904296875;
        float _213 = _211 * 6.283185482025146484375;
        float _215 = sin(_213);
        float _217 = _211 * 6.283185482025146484375;
        float _219 = cos(_217);
        float _221 = fma(_215, _205, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _223 = _207 * _221;
        float _225 = _219 + (-1.0);
        float _227 = _161 * _223;
        float _229 = _225 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _231 = _163 * _223;
        float _233 = fma(_181, _219, _229);
        float _235 = _227 * _227;
        float _237 = _231 * _231;
        _189 = _233;
        _197 = _235;
        _191 = _237;
    }
    float _239 = _189;
    float _241 = _197;
    float _243 = _191;
    float _245 = _99 * _99;
    float _247 = fma(_239, _239, _241);
    bool _249 = as_type<uint>(_101) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _251 = fma(_103, _103, _245);
    float _253 = _247 + _243;
    float _255 = _155 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _257 = _251 + 1.0;
    float _259 = rsqrt(_253);
    float _261 = -_159;
    float _263 = -_255;
    float _265 = fma(_261, (*spvDescriptorSet0.cp_c3)._m0[6].y, _263);
    float _267 = -_157;
    float _269 = fma(_267, (*spvDescriptorSet0.cp_c3)._m0[6].z, _265);
    float _271 = sqrt(_257);
    if (_249)
    {
        return;
    }
    int _273 = as_type<int>(_70) << 2;
    int _275 = _273 + as_type<int>(_74);
    float _277 = _259 * _239;
    float _279 = rsqrt(_257);
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.cp_c3)._m0[15].x, _269);
    int _285 = _275 << 2;
    uint _288 = as_type<uint>(_101);
    float _290 = 0.0;
    float _292 = 0.0;
    float _294 = 0.0;
    float _296 = 0.0;
    float _298 = 0.0;
    int _300 = 0;
    int _302 = 0;
    float _304 = 0.0;
    int _306 = 0;
    float _308 = 0.0;
    float _310 = 0.0;
    do
    {
        uint _312 = _288;
        float _314 = _290;
        float _316 = _292;
        float _318 = _294;
        float _320 = _296;
        float _322 = _298;
        int _324 = _300;
        int _326 = _302;
        float _328 = _304;
        int _330 = _306;
        float _332 = _308;
        float _334 = _310;
        float _336 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _338 = log2(_336);
        float _340 = float(_312);
        float _342 = _271 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _344 = int(_312) + 1;
        float _346 = _159 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _348 = _157 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _350 = float(uint(_344));
        float _352 = _338 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _354 = _340 * _352;
        float _356 = _350 * _352;
        float _358 = exp2(_354);
        float _360 = exp2(_356);
        float _362 = _358 + (-1.0);
        float _364 = _362 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _366 = _360 + (-1.0);
        float _368 = _155 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _370 = -_364;
        float _372 = fma(_366, (*spvDescriptorSet0.cp_c3)._m0[8].z, _370);
        float _374 = _364 + _372;
        float _376 = _271 * _364;
        float _378 = _374 * _342;
        float _380 = _372 * _342;
        float _382 = fma(_376, _368, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _384 = fma(_376, _346, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _386 = -_279;
        float _388 = _378 * _386;
        float _390 = fma(_376, _348, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _392 = _159 * _380;
        float _394 = fma(_155, _380, _382);
        float _396 = -_388;
        float _398 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _400 = _396 + _398;
        float _402 = -_388;
        float _404 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _406 = _402 + _404;
        float _408 = fma(_157, _380, _390);
        float _410 = _384 + _392;
        float _412 = _400 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _414 = precise::clamp(_412, 0.0, 1.0);
        float _416 = _406 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _418 = precise::clamp(_416, 0.0, 1.0);
        bool _420 = _414 != 1.0;
        bool _422 = isnan(_414);
        bool _424 = _420 || _422;
        bool _426 = isnan(1.0);
        bool _428 = _424 || _426;
        bool _430 = _418 != 1.0;
        bool _432 = isnan(_418);
        bool _434 = _430 || _432;
        bool _436 = isnan(1.0);
        bool _438 = _434 || _436;
        float _440 = _320;
        float _442 = _316;
        float _444 = _318;
        float _446 = _314;
        float _448 = _332;
        float _450 = _334;
        if (!_428)
        {
            _440 = 1.0;
        }
        float _452 = _440;
        bool _454 = !_428;
        float _456 = _452;
        if (!_454)
        {
            float _458 = -_388;
            bool _460 = _458 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _462 = -_388;
            bool _464 = _462 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _466 = !_460;
            int _468 = _466 ? 0 : 1;
            int _470 = 2;
            if (!_460)
            {
                _470 = 1;
            }
            int _472 = _470;
            int _474 = _472;
            if (!_464)
            {
                _474 = _468;
            }
            int _476 = _474;
            int _478 = _476 << 6;
            float _480 = float(_476);
            int _482 = _478 + 304;
            uint _484 = uint(int(uint(_482) >> uint(2)));
            uint _486 = uint(int(uint(int(_484)) >> uint(2)));
            int _488 = int(_484) & 3;
            float _490 = (*spvDescriptorSet0.cp_c3)._m0[int(_486)][_488];
            int _492 = int(_484) + 1;
            uint _494 = uint(int(uint(_492) >> uint(2)));
            int _496 = _492 & 3;
            float _498 = (*spvDescriptorSet0.cp_c3)._m0[int(_494)][_496];
            int _500 = _478 + 312;
            uint _502 = uint(int(uint(_500) >> uint(2)));
            uint _504 = uint(int(uint(int(_502)) >> uint(2)));
            int _506 = int(_502) & 3;
            float _508 = (*spvDescriptorSet0.cp_c3)._m0[int(_504)][_506];
            int _510 = int(_502) + 1;
            uint _512 = uint(int(uint(_510) >> uint(2)));
            int _514 = _510 & 3;
            float _516 = (*spvDescriptorSet0.cp_c3)._m0[int(_512)][_514];
            int _518 = _478 + 256;
            uint _520 = uint(int(uint(_518) >> uint(2)));
            uint _522 = uint(int(uint(int(_520)) >> uint(2)));
            int _524 = int(_520) & 3;
            float _526 = (*spvDescriptorSet0.cp_c3)._m0[int(_522)][_524];
            int _528 = int(_520) + 1;
            uint _530 = uint(int(uint(_528) >> uint(2)));
            int _532 = _528 & 3;
            float _534 = (*spvDescriptorSet0.cp_c3)._m0[int(_530)][_532];
            int _536 = _478 + 272;
            uint _538 = uint(int(uint(_536) >> uint(2)));
            uint _540 = uint(int(uint(int(_538)) >> uint(2)));
            int _542 = int(_538) & 3;
            float _544 = (*spvDescriptorSet0.cp_c3)._m0[int(_540)][_542];
            int _546 = int(_538) + 1;
            uint _548 = uint(int(uint(_546) >> uint(2)));
            int _550 = _546 & 3;
            float _552 = (*spvDescriptorSet0.cp_c3)._m0[int(_548)][_550];
            int _554 = _478 + 288;
            uint _556 = uint(int(uint(_554) >> uint(2)));
            uint _558 = uint(int(uint(int(_556)) >> uint(2)));
            int _560 = int(_556) & 3;
            float _562 = (*spvDescriptorSet0.cp_c3)._m0[int(_558)][_560];
            int _564 = int(_556) + 1;
            uint _566 = uint(int(uint(_564) >> uint(2)));
            int _568 = _564 & 3;
            float _570 = (*spvDescriptorSet0.cp_c3)._m0[int(_566)][_568];
            int _572 = _478 + 264;
            uint _574 = uint(int(uint(_572) >> uint(2)));
            uint _576 = uint(int(uint(int(_574)) >> uint(2)));
            int _578 = int(_574) & 3;
            float _580 = (*spvDescriptorSet0.cp_c3)._m0[int(_576)][_578];
            int _582 = int(_574) + 1;
            uint _584 = uint(int(uint(_582) >> uint(2)));
            int _586 = _582 & 3;
            float _588 = (*spvDescriptorSet0.cp_c3)._m0[int(_584)][_586];
            int _590 = _478 + 280;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            uint _594 = uint(int(uint(int(_592)) >> uint(2)));
            int _596 = int(_592) & 3;
            float _598 = (*spvDescriptorSet0.cp_c3)._m0[int(_594)][_596];
            int _600 = int(_592) + 1;
            uint _602 = uint(int(uint(_600) >> uint(2)));
            int _604 = _600 & 3;
            float _606 = (*spvDescriptorSet0.cp_c3)._m0[int(_602)][_604];
            float _608 = _410 * _498;
            float _610 = fma(_394, _490, _608);
            int _612 = _478 + 296;
            uint _614 = uint(int(uint(_612) >> uint(2)));
            uint _616 = uint(int(uint(int(_614)) >> uint(2)));
            int _618 = int(_614) & 3;
            float _620 = (*spvDescriptorSet0.cp_c3)._m0[int(_616)][_618];
            int _622 = int(_614) + 1;
            uint _624 = uint(int(uint(_622) >> uint(2)));
            int _626 = _622 & 3;
            float _628 = (*spvDescriptorSet0.cp_c3)._m0[int(_624)][_626];
            float _630 = fma(_408, _508, _610);
            float _632 = _630 + _516;
            float _634 = _410 * _534;
            float _636 = 1.0 / _632;
            float _638 = fma(_394, _526, _634);
            float _640 = _410 * _552;
            float _642 = rint(_480);
            float _644 = precise::max(_642, 0.0);
            uint _646 = uint(_644);
            uint _648 = clamp(_646, 0u, 65535u);
            float _650 = fma(_394, _544, _640);
            float _652 = _410 * _570;
            float _654 = fma(_394, _562, _652);
            float _656 = fma(_408, _580, _638);
            float _658 = _656 + _588;
            float _660 = fma(_408, _598, _650);
            float _662 = _658 * _636;
            float _664 = _660 + _606;
            float _666 = fma(_408, _620, _654);
            float _668 = _664 * _636;
            float _670 = _666 + _628;
            float _672 = _670 * _636;
            float _674 = precise::clamp(_672, 0.0, 1.0);
            float3 _2989 = float3(_662, _668, float(int(_648)));
            float3 _2993 = select(_2989, float3(0.0), isnan(_2989));
            float _676 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _2993.xy, uint(rint(_2993.z)), _674, level(0.0));
            float _678 = -_676;
            float _680 = _678 + 1.0;
            float _682 = fma(_414, _680, _676);
            _456 = _682;
            _442 = _670;
            _444 = _628;
            _446 = _674;
        }
        float _684 = _456;
        float _686 = _442;
        float _688 = _444;
        float _690 = _446;
        float _692 = _686;
        float _694 = _688;
        float _696 = _690;
        if (!_438)
        {
            _692 = 1.0;
        }
        float _698 = _692;
        bool _700 = !_438;
        float _702 = _698;
        if (!_700)
        {
            float _704 = _410 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _706 = _410 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _708 = fma(_394, (*spvDescriptorSet0.cp_c3)._m0[130].x, _704);
            float _710 = fma(_394, (*spvDescriptorSet0.cp_c3)._m0[131].x, _706);
            float _712 = fma(_408, (*spvDescriptorSet0.cp_c3)._m0[130].z, _708);
            float _714 = fma(_408, (*spvDescriptorSet0.cp_c3)._m0[131].z, _710);
            float _716 = _712 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _718 = _714 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _720 = trunc(_716);
            int _722 = int(_720);
            float _724 = trunc(_718);
            int _726 = int(_724);
            int _728 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _730 = _722 + _728;
            int _732 = _730 + 1;
            bool _734 = _732 >= 0;
            int _736 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _738 = _726 + _736;
            int _740 = _738 + 1;
            bool _742 = _732 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _744 = !_734;
            bool _746 = _742 || _744;
            bool _748 = _740 < 0;
            bool _750 = _748 || _746;
            bool _752 = _740 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _754 = _752 || _750;
            float _756 = _714;
            if (_754)
            {
                _756 = 1.0;
            }
            float _758 = _756;
            float _760 = _758;
            if (!_754)
            {
                int _762 = _740 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _764 = _762 + _732;
                float _766 = floor(_716);
                int _768 = _764 << 2;
                uint _770 = uint(int(uint(_764) >> uint(2)));
                int _772 = 12 & _768;
                float _774 = floor(_718);
                int _776 = _764 << 4;
                int _778 = _776 + 2112;
                int _780 = int(_770) << 4;
                int _782 = _780 + _772;
                uint _784 = uint(int(uint(_778) >> uint(2)));
                uint _786 = uint(int(uint(int(_784)) >> uint(2)));
                int _788 = int(_784) & 3;
                float _790 = (*spvDescriptorSet0.cp_c3)._m0[int(_786)][_788];
                int _792 = int(_784) + 1;
                uint _794 = uint(int(uint(_792) >> uint(2)));
                int _796 = _792 & 3;
                float _798 = (*spvDescriptorSet0.cp_c3)._m0[int(_794)][_796];
                float _800 = -_766;
                float _802 = _716 + _800;
                int _804 = _782 + 464;
                uint _806 = uint(int(uint(_804) >> uint(2)));
                uint _808 = uint(int(uint(int(_806)) >> uint(2)));
                int _810 = int(_806) & 3;
                float _812 = (*spvDescriptorSet0.cp_c3)._m0[int(_808)][_810];
                int _814 = _778 + 8;
                uint _816 = uint(int(uint(_814) >> uint(2)));
                uint _818 = uint(int(uint(int(_816)) >> uint(2)));
                int _820 = int(_816) & 3;
                float _822 = (*spvDescriptorSet0.cp_c3)._m0[int(_818)][_820];
                int _824 = int(_816) + 1;
                uint _826 = uint(int(uint(_824) >> uint(2)));
                int _828 = _824 & 3;
                float _830 = (*spvDescriptorSet0.cp_c3)._m0[int(_826)][_828];
                float _832 = _410 * _798;
                float _834 = fma(_394, _790, _832);
                float _836 = rint(_812);
                float _838 = precise::max(_836, 0.0);
                uint _840 = uint(_838);
                uint _842 = clamp(_840, 0u, 65535u);
                float _844 = fma(_408, _822, _834);
                float _846 = -_774;
                float _848 = _718 + _846;
                float _850 = _844 + _830;
                float _852 = precise::clamp(_850, 0.0, 1.0);
                float3 _3272 = float3(_802, _848, float(int(_842)));
                float3 _3274 = select(_3272, float3(0.0), isnan(_3272));
                float _854 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _3274.xy, uint(rint(_3274.z)), _852, level(0.0));
                _760 = _854;
            }
            float _856 = _760;
            float _858 = -_856;
            float _860 = _858 + 1.0;
            float _862 = fma(_418, _860, _856);
            _702 = _862;
        }
        float _864 = _702;
        float _866 = fma(_394, 6.2500002968590706586837768554688e-05, 0.5);
        float _868 = fma(_408, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _3300 = float2(_866, _868);
        float3 _872 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_3300, float2(0.0), isnan(_3300)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_3300, float2(0.0), isnan(_3300)), level(0.0)).xyz;
        float _874 = _872.x;
        float _876 = _872.y;
        float _878 = _872.z;
        float2 _3316 = float2(_866, _868);
        float _880 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3316, float2(0.0), isnan(_3316)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3316, float2(0.0), isnan(_3316)), level(0.0)).x;
        float3 _3325 = float3(_866, _868, float(0));
        float3 _3327 = select(_3325, float3(0.0), isnan(_3325));
        float4 _883 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3327.xy, uint(rint(_3327.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3327.xy, uint(rint(_3327.z)), level(0.0)).xyzw;
        float _885 = _883.x;
        float _887 = _883.y;
        float _889 = _883.z;
        float _891 = _883.w;
        float3 _3342 = float3(_866, _868, float(1));
        float3 _3344 = select(_3342, float3(0.0), isnan(_3342));
        float4 _893 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3344.xy, uint(rint(_3344.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3344.xy, uint(rint(_3344.z)), level(0.0)).xyzw;
        float _895 = _893.x;
        float _897 = _893.y;
        float _899 = _893.z;
        float _901 = _893.w;
        float3 _3359 = float3(_866, _868, float(2));
        float3 _3361 = select(_3359, float3(0.0), isnan(_3359));
        float4 _903 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3361.xy, uint(rint(_3361.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3361.xy, uint(rint(_3361.z)), level(0.0)).xyzw;
        float _905 = _903.x;
        float _907 = _903.y;
        float _909 = _903.z;
        float _911 = _903.w;
        float _913 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _915 = _408 + _913;
        float _917 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _919 = _394 + _917;
        float _921 = precise::min(_684, _864);
        float _923 = _159 * 1.02332699298858642578125;
        float _925 = _915 * _915;
        float _927 = _157 * 1.02332699298858642578125;
        float _929 = fma(_919, _919, _925);
        float _931 = _155 * 1.02332699298858642578125;
        float _933 = sqrt(_929);
        bool _935 = _933 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _937 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _939 = _933 + _937;
        float _941 = _322;
        float _943 = _939;
        float _945 = _921;
        if (_935)
        {
            float _947 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _941 = _947;
        }
        float _949 = _941;
        if (_935)
        {
            float _951 = _939 * _949;
            _943 = _951;
        }
        float _953 = _943;
        float _955 = _953;
        if (_935)
        {
            float _957 = _953 * 0.15915493667125701904296875;
            _694 = _957;
        }
        float _959 = _694;
        if (!_935)
        {
            _955 = _410;
        }
        float _961 = _955;
        float _963 = _915;
        float _965 = _961;
        if (_935)
        {
            float _967 = _959 * 6.283185482025146484375;
            float _969 = cos(_967);
            _963 = _969;
        }
        float _971 = _963;
        if (_935)
        {
            float _973 = _971 + (-1.0);
            _696 = _973;
        }
        float _975 = _696;
        float _977 = _975;
        if (_935)
        {
            float _979 = _975 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _977 = _979;
        }
        float _981 = _977;
        if (_935)
        {
            float _983 = fma(_410, _971, _981);
            _965 = _983;
        }
        float _985 = _965;
        float _987 = abs(_392);
        bool _989 = _987 > 0.00999999977648258209228515625;
        float _991 = -_985;
        float _993 = fma(_410, 2.0, _991);
        float _995 = fma(_876, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _997 = fma(_880, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _999 = _989 ? _392 : 0.00999999977648258209228515625;
        float _1001 = _995 * 100.0;
        float _1003 = 1.0 / _995;
        float _1005 = fma(_378, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _1007 = precise::clamp(_1005, 0.0, 1.0);
        float _1009 = -_997;
        float _1011 = _1009 + _993;
        float _1013 = _995 * _999;
        float _1015 = fma(_283, -0.5, 0.5);
        float _1017 = -_1007;
        float _1019 = _1017 + 1.0;
        float _1021 = _995 * 5115.0;
        float _1023 = precise::max(0.0, _1011);
        float _1025 = exp2(_1001);
        float _1027 = precise::max(_1013, -127.0);
        float _1029 = _891 * _923;
        float _1031 = _895 * _923;
        float _1033 = _897 * _923;
        float _1035 = fma(_885, 0.88622701168060302734375, _1029);
        float _1037 = fma(_887, 0.88622701168060302734375, _1031);
        float _1039 = abs(_1019);
        float _1041 = log2(_1039);
        float _1043 = fma(_889, 0.88622701168060302734375, _1033);
        float _1045 = fma(_899, _927, _1035);
        float _1047 = fma(_901, _927, _1037);
        float _1049 = fma(_1025, 512.0, -512.0);
        float _1051 = sqrt(_1015);
        float _1053 = 1.0 / _1027;
        float _1055 = _1041 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _1057 = fma(_905, _927, _1043);
        float _1059 = fma(_907, _931, _1045);
        float _1061 = fma(_909, _931, _1047);
        float _1063 = 1.0 / _1049;
        float _1065 = _1051 * 0.636619746685028076171875;
        float _1067 = exp2(_1055);
        float _1069 = _277 + 1.0;
        float _1071 = _1021 * _1063;
        float _1073 = log2(_1071);
        float _1075 = -_277;
        float _1077 = fma(_1067, _1069, _1075);
        float _1079 = fma(_283, 0.5, 0.5);
        float _1081 = fma(_1079, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _1083 = fma(_1079, _1081, -0.212114393711090087890625);
        float _1085 = fma(_1079, _1083, 1.570728778839111328125);
        float _1087 = fma(_1073, _1003, 100.0);
        float _1089 = -_1085;
        float _1091 = fma(_1065, _1089, 1.0);
        float _1093 = -_1087;
        float _1095 = _1093 + _1023;
        float _1097 = fma(_1077, 0.5, 0.5);
        float _1099 = -_1027;
        float _1101 = exp2(_1099);
        float _1103 = _995 * _1095;
        float3 _3660 = float3(_866, _868, float(3));
        float3 _3662 = select(_3660, float3(0.0), isnan(_3660));
        float4 _1105 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3662.xy, uint(rint(_3662.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3662.xy, uint(rint(_3662.z)), level(0.0)).xyzw;
        float _1107 = _1105.x;
        float _1109 = _1105.y;
        float _1111 = _1105.z;
        float _1113 = _1105.w;
        float3 _3677 = float3(_866, _868, float(6));
        float3 _3679 = select(_3677, float3(0.0), isnan(_3677));
        float4 _1115 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3679.xy, uint(rint(_3679.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3679.xy, uint(rint(_3679.z)), level(0.0)).xyzw;
        float _1117 = _1115.x;
        float _1119 = _1115.y;
        float _1121 = _1115.z;
        float _1123 = _1115.w;
        float3 _3694 = float3(_866, _868, float(4));
        float3 _3696 = select(_3694, float3(0.0), isnan(_3694));
        float4 _1125 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3696.xy, uint(rint(_3696.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3696.xy, uint(rint(_3696.z)), level(0.0)).xyzw;
        float _1127 = _1125.x;
        float _1129 = _1125.y;
        float _1131 = _1125.z;
        float _1133 = _1125.w;
        float _1135 = -_1103;
        float _1137 = exp2(_1135);
        float _1139 = -_1101;
        float _1141 = _1139 + 1.0;
        float _1143 = _1137 * _1141;
        float _1145 = _1143 * _1053;
        float3 _3726 = float3(_866, _868, float(7));
        float3 _3728 = select(_3726, float3(0.0), isnan(_3726));
        float4 _1147 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3728.xy, uint(rint(_3728.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3728.xy, uint(rint(_3728.z)), level(0.0)).xyzw;
        float _1149 = _1147.x;
        float _1151 = _1147.y;
        float _1153 = _1147.z;
        float _1155 = _1147.w;
        float3 _3744 = float3(_866, _868, float(5));
        float3 _3746 = select(_3744, float3(0.0), isnan(_3744));
        float4 _1157 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3746.xy, uint(rint(_3746.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3746.xy, uint(rint(_3746.z)), level(0.0)).xyzw;
        float _1159 = _1157.x;
        float _1161 = _1157.y;
        float _1163 = _1157.z;
        float _1165 = _1157.w;
        float2 _3760 = float2(_866, _868);
        float3 _1167 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_3760, float2(0.0), isnan(_3760)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_3760, float2(0.0), isnan(_3760)), level(0.0)).xyz;
        float _1169 = _1167.x;
        float _1171 = _1167.y;
        float _1173 = _1167.z;
        float2 _3774 = float2(_1091, _1097);
        float3 _1175 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_3774, float2(0.0), isnan(_3774)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_3774, float2(0.0), isnan(_3774)), level(0.0)).xyz;
        float _1177 = _1175.x;
        float _1179 = _1175.y;
        float _1181 = _1175.z;
        float _1183 = fma(_911, _931, _1057);
        float _1185 = precise::max(0.0, _1059);
        float _1187 = _1041 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _1189 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _1191 = precise::max(0.0, _1061);
        bool _1193 = as_type<int>(_101) != 0;
        float _1195 = _1185 * _1189;
        float _1197 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _1199 = _878 * 2.0;
        float _1201 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _1203 = exp2(_1187);
        float _1205 = _1191 * _1197;
        float _1207 = fma(_878, _878, 1.0);
        float _1209 = -_1199;
        float _1211 = fma(_283, _1209, _1207);
        float _1213 = -_1199;
        float _1215 = _1207 + _1213;
        float _1217 = abs(_1211);
        float _1219 = log2(_1217);
        float _1221 = abs(_1215);
        float _1223 = log2(_1221);
        float _1225 = _1219 * 1.5;
        float _1227 = exp2(_1225);
        float _1229 = _1223 * 1.5;
        float _1231 = -_878;
        float _1233 = fma(_1231, _878, 1.0);
        float _1235 = exp2(_1229);
        float _1237 = _1227 * 12.56637096405029296875;
        float _1239 = 1.0 / _1237;
        float _1241 = _1235 * 12.56637096405029296875;
        float _1243 = 1.0 / _1241;
        float _1245 = _1233 * _1239;
        float _1247 = _1233 * _1243;
        float _1249 = fma(_874, -0.99447572231292724609375, 1.0);
        float _1251 = log2(_1249);
        float _1253 = _1251 * (-0.0199999995529651641845703125);
        float _1255 = _380 * _1253;
        float _1257 = precise::max(0.0, _1183);
        float _1259 = _1145 * _1255;
        float _1261 = 1.0 / _380;
        float _1263 = _1257 * _1201;
        float _1265 = _1113 * _923;
        float _1267 = _1119 * _923;
        float _1269 = _1127 * _923;
        float _1271 = _1129 * _923;
        float _1273 = fma(_1107, 0.88622701168060302734375, _1265);
        float _1275 = fma(_1117, 0.88622701168060302734375, _1267);
        float _1277 = fma(_1109, 0.88622701168060302734375, _1269);
        float _1279 = fma(_1111, 0.88622701168060302734375, _1271);
        float _1281 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _1283 = _378 + _1281;
        float _1285 = fma(_1121, _927, _1275);
        float _1287 = fma(_1131, _927, _1273);
        float _1289 = fma(_1133, _927, _1277);
        float _1291 = _1283 * _1261;
        float _1293 = precise::clamp(_1291, 0.0, 1.0);
        float _1295 = fma(_1123, _931, _1285);
        float _1297 = _1123;
        float _1299 = _1277;
        float _1301 = _1279;
        float _1303 = _1161;
        float _1305 = _1163;
        float _1307 = _1165;
        float _1309 = _1117;
        if (_1193)
        {
            _1297 = as_type<float>(_324);
        }
        int _1311 = as_type<int>(_1297);
        float _1313 = _1259 * _1293;
        float _1315 = _1295 * 0.31830990314483642578125;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        int _1319 = _1311;
        if (_1193)
        {
            _1299 = as_type<float>(_326);
        }
        int _1321 = as_type<int>(_1299);
        float _1323 = precise::min(_1317, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1325 = _1323 * 0.88622701168060302734375;
        float _1327 = _1151 * _923;
        float _1329 = fma(_1159, _927, _1279);
        float _1331 = fma(_1161, _931, _1287);
        float _1333 = fma(_1163, _931, _1289);
        float _1335 = fma(_1149, 0.88622701168060302734375, _1327);
        float _1337 = fma(_1165, _931, _1329);
        float _1339 = fma(_1325, (*spvDescriptorSet0.cp_c3)._m0[9].x, _1195);
        float _1341 = precise::max(0.0, _1331);
        float _1343 = fma(_1153, _927, _1335);
        float _1345 = precise::max(0.0, _1333);
        float _1347 = fma(_1325, (*spvDescriptorSet0.cp_c3)._m0[9].y, _1205);
        float _1349 = precise::max(0.0, _1337);
        float _1351 = fma(_1155, _931, _1343);
        float _1353 = fma(_1325, (*spvDescriptorSet0.cp_c3)._m0[9].z, _1263);
        float _1355 = precise::min(_921, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1357 = _1351 * 0.31830990314483642578125;
        float _1359 = precise::clamp(_1357, 0.0, 1.0);
        int _1361 = _1321;
        if (_1193)
        {
            _1301 = _328;
        }
        float _1363 = _1301;
        float _1365 = _1355 * _1245;
        float _1367 = _1359 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _1369 = precise::clamp(_1367, 0.0, 1.0);
        float _1371 = _380 * _1355;
        float _1373 = _1355 * _1177;
        float _1375 = _1355 * _1179;
        float _1377 = fma(_1341, _1369, _1339);
        float _1379 = fma(_1345, _1369, _1347);
        float _1381 = fma(_1349, _1369, _1353);
        int _1383 = _285 + as_type<int>(_101);
        float _1385 = _1377 * _1247;
        float _1387 = _1379 * _1247;
        float _1389 = _1381 * _1247;
        float _1391 = _1355 * _1181;
        float _1393 = fma(_1365, (*spvDescriptorSet0.cp_c3)._m0[7].x, _1385);
        float _1395 = fma(_1365, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1387);
        float _1397 = fma(_1365, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1389);
        float _1399 = -_1203;
        float _1401 = _1399 + 1.0;
        float _1403 = _1169 * _1393;
        float _1405 = _1171 * _1395;
        float _1407 = _1173 * _1397;
        float _1409 = _1401 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        int _1411 = _1383 << 2;
        int _1413 = _1411 + 1024;
        uint _1415 = uint(int(uint(_1413) >> uint(2)));
        _26[int(_1415)] = as_type<uint>(_1371);
        float _1417 = _1397;
        float _1419 = _1363;
        if (_1193)
        {
            _1417 = as_type<float>(_330);
        }
        int _1421 = as_type<int>(_1417);
        int _1423 = _1383 << 4;
        int _1425 = _1423 + 1280;
        uint _1427 = uint(int(uint(_1425) >> uint(2)));
        _26[int(_1427)] = as_type<uint>(_1403);
        int _1429 = _1423 + 1284;
        uint _1431 = uint(int(uint(_1429) >> uint(2)));
        _26[int(_1431)] = as_type<uint>(_1405);
        int _1433 = _1423 + 1288;
        uint _1435 = uint(int(uint(_1433) >> uint(2)));
        _26[int(_1435)] = as_type<uint>(_1407);
        int _1437 = _1423 + 1292;
        uint _1439 = uint(int(uint(_1437) >> uint(2)));
        _26[int(_1439)] = as_type<uint>(_1313);
        int _1441 = _1383 << 4;
        uint _1443 = uint(int(uint(_1441) >> uint(2)));
        _26[int(_1443)] = as_type<uint>(_1373);
        int _1445 = _1441 + 4;
        uint _1447 = uint(int(uint(_1445) >> uint(2)));
        _26[int(_1447)] = as_type<uint>(_1375);
        int _1449 = _1441 + 8;
        uint _1451 = uint(int(uint(_1449) >> uint(2)));
        _26[int(_1451)] = as_type<uint>(_1391);
        int _1453 = _1441 + 12;
        uint _1455 = uint(int(uint(_1453) >> uint(2)));
        _26[int(_1455)] = as_type<uint>(_1409);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1457 = _1421;
        if (!_1193)
        {
            int _1459 = _285 << 4;
            int _1461 = _1459 + 1280;
            uint _1463 = uint(int(uint(_1461) >> uint(2)));
            float _1465 = as_type<float>(_26[int(_1463)]);
            int _1467 = _1459 + 1284;
            uint _1469 = uint(int(uint(_1467) >> uint(2)));
            float _1471 = as_type<float>(_26[int(_1469)]);
            int _1473 = _1459 + 1288;
            uint _1475 = uint(int(uint(_1473) >> uint(2)));
            float _1477 = as_type<float>(_26[int(_1475)]);
            int _1479 = _1459 + 1292;
            uint _1481 = uint(int(uint(_1479) >> uint(2)));
            float _1483 = as_type<float>(_26[int(_1481)]);
            int _1485 = _285 << 4;
            int _1487 = _1485 + 1296;
            uint _1489 = uint(int(uint(_1487) >> uint(2)));
            float _1491 = as_type<float>(_26[int(_1489)]);
            int _1493 = _1485 + 1300;
            uint _1495 = uint(int(uint(_1493) >> uint(2)));
            float _1497 = as_type<float>(_26[int(_1495)]);
            int _1499 = _1485 + 1304;
            uint _1501 = uint(int(uint(_1499) >> uint(2)));
            float _1503 = as_type<float>(_26[int(_1501)]);
            int _1505 = _1485 + 1308;
            uint _1507 = uint(int(uint(_1505) >> uint(2)));
            float _1509 = as_type<float>(_26[int(_1507)]);
            int _1511 = _285 << 4;
            uint _1513 = uint(int(uint(_1511) >> uint(2)));
            float _1515 = as_type<float>(_26[int(_1513)]);
            int _1517 = _1511 + 4;
            uint _1519 = uint(int(uint(_1517) >> uint(2)));
            float _1521 = as_type<float>(_26[int(_1519)]);
            int _1523 = _1511 + 8;
            uint _1525 = uint(int(uint(_1523) >> uint(2)));
            float _1527 = as_type<float>(_26[int(_1525)]);
            int _1529 = _1511 + 12;
            uint _1531 = uint(int(uint(_1529) >> uint(2)));
            float _1533 = as_type<float>(_26[int(_1531)]);
            int _1535 = _285 << 4;
            int _1537 = _1535 + 1312;
            uint _1539 = uint(int(uint(_1537) >> uint(2)));
            float _1541 = as_type<float>(_26[int(_1539)]);
            int _1543 = _1535 + 1316;
            uint _1545 = uint(int(uint(_1543) >> uint(2)));
            float _1547 = as_type<float>(_26[int(_1545)]);
            int _1549 = _1535 + 1320;
            uint _1551 = uint(int(uint(_1549) >> uint(2)));
            float _1553 = as_type<float>(_26[int(_1551)]);
            int _1555 = _1535 + 1324;
            uint _1557 = uint(int(uint(_1555) >> uint(2)));
            float _1559 = as_type<float>(_26[int(_1557)]);
            int _1561 = _285 << 4;
            int _1563 = _1561 + 16;
            uint _1565 = uint(int(uint(_1563) >> uint(2)));
            float _1567 = as_type<float>(_26[int(_1565)]);
            int _1569 = _1561 + 20;
            uint _1571 = uint(int(uint(_1569) >> uint(2)));
            float _1573 = as_type<float>(_26[int(_1571)]);
            int _1575 = _1561 + 24;
            uint _1577 = uint(int(uint(_1575) >> uint(2)));
            float _1579 = as_type<float>(_26[int(_1577)]);
            int _1581 = _1561 + 28;
            uint _1583 = uint(int(uint(_1581) >> uint(2)));
            float _1585 = as_type<float>(_26[int(_1583)]);
            int _1587 = _285 << 4;
            int _1589 = _1587 + 1328;
            uint _1591 = uint(int(uint(_1589) >> uint(2)));
            float _1593 = as_type<float>(_26[int(_1591)]);
            int _1595 = _1587 + 1332;
            uint _1597 = uint(int(uint(_1595) >> uint(2)));
            float _1599 = as_type<float>(_26[int(_1597)]);
            int _1601 = _1587 + 1336;
            uint _1603 = uint(int(uint(_1601) >> uint(2)));
            float _1605 = as_type<float>(_26[int(_1603)]);
            int _1607 = _1587 + 1340;
            uint _1609 = uint(int(uint(_1607) >> uint(2)));
            float _1611 = as_type<float>(_26[int(_1609)]);
            float _1613 = _328 + _1483;
            float _1615 = -_1613;
            float _1617 = exp2(_1615);
            float _1619 = _1613 + _1509;
            float _1621 = -_1465;
            float _1623 = _1621 + _1515;
            float _1625 = -_1471;
            float _1627 = _1625 + _1521;
            float _1629 = -_1477;
            float _1631 = _1629 + _1527;
            float _1633 = -_1619;
            float _1635 = exp2(_1633);
            float _1637 = _1619 + _1559;
            float _1639 = -_1491;
            float _1641 = _1639 + _1567;
            float _1643 = -_1497;
            float _1645 = _1643 + _1573;
            float _1647 = -_1503;
            float _1649 = _1647 + _1579;
            float _1651 = -_1617;
            float _1653 = _1651 + 1.0;
            float _1655 = _1637 + _1611;
            int _1657 = _285 << 4;
            int _1659 = _1657 + 32;
            uint _1661 = uint(int(uint(_1659) >> uint(2)));
            float _1663 = as_type<float>(_26[int(_1661)]);
            int _1665 = _1657 + 36;
            uint _1667 = uint(int(uint(_1665) >> uint(2)));
            float _1669 = as_type<float>(_26[int(_1667)]);
            int _1671 = _1657 + 40;
            uint _1673 = uint(int(uint(_1671) >> uint(2)));
            float _1675 = as_type<float>(_26[int(_1673)]);
            int _1677 = _1657 + 44;
            uint _1679 = uint(int(uint(_1677) >> uint(2)));
            float _1681 = as_type<float>(_26[int(_1679)]);
            float _1683 = precise::min(_1653, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1685 = -_332;
            float _1687 = _1683 + _1685;
            float _1689 = -_1635;
            float _1691 = _1689 + 1.0;
            float _1693 = -_1637;
            float _1695 = exp2(_1693);
            float _1697 = _1687 * _1533;
            float _1699 = precise::min(_1691, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1701 = _1627 * _1697;
            float _1703 = _1631 * _1697;
            float _1705 = _1623 * _1697;
            float _1707 = -_1683;
            float _1709 = _1707 + _1699;
            float _1711 = fma(_1471, _1687, _1701);
            float _1713 = fma(_1477, _1687, _1703);
            float _1715 = fma(_1465, _1687, _1705);
            float _1717 = _1709 * _1585;
            int _1719 = _285 << 4;
            int _1721 = _1719 + 48;
            uint _1723 = uint(int(uint(_1721) >> uint(2)));
            float _1725 = as_type<float>(_26[int(_1723)]);
            int _1727 = _1719 + 52;
            uint _1729 = uint(int(uint(_1727) >> uint(2)));
            float _1731 = as_type<float>(_26[int(_1729)]);
            int _1733 = _1719 + 56;
            uint _1735 = uint(int(uint(_1733) >> uint(2)));
            float _1737 = as_type<float>(_26[int(_1735)]);
            int _1739 = _1719 + 60;
            uint _1741 = uint(int(uint(_1739) >> uint(2)));
            float _1743 = as_type<float>(_26[int(_1741)]);
            float _1745 = _1713 + as_type<float>(_326);
            float _1747 = _1715 + as_type<float>(_330);
            float _1749 = _1641 * _1717;
            float _1751 = -_1695;
            float _1753 = _1751 + 1.0;
            int _1755 = _285 << 2;
            int _1757 = _1755 + 1024;
            uint _1759 = uint(int(uint(_1757) >> uint(2)));
            float _1761 = as_type<float>(_26[int(_1759)]);
            float _1763 = _1645 * _1717;
            float _1765 = _1649 * _1717;
            float _1767 = fma(_1491, _1709, _1749);
            int _1769 = _285 << 2;
            int _1771 = _1769 + 1028;
            uint _1773 = uint(int(uint(_1771) >> uint(2)));
            float _1775 = as_type<float>(_26[int(_1773)]);
            float _1777 = precise::min(_1753, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1779 = -_1655;
            float _1781 = exp2(_1779);
            float _1783 = fma(_1497, _1709, _1763);
            int _1785 = _285 << 2;
            int _1787 = _1785 + 1032;
            uint _1789 = uint(int(uint(_1787) >> uint(2)));
            float _1791 = as_type<float>(_26[int(_1789)]);
            float _1793 = fma(_1503, _1709, _1765);
            float _1795 = -_1699;
            float _1797 = _1795 + _1777;
            float _1799 = -_1541;
            float _1801 = _1799 + _1663;
            float _1803 = -_1547;
            float _1805 = _1803 + _1669;
            int _1807 = _285 << 2;
            int _1809 = _1807 + 1036;
            uint _1811 = uint(int(uint(_1809) >> uint(2)));
            float _1813 = as_type<float>(_26[int(_1811)]);
            float _1815 = _1797 * _1681;
            float _1817 = -_1553;
            float _1819 = _1817 + _1675;
            float _1821 = _1745 + _1793;
            float _1823 = _1711 + as_type<float>(_324);
            float _1825 = _1805 * _1815;
            float _1827 = _1801 * _1815;
            float _1829 = _1819 * _1815;
            float _1831 = -_1781;
            float _1833 = _1831 + 1.0;
            float _1835 = fma(_1541, _1797, _1827);
            float _1837 = fma(_1547, _1797, _1825);
            float _1839 = fma(_1553, _1797, _1829);
            float _1841 = _1747 + _1767;
            float _1843 = precise::min(_1833, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1845 = _1823 + _1783;
            float _1847 = _1821 + _1839;
            float _1849 = _1841 + _1835;
            int _1851 = _285 << 4;
            int _1853 = _1851 + 1280;
            uint _1855 = uint(int(uint(_1853) >> uint(2)));
            _26[int(_1855)] = as_type<uint>(_1747);
            int _1857 = _1851 + 1284;
            uint _1859 = uint(int(uint(_1857) >> uint(2)));
            _26[int(_1859)] = as_type<uint>(_1823);
            int _1861 = _1851 + 1288;
            uint _1863 = uint(int(uint(_1861) >> uint(2)));
            _26[int(_1863)] = as_type<uint>(_1745);
            int _1865 = _1851 + 1292;
            uint _1867 = uint(int(uint(_1865) >> uint(2)));
            _26[int(_1867)] = as_type<uint>(_1613);
            float _1869 = -_1777;
            float _1871 = _1843 + _1869;
            float _1873 = _1845 + _1837;
            float _1875 = -_1593;
            float _1877 = _1875 + _1725;
            float _1879 = _1871 * _1743;
            float _1881 = -_1599;
            float _1883 = _1881 + _1731;
            float _1885 = -_1605;
            float _1887 = _1885 + _1737;
            int _1889 = _285 << 4;
            int _1891 = _1889 + 1296;
            uint _1893 = uint(int(uint(_1891) >> uint(2)));
            _26[int(_1893)] = as_type<uint>(_1841);
            int _1895 = _1889 + 1300;
            uint _1897 = uint(int(uint(_1895) >> uint(2)));
            _26[int(_1897)] = as_type<uint>(_1845);
            int _1899 = _1889 + 1304;
            uint _1901 = uint(int(uint(_1899) >> uint(2)));
            _26[int(_1901)] = as_type<uint>(_1821);
            int _1903 = _1889 + 1308;
            uint _1905 = uint(int(uint(_1903) >> uint(2)));
            _26[int(_1905)] = as_type<uint>(_1619);
            float _1907 = _1761 + _334;
            float _1909 = _1877 * _1879;
            float _1911 = _1883 * _1879;
            float _1913 = _1887 * _1879;
            float _1915 = _1907 + _1775;
            float _1917 = fma(_1593, _1871, _1909);
            float _1919 = fma(_1599, _1871, _1911);
            float _1921 = fma(_1605, _1871, _1913);
            float _1923 = _1915 + _1791;
            float _1925 = _1917 + _1849;
            float _1927 = _1919 + _1873;
            float _1929 = _1921 + _1847;
            int _1931 = _285 << 4;
            int _1933 = _1931 + 1312;
            uint _1935 = uint(int(uint(_1933) >> uint(2)));
            _26[int(_1935)] = as_type<uint>(_1849);
            int _1937 = _1931 + 1316;
            uint _1939 = uint(int(uint(_1937) >> uint(2)));
            _26[int(_1939)] = as_type<uint>(_1873);
            int _1941 = _1931 + 1320;
            uint _1943 = uint(int(uint(_1941) >> uint(2)));
            _26[int(_1943)] = as_type<uint>(_1847);
            int _1945 = _1931 + 1324;
            uint _1947 = uint(int(uint(_1945) >> uint(2)));
            _26[int(_1947)] = as_type<uint>(_1637);
            float _1949 = _1923 + _1813;
            int _1951 = _285 << 2;
            int _1953 = _1951 + 1024;
            uint _1955 = uint(int(uint(_1953) >> uint(2)));
            _26[int(_1955)] = as_type<uint>(_1907);
            int _1957 = _285 << 2;
            int _1959 = _1957 + 1028;
            uint _1961 = uint(int(uint(_1959) >> uint(2)));
            _26[int(_1961)] = as_type<uint>(_1915);
            int _1963 = _285 << 2;
            int _1965 = _1963 + 1032;
            uint _1967 = uint(int(uint(_1965) >> uint(2)));
            _26[int(_1967)] = as_type<uint>(_1923);
            int _1969 = _285 << 2;
            int _1971 = _1969 + 1036;
            uint _1973 = uint(int(uint(_1971) >> uint(2)));
            _26[int(_1973)] = as_type<uint>(_1949);
            int _1975 = _285 << 4;
            int _1977 = _1975 + 1328;
            uint _1979 = uint(int(uint(_1977) >> uint(2)));
            _26[int(_1979)] = as_type<uint>(_1925);
            int _1981 = _1975 + 1332;
            uint _1983 = uint(int(uint(_1981) >> uint(2)));
            _26[int(_1983)] = as_type<uint>(_1927);
            int _1985 = _1975 + 1336;
            uint _1987 = uint(int(uint(_1985) >> uint(2)));
            _26[int(_1987)] = as_type<uint>(_1929);
            int _1989 = _1975 + 1340;
            uint _1991 = uint(int(uint(_1989) >> uint(2)));
            _26[int(_1991)] = as_type<uint>(_1655);
            _1303 = _1883;
            _1305 = _1887;
            _1307 = _1907;
            _945 = _1767;
            _1309 = _1821;
            _448 = _1843;
            _450 = _1949;
            _1457 = as_type<int>(_1925);
            _1319 = as_type<int>(_1927);
            _1361 = as_type<int>(_1929);
            _1419 = _1655;
        }
        float _1993 = _1303;
        float _1995 = _1305;
        float _1997 = _1307;
        float _1999 = _945;
        float _2001 = _1309;
        float _2003 = _448;
        float _2005 = _450;
        int _2007 = _1457;
        int _2009 = _1319;
        int _2011 = _1361;
        float _2013 = _1419;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _2015 = _1383 << 4;
        int _2017 = _2015 + 1280;
        uint _2019 = uint(int(uint(_2017) >> uint(2)));
        float _2021 = as_type<float>(_26[int(_2019)]);
        int _2023 = _2015 + 1284;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        float _2027 = as_type<float>(_26[int(_2025)]);
        int _2029 = _2015 + 1288;
        uint _2031 = uint(int(uint(_2029) >> uint(2)));
        float _2033 = as_type<float>(_26[int(_2031)]);
        int _2035 = _2015 + 1292;
        uint _2037 = uint(int(uint(_2035) >> uint(2)));
        float _2039 = as_type<float>(_26[int(_2037)]);
        float _2041 = 1.0 / _378;
        int _2043 = _1383 << 2;
        int _2045 = _2043 + 1024;
        uint _2047 = uint(int(uint(_2045) >> uint(2)));
        float _2049 = as_type<float>(_26[int(_2047)]);
        float _2051 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
        float _2053 = _2051 + 1.0;
        float _2055 = -_2039;
        float _2057 = exp2(_2055);
        float _2059 = _2049 * _2041;
        float _2061 = precise::max(_2057, _2053);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_2021, _2027, _2033, _2061), uint3(int3(_83, _79, int(_312))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_2059, _2059, _2059, _2059), uint3(int3(_83, _79, int(_312))));
        int _2063 = int(_312) + 4;
        bool _2065 = uint(_2063) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _288 = uint(_2063);
        _290 = _1993;
        _292 = _1995;
        _294 = _1997;
        _296 = _1999;
        _298 = _2001;
        _300 = _2009;
        _302 = _2011;
        _304 = _2013;
        _306 = _2007;
        _308 = _2003;
        _310 = _2005;
        if (_2065)
        {
            _2067 = true;
            if (_2067)
            {
                break;
            }
        }
    } while (true);
    _2067 = false;
}

