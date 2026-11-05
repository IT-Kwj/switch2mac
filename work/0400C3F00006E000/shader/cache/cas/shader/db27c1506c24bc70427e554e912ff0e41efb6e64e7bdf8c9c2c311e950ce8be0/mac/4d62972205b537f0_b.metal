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
    bool _2029 = false;
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
            float3 _2954 = float3(_656, _662, float(int(_642)));
            float3 _2958 = select(_2954, float3(0.0), isnan(_2954));
            float _670 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _2958.xy, uint(rint(_2958.z)), _668, level(0.0));
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
                float3 _3235 = float3(_792, _838, float(int(_832)));
                float3 _3237 = select(_3235, float3(0.0), isnan(_3235));
                float _844 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _3237.xy, uint(rint(_3237.z)), _842, level(0.0));
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
        float2 _3263 = float2(_856, _858);
        float _860 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_3263, float2(0.0), isnan(_3263)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_3263, float2(0.0), isnan(_3263)), level(0.0)).x;
        float3 _3274 = float3(_856, _858, float(0));
        float3 _3276 = select(_3274, float3(0.0), isnan(_3274));
        float4 _863 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3276.xy, uint(rint(_3276.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3276.xy, uint(rint(_3276.z)), level(0.0)).xyzw;
        float _865 = _863.x;
        float _867 = _863.y;
        float _869 = _863.z;
        float _871 = _863.w;
        float3 _3291 = float3(_856, _858, float(1));
        float3 _3293 = select(_3291, float3(0.0), isnan(_3291));
        float4 _873 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3293.xy, uint(rint(_3293.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3293.xy, uint(rint(_3293.z)), level(0.0)).xyzw;
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
        float3 _3571 = float3(_856, _858, float(2));
        float3 _3573 = select(_3571, float3(0.0), isnan(_3571));
        float4 _1067 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3573.xy, uint(rint(_3573.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3573.xy, uint(rint(_3573.z)), level(0.0)).xyzw;
        float _1069 = _1067.x;
        float _1071 = _1067.y;
        float _1073 = _1067.z;
        float _1075 = _1067.w;
        float3 _3588 = float3(_856, _858, float(3));
        float3 _3590 = select(_3588, float3(0.0), isnan(_3588));
        float4 _1077 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3590.xy, uint(rint(_3590.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3590.xy, uint(rint(_3590.z)), level(0.0)).xyzw;
        float _1079 = _1077.x;
        float _1081 = _1077.y;
        float _1083 = _1077.z;
        float _1085 = _1077.w;
        float3 _3605 = float3(_856, _858, float(4));
        float3 _3607 = select(_3605, float3(0.0), isnan(_3605));
        float4 _1087 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3607.xy, uint(rint(_3607.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3607.xy, uint(rint(_3607.z)), level(0.0)).xyzw;
        float _1089 = _1087.x;
        float _1091 = _1087.y;
        float _1093 = _1087.z;
        float _1095 = _1087.w;
        float2 _3621 = float2(_856, _858);
        float _1097 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_3621, float2(0.0), isnan(_3621)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_3621, float2(0.0), isnan(_3621)), level(0.0)).z;
        float3 _3630 = float3(_856, _858, float(6));
        float3 _3632 = select(_3630, float3(0.0), isnan(_3630));
        float4 _1099 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3632.xy, uint(rint(_3632.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3632.xy, uint(rint(_3632.z)), level(0.0)).xyzw;
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
        float3 _3667 = float3(_856, _858, float(7));
        float3 _3669 = select(_3667, float3(0.0), isnan(_3667));
        float4 _1121 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3669.xy, uint(rint(_3669.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3669.xy, uint(rint(_3669.z)), level(0.0)).xyzw;
        float _1123 = _1121.x;
        float _1125 = _1121.y;
        float _1127 = _1121.z;
        float _1129 = _1121.w;
        float _1131 = _1117 * _1011;
        float3 _3688 = float3(_856, _858, float(5));
        float3 _3690 = select(_3688, float3(0.0), isnan(_3688));
        float4 _1133 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _3690.xy, uint(rint(_3690.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _3690.xy, uint(rint(_3690.z)), level(0.0)).xyzw;
        float _1135 = _1133.x;
        float _1137 = _1133.y;
        float _1139 = _1133.z;
        float _1141 = _1133.w;
        float2 _3704 = float2(_1065, _1047);
        float3 _1145 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_3704, float2(0.0), isnan(_3704)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_3704, float2(0.0), isnan(_3704)), level(0.0)).xyz;
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
        float _1339 = _1209;
        if (_1161)
        {
            _1337 = as_type<float>(_318);
        }
        int _1341 = as_type<int>(_1337);
        int _1343 = _1331 << 2;
        int _1345 = _1343 + 1024;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        _26[int(_1347)] = as_type<uint>(_1323);
        float _1349 = 1.0 / _1333;
        float _1351 = _1313 * 12.56637096405029296875;
        int _1353 = _1331 << 4;
        uint _1355 = uint(int(uint(_1353) >> uint(2)));
        _26[int(_1355)] = as_type<uint>(_1325);
        int _1357 = _1353 + 4;
        uint _1359 = uint(int(uint(_1357) >> uint(2)));
        _26[int(_1359)] = as_type<uint>(_1311);
        int _1361 = _1353 + 8;
        uint _1363 = uint(int(uint(_1361) >> uint(2)));
        _26[int(_1363)] = as_type<uint>(_1329);
        int _1365 = _1353 + 12;
        uint _1367 = uint(int(uint(_1365) >> uint(2)));
        _26[int(_1367)] = as_type<uint>(_1335);
        float _1369 = 1.0 / _1351;
        float _1371 = _1265 * _1349;
        float _1373 = _1159 * _1371;
        float _1375 = _1265 * _1369;
        float _1377 = _1301 * _1375;
        float _1379 = _1307 * _1375;
        float _1381 = _1309 * _1375;
        float _1383 = fma(_1373, (*spvDescriptorSet0.cp_c3)._m0[7].x, _1377);
        float _1385 = fma(_1373, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1379);
        float _1387 = fma(_1373, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1381);
        float _1389 = _1379;
        float _1391 = _1381;
        float _1393 = _1377;
        int _1395 = _1341;
        if (_1161)
        {
            _1389 = as_type<float>(_320);
        }
        int _1397 = as_type<int>(_1389);
        float _1399 = _1383 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _1401 = _1385 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _1403 = _1387 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _1405 = _1397;
        if (_1161)
        {
            _1391 = as_type<float>(_322);
        }
        int _1407 = as_type<int>(_1391);
        int _1409 = _1407;
        if (_1161)
        {
            _1393 = as_type<float>(_324);
        }
        int _1411 = as_type<int>(_1393);
        int _1413 = _1331 << 4;
        int _1415 = _1413 + 1280;
        uint _1417 = uint(int(uint(_1415) >> uint(2)));
        _26[int(_1417)] = as_type<uint>(_1399);
        int _1419 = _1413 + 1284;
        uint _1421 = uint(int(uint(_1419) >> uint(2)));
        _26[int(_1421)] = as_type<uint>(_1401);
        int _1423 = _1413 + 1288;
        uint _1425 = uint(int(uint(_1423) >> uint(2)));
        _26[int(_1425)] = as_type<uint>(_1403);
        int _1427 = _1413 + 1292;
        uint _1429 = uint(int(uint(_1427) >> uint(2)));
        _26[int(_1429)] = as_type<uint>(_1327);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1431 = _1411;
        if (!_1161)
        {
            int _1433 = _287 << 4;
            int _1435 = _1433 + 1280;
            uint _1437 = uint(int(uint(_1435) >> uint(2)));
            float _1439 = as_type<float>(_26[int(_1437)]);
            int _1441 = _1433 + 1284;
            uint _1443 = uint(int(uint(_1441) >> uint(2)));
            float _1445 = as_type<float>(_26[int(_1443)]);
            int _1447 = _1433 + 1288;
            uint _1449 = uint(int(uint(_1447) >> uint(2)));
            float _1451 = as_type<float>(_26[int(_1449)]);
            int _1453 = _1433 + 1292;
            uint _1455 = uint(int(uint(_1453) >> uint(2)));
            float _1457 = as_type<float>(_26[int(_1455)]);
            int _1459 = _287 << 4;
            int _1461 = _1459 + 1296;
            uint _1463 = uint(int(uint(_1461) >> uint(2)));
            float _1465 = as_type<float>(_26[int(_1463)]);
            int _1467 = _1459 + 1300;
            uint _1469 = uint(int(uint(_1467) >> uint(2)));
            float _1471 = as_type<float>(_26[int(_1469)]);
            int _1473 = _1459 + 1304;
            uint _1475 = uint(int(uint(_1473) >> uint(2)));
            float _1477 = as_type<float>(_26[int(_1475)]);
            int _1479 = _1459 + 1308;
            uint _1481 = uint(int(uint(_1479) >> uint(2)));
            float _1483 = as_type<float>(_26[int(_1481)]);
            int _1485 = _287 << 4;
            uint _1487 = uint(int(uint(_1485) >> uint(2)));
            float _1489 = as_type<float>(_26[int(_1487)]);
            int _1491 = _1485 + 4;
            uint _1493 = uint(int(uint(_1491) >> uint(2)));
            float _1495 = as_type<float>(_26[int(_1493)]);
            int _1497 = _1485 + 8;
            uint _1499 = uint(int(uint(_1497) >> uint(2)));
            float _1501 = as_type<float>(_26[int(_1499)]);
            int _1503 = _1485 + 12;
            uint _1505 = uint(int(uint(_1503) >> uint(2)));
            float _1507 = as_type<float>(_26[int(_1505)]);
            int _1509 = _287 << 4;
            int _1511 = _1509 + 16;
            uint _1513 = uint(int(uint(_1511) >> uint(2)));
            float _1515 = as_type<float>(_26[int(_1513)]);
            int _1517 = _1509 + 20;
            uint _1519 = uint(int(uint(_1517) >> uint(2)));
            float _1521 = as_type<float>(_26[int(_1519)]);
            int _1523 = _1509 + 24;
            uint _1525 = uint(int(uint(_1523) >> uint(2)));
            float _1527 = as_type<float>(_26[int(_1525)]);
            int _1529 = _1509 + 28;
            uint _1531 = uint(int(uint(_1529) >> uint(2)));
            float _1533 = as_type<float>(_26[int(_1531)]);
            int _1535 = _287 << 4;
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
            int _1561 = _287 << 4;
            int _1563 = _1561 + 1328;
            uint _1565 = uint(int(uint(_1563) >> uint(2)));
            float _1567 = as_type<float>(_26[int(_1565)]);
            int _1569 = _1561 + 1332;
            uint _1571 = uint(int(uint(_1569) >> uint(2)));
            float _1573 = as_type<float>(_26[int(_1571)]);
            int _1575 = _1561 + 1336;
            uint _1577 = uint(int(uint(_1575) >> uint(2)));
            float _1579 = as_type<float>(_26[int(_1577)]);
            int _1581 = _1561 + 1340;
            uint _1583 = uint(int(uint(_1581) >> uint(2)));
            float _1585 = as_type<float>(_26[int(_1583)]);
            float _1587 = as_type<float>(_324) + _1457;
            float _1589 = -_1587;
            float _1591 = exp2(_1589);
            float _1593 = _1587 + _1483;
            float _1595 = -_1439;
            float _1597 = _1595 + _1489;
            float _1599 = -_1445;
            float _1601 = _1599 + _1495;
            float _1603 = -_1451;
            float _1605 = _1603 + _1501;
            float _1607 = -_1593;
            float _1609 = exp2(_1607);
            float _1611 = -_1471;
            float _1613 = _1611 + _1521;
            float _1615 = -_1477;
            float _1617 = _1615 + _1527;
            float _1619 = -_1465;
            float _1621 = _1619 + _1515;
            float _1623 = _1593 + _1559;
            float _1625 = -_1591;
            float _1627 = _1625 + 1.0;
            float _1629 = -_1623;
            float _1631 = exp2(_1629);
            int _1633 = _287 << 4;
            int _1635 = _1633 + 32;
            uint _1637 = uint(int(uint(_1635) >> uint(2)));
            float _1639 = as_type<float>(_26[int(_1637)]);
            int _1641 = _1633 + 36;
            uint _1643 = uint(int(uint(_1641) >> uint(2)));
            float _1645 = as_type<float>(_26[int(_1643)]);
            int _1647 = _1633 + 40;
            uint _1649 = uint(int(uint(_1647) >> uint(2)));
            float _1651 = as_type<float>(_26[int(_1649)]);
            int _1653 = _1633 + 44;
            uint _1655 = uint(int(uint(_1653) >> uint(2)));
            float _1657 = as_type<float>(_26[int(_1655)]);
            float _1659 = _1623 + _1585;
            float _1661 = precise::min(_1627, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1663 = -_1609;
            float _1665 = _1663 + 1.0;
            float _1667 = -_326;
            float _1669 = _1661 + _1667;
            float _1671 = precise::min(_1665, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1673 = _1669 * _1507;
            float _1675 = -_1631;
            float _1677 = _1675 + 1.0;
            float _1679 = _1601 * _1673;
            float _1681 = _1605 * _1673;
            float _1683 = _1597 * _1673;
            float _1685 = fma(_1445, _1669, _1679);
            float _1687 = -_1661;
            float _1689 = _1687 + _1671;
            float _1691 = fma(_1439, _1669, _1683);
            float _1693 = fma(_1451, _1669, _1681);
            float _1695 = _1685 + as_type<float>(_320);
            float _1697 = _1689 * _1533;
            int _1699 = _287 << 4;
            int _1701 = _1699 + 48;
            uint _1703 = uint(int(uint(_1701) >> uint(2)));
            float _1705 = as_type<float>(_26[int(_1703)]);
            int _1707 = _1699 + 52;
            uint _1709 = uint(int(uint(_1707) >> uint(2)));
            float _1711 = as_type<float>(_26[int(_1709)]);
            int _1713 = _1699 + 56;
            uint _1715 = uint(int(uint(_1713) >> uint(2)));
            float _1717 = as_type<float>(_26[int(_1715)]);
            int _1719 = _1699 + 60;
            uint _1721 = uint(int(uint(_1719) >> uint(2)));
            float _1723 = as_type<float>(_26[int(_1721)]);
            float _1725 = _1691 + as_type<float>(_318);
            float _1727 = _1693 + as_type<float>(_322);
            float _1729 = _1613 * _1697;
            float _1731 = _1617 * _1697;
            int _1733 = _287 << 2;
            int _1735 = _1733 + 1024;
            uint _1737 = uint(int(uint(_1735) >> uint(2)));
            float _1739 = as_type<float>(_26[int(_1737)]);
            float _1741 = _1621 * _1697;
            float _1743 = fma(_1471, _1689, _1729);
            float _1745 = precise::min(_1677, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1747 = _287 << 2;
            int _1749 = _1747 + 1028;
            uint _1751 = uint(int(uint(_1749) >> uint(2)));
            float _1753 = as_type<float>(_26[int(_1751)]);
            float _1755 = fma(_1465, _1689, _1741);
            float _1757 = fma(_1477, _1689, _1731);
            float _1759 = -_1659;
            float _1761 = exp2(_1759);
            int _1763 = _287 << 2;
            int _1765 = _1763 + 1032;
            uint _1767 = uint(int(uint(_1765) >> uint(2)));
            float _1769 = as_type<float>(_26[int(_1767)]);
            float _1771 = -_1541;
            float _1773 = _1771 + _1639;
            float _1775 = -_1671;
            float _1777 = _1775 + _1745;
            float _1779 = -_1547;
            float _1781 = _1779 + _1645;
            int _1783 = _287 << 2;
            int _1785 = _1783 + 1036;
            uint _1787 = uint(int(uint(_1785) >> uint(2)));
            float _1789 = as_type<float>(_26[int(_1787)]);
            float _1791 = -_1553;
            float _1793 = _1791 + _1651;
            float _1795 = _1777 * _1657;
            float _1797 = _1727 + _1757;
            int _1799 = _287 << 4;
            int _1801 = _1799 + 1280;
            uint _1803 = uint(int(uint(_1801) >> uint(2)));
            _26[int(_1803)] = as_type<uint>(_1725);
            int _1805 = _1799 + 1284;
            uint _1807 = uint(int(uint(_1805) >> uint(2)));
            _26[int(_1807)] = as_type<uint>(_1695);
            int _1809 = _1799 + 1288;
            uint _1811 = uint(int(uint(_1809) >> uint(2)));
            _26[int(_1811)] = as_type<uint>(_1727);
            int _1813 = _1799 + 1292;
            uint _1815 = uint(int(uint(_1813) >> uint(2)));
            _26[int(_1815)] = as_type<uint>(_1587);
            float _1817 = _1781 * _1795;
            float _1819 = _1773 * _1795;
            float _1821 = _1793 * _1795;
            float _1823 = fma(_1547, _1777, _1817);
            float _1825 = -_1761;
            float _1827 = _1825 + 1.0;
            float _1829 = fma(_1541, _1777, _1819);
            float _1831 = fma(_1553, _1777, _1821);
            float _1833 = _1725 + _1755;
            float _1835 = _1695 + _1743;
            float _1837 = precise::min(_1827, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1839 = _1797 + _1831;
            float _1841 = _1833 + _1829;
            float _1843 = _1835 + _1823;
            int _1845 = _287 << 4;
            int _1847 = _1845 + 1296;
            uint _1849 = uint(int(uint(_1847) >> uint(2)));
            _26[int(_1849)] = as_type<uint>(_1833);
            int _1851 = _1845 + 1300;
            uint _1853 = uint(int(uint(_1851) >> uint(2)));
            _26[int(_1853)] = as_type<uint>(_1835);
            int _1855 = _1845 + 1304;
            uint _1857 = uint(int(uint(_1855) >> uint(2)));
            _26[int(_1857)] = as_type<uint>(_1797);
            int _1859 = _1845 + 1308;
            uint _1861 = uint(int(uint(_1859) >> uint(2)));
            _26[int(_1861)] = as_type<uint>(_1593);
            float _1863 = -_1745;
            float _1865 = _1837 + _1863;
            float _1867 = -_1567;
            float _1869 = _1867 + _1705;
            float _1871 = -_1573;
            float _1873 = _1871 + _1711;
            float _1875 = _1865 * _1723;
            float _1877 = -_1579;
            float _1879 = _1877 + _1717;
            int _1881 = _287 << 4;
            int _1883 = _1881 + 1312;
            uint _1885 = uint(int(uint(_1883) >> uint(2)));
            _26[int(_1885)] = as_type<uint>(_1841);
            int _1887 = _1881 + 1316;
            uint _1889 = uint(int(uint(_1887) >> uint(2)));
            _26[int(_1889)] = as_type<uint>(_1843);
            int _1891 = _1881 + 1320;
            uint _1893 = uint(int(uint(_1891) >> uint(2)));
            _26[int(_1893)] = as_type<uint>(_1839);
            int _1895 = _1881 + 1324;
            uint _1897 = uint(int(uint(_1895) >> uint(2)));
            _26[int(_1897)] = as_type<uint>(_1623);
            float _1899 = _1739 + _328;
            float _1901 = _1869 * _1875;
            float _1903 = _1873 * _1875;
            float _1905 = _1879 * _1875;
            float _1907 = _1899 + _1753;
            float _1909 = fma(_1567, _1865, _1901);
            float _1911 = fma(_1573, _1865, _1903);
            float _1913 = fma(_1579, _1865, _1905);
            float _1915 = _1907 + _1769;
            float _1917 = _1909 + _1841;
            float _1919 = _1911 + _1843;
            float _1921 = _1913 + _1839;
            float _1923 = _1915 + _1789;
            int _1925 = _287 << 2;
            int _1927 = _1925 + 1024;
            uint _1929 = uint(int(uint(_1927) >> uint(2)));
            _26[int(_1929)] = as_type<uint>(_1899);
            int _1931 = _287 << 2;
            int _1933 = _1931 + 1028;
            uint _1935 = uint(int(uint(_1933) >> uint(2)));
            _26[int(_1935)] = as_type<uint>(_1907);
            int _1937 = _287 << 2;
            int _1939 = _1937 + 1032;
            uint _1941 = uint(int(uint(_1939) >> uint(2)));
            _26[int(_1941)] = as_type<uint>(_1915);
            int _1943 = _287 << 2;
            int _1945 = _1943 + 1036;
            uint _1947 = uint(int(uint(_1945) >> uint(2)));
            _26[int(_1947)] = as_type<uint>(_1923);
            int _1949 = _287 << 4;
            int _1951 = _1949 + 1328;
            uint _1953 = uint(int(uint(_1951) >> uint(2)));
            _26[int(_1953)] = as_type<uint>(_1917);
            int _1955 = _1949 + 1332;
            uint _1957 = uint(int(uint(_1955) >> uint(2)));
            _26[int(_1957)] = as_type<uint>(_1919);
            int _1959 = _1949 + 1336;
            uint _1961 = uint(int(uint(_1959) >> uint(2)));
            _26[int(_1961)] = as_type<uint>(_1921);
            int _1963 = _1949 + 1340;
            uint _1965 = uint(int(uint(_1963) >> uint(2)));
            _26[int(_1965)] = as_type<uint>(_1659);
            _1339 = _1587;
            _442 = _1837;
            _444 = _1923;
            _1395 = as_type<int>(_1917);
            _1405 = as_type<int>(_1919);
            _1409 = as_type<int>(_1921);
            _1431 = as_type<int>(_1659);
        }
        float _1967 = _1339;
        float _1969 = _442;
        float _1971 = _444;
        int _1973 = _1395;
        int _1975 = _1405;
        int _1977 = _1409;
        int _1979 = _1431;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1981 = _1331 << 4;
        int _1983 = _1981 + 1280;
        uint _1985 = uint(int(uint(_1983) >> uint(2)));
        float _1987 = as_type<float>(_26[int(_1985)]);
        int _1989 = _1981 + 1284;
        uint _1991 = uint(int(uint(_1989) >> uint(2)));
        float _1993 = as_type<float>(_26[int(_1991)]);
        int _1995 = _1981 + 1288;
        uint _1997 = uint(int(uint(_1995) >> uint(2)));
        float _1999 = as_type<float>(_26[int(_1997)]);
        int _2001 = _1981 + 1292;
        uint _2003 = uint(int(uint(_2001) >> uint(2)));
        float _2005 = as_type<float>(_26[int(_2003)]);
        float _2007 = 1.0 / _374;
        int _2009 = _1331 << 2;
        int _2011 = _2009 + 1024;
        uint _2013 = uint(int(uint(_2011) >> uint(2)));
        float _2015 = as_type<float>(_26[int(_2013)]);
        float _2017 = -_2005;
        float _2019 = exp2(_2017);
        float _2021 = _2015 * _2007;
        float _2023 = precise::max(_2019, _285);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1987, _1993, _1999, _2023), uint3(int3(_81, _77, int(_310))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_2021, _2021, _2021, _2021), uint3(int3(_81, _77, int(_310))));
        int _2025 = int(_310) + 4;
        bool _2027 = uint(_2025) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _290 = uint(_2025);
        _292 = _2021;
        _294 = _1967;
        _298 = _1973;
        _300 = _1975;
        _302 = _1977;
        _304 = _1979;
        _306 = _1969;
        _308 = _1971;
        if (_2027)
        {
            _2029 = true;
            if (_2029)
            {
                break;
            }
        }
    } while (true);
    _2029 = false;
}

