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
    texture2d<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_12 [[id(8)]];
    sampler cp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> cp_t_tcb_C [[id(10)]];
    sampler cp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> cp_t_tcb_14 [[id(12)]];
    sampler cp_t_tcb_14Smplr [[id(13)]];
    texture3d<float, access::write> cp_i_tcb_48_ [[id(14)]];
    texture3d<float, access::write> cp_i_tcb_4A_ [[id(15)]];
    sampler cp_t_tcb_8Smplr_w [[id(16)]];
    sampler cp_t_tcb_12Smplr_w [[id(17)]];
    sampler cp_t_tcb_CSmplr_w [[id(18)]];
    sampler cp_t_tcb_14Smplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    threadgroup spvUnsafeArray<uint, 576> _26;
    bool _2089 = false;
    float _66 = as_type<float>(gl_WorkGroupID.y);
    float _68 = as_type<float>(gl_LocalInvocationID.y);
    float _70 = as_type<float>(gl_WorkGroupID.x);
    float _72 = as_type<float>(gl_LocalInvocationID.x);
    int _75 = as_type<int>(_66) << 2;
    int _77 = _75 + as_type<int>(_68);
    int _79 = as_type<int>(_70) << 2;
    int _81 = _79 + as_type<int>(_72);
    float _83 = float(uint(_77));
    float _85 = float(uint(_81));
    float _87 = _83 + 0.5;
    float _89 = _85 + 0.5;
    float _91 = -_87;
    float _93 = fma(_91, (*spvDescriptorSet0.cp_c4)._m0[0].y, 0.5);
    float _95 = fma(_89, (*spvDescriptorSet0.cp_c4)._m0[0].x, -0.5);
    float _97 = fma(_93, (*spvDescriptorSet0.cp_c3)._m0[4].y, (*spvDescriptorSet0.cp_c3)._m0[4].w);
    float _99 = as_type<float>(gl_LocalInvocationID.z);
    float _101 = fma(_95, (*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _103 = _97 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _105 = _97 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _107 = _97 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _109 = fma(_101, (*spvDescriptorSet0.cp_c3)._m0[1].x, _103);
    float _111 = fma(_101, (*spvDescriptorSet0.cp_c3)._m0[0].x, _105);
    float _113 = fma(_101, (*spvDescriptorSet0.cp_c3)._m0[2].x, _107);
    float _115 = -(*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _117 = _109 + _115;
    float _119 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _121 = _111 + _119;
    float _123 = -(*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _125 = _113 + _123;
    float _127 = _117 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _129 = _121 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _131 = _125 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _133 = -(*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _135 = _127 + _133;
    float _137 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _139 = _129 + _137;
    float _141 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _143 = _131 + _141;
    float _145 = _135 * _135;
    float _147 = fma(_139, _139, _145);
    float _149 = fma(_143, _143, _147);
    float _151 = rsqrt(_149);
    float _153 = _139 * _151;
    float _155 = _143 * _151;
    float _157 = _135 * _151;
    float _159 = _153 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _161 = _155 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _163 = (*spvDescriptorSet0.cp_c3)._m0[3].y + (-220.0);
    float _165 = _159 * _159;
    float _167 = _161 * _161;
    float _169 = precise::max(0.0, _163);
    float _171 = _165 + _167;
    float _173 = sqrt(_171);
    float _175 = -_157;
    float _177 = -_169;
    float _179 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[8].w, _177);
    bool _183 = _173 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _185 = _151;
    float _187 = _179;
    float _189 = _167;
    if (!_183)
    {
        _185 = _165;
    }
    float _191 = _185;
    bool _193 = !_183;
    float _195 = _191;
    if (!_193)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _199 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _201 = _173 + _199;
        float _203 = _179 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _205 = rsqrt(_171);
        float _207 = _201 * _197;
        float _209 = _207 * 0.15915493667125701904296875;
        float _211 = _209 * 6.283185482025146484375;
        float _213 = sin(_211);
        float _215 = _209 * 6.283185482025146484375;
        float _217 = cos(_215);
        float _219 = fma(_213, _203, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _221 = _205 * _219;
        float _223 = _217 + (-1.0);
        float _225 = _159 * _221;
        float _227 = _223 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _229 = _161 * _221;
        float _231 = fma(_179, _217, _227);
        float _233 = _225 * _225;
        float _235 = _229 * _229;
        _187 = _231;
        _195 = _233;
        _189 = _235;
    }
    float _237 = _187;
    float _239 = _195;
    float _241 = _189;
    float _243 = _97 * _97;
    float _245 = fma(_237, _237, _239);
    bool _247 = as_type<uint>(_99) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _249 = fma(_101, _101, _243);
    float _251 = _245 + _241;
    float _253 = _153 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _255 = _249 + 1.0;
    float _257 = rsqrt(_251);
    float _259 = -_157;
    float _261 = -_253;
    float _263 = fma(_259, (*spvDescriptorSet0.cp_c3)._m0[6].y, _261);
    float _265 = -_155;
    float _267 = fma(_265, (*spvDescriptorSet0.cp_c3)._m0[6].z, _263);
    float _269 = sqrt(_255);
    if (_247)
    {
        return;
    }
    int _271 = as_type<int>(_68) << 2;
    int _273 = _271 + as_type<int>(_72);
    float _275 = -_267;
    float _277 = fma(_275, (*spvDescriptorSet0.cp_c3)._m0[15].x, _267);
    float _279 = rsqrt(_255);
    float _281 = _257 * _237;
    float _283 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _285 = _283 + 1.0;
    int _287 = _273 << 2;
    uint _290 = as_type<uint>(_99);
    float _292 = 0.0;
    float _294 = 0.0;
    float _296 = 0.0;
    int _298 = 0;
    int _300 = 0;
    int _302 = 0;
    int _304 = 0;
    float _306 = 0.0;
    float _308 = 0.0;
    do
    {
        uint _310 = _290;
        float _312 = _292;
        float _314 = _294;
        float _316 = _296;
        int _318 = _298;
        int _320 = _300;
        int _322 = _302;
        int _324 = _304;
        float _326 = _306;
        float _328 = _308;
        float _330 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _332 = log2(_330);
        float _334 = float(_310);
        float _336 = _269 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _338 = int(_310) + 1;
        float _340 = _155 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _342 = float(uint(_338));
        float _344 = _332 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _346 = _334 * _344;
        float _348 = _342 * _344;
        float _350 = exp2(_346);
        float _352 = exp2(_348);
        float _354 = _350 + (-1.0);
        float _356 = _354 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _358 = _153 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _360 = _352 + (-1.0);
        float _362 = _157 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _364 = -_356;
        float _366 = fma(_360, (*spvDescriptorSet0.cp_c3)._m0[8].z, _364);
        float _368 = _356 + _366;
        float _370 = _269 * _356;
        float _372 = _366 * _336;
        float _374 = _368 * _336;
        float _376 = fma(_370, _358, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _378 = fma(_370, _362, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _380 = fma(_370, _340, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _382 = -_279;
        float _384 = _374 * _382;
        float _386 = _157 * _372;
        float _388 = fma(_153, _372, _376);
        float _390 = fma(_155, _372, _380);
        float _392 = -_384;
        float _394 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _396 = _392 + _394;
        float _398 = -_384;
        float _400 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _402 = _398 + _400;
        float _404 = _378 + _386;
        float _406 = _396 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _408 = precise::clamp(_406, 0.0, 1.0);
        float _410 = _402 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _412 = precise::clamp(_410, 0.0, 1.0);
        bool _414 = _408 != 1.0;
        bool _416 = isnan(_408);
        bool _418 = _414 || _416;
        bool _420 = isnan(1.0);
        bool _422 = _418 || _420;
        bool _424 = _412 != 1.0;
        bool _426 = isnan(_412);
        bool _428 = _424 || _426;
        bool _430 = isnan(1.0);
        bool _432 = _428 || _430;
        float _434 = _316;
        float _436 = _362;
        float _438 = _312;
        float _440 = _314;
        float _442 = _326;
        float _444 = _328;
        if (!_422)
        {
            _434 = 1.0;
        }
        float _446 = _434;
        bool _448 = !_422;
        float _450 = _446;
        if (!_448)
        {
            float _452 = -_384;
            bool _454 = _452 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _456 = -_384;
            bool _458 = _456 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _460 = !_454;
            int _462 = _460 ? 0 : 1;
            int _464 = 2;
            if (!_454)
            {
                _464 = 1;
            }
            int _466 = _464;
            int _468 = _466;
            if (!_458)
            {
                _468 = _462;
            }
            int _470 = _468;
            int _472 = _470 << 6;
            float _474 = float(_470);
            int _476 = _472 + 304;
            uint _478 = uint(int(uint(_476) >> uint(2)));
            uint _480 = uint(int(uint(int(_478)) >> uint(2)));
            int _482 = int(_478) & 3;
            float _484 = (*spvDescriptorSet0.cp_c3)._m0[int(_480)][_482];
            int _486 = int(_478) + 1;
            uint _488 = uint(int(uint(_486) >> uint(2)));
            int _490 = _486 & 3;
            float _492 = (*spvDescriptorSet0.cp_c3)._m0[int(_488)][_490];
            int _494 = _472 + 312;
            uint _496 = uint(int(uint(_494) >> uint(2)));
            uint _498 = uint(int(uint(int(_496)) >> uint(2)));
            int _500 = int(_496) & 3;
            float _502 = (*spvDescriptorSet0.cp_c3)._m0[int(_498)][_500];
            int _504 = int(_496) + 1;
            uint _506 = uint(int(uint(_504) >> uint(2)));
            int _508 = _504 & 3;
            float _510 = (*spvDescriptorSet0.cp_c3)._m0[int(_506)][_508];
            int _512 = _472 + 256;
            uint _514 = uint(int(uint(_512) >> uint(2)));
            uint _516 = uint(int(uint(int(_514)) >> uint(2)));
            int _518 = int(_514) & 3;
            float _520 = (*spvDescriptorSet0.cp_c3)._m0[int(_516)][_518];
            int _522 = int(_514) + 1;
            uint _524 = uint(int(uint(_522) >> uint(2)));
            int _526 = _522 & 3;
            float _528 = (*spvDescriptorSet0.cp_c3)._m0[int(_524)][_526];
            int _530 = _472 + 272;
            uint _532 = uint(int(uint(_530) >> uint(2)));
            uint _534 = uint(int(uint(int(_532)) >> uint(2)));
            int _536 = int(_532) & 3;
            float _538 = (*spvDescriptorSet0.cp_c3)._m0[int(_534)][_536];
            int _540 = int(_532) + 1;
            uint _542 = uint(int(uint(_540) >> uint(2)));
            int _544 = _540 & 3;
            float _546 = (*spvDescriptorSet0.cp_c3)._m0[int(_542)][_544];
            int _548 = _472 + 288;
            uint _550 = uint(int(uint(_548) >> uint(2)));
            uint _552 = uint(int(uint(int(_550)) >> uint(2)));
            int _554 = int(_550) & 3;
            float _556 = (*spvDescriptorSet0.cp_c3)._m0[int(_552)][_554];
            int _558 = int(_550) + 1;
            uint _560 = uint(int(uint(_558) >> uint(2)));
            int _562 = _558 & 3;
            float _564 = (*spvDescriptorSet0.cp_c3)._m0[int(_560)][_562];
            int _566 = _472 + 264;
            uint _568 = uint(int(uint(_566) >> uint(2)));
            uint _570 = uint(int(uint(int(_568)) >> uint(2)));
            int _572 = int(_568) & 3;
            float _574 = (*spvDescriptorSet0.cp_c3)._m0[int(_570)][_572];
            int _576 = int(_568) + 1;
            uint _578 = uint(int(uint(_576) >> uint(2)));
            int _580 = _576 & 3;
            float _582 = (*spvDescriptorSet0.cp_c3)._m0[int(_578)][_580];
            int _584 = _472 + 280;
            uint _586 = uint(int(uint(_584) >> uint(2)));
            uint _588 = uint(int(uint(int(_586)) >> uint(2)));
            int _590 = int(_586) & 3;
            float _592 = (*spvDescriptorSet0.cp_c3)._m0[int(_588)][_590];
            int _594 = int(_586) + 1;
            uint _596 = uint(int(uint(_594) >> uint(2)));
            int _598 = _594 & 3;
            float _600 = (*spvDescriptorSet0.cp_c3)._m0[int(_596)][_598];
            float _602 = _404 * _492;
            float _604 = fma(_388, _484, _602);
            int _606 = _472 + 296;
            uint _608 = uint(int(uint(_606) >> uint(2)));
            uint _610 = uint(int(uint(int(_608)) >> uint(2)));
            int _612 = int(_608) & 3;
            float _614 = (*spvDescriptorSet0.cp_c3)._m0[int(_610)][_612];
            int _616 = int(_608) + 1;
            uint _618 = uint(int(uint(_616) >> uint(2)));
            int _620 = _616 & 3;
            float _622 = (*spvDescriptorSet0.cp_c3)._m0[int(_618)][_620];
            float _624 = fma(_390, _502, _604);
            float _626 = _624 + _510;
            float _628 = _404 * _528;
            float _630 = 1.0 / _626;
            float _632 = fma(_388, _520, _628);
            float _634 = _404 * _546;
            float _636 = rint(_474);
            float _638 = precise::max(_636, 0.0);
            uint _640 = uint(_638);
            uint _642 = clamp(_640, 0u, 65535u);
            float _644 = fma(_388, _538, _634);
            float _646 = _404 * _564;
            float _648 = fma(_388, _556, _646);
            float _650 = fma(_390, _574, _632);
            float _652 = _650 + _582;
            float _654 = fma(_390, _592, _644);
            float _656 = _652 * _630;
            float _658 = _654 + _600;
            float _660 = fma(_390, _614, _648);
            float _662 = _658 * _630;
            float _664 = _660 + _622;
            float _666 = _664 * _630;
            float _668 = precise::clamp(_666, 0.0, 1.0);
            float3 _3014 = float3(_656, _662, float(int(_642)));
            float3 _3018 = select(_3014, float3(0.0), isnan(_3014));
            float _670 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _3018.xy, uint(rint(_3018.z)), _668, level(0.0));
            float _672 = -_670;
            float _674 = _672 + 1.0;
            float _676 = fma(_408, _674, _670);
            _436 = _630;
            _450 = _676;
            _438 = _582;
            _440 = _622;
        }
        float _678 = _436;
        float _680 = _450;
        float _682 = _438;
        float _684 = _440;
        float _686 = _682;
        float _688 = _678;
        if (!_432)
        {
            _686 = 1.0;
        }
        float _690 = _686;
        bool _692 = !_432;
        float _694 = _690;
        if (!_692)
        {
            float _696 = _404 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _698 = _404 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _700 = fma(_388, (*spvDescriptorSet0.cp_c3)._m0[130].x, _696);
            float _702 = fma(_388, (*spvDescriptorSet0.cp_c3)._m0[131].x, _698);
            float _704 = fma(_390, (*spvDescriptorSet0.cp_c3)._m0[130].z, _700);
            float _706 = fma(_390, (*spvDescriptorSet0.cp_c3)._m0[131].z, _702);
            float _708 = _704 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _710 = _706 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _712 = trunc(_708);
            int _714 = int(_712);
            float _716 = trunc(_710);
            int _718 = int(_716);
            int _720 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _722 = _714 + _720;
            int _724 = _722 + 1;
            bool _726 = _724 >= 0;
            int _728 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _730 = _718 + _728;
            int _732 = _730 + 1;
            bool _734 = _724 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _736 = !_726;
            bool _738 = _734 || _736;
            bool _740 = _732 < 0;
            bool _742 = _740 || _738;
            bool _744 = _732 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _746 = _744 || _742;
            if (_746)
            {
                _688 = 1.0;
            }
            float _748 = _688;
            float _750 = _748;
            if (!_746)
            {
                int _752 = _732 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _754 = _752 + _724;
                float _756 = floor(_708);
                int _758 = _754 << 2;
                uint _760 = uint(int(uint(_754) >> uint(2)));
                int _762 = 12 & _758;
                float _764 = floor(_710);
                int _766 = _754 << 4;
                int _768 = _766 + 2112;
                int _770 = int(_760) << 4;
                int _772 = _770 + _762;
                uint _774 = uint(int(uint(_768) >> uint(2)));
                uint _776 = uint(int(uint(int(_774)) >> uint(2)));
                int _778 = int(_774) & 3;
                float _780 = (*spvDescriptorSet0.cp_c3)._m0[int(_776)][_778];
                int _782 = int(_774) + 1;
                uint _784 = uint(int(uint(_782) >> uint(2)));
                int _786 = _782 & 3;
                float _788 = (*spvDescriptorSet0.cp_c3)._m0[int(_784)][_786];
                float _790 = -_756;
                float _792 = _708 + _790;
                int _794 = _772 + 464;
                uint _796 = uint(int(uint(_794) >> uint(2)));
                uint _798 = uint(int(uint(int(_796)) >> uint(2)));
                int _800 = int(_796) & 3;
                float _802 = (*spvDescriptorSet0.cp_c3)._m0[int(_798)][_800];
                int _804 = _768 + 8;
                uint _806 = uint(int(uint(_804) >> uint(2)));
                uint _808 = uint(int(uint(int(_806)) >> uint(2)));
                int _810 = int(_806) & 3;
                float _812 = (*spvDescriptorSet0.cp_c3)._m0[int(_808)][_810];
                int _814 = int(_806) + 1;
                uint _816 = uint(int(uint(_814) >> uint(2)));
                int _818 = _814 & 3;
                float _820 = (*spvDescriptorSet0.cp_c3)._m0[int(_816)][_818];
                float _822 = _404 * _788;
                float _824 = fma(_388, _780, _822);
                float _826 = rint(_802);
                float _828 = precise::max(_826, 0.0);
                uint _830 = uint(_828);
                uint _832 = clamp(_830, 0u, 65535u);
                float _834 = fma(_390, _812, _824);
                float _836 = -_764;
                float _838 = _710 + _836;
                float _840 = _834 + _820;
                float _842 = precise::clamp(_840, 0.0, 1.0);
                float3 _3295 = float3(_792, _838, float(int(_832)));
                float3 _3297 = select(_3295, float3(0.0), isnan(_3295));
                float _844 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _3297.xy, uint(rint(_3297.z)), _842, level(0.0));
                _750 = _844;
            }
            float _846 = _750;
            float _848 = -_846;
            float _850 = _848 + 1.0;
            float _852 = fma(_412, _850, _846);
            _694 = _852;
        }
        float _854 = _694;
        float _856 = fma(_388, 6.2500002968590706586837768554688e-05, 0.5);
        float _858 = fma(_390, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _3323 = float2(_856, _858);
        float _860 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3323, float2(0.0), isnan(_3323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3323, float2(0.0), isnan(_3323)), level(0.0)).x;
        float3 _3334 = float3(_856, _858, float(0));
        float3 _3336 = select(_3334, float3(0.0), isnan(_3334));
        float4 _863 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3336.xy, uint(rint(_3336.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3336.xy, uint(rint(_3336.z)), level(0.0)).xyzw;
        float _865 = _863.x;
        float _867 = _863.y;
        float _869 = _863.z;
        float _871 = _863.w;
        float3 _3351 = float3(_856, _858, float(1));
        float3 _3353 = select(_3351, float3(0.0), isnan(_3351));
        float4 _873 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3353.xy, uint(rint(_3353.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3353.xy, uint(rint(_3353.z)), level(0.0)).xyzw;
        float _875 = _873.x;
        float _877 = _873.y;
        float _879 = _873.z;
        float _881 = _873.w;
        float _883 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _885 = _390 + _883;
        float _887 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _889 = _388 + _887;
        float _891 = _157 * 1.02332699298858642578125;
        float _893 = _885 * _885;
        float _895 = precise::min(_680, _854);
        float _897 = _155 * 1.02332699298858642578125;
        float _899 = fma(_889, _889, _893);
        float _901 = sqrt(_899);
        float _903 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _905 = _903 * 100.0;
        float _907 = 1.0 / _903;
        bool _909 = _901 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _911 = exp2(_905);
        float _913 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _915 = _901 + _913;
        float _917 = _684;
        float _919 = 512.0;
        float _921 = _915;
        float _923 = _901;
        if (_909)
        {
            float _925 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _917 = _925;
        }
        float _927 = _917;
        float _929 = fma(_911, 512.0, -512.0);
        float _931 = _903 * 5115.0;
        if (!_909)
        {
            _919 = _404;
        }
        float _933 = _919;
        float _935 = 1.0 / _929;
        float _937 = _927;
        float _939 = _933;
        if (_909)
        {
            float _941 = _915 * _927;
            _921 = _941;
        }
        float _943 = _921;
        float _945 = fma(_277, -0.5, 0.5);
        if (_909)
        {
            float _947 = _943 * 0.15915493667125701904296875;
            _937 = _947;
        }
        float _949 = _937;
        float _951 = sqrt(_945);
        float _953 = _931 * _935;
        float _955 = fma(_374, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _957 = precise::clamp(_955, 0.0, 1.0);
        float _959 = -_957;
        float _961 = _959 + 1.0;
        float _963 = _949;
        float _965 = _957;
        if (_909)
        {
            float _967 = _949 * 6.283185482025146484375;
            float _969 = cos(_967);
            _963 = _969;
        }
        float _971 = _963;
        float _973 = abs(_961);
        float _975 = log2(_973);
        float _977 = _951 * 0.636619746685028076171875;
        if (_909)
        {
            float _979 = _971 + (-1.0);
            _965 = _979;
        }
        float _981 = _965;
        float _983 = log2(_953);
        if (_909)
        {
            float _985 = _981 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _923 = _985;
        }
        float _987 = _923;
        if (_909)
        {
            float _989 = fma(_404, _971, _987);
            _939 = _989;
        }
        float _991 = _939;
        float _993 = abs(_386);
        bool _995 = _993 > 0.00999999977648258209228515625;
        float _997 = -_991;
        float _999 = fma(_404, 2.0, _997);
        float _1001 = _995 ? _386 : 0.00999999977648258209228515625;
        float _1003 = fma(_983, _907, 100.0);
        float _1005 = _903 * _1001;
        float _1007 = precise::max(_1005, -127.0);
        float _1009 = _281 + 1.0;
        float _1011 = 1.0 / _1007;
        float _1013 = fma(_860, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _1015 = _975 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _1017 = _871 * _891;
        float _1019 = _1013 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _1021 = exp2(_1015);
        float _1023 = fma(_865, 0.88622701168060302734375, _1017);
        float _1025 = -_1019;
        float _1027 = _999 + _1025;
        float _1029 = precise::max(0.0, _1027);
        float _1031 = -_1007;
        float _1033 = exp2(_1031);
        float _1035 = -_1003;
        float _1037 = _1035 + _1029;
        float _1039 = -_281;
        float _1041 = fma(_1021, _1009, _1039);
        float _1043 = _903 * _1037;
        float _1045 = fma(_277, 0.5, 0.5);
        float _1047 = fma(_1041, 0.5, 0.5);
        float _1049 = fma(_1045, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _1051 = -_1043;
        float _1053 = exp2(_1051);
        float _1055 = fma(_1045, _1049, -0.212114393711090087890625);
        float _1057 = fma(_1045, _1055, 1.570728778839111328125);
        float _1059 = -_1033;
        float _1061 = _1059 + 1.0;
        float _1063 = -_1057;
        float _1065 = fma(_977, _1063, 1.0);
        float3 _3631 = float3(_856, _858, float(2));
        float3 _3633 = select(_3631, float3(0.0), isnan(_3631));
        float4 _1067 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3633.xy, uint(rint(_3633.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3633.xy, uint(rint(_3633.z)), level(0.0)).xyzw;
        float _1069 = _1067.x;
        float _1071 = _1067.y;
        float _1073 = _1067.z;
        float _1075 = _1067.w;
        float3 _3648 = float3(_856, _858, float(3));
        float3 _3650 = select(_3648, float3(0.0), isnan(_3648));
        float4 _1077 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3650.xy, uint(rint(_3650.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3650.xy, uint(rint(_3650.z)), level(0.0)).xyzw;
        float _1079 = _1077.x;
        float _1081 = _1077.y;
        float _1083 = _1077.z;
        float _1085 = _1077.w;
        float3 _3665 = float3(_856, _858, float(4));
        float3 _3667 = select(_3665, float3(0.0), isnan(_3665));
        float4 _1087 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3667.xy, uint(rint(_3667.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3667.xy, uint(rint(_3667.z)), level(0.0)).xyzw;
        float _1089 = _1087.x;
        float _1091 = _1087.y;
        float _1093 = _1087.z;
        float _1095 = _1087.w;
        float2 _3681 = float2(_856, _858);
        float _1097 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_3681, float2(0.0), isnan(_3681)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_3681, float2(0.0), isnan(_3681)), level(0.0)).z;
        float3 _3690 = float3(_856, _858, float(6));
        float3 _3692 = select(_3690, float3(0.0), isnan(_3690));
        float4 _1099 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3692.xy, uint(rint(_3692.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3692.xy, uint(rint(_3692.z)), level(0.0)).xyzw;
        float _1101 = _1099.x;
        float _1103 = _1099.y;
        float _1105 = _1099.z;
        float _1107 = _1099.w;
        float _1109 = _877 * _891;
        float _1111 = fma(_879, _897, _1023);
        float _1113 = _875 * _891;
        float _1115 = fma(_869, 0.88622701168060302734375, _1109);
        float _1117 = _1053 * _1061;
        float _1119 = fma(_867, 0.88622701168060302734375, _1113);
        float3 _3727 = float3(_856, _858, float(7));
        float3 _3729 = select(_3727, float3(0.0), isnan(_3727));
        float4 _1121 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3729.xy, uint(rint(_3729.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3729.xy, uint(rint(_3729.z)), level(0.0)).xyzw;
        float _1123 = _1121.x;
        float _1125 = _1121.y;
        float _1127 = _1121.z;
        float _1129 = _1121.w;
        float _1131 = _1117 * _1011;
        float3 _3748 = float3(_856, _858, float(5));
        float3 _3750 = select(_3748, float3(0.0), isnan(_3748));
        float4 _1133 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3750.xy, uint(rint(_3750.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3750.xy, uint(rint(_3750.z)), level(0.0)).xyzw;
        float _1135 = _1133.x;
        float _1137 = _1133.y;
        float _1139 = _1133.z;
        float _1141 = _1133.w;
        float2 _3764 = float2(_1065, _1047);
        float3 _1145 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_3764, float2(0.0), isnan(_3764)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_3764, float2(0.0), isnan(_3764)), level(0.0)).xyz;
        float _1147 = _1145.x;
        float _1149 = _1145.y;
        float _1151 = _1145.z;
        float _1153 = fma(_881, _897, _1119);
        float _1155 = _153 * 1.02332699298858642578125;
        float _1157 = _975 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _1159 = precise::min(_895, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        bool _1161 = as_type<int>(_99) != 0;
        float _1163 = exp2(_1157);
        float _1165 = fma(_1071, _1155, _1111);
        float _1167 = fma(_1073, _1155, _1153);
        float _1169 = _1085 * _891;
        float _1171 = fma(_1069, _897, _1115);
        float _1173 = precise::max(0.0, _1165);
        float _1175 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _1177 = fma(_1079, 0.88622701168060302734375, _1169);
        float _1179 = precise::max(0.0, _1167);
        float _1181 = fma(_1075, _1155, _1171);
        float _1183 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _1185 = _1173 * _1175;
        float _1187 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _1189 = _1089 * _891;
        float _1191 = _1179 * _1183;
        float _1193 = fma(_1081, 0.88622701168060302734375, _1189);
        float _1195 = precise::max(0.0, _1181);
        float _1197 = _1091 * _891;
        float _1199 = fma(_1093, _897, _1177);
        float _1201 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _1203 = _1097 * 2.0;
        float _1205 = _1195 * _1187;
        float _1207 = fma(_1097, _1097, 1.0);
        float _1209 = fma(_1083, 0.88622701168060302734375, _1197);
        float _1211 = _1103 * _891;
        float _1213 = log2(_1201);
        float _1215 = -_1203;
        float _1217 = fma(_277, _1215, _1207);
        float _1219 = -_1203;
        float _1221 = _1207 + _1219;
        float _1223 = fma(_1101, 0.88622701168060302734375, _1211);
        float _1225 = _1125 * _891;
        float _1227 = fma(_1095, _897, _1193);
        float _1229 = fma(_1137, _1155, _1199);
        float _1231 = fma(_1105, _897, _1223);
        float _1233 = abs(_1217);
        float _1235 = log2(_1233);
        float _1237 = fma(_1123, 0.88622701168060302734375, _1225);
        float _1239 = fma(_1135, _897, _1209);
        float _1241 = fma(_1107, _1155, _1231);
        float _1243 = fma(_1139, _1155, _1227);
        float _1245 = fma(_1127, _897, _1237);
        float _1247 = fma(_1141, _1155, _1239);
        float _1249 = _1241 * 0.31830990314483642578125;
        float _1251 = precise::clamp(_1249, 0.0, 1.0);
        float _1253 = abs(_1221);
        float _1255 = log2(_1253);
        float _1257 = _1213 * (-0.0199999995529651641845703125);
        float _1259 = fma(_1129, _1155, _1245);
        float _1261 = precise::max(0.0, _1229);
        float _1263 = -_1097;
        float _1265 = fma(_1263, _1097, 1.0);
        float _1267 = _372 * _1257;
        float _1269 = precise::min(_1251, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1271 = _1259 * 0.31830990314483642578125;
        float _1273 = precise::clamp(_1271, 0.0, 1.0);
        float _1275 = 1.0 / _372;
        float _1277 = _1131 * _1267;
        float _1279 = _1235 * 1.5;
        float _1281 = _1269 * 0.88622701168060302734375;
        float _1283 = precise::max(0.0, _1243);
        float _1285 = _1273 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _1287 = precise::clamp(_1285, 0.0, 1.0);
        float _1289 = precise::max(0.0, _1247);
        float _1291 = fma(_1281, (*spvDescriptorSet0.cp_c3)._m0[9].x, _1185);
        float _1293 = _1255 * 1.5;
        float _1295 = exp2(_1279);
        float _1297 = fma(_1281, (*spvDescriptorSet0.cp_c3)._m0[9].y, _1191);
        float _1299 = fma(_1281, (*spvDescriptorSet0.cp_c3)._m0[9].z, _1205);
        float _1301 = fma(_1261, _1287, _1291);
        float _1303 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _1305 = _374 + _1303;
        float _1307 = fma(_1283, _1287, _1297);
        float _1309 = fma(_1289, _1287, _1299);
        float _1311 = _1159 * _1149;
        float _1313 = exp2(_1293);
        float _1315 = _1305 * _1275;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        float _1319 = -_1163;
        float _1321 = _1319 + 1.0;
        float _1323 = _372 * _1159;
        float _1325 = _1159 * _1147;
        float _1327 = _1277 * _1317;
        float _1329 = _1159 * _1151;
        int _1331 = _287 + as_type<int>(_99);
        float _1333 = _1295 * 12.56637096405029296875;
        float _1335 = _1321 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        _296 = _1159;
        float _1337 = _1287;
        if (_1161)
        {
            _1337 = as_type<float>(_318);
        }
        int _1339 = as_type<int>(_1337);
        int _1341 = _1331 << 2;
        int _1343 = _1341 + 1024;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        _26[int(_1345)] = as_type<uint>(_1323);
        float _1347 = 1.0 / _1333;
        float _1349 = _1313 * 12.56637096405029296875;
        int _1351 = _1331 << 4;
        uint _1353 = uint(int(uint(_1351) >> uint(2)));
        _26[int(_1353)] = as_type<uint>(_1325);
        int _1355 = _1351 + 4;
        uint _1357 = uint(int(uint(_1355) >> uint(2)));
        _26[int(_1357)] = as_type<uint>(_1311);
        int _1359 = _1351 + 8;
        uint _1361 = uint(int(uint(_1359) >> uint(2)));
        _26[int(_1361)] = as_type<uint>(_1329);
        int _1363 = _1351 + 12;
        uint _1365 = uint(int(uint(_1363) >> uint(2)));
        _26[int(_1365)] = as_type<uint>(_1335);
        float _1367 = 1.0 / _1349;
        float _1369 = _1265 * _1347;
        float _1371 = _1159 * _1369;
        float _1373 = _1265 * _1367;
        float _1375 = _1301 * _1373;
        float _1377 = _1307 * _1373;
        float _1379 = _1309 * _1373;
        float _1381 = fma(_1371, (*spvDescriptorSet0.cp_c3)._m0[7].x, _1375);
        float _1383 = fma(_1371, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1377);
        float _1385 = fma(_1371, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1379);
        float _1387 = _1377;
        float _1389 = _1379;
        float _1391 = _1375;
        int _1393 = _1339;
        if (_1161)
        {
            _1387 = as_type<float>(_320);
        }
        int _1395 = as_type<int>(_1387);
        float _1397 = _1381 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _1399 = _1383 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _1401 = _1385 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _1403 = _1395;
        if (_1161)
        {
            _1389 = as_type<float>(_322);
        }
        int _1405 = as_type<int>(_1389);
        int _1407 = _1405;
        if (_1161)
        {
            _1391 = as_type<float>(_324);
        }
        int _1409 = as_type<int>(_1391);
        int _1411 = _1331 << 4;
        int _1413 = _1411 + 1280;
        uint _1415 = uint(int(uint(_1413) >> uint(2)));
        _26[int(_1415)] = as_type<uint>(_1397);
        int _1417 = _1411 + 1284;
        uint _1419 = uint(int(uint(_1417) >> uint(2)));
        _26[int(_1419)] = as_type<uint>(_1399);
        int _1421 = _1411 + 1288;
        uint _1423 = uint(int(uint(_1421) >> uint(2)));
        _26[int(_1423)] = as_type<uint>(_1401);
        int _1425 = _1411 + 1292;
        uint _1427 = uint(int(uint(_1425) >> uint(2)));
        _26[int(_1427)] = as_type<uint>(_1327);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1429 = _1409;
        if (!_1161)
        {
            int _1431 = _287 << 4;
            int _1433 = _1431 + 1280;
            uint _1435 = uint(int(uint(_1433) >> uint(2)));
            float _1437 = as_type<float>(_26[int(_1435)]);
            int _1439 = _1431 + 1284;
            uint _1441 = uint(int(uint(_1439) >> uint(2)));
            float _1443 = as_type<float>(_26[int(_1441)]);
            int _1445 = _1431 + 1288;
            uint _1447 = uint(int(uint(_1445) >> uint(2)));
            float _1449 = as_type<float>(_26[int(_1447)]);
            int _1451 = _1431 + 1292;
            uint _1453 = uint(int(uint(_1451) >> uint(2)));
            float _1455 = as_type<float>(_26[int(_1453)]);
            int _1457 = _287 << 4;
            int _1459 = _1457 + 1296;
            uint _1461 = uint(int(uint(_1459) >> uint(2)));
            float _1463 = as_type<float>(_26[int(_1461)]);
            int _1465 = _1457 + 1300;
            uint _1467 = uint(int(uint(_1465) >> uint(2)));
            float _1469 = as_type<float>(_26[int(_1467)]);
            int _1471 = _1457 + 1304;
            uint _1473 = uint(int(uint(_1471) >> uint(2)));
            float _1475 = as_type<float>(_26[int(_1473)]);
            int _1477 = _1457 + 1308;
            uint _1479 = uint(int(uint(_1477) >> uint(2)));
            float _1481 = as_type<float>(_26[int(_1479)]);
            int _1483 = _287 << 4;
            uint _1485 = uint(int(uint(_1483) >> uint(2)));
            float _1487 = as_type<float>(_26[int(_1485)]);
            int _1489 = _1483 + 4;
            uint _1491 = uint(int(uint(_1489) >> uint(2)));
            float _1493 = as_type<float>(_26[int(_1491)]);
            int _1495 = _1483 + 8;
            uint _1497 = uint(int(uint(_1495) >> uint(2)));
            float _1499 = as_type<float>(_26[int(_1497)]);
            int _1501 = _1483 + 12;
            uint _1503 = uint(int(uint(_1501) >> uint(2)));
            float _1505 = as_type<float>(_26[int(_1503)]);
            int _1507 = _287 << 4;
            int _1509 = _1507 + 16;
            uint _1511 = uint(int(uint(_1509) >> uint(2)));
            float _1513 = as_type<float>(_26[int(_1511)]);
            int _1515 = _1507 + 20;
            uint _1517 = uint(int(uint(_1515) >> uint(2)));
            float _1519 = as_type<float>(_26[int(_1517)]);
            int _1521 = _1507 + 24;
            uint _1523 = uint(int(uint(_1521) >> uint(2)));
            float _1525 = as_type<float>(_26[int(_1523)]);
            int _1527 = _1507 + 28;
            uint _1529 = uint(int(uint(_1527) >> uint(2)));
            float _1531 = as_type<float>(_26[int(_1529)]);
            int _1533 = _287 << 4;
            int _1535 = _1533 + 1312;
            uint _1537 = uint(int(uint(_1535) >> uint(2)));
            float _1539 = as_type<float>(_26[int(_1537)]);
            int _1541 = _1533 + 1316;
            uint _1543 = uint(int(uint(_1541) >> uint(2)));
            float _1545 = as_type<float>(_26[int(_1543)]);
            int _1547 = _1533 + 1320;
            uint _1549 = uint(int(uint(_1547) >> uint(2)));
            float _1551 = as_type<float>(_26[int(_1549)]);
            int _1553 = _1533 + 1324;
            uint _1555 = uint(int(uint(_1553) >> uint(2)));
            float _1557 = as_type<float>(_26[int(_1555)]);
            int _1559 = _287 << 4;
            int _1561 = _1559 + 1328;
            uint _1563 = uint(int(uint(_1561) >> uint(2)));
            float _1565 = as_type<float>(_26[int(_1563)]);
            int _1567 = _1559 + 1332;
            uint _1569 = uint(int(uint(_1567) >> uint(2)));
            float _1571 = as_type<float>(_26[int(_1569)]);
            int _1573 = _1559 + 1336;
            uint _1575 = uint(int(uint(_1573) >> uint(2)));
            float _1577 = as_type<float>(_26[int(_1575)]);
            int _1579 = _1559 + 1340;
            uint _1581 = uint(int(uint(_1579) >> uint(2)));
            float _1583 = as_type<float>(_26[int(_1581)]);
            float _1585 = as_type<float>(_324) + _1455;
            float _1587 = -_1585;
            float _1589 = exp2(_1587);
            float _1591 = _1585 + _1481;
            float _1593 = -_1437;
            float _1595 = _1593 + _1487;
            float _1597 = -_1443;
            float _1599 = _1597 + _1493;
            float _1601 = -_1449;
            float _1603 = _1601 + _1499;
            float _1605 = -_1591;
            float _1607 = exp2(_1605);
            float _1609 = -_1469;
            float _1611 = _1609 + _1519;
            float _1613 = -_1475;
            float _1615 = _1613 + _1525;
            float _1617 = -_1463;
            float _1619 = _1617 + _1513;
            float _1621 = _1591 + _1557;
            float _1623 = -_1589;
            float _1625 = _1623 + 1.0;
            float _1627 = -_1621;
            float _1629 = exp2(_1627);
            int _1631 = _287 << 4;
            int _1633 = _1631 + 32;
            uint _1635 = uint(int(uint(_1633) >> uint(2)));
            float _1637 = as_type<float>(_26[int(_1635)]);
            int _1639 = _1631 + 36;
            uint _1641 = uint(int(uint(_1639) >> uint(2)));
            float _1643 = as_type<float>(_26[int(_1641)]);
            int _1645 = _1631 + 40;
            uint _1647 = uint(int(uint(_1645) >> uint(2)));
            float _1649 = as_type<float>(_26[int(_1647)]);
            int _1651 = _1631 + 44;
            uint _1653 = uint(int(uint(_1651) >> uint(2)));
            float _1655 = as_type<float>(_26[int(_1653)]);
            float _1657 = _1621 + _1583;
            float _1659 = precise::min(_1625, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1661 = -_1607;
            float _1663 = _1661 + 1.0;
            float _1665 = -_326;
            float _1667 = _1659 + _1665;
            float _1669 = precise::min(_1663, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1671 = _1667 * _1505;
            float _1673 = -_1629;
            float _1675 = _1673 + 1.0;
            float _1677 = _1599 * _1671;
            float _1679 = _1603 * _1671;
            float _1681 = _1595 * _1671;
            float _1683 = fma(_1443, _1667, _1677);
            float _1685 = -_1659;
            float _1687 = _1685 + _1669;
            float _1689 = fma(_1437, _1667, _1681);
            float _1691 = fma(_1449, _1667, _1679);
            float _1693 = _1683 + as_type<float>(_320);
            float _1695 = _1687 * _1531;
            int _1697 = _287 << 4;
            int _1699 = _1697 + 48;
            uint _1701 = uint(int(uint(_1699) >> uint(2)));
            float _1703 = as_type<float>(_26[int(_1701)]);
            int _1705 = _1697 + 52;
            uint _1707 = uint(int(uint(_1705) >> uint(2)));
            float _1709 = as_type<float>(_26[int(_1707)]);
            int _1711 = _1697 + 56;
            uint _1713 = uint(int(uint(_1711) >> uint(2)));
            float _1715 = as_type<float>(_26[int(_1713)]);
            int _1717 = _1697 + 60;
            uint _1719 = uint(int(uint(_1717) >> uint(2)));
            float _1721 = as_type<float>(_26[int(_1719)]);
            float _1723 = _1689 + as_type<float>(_318);
            float _1725 = _1691 + as_type<float>(_322);
            float _1727 = _1611 * _1695;
            float _1729 = _1615 * _1695;
            int _1731 = _287 << 2;
            int _1733 = _1731 + 1024;
            uint _1735 = uint(int(uint(_1733) >> uint(2)));
            float _1737 = as_type<float>(_26[int(_1735)]);
            float _1739 = _1619 * _1695;
            float _1741 = fma(_1469, _1687, _1727);
            float _1743 = precise::min(_1675, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1745 = _287 << 2;
            int _1747 = _1745 + 1028;
            uint _1749 = uint(int(uint(_1747) >> uint(2)));
            float _1751 = as_type<float>(_26[int(_1749)]);
            float _1753 = fma(_1463, _1687, _1739);
            float _1755 = fma(_1475, _1687, _1729);
            float _1757 = -_1657;
            float _1759 = exp2(_1757);
            int _1761 = _287 << 2;
            int _1763 = _1761 + 1032;
            uint _1765 = uint(int(uint(_1763) >> uint(2)));
            float _1767 = as_type<float>(_26[int(_1765)]);
            float _1769 = -_1539;
            float _1771 = _1769 + _1637;
            float _1773 = -_1669;
            float _1775 = _1773 + _1743;
            float _1777 = -_1545;
            float _1779 = _1777 + _1643;
            int _1781 = _287 << 2;
            int _1783 = _1781 + 1036;
            uint _1785 = uint(int(uint(_1783) >> uint(2)));
            float _1787 = as_type<float>(_26[int(_1785)]);
            float _1789 = -_1551;
            float _1791 = _1789 + _1649;
            float _1793 = _1775 * _1655;
            float _1795 = _1725 + _1755;
            int _1797 = _287 << 4;
            int _1799 = _1797 + 1280;
            uint _1801 = uint(int(uint(_1799) >> uint(2)));
            _26[int(_1801)] = as_type<uint>(_1723);
            int _1803 = _1797 + 1284;
            uint _1805 = uint(int(uint(_1803) >> uint(2)));
            _26[int(_1805)] = as_type<uint>(_1693);
            int _1807 = _1797 + 1288;
            uint _1809 = uint(int(uint(_1807) >> uint(2)));
            _26[int(_1809)] = as_type<uint>(_1725);
            int _1811 = _1797 + 1292;
            uint _1813 = uint(int(uint(_1811) >> uint(2)));
            _26[int(_1813)] = as_type<uint>(_1585);
            float _1815 = _1779 * _1793;
            float _1817 = _1771 * _1793;
            float _1819 = _1791 * _1793;
            float _1821 = fma(_1545, _1775, _1815);
            float _1823 = -_1759;
            float _1825 = _1823 + 1.0;
            float _1827 = fma(_1539, _1775, _1817);
            float _1829 = fma(_1551, _1775, _1819);
            float _1831 = _1723 + _1753;
            float _1833 = _1693 + _1741;
            float _1835 = precise::min(_1825, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1837 = _1795 + _1829;
            float _1839 = _1831 + _1827;
            float _1841 = _1833 + _1821;
            int _1843 = _287 << 4;
            int _1845 = _1843 + 1296;
            uint _1847 = uint(int(uint(_1845) >> uint(2)));
            _26[int(_1847)] = as_type<uint>(_1831);
            int _1849 = _1843 + 1300;
            uint _1851 = uint(int(uint(_1849) >> uint(2)));
            _26[int(_1851)] = as_type<uint>(_1833);
            int _1853 = _1843 + 1304;
            uint _1855 = uint(int(uint(_1853) >> uint(2)));
            _26[int(_1855)] = as_type<uint>(_1795);
            int _1857 = _1843 + 1308;
            uint _1859 = uint(int(uint(_1857) >> uint(2)));
            _26[int(_1859)] = as_type<uint>(_1591);
            float _1861 = -_1743;
            float _1863 = _1835 + _1861;
            float _1865 = -_1565;
            float _1867 = _1865 + _1703;
            float _1869 = -_1571;
            float _1871 = _1869 + _1709;
            float _1873 = _1863 * _1721;
            float _1875 = -_1577;
            float _1877 = _1875 + _1715;
            int _1879 = _287 << 4;
            int _1881 = _1879 + 1312;
            uint _1883 = uint(int(uint(_1881) >> uint(2)));
            _26[int(_1883)] = as_type<uint>(_1839);
            int _1885 = _1879 + 1316;
            uint _1887 = uint(int(uint(_1885) >> uint(2)));
            _26[int(_1887)] = as_type<uint>(_1841);
            int _1889 = _1879 + 1320;
            uint _1891 = uint(int(uint(_1889) >> uint(2)));
            _26[int(_1891)] = as_type<uint>(_1837);
            int _1893 = _1879 + 1324;
            uint _1895 = uint(int(uint(_1893) >> uint(2)));
            _26[int(_1895)] = as_type<uint>(_1621);
            float _1897 = _1737 + _328;
            float _1899 = _1867 * _1873;
            float _1901 = _1871 * _1873;
            float _1903 = _1877 * _1873;
            float _1905 = _1897 + _1751;
            float _1907 = fma(_1565, _1863, _1899);
            float _1909 = fma(_1571, _1863, _1901);
            float _1911 = fma(_1577, _1863, _1903);
            float _1913 = _1905 + _1767;
            float _1915 = _1907 + _1839;
            float _1917 = _1909 + _1841;
            float _1919 = _1911 + _1837;
            float _1921 = _1913 + _1787;
            int _1923 = _287 << 2;
            int _1925 = _1923 + 1024;
            uint _1927 = uint(int(uint(_1925) >> uint(2)));
            _26[int(_1927)] = as_type<uint>(_1897);
            int _1929 = _287 << 2;
            int _1931 = _1929 + 1028;
            uint _1933 = uint(int(uint(_1931) >> uint(2)));
            _26[int(_1933)] = as_type<uint>(_1905);
            int _1935 = _287 << 2;
            int _1937 = _1935 + 1032;
            uint _1939 = uint(int(uint(_1937) >> uint(2)));
            _26[int(_1939)] = as_type<uint>(_1913);
            int _1941 = _287 << 2;
            int _1943 = _1941 + 1036;
            uint _1945 = uint(int(uint(_1943) >> uint(2)));
            _26[int(_1945)] = as_type<uint>(_1921);
            int _1947 = _287 << 4;
            int _1949 = _1947 + 1328;
            uint _1951 = uint(int(uint(_1949) >> uint(2)));
            _26[int(_1951)] = as_type<uint>(_1915);
            int _1953 = _1947 + 1332;
            uint _1955 = uint(int(uint(_1953) >> uint(2)));
            _26[int(_1955)] = as_type<uint>(_1917);
            int _1957 = _1947 + 1336;
            uint _1959 = uint(int(uint(_1957) >> uint(2)));
            _26[int(_1959)] = as_type<uint>(_1919);
            int _1961 = _1947 + 1340;
            uint _1963 = uint(int(uint(_1961) >> uint(2)));
            _26[int(_1963)] = as_type<uint>(_1657);
            _442 = _1835;
            _444 = _1921;
            _1393 = as_type<int>(_1915);
            _1403 = as_type<int>(_1917);
            _1407 = as_type<int>(_1919);
            _1429 = as_type<int>(_1657);
        }
        float _1965 = _442;
        float _1967 = _444;
        int _1969 = _1393;
        int _1971 = _1403;
        int _1973 = _1407;
        int _1975 = _1429;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1977 = _1331 << 4;
        int _1979 = _1977 + 1280;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        float _1983 = as_type<float>(_26[int(_1981)]);
        int _1985 = _1977 + 1284;
        uint _1987 = uint(int(uint(_1985) >> uint(2)));
        float _1989 = as_type<float>(_26[int(_1987)]);
        int _1991 = _1977 + 1288;
        uint _1993 = uint(int(uint(_1991) >> uint(2)));
        float _1995 = as_type<float>(_26[int(_1993)]);
        int _1997 = _1977 + 1292;
        uint _1999 = uint(int(uint(_1997) >> uint(2)));
        float _2001 = as_type<float>(_26[int(_1999)]);
        float _2003 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _2005 = _374 + _2003;
        float _2007 = 1.0 / _374;
        int _2009 = _1331 << 2;
        int _2011 = _2009 + 1024;
        uint _2013 = uint(int(uint(_2011) >> uint(2)));
        float _2015 = as_type<float>(_26[int(_2013)]);
        float _2017 = _2005 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _2019 = precise::clamp(_2017, 0.0, 1.0);
        float _2021 = abs(_2019);
        float _2023 = log2(_2021);
        float _2025 = _2023 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _2027 = exp2(_2025);
        float _2029 = -_2001;
        float _2031 = exp2(_2029);
        float _2033 = _2027 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _2035 = precise::max(_2031, _285);
        float _2037 = -_2035;
        float _2039 = _2037 + 1.0;
        float _2041 = -_2033;
        float _2043 = _2041 + 1.0;
        float _2045 = 1.0 / _2039;
        bool _2047 = _2043 > _2039;
        bool _2049 = isnan(_2043);
        bool _2051 = _2047 || _2049;
        bool _2053 = isnan(_2039);
        bool _2055 = _2051 || _2053;
        float _2057 = _2043 * _2045;
        float _2059 = _2015 * _2007;
        bool _2061 = !_2055;
        float _2063 = _2061 ? _2057 : 1.0;
        float _2065 = _1983 * _2063;
        float _2067 = _1989 * _2063;
        float _2069 = _1995 * _2063;
        float _2071 = fma(_2039, _2063, _2033);
        float _2073 = precise::clamp(_2071, 0.0, 1.0);
        float _2075 = fma(_2033, (*spvDescriptorSet0.cp_c3)._m0[14].x, _2065);
        float _2077 = fma(_2033, (*spvDescriptorSet0.cp_c3)._m0[14].y, _2067);
        float _2079 = fma(_2033, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2069);
        float _2081 = -_2073;
        float _2083 = _2081 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_2075, _2077, _2079, _2083), uint3(int3(_81, _77, int(_310))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_2059, _2059, _2059, _2059), uint3(int3(_81, _77, int(_310))));
        int _2085 = int(_310) + 4;
        bool _2087 = uint(_2085) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _290 = uint(_2085);
        _292 = _2059;
        _294 = _2065;
        _298 = _1969;
        _300 = _1971;
        _302 = _1973;
        _304 = _1975;
        _306 = _1965;
        _308 = _1967;
        if (_2087)
        {
            _2089 = true;
            if (_2089)
            {
                break;
            }
        }
    } while (true);
    _2089 = false;
}

