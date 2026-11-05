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
    bool _2617 = false;
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
    float _193 = _171;
    if (!_185)
    {
        _187 = _167;
    }
    float _195 = _187;
    bool _197 = !_185;
    float _199 = _195;
    if (!_197)
    {
        float _201 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _203 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _205 = _175 + _203;
        float _207 = _181 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _209 = rsqrt(_173);
        float _211 = _205 * _201;
        float _213 = _211 * 0.15915493667125701904296875;
        float _215 = _213 * 6.283185482025146484375;
        float _217 = sin(_215);
        float _219 = _213 * 6.283185482025146484375;
        float _221 = cos(_219);
        float _223 = fma(_217, _207, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _225 = _209 * _223;
        float _227 = _221 + (-1.0);
        float _229 = _161 * _225;
        float _231 = _227 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _233 = _163 * _225;
        float _235 = fma(_181, _221, _231);
        float _237 = _229 * _229;
        float _239 = _233 * _233;
        _189 = _235;
        _199 = _237;
        _191 = _239;
        _193 = _231;
    }
    float _241 = _189;
    float _243 = _199;
    float _245 = _191;
    float _247 = _193;
    float _249 = _99 * _99;
    float _251 = fma(_241, _241, _243);
    bool _253 = as_type<uint>(_101) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _255 = fma(_103, _103, _249);
    float _257 = _251 + _245;
    float _259 = _155 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _261 = _255 + 1.0;
    float _263 = rsqrt(_257);
    float _265 = -_159;
    float _267 = -_259;
    float _269 = fma(_265, (*spvDescriptorSet0.cp_c3)._m0[6].y, _267);
    float _271 = -_157;
    float _273 = fma(_271, (*spvDescriptorSet0.cp_c3)._m0[6].z, _269);
    float _275 = sqrt(_261);
    float _277 = _247;
    if (_253)
    {
        return;
    }
    int _279 = as_type<int>(_70) << 2;
    int _281 = _279 + as_type<int>(_74);
    float _283 = _263 * _241;
    float _285 = rsqrt(_261);
    float _287 = -_273;
    float _289 = fma(_287, (*spvDescriptorSet0.cp_c3)._m0[15].x, _273);
    int _291 = _281 << 2;
    uint _294 = as_type<uint>(_101);
    float _296 = 0.0;
    float _298 = 0.0;
    float _300 = 0.0;
    float _302 = 0.0;
    int _304 = 0;
    int _306 = 0;
    float _308 = 0.0;
    int _310 = 0;
    float _312 = 0.0;
    float _314 = 0.0;
    do
    {
        uint _316 = _294;
        float _318 = _296;
        float _320 = _298;
        float _322 = _300;
        float _324 = _277;
        float _326 = _302;
        int _328 = _304;
        int _330 = _306;
        float _332 = _308;
        int _334 = _310;
        float _336 = _312;
        float _338 = _314;
        float _340 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _342 = log2(_340);
        float _344 = float(_316);
        int _346 = int(_316) + 1;
        float _348 = float(uint(_346));
        float _350 = _342 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _352 = _344 * _350;
        float _354 = _348 * _350;
        float _356 = _275 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _358 = exp2(_352);
        float _360 = exp2(_354);
        float _362 = _358 + (-1.0);
        float _364 = _362 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _366 = _360 + (-1.0);
        float _368 = _364 * _356;
        float _370 = -_364;
        float _372 = fma(_366, (*spvDescriptorSet0.cp_c3)._m0[8].z, _370);
        float _374 = fma(_155, _368, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _376 = fma(_159, _368, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _378 = _275 * _372;
        float _380 = _378 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _382 = _380 * 0.5;
        float _384 = _368 + _382;
        float _386 = fma(_157, _368, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _388 = fma(_155, _382, _374);
        float _390 = fma(_159, _382, _376);
        float _392 = -_285;
        float _394 = _384 * _392;
        float _396 = fma(_157, _382, _386);
        float _398 = -_394;
        float _400 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _402 = _398 + _400;
        float _404 = -_394;
        float _406 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _408 = _404 + _406;
        float _410 = fma(_394, (*spvDescriptorSet0.cp_c4)._m0[2].x, _388);
        float _412 = fma(_394, (*spvDescriptorSet0.cp_c4)._m0[2].y, _390);
        float _414 = _402 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _416 = precise::clamp(_414, 0.0, 1.0);
        float _418 = _408 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _420 = precise::clamp(_418, 0.0, 1.0);
        float _422 = fma(_394, (*spvDescriptorSet0.cp_c4)._m0[2].z, _396);
        bool _424 = _416 != 1.0;
        bool _426 = isnan(_416);
        bool _428 = _424 || _426;
        bool _430 = isnan(1.0);
        bool _432 = _428 || _430;
        bool _434 = _420 != 1.0;
        bool _436 = isnan(_420);
        bool _438 = _434 || _436;
        bool _440 = isnan(1.0);
        bool _442 = _438 || _440;
        float _444 = _318;
        float _446 = _324;
        float _448 = _326;
        float _450 = _320;
        float _452 = _322;
        float _454 = _376;
        float _456 = _336;
        float _458 = _338;
        if (!_432)
        {
            _444 = 1.0;
        }
        float _460 = _444;
        bool _462 = !_432;
        float _464 = _460;
        if (!_462)
        {
            float _466 = -_394;
            bool _468 = _466 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _470 = -_394;
            bool _472 = _470 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _474 = !_468;
            int _476 = _474 ? 0 : 1;
            int _478 = 2;
            if (!_468)
            {
                _478 = 1;
            }
            int _480 = _478;
            int _482 = _480;
            if (!_472)
            {
                _482 = _476;
            }
            int _484 = _482;
            int _486 = _484 << 6;
            float _488 = float(_484);
            int _490 = _486 + 304;
            uint _492 = uint(int(uint(_490) >> uint(2)));
            uint _494 = uint(int(uint(int(_492)) >> uint(2)));
            int _496 = int(_492) & 3;
            float _498 = (*spvDescriptorSet0.cp_c3)._m0[int(_494)][_496];
            int _500 = int(_492) + 1;
            uint _502 = uint(int(uint(_500) >> uint(2)));
            int _504 = _500 & 3;
            float _506 = (*spvDescriptorSet0.cp_c3)._m0[int(_502)][_504];
            int _508 = _486 + 312;
            uint _510 = uint(int(uint(_508) >> uint(2)));
            uint _512 = uint(int(uint(int(_510)) >> uint(2)));
            int _514 = int(_510) & 3;
            float _516 = (*spvDescriptorSet0.cp_c3)._m0[int(_512)][_514];
            int _518 = int(_510) + 1;
            uint _520 = uint(int(uint(_518) >> uint(2)));
            int _522 = _518 & 3;
            float _524 = (*spvDescriptorSet0.cp_c3)._m0[int(_520)][_522];
            int _526 = _486 + 256;
            uint _528 = uint(int(uint(_526) >> uint(2)));
            uint _530 = uint(int(uint(int(_528)) >> uint(2)));
            int _532 = int(_528) & 3;
            float _534 = (*spvDescriptorSet0.cp_c3)._m0[int(_530)][_532];
            int _536 = int(_528) + 1;
            uint _538 = uint(int(uint(_536) >> uint(2)));
            int _540 = _536 & 3;
            float _542 = (*spvDescriptorSet0.cp_c3)._m0[int(_538)][_540];
            int _544 = _486 + 288;
            uint _546 = uint(int(uint(_544) >> uint(2)));
            uint _548 = uint(int(uint(int(_546)) >> uint(2)));
            int _550 = int(_546) & 3;
            float _552 = (*spvDescriptorSet0.cp_c3)._m0[int(_548)][_550];
            int _554 = int(_546) + 1;
            uint _556 = uint(int(uint(_554) >> uint(2)));
            int _558 = _554 & 3;
            float _560 = (*spvDescriptorSet0.cp_c3)._m0[int(_556)][_558];
            int _562 = _486 + 272;
            uint _564 = uint(int(uint(_562) >> uint(2)));
            uint _566 = uint(int(uint(int(_564)) >> uint(2)));
            int _568 = int(_564) & 3;
            float _570 = (*spvDescriptorSet0.cp_c3)._m0[int(_566)][_568];
            int _572 = int(_564) + 1;
            uint _574 = uint(int(uint(_572) >> uint(2)));
            int _576 = _572 & 3;
            float _578 = (*spvDescriptorSet0.cp_c3)._m0[int(_574)][_576];
            int _580 = _486 + 296;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            uint _584 = uint(int(uint(int(_582)) >> uint(2)));
            int _586 = int(_582) & 3;
            float _588 = (*spvDescriptorSet0.cp_c3)._m0[int(_584)][_586];
            int _590 = int(_582) + 1;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            int _594 = _590 & 3;
            float _596 = (*spvDescriptorSet0.cp_c3)._m0[int(_592)][_594];
            int _598 = _486 + 264;
            uint _600 = uint(int(uint(_598) >> uint(2)));
            uint _602 = uint(int(uint(int(_600)) >> uint(2)));
            int _604 = int(_600) & 3;
            float _606 = (*spvDescriptorSet0.cp_c3)._m0[int(_602)][_604];
            int _608 = int(_600) + 1;
            uint _610 = uint(int(uint(_608) >> uint(2)));
            int _612 = _608 & 3;
            float _614 = (*spvDescriptorSet0.cp_c3)._m0[int(_610)][_612];
            float _616 = _412 * _506;
            float _618 = fma(_410, _498, _616);
            int _620 = _486 + 280;
            uint _622 = uint(int(uint(_620) >> uint(2)));
            uint _624 = uint(int(uint(int(_622)) >> uint(2)));
            int _626 = int(_622) & 3;
            float _628 = (*spvDescriptorSet0.cp_c3)._m0[int(_624)][_626];
            int _630 = int(_622) + 1;
            uint _632 = uint(int(uint(_630) >> uint(2)));
            int _634 = _630 & 3;
            float _636 = (*spvDescriptorSet0.cp_c3)._m0[int(_632)][_634];
            float _638 = fma(_422, _516, _618);
            float _640 = _638 + _524;
            float _642 = _412 * _542;
            float _644 = 1.0 / _640;
            float _646 = fma(_410, _534, _642);
            float _648 = _412 * _560;
            float _650 = rint(_488);
            float _652 = precise::max(_650, 0.0);
            uint _654 = uint(_652);
            uint _656 = clamp(_654, 0u, 65535u);
            float _658 = fma(_410, _552, _648);
            float _660 = _412 * _578;
            float _662 = fma(_410, _570, _660);
            float _664 = fma(_422, _588, _658);
            float _666 = _664 + _596;
            float _668 = fma(_422, _606, _646);
            float _670 = _666 * _644;
            float _672 = precise::clamp(_670, 0.0, 1.0);
            float _674 = _668 + _614;
            float _676 = fma(_422, _628, _662);
            float _678 = _674 * _644;
            float _680 = _676 + _636;
            float _682 = _680 * _644;
            float3 _3549 = float3(_678, _682, float(int(_656)));
            float3 _3553 = select(_3549, float3(0.0), isnan(_3549));
            float _684 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _3553.xy, uint(rint(_3553.z)), _672, level(0.0));
            float _686 = -_684;
            float _688 = _686 + 1.0;
            float _690 = fma(_688, _416, _684);
            _446 = _680;
            _464 = _690;
            _448 = _488;
            _450 = _646;
            _452 = _662;
        }
        float _692 = _446;
        float _694 = _464;
        float _696 = _448;
        float _698 = _450;
        float _700 = _452;
        float _702 = _696;
        float _704 = _692;
        float _706 = _698;
        float _708 = _700;
        if (!_442)
        {
            _702 = 1.0;
        }
        float _710 = _702;
        bool _712 = !_442;
        float _714 = _710;
        if (!_712)
        {
            float _716 = _412 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _718 = _412 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _720 = fma(_410, (*spvDescriptorSet0.cp_c3)._m0[130].x, _716);
            float _722 = fma(_410, (*spvDescriptorSet0.cp_c3)._m0[131].x, _718);
            float _724 = fma(_422, (*spvDescriptorSet0.cp_c3)._m0[130].z, _720);
            float _726 = fma(_422, (*spvDescriptorSet0.cp_c3)._m0[131].z, _722);
            float _728 = _724 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _730 = _726 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _732 = trunc(_728);
            int _734 = int(_732);
            float _736 = trunc(_730);
            int _738 = int(_736);
            int _740 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _742 = _734 + _740;
            int _744 = _742 + 1;
            bool _746 = _744 >= 0;
            int _748 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _750 = _738 + _748;
            int _752 = _750 + 1;
            bool _754 = _744 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _756 = !_746;
            bool _758 = _754 || _756;
            bool _760 = _752 < 0;
            bool _762 = _760 || _758;
            bool _764 = _752 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _766 = _764 || _762;
            _706 = _728;
            if (_766)
            {
                _704 = 1.0;
            }
            float _768 = _704;
            float _770 = _768;
            if (!_766)
            {
                int _772 = _752 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _774 = _772 + _744;
                float _776 = floor(_728);
                int _778 = _774 << 2;
                uint _780 = uint(int(uint(_774) >> uint(2)));
                int _782 = 12 & _778;
                float _784 = floor(_730);
                int _786 = _774 << 4;
                int _788 = _786 + 2112;
                int _790 = int(_780) << 4;
                int _792 = _790 + _782;
                uint _794 = uint(int(uint(_788) >> uint(2)));
                uint _796 = uint(int(uint(int(_794)) >> uint(2)));
                int _798 = int(_794) & 3;
                float _800 = (*spvDescriptorSet0.cp_c3)._m0[int(_796)][_798];
                int _802 = int(_794) + 1;
                uint _804 = uint(int(uint(_802) >> uint(2)));
                int _806 = _802 & 3;
                float _808 = (*spvDescriptorSet0.cp_c3)._m0[int(_804)][_806];
                float _810 = -_776;
                float _812 = _810 + _728;
                int _814 = _792 + 464;
                uint _816 = uint(int(uint(_814) >> uint(2)));
                uint _818 = uint(int(uint(int(_816)) >> uint(2)));
                int _820 = int(_816) & 3;
                float _822 = (*spvDescriptorSet0.cp_c3)._m0[int(_818)][_820];
                int _824 = _788 + 8;
                uint _826 = uint(int(uint(_824) >> uint(2)));
                uint _828 = uint(int(uint(int(_826)) >> uint(2)));
                int _830 = int(_826) & 3;
                float _832 = (*spvDescriptorSet0.cp_c3)._m0[int(_828)][_830];
                int _834 = int(_826) + 1;
                uint _836 = uint(int(uint(_834) >> uint(2)));
                int _838 = _834 & 3;
                float _840 = (*spvDescriptorSet0.cp_c3)._m0[int(_836)][_838];
                float _842 = _412 * _808;
                float _844 = fma(_410, _800, _842);
                float _846 = rint(_822);
                float _848 = precise::max(_846, 0.0);
                uint _850 = uint(_848);
                uint _852 = clamp(_850, 0u, 65535u);
                float _854 = fma(_422, _832, _844);
                float _856 = -_784;
                float _858 = _856 + _730;
                float _860 = _854 + _840;
                float _862 = precise::clamp(_860, 0.0, 1.0);
                float3 _3835 = float3(_812, _858, float(int(_852)));
                float3 _3837 = select(_3835, float3(0.0), isnan(_3835));
                float _864 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _3837.xy, uint(rint(_3837.z)), _862, level(0.0));
                _770 = _864;
            }
            float _866 = _770;
            float _868 = -_866;
            float _870 = _868 + 1.0;
            float _872 = fma(_870, _420, _866);
            _714 = _872;
        }
        float _874 = _714;
        float _876 = _706;
        float _878 = -_394;
        float _880 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _882 = _878 + _880;
        float _884 = -_394;
        float _886 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _888 = _884 + _886;
        float _890 = precise::min(_694, _874);
        float _892 = _882 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _894 = precise::clamp(_892, 0.0, 1.0);
        float _896 = _888 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _898 = precise::clamp(_896, 0.0, 1.0);
        float _900 = fma(_394, (*spvDescriptorSet0.cp_c4)._m0[3].x, _388);
        float _902 = fma(_394, (*spvDescriptorSet0.cp_c4)._m0[3].y, _390);
        float _904 = fma(_394, (*spvDescriptorSet0.cp_c4)._m0[3].z, _396);
        bool _906 = _894 != 1.0;
        bool _908 = isnan(_894);
        bool _910 = _906 || _908;
        bool _912 = isnan(1.0);
        bool _914 = _910 || _912;
        bool _916 = _898 != 1.0;
        bool _918 = isnan(_898);
        bool _920 = _916 || _918;
        bool _922 = isnan(1.0);
        bool _924 = _920 || _922;
        float _926 = _876;
        float _928 = _902;
        float _930 = _902;
        if (!_914)
        {
            _926 = 1.0;
        }
        float _932 = _926;
        bool _934 = !_914;
        float _936 = _932;
        if (!_934)
        {
            float _938 = -_394;
            bool _940 = _938 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _942 = -_394;
            bool _944 = _942 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _946 = !_940;
            int _948 = _946 ? 0 : 1;
            int _950 = 2;
            if (!_940)
            {
                _950 = 1;
            }
            int _952 = _950;
            int _954 = _952;
            if (!_944)
            {
                _954 = _948;
            }
            int _956 = _954;
            int _958 = _956 << 6;
            float _960 = float(_956);
            int _962 = _958 + 304;
            uint _964 = uint(int(uint(_962) >> uint(2)));
            uint _966 = uint(int(uint(int(_964)) >> uint(2)));
            int _968 = int(_964) & 3;
            float _970 = (*spvDescriptorSet0.cp_c3)._m0[int(_966)][_968];
            int _972 = int(_964) + 1;
            uint _974 = uint(int(uint(_972) >> uint(2)));
            int _976 = _972 & 3;
            float _978 = (*spvDescriptorSet0.cp_c3)._m0[int(_974)][_976];
            int _980 = _958 + 312;
            uint _982 = uint(int(uint(_980) >> uint(2)));
            uint _984 = uint(int(uint(int(_982)) >> uint(2)));
            int _986 = int(_982) & 3;
            float _988 = (*spvDescriptorSet0.cp_c3)._m0[int(_984)][_986];
            int _990 = int(_982) + 1;
            uint _992 = uint(int(uint(_990) >> uint(2)));
            int _994 = _990 & 3;
            float _996 = (*spvDescriptorSet0.cp_c3)._m0[int(_992)][_994];
            int _998 = _958 + 256;
            uint _1000 = uint(int(uint(_998) >> uint(2)));
            uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
            int _1004 = int(_1000) & 3;
            float _1006 = (*spvDescriptorSet0.cp_c3)._m0[int(_1002)][_1004];
            int _1008 = int(_1000) + 1;
            uint _1010 = uint(int(uint(_1008) >> uint(2)));
            int _1012 = _1008 & 3;
            float _1014 = (*spvDescriptorSet0.cp_c3)._m0[int(_1010)][_1012];
            int _1016 = _958 + 288;
            uint _1018 = uint(int(uint(_1016) >> uint(2)));
            uint _1020 = uint(int(uint(int(_1018)) >> uint(2)));
            int _1022 = int(_1018) & 3;
            float _1024 = (*spvDescriptorSet0.cp_c3)._m0[int(_1020)][_1022];
            int _1026 = int(_1018) + 1;
            uint _1028 = uint(int(uint(_1026) >> uint(2)));
            int _1030 = _1026 & 3;
            float _1032 = (*spvDescriptorSet0.cp_c3)._m0[int(_1028)][_1030];
            int _1034 = _958 + 272;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
            int _1040 = int(_1036) & 3;
            float _1042 = (*spvDescriptorSet0.cp_c3)._m0[int(_1038)][_1040];
            int _1044 = int(_1036) + 1;
            uint _1046 = uint(int(uint(_1044) >> uint(2)));
            int _1048 = _1044 & 3;
            float _1050 = (*spvDescriptorSet0.cp_c3)._m0[int(_1046)][_1048];
            int _1052 = _958 + 296;
            uint _1054 = uint(int(uint(_1052) >> uint(2)));
            uint _1056 = uint(int(uint(int(_1054)) >> uint(2)));
            int _1058 = int(_1054) & 3;
            float _1060 = (*spvDescriptorSet0.cp_c3)._m0[int(_1056)][_1058];
            int _1062 = int(_1054) + 1;
            uint _1064 = uint(int(uint(_1062) >> uint(2)));
            int _1066 = _1062 & 3;
            float _1068 = (*spvDescriptorSet0.cp_c3)._m0[int(_1064)][_1066];
            int _1070 = _958 + 264;
            uint _1072 = uint(int(uint(_1070) >> uint(2)));
            uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
            int _1076 = int(_1072) & 3;
            float _1078 = (*spvDescriptorSet0.cp_c3)._m0[int(_1074)][_1076];
            int _1080 = int(_1072) + 1;
            uint _1082 = uint(int(uint(_1080) >> uint(2)));
            int _1084 = _1080 & 3;
            float _1086 = (*spvDescriptorSet0.cp_c3)._m0[int(_1082)][_1084];
            float _1088 = _902 * _978;
            float _1090 = fma(_900, _970, _1088);
            int _1092 = _958 + 280;
            uint _1094 = uint(int(uint(_1092) >> uint(2)));
            uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
            int _1098 = int(_1094) & 3;
            float _1100 = (*spvDescriptorSet0.cp_c3)._m0[int(_1096)][_1098];
            int _1102 = int(_1094) + 1;
            uint _1104 = uint(int(uint(_1102) >> uint(2)));
            int _1106 = _1102 & 3;
            float _1108 = (*spvDescriptorSet0.cp_c3)._m0[int(_1104)][_1106];
            float _1110 = fma(_904, _988, _1090);
            float _1112 = _1110 + _996;
            float _1114 = _902 * _1014;
            float _1116 = 1.0 / _1112;
            float _1118 = fma(_900, _1006, _1114);
            float _1120 = _902 * _1032;
            float _1122 = rint(_960);
            float _1124 = precise::max(_1122, 0.0);
            uint _1126 = uint(_1124);
            uint _1128 = clamp(_1126, 0u, 65535u);
            float _1130 = fma(_900, _1024, _1120);
            float _1132 = _902 * _1050;
            float _1134 = fma(_900, _1042, _1132);
            float _1136 = fma(_904, _1060, _1130);
            float _1138 = _1136 + _1068;
            float _1140 = fma(_904, _1078, _1118);
            float _1142 = _1138 * _1116;
            float _1144 = precise::clamp(_1142, 0.0, 1.0);
            float _1146 = _1140 + _1086;
            float _1148 = fma(_904, _1100, _1134);
            float _1150 = _1146 * _1116;
            float _1152 = _1148 + _1108;
            float _1154 = _1152 * _1116;
            float3 _4292 = float3(_1150, _1154, float(int(_1128)));
            float3 _4294 = select(_4292, float3(0.0), isnan(_4292));
            float _1156 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _4294.xy, uint(rint(_4294.z)), _1144, level(0.0));
            float _1158 = -_1156;
            float _1160 = _1158 + 1.0;
            float _1162 = fma(_894, _1160, _1156);
            _708 = _1134;
            _936 = _1162;
        }
        float _1164 = _708;
        float _1166 = _936;
        float _1168 = precise::min(_890, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1170 = _1164;
        if (!_924)
        {
            _1170 = 1.0;
        }
        float _1172 = _1170;
        bool _1174 = !_924;
        float _1176 = _1172;
        if (!_1174)
        {
            float _1178 = _902 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1180 = _902 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1182 = fma(_900, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1178);
            float _1184 = fma(_900, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1180);
            float _1186 = fma(_904, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1182);
            float _1188 = fma(_904, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1184);
            float _1190 = _1186 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1192 = _1188 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1194 = trunc(_1190);
            int _1196 = int(_1194);
            float _1198 = trunc(_1192);
            int _1200 = int(_1198);
            int _1202 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1204 = _1196 + _1202;
            int _1206 = _1204 + 1;
            bool _1208 = _1206 >= 0;
            int _1210 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1212 = _1200 + _1210;
            int _1214 = _1212 + 1;
            bool _1216 = _1206 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1218 = !_1208;
            bool _1220 = _1216 || _1218;
            bool _1222 = _1214 < 0;
            bool _1224 = _1222 || _1220;
            bool _1226 = _1214 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1228 = _1226 || _1224;
            float _1230 = as_type<float>(_1200);
            if (_1228)
            {
                _1230 = 1.0;
            }
            float _1232 = _1230;
            float _1234 = _1232;
            if (!_1228)
            {
                int _1236 = _1214 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1238 = _1236 + _1206;
                float _1240 = floor(_1190);
                int _1242 = _1238 << 2;
                uint _1244 = uint(int(uint(_1238) >> uint(2)));
                int _1246 = 12 & _1242;
                float _1248 = floor(_1192);
                int _1250 = _1238 << 4;
                int _1252 = _1250 + 2112;
                int _1254 = int(_1244) << 4;
                int _1256 = _1254 + _1246;
                uint _1258 = uint(int(uint(_1252) >> uint(2)));
                uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
                int _1262 = int(_1258) & 3;
                float _1264 = (*spvDescriptorSet0.cp_c3)._m0[int(_1260)][_1262];
                int _1266 = int(_1258) + 1;
                uint _1268 = uint(int(uint(_1266) >> uint(2)));
                int _1270 = _1266 & 3;
                float _1272 = (*spvDescriptorSet0.cp_c3)._m0[int(_1268)][_1270];
                float _1274 = -_1240;
                float _1276 = _1190 + _1274;
                int _1278 = _1256 + 464;
                uint _1280 = uint(int(uint(_1278) >> uint(2)));
                uint _1282 = uint(int(uint(int(_1280)) >> uint(2)));
                int _1284 = int(_1280) & 3;
                float _1286 = (*spvDescriptorSet0.cp_c3)._m0[int(_1282)][_1284];
                int _1288 = _1252 + 8;
                uint _1290 = uint(int(uint(_1288) >> uint(2)));
                uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
                int _1294 = int(_1290) & 3;
                float _1296 = (*spvDescriptorSet0.cp_c3)._m0[int(_1292)][_1294];
                int _1298 = int(_1290) + 1;
                uint _1300 = uint(int(uint(_1298) >> uint(2)));
                int _1302 = _1298 & 3;
                float _1304 = (*spvDescriptorSet0.cp_c3)._m0[int(_1300)][_1302];
                float _1306 = _902 * _1272;
                float _1308 = fma(_900, _1264, _1306);
                float _1310 = rint(_1286);
                float _1312 = precise::max(_1310, 0.0);
                uint _1314 = uint(_1312);
                uint _1316 = clamp(_1314, 0u, 65535u);
                float _1318 = fma(_904, _1296, _1308);
                float _1320 = -_1248;
                float _1322 = _1192 + _1320;
                float _1324 = _1318 + _1304;
                float _1326 = precise::clamp(_1324, 0.0, 1.0);
                float3 _4567 = float3(_1276, _1322, float(int(_1316)));
                float3 _4569 = select(_4567, float3(0.0), isnan(_4567));
                float _1328 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _4569.xy, uint(rint(_4569.z)), _1326, level(0.0));
                _1234 = _1328;
                _928 = _1306;
            }
            float _1330 = _1234;
            float _1332 = _928;
            float _1334 = -_1330;
            float _1336 = _1334 + 1.0;
            float _1338 = fma(_898, _1336, _1330);
            _1176 = _1338;
            _930 = _1332;
        }
        float _1340 = _1176;
        float _1342 = _930;
        float _1344 = fma(_155, _380, _374);
        float _1346 = fma(_157, _380, _386);
        float _1348 = fma(_1344, 6.2500002968590706586837768554688e-05, 0.5);
        float _1350 = fma(_1346, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _4607 = float2(_1348, _1350);
        float3 _1354 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_4607, float2(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_4607, float2(0.0), isnan(_4607)), level(0.0)).xyz;
        float _1356 = _1354.x;
        float _1358 = _1354.y;
        float _1360 = _1354.z;
        float2 _4623 = float2(_1348, _1350);
        float _1362 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4623, float2(0.0), isnan(_4623)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4623, float2(0.0), isnan(_4623)), level(0.0)).x;
        float3 _4632 = float3(_1348, _1350, float(0));
        float3 _4634 = select(_4632, float3(0.0), isnan(_4632));
        float4 _1365 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4634.xy, uint(rint(_4634.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4634.xy, uint(rint(_4634.z)), level(0.0)).xyzw;
        float _1367 = _1365.x;
        float _1369 = _1365.y;
        float _1371 = _1365.z;
        float _1373 = _1365.w;
        float3 _4649 = float3(_1348, _1350, float(1));
        float3 _4651 = select(_4649, float3(0.0), isnan(_4649));
        float4 _1375 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4651.xy, uint(rint(_4651.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4651.xy, uint(rint(_4651.z)), level(0.0)).xyzw;
        float _1377 = _1375.x;
        float _1379 = _1375.y;
        float _1381 = _1375.z;
        float _1383 = _1375.w;
        float3 _4666 = float3(_1348, _1350, float(2));
        float3 _4668 = select(_4666, float3(0.0), isnan(_4666));
        float4 _1385 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4668.xy, uint(rint(_4668.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4668.xy, uint(rint(_4668.z)), level(0.0)).xyzw;
        float _1387 = _1385.x;
        float _1389 = _1385.y;
        float _1391 = _1385.z;
        float _1393 = _1385.w;
        float _1395 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _1397 = _1346 + _1395;
        float _1399 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _1401 = _1344 + _1399;
        float _1403 = precise::min(_1340, _1166);
        float _1405 = _159 * 1.02332699298858642578125;
        float _1407 = _1397 * _1397;
        float _1409 = _157 * 1.02332699298858642578125;
        float _1411 = precise::min(_1403, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1413 = _155 * 1.02332699298858642578125;
        float _1415 = fma(_1401, _1401, _1407);
        float _1417 = _1168 + _1411;
        float _1419 = sqrt(_1415);
        bool _1421 = _1419 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _1423 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _1425 = _1419 + _1423;
        float _1427 = _904;
        float _1429 = _1425;
        float _1431 = _1342;
        float _1433 = 0.0;
        float _1435 = _1340;
        float _1437 = _1417;
        if (_1421)
        {
            float _1439 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _1427 = _1439;
        }
        float _1441 = _1427;
        if (_1421)
        {
            float _1443 = _1425 * _1441;
            _1429 = _1443;
        }
        float _1445 = _1429;
        if (_1421)
        {
            float _1447 = _1445 * 0.15915493667125701904296875;
            _1431 = _1447;
        }
        float _1449 = _1431;
        float _1451 = _159 * _380;
        float _1453 = _1397;
        if (_1421)
        {
            float _1455 = _1449 * 6.283185482025146484375;
            float _1457 = cos(_1455);
            _1453 = _1457;
        }
        float _1459 = _1453;
        float _1461 = _376 + _1451;
        if (!_1421)
        {
            _454 = _1461;
        }
        float _1463 = _454;
        float _1465 = _1463;
        if (_1421)
        {
            float _1467 = _1459 + (-1.0);
            _1433 = _1467;
        }
        float _1469 = _1433;
        if (_1421)
        {
            float _1471 = _1469 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _1435 = _1471;
        }
        float _1473 = _1435;
        if (_1421)
        {
            float _1475 = fma(_1461, _1459, _1473);
            _1465 = _1475;
        }
        float _1477 = _1465;
        float _1479 = _364 + _372;
        float _1481 = abs(_1451);
        bool _1483 = _1481 > 0.00999999977648258209228515625;
        float _1485 = _275 * _1479;
        float _1487 = -_1477;
        float _1489 = fma(_1461, 2.0, _1487);
        float _1491 = _1485 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _1493 = fma(_1358, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _1495 = fma(_1491, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _1497 = precise::clamp(_1495, 0.0, 1.0);
        float _1499 = fma(_289, -0.5, 0.5);
        float _1501 = _1373 * _1405;
        float _1503 = _1493 * 100.0;
        float _1505 = -_1497;
        float _1507 = _1505 + 1.0;
        float _1509 = _1493 * 5115.0;
        float _1511 = 1.0 / _1493;
        float _1513 = fma(_1367, 0.88622701168060302734375, _1501);
        float _1515 = _1377 * _1405;
        float _1517 = _1379 * _1405;
        float _1519 = fma(_1381, _1409, _1513);
        float _1521 = fma(_1369, 0.88622701168060302734375, _1515);
        float _1523 = fma(_1371, 0.88622701168060302734375, _1517);
        float _1525 = exp2(_1503);
        float _1527 = fma(_1383, _1409, _1521);
        float _1529 = abs(_1507);
        float _1531 = log2(_1529);
        float _1533 = fma(_1387, _1409, _1523);
        float _1535 = fma(_1389, _1413, _1519);
        float _1537 = fma(_1391, _1413, _1527);
        float _1539 = fma(_1525, 512.0, -512.0);
        float _1541 = 1.0 / _1539;
        float _1543 = fma(_1362, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _1545 = _1483 ? _1451 : 0.00999999977648258209228515625;
        float _1547 = _283 + 1.0;
        float _1549 = -_1543;
        float _1551 = _1549 + _1489;
        float _1553 = _1493 * _1545;
        float _1555 = sqrt(_1499);
        float _1557 = fma(_289, 0.5, 0.5);
        float _1559 = precise::max(0.0, _1551);
        float _1561 = _1509 * _1541;
        float _1563 = _1531 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _1565 = exp2(_1563);
        float _1567 = _1555 * 0.636619746685028076171875;
        float _1569 = log2(_1561);
        float _1571 = -_283;
        float _1573 = fma(_1565, _1547, _1571);
        float _1575 = precise::max(_1553, -127.0);
        float _1577 = 1.0 / _1575;
        float _1579 = fma(_1569, _1511, 100.0);
        float _1581 = -_1579;
        float _1583 = _1581 + _1559;
        float _1585 = fma(_1573, 0.5, 0.5);
        float _1587 = -_1575;
        float _1589 = exp2(_1587);
        float _1591 = _1493 * _1583;
        float _1593 = fma(_1557, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _1595 = fma(_1557, _1593, -0.212114393711090087890625);
        float _1597 = -_1591;
        float _1599 = exp2(_1597);
        float3 _4985 = float3(_1348, _1350, float(3));
        float3 _4987 = select(_4985, float3(0.0), isnan(_4985));
        float4 _1601 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4987.xy, uint(rint(_4987.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4987.xy, uint(rint(_4987.z)), level(0.0)).xyzw;
        float _1603 = _1601.x;
        float _1605 = _1601.y;
        float _1607 = _1601.z;
        float _1609 = _1601.w;
        float3 _5002 = float3(_1348, _1350, float(6));
        float3 _5004 = select(_5002, float3(0.0), isnan(_5002));
        float4 _1611 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _5004.xy, uint(rint(_5004.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _5004.xy, uint(rint(_5004.z)), level(0.0)).xyzw;
        float _1613 = _1611.x;
        float _1615 = _1611.y;
        float _1617 = _1611.z;
        float _1619 = _1611.w;
        float3 _5019 = float3(_1348, _1350, float(4));
        float3 _5021 = select(_5019, float3(0.0), isnan(_5019));
        float4 _1621 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _5021.xy, uint(rint(_5021.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _5021.xy, uint(rint(_5021.z)), level(0.0)).xyzw;
        float _1623 = _1621.x;
        float _1625 = _1621.y;
        float _1627 = _1621.z;
        float _1629 = _1621.w;
        float _1631 = fma(_1557, _1595, 1.570728778839111328125);
        float _1633 = -_1589;
        float _1635 = _1633 + 1.0;
        float _1637 = -_1631;
        float _1639 = fma(_1567, _1637, 1.0);
        float _1641 = _1599 * _1635;
        float _1643 = _1641 * _1577;
        float3 _5056 = float3(_1348, _1350, float(7));
        float3 _5058 = select(_5056, float3(0.0), isnan(_5056));
        float4 _1645 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _5058.xy, uint(rint(_5058.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _5058.xy, uint(rint(_5058.z)), level(0.0)).xyzw;
        float _1647 = _1645.x;
        float _1649 = _1645.y;
        float _1651 = _1645.z;
        float _1653 = _1645.w;
        float3 _5074 = float3(_1348, _1350, float(5));
        float3 _5076 = select(_5074, float3(0.0), isnan(_5074));
        float4 _1655 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _5076.xy, uint(rint(_5076.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _5076.xy, uint(rint(_5076.z)), level(0.0)).xyzw;
        float _1657 = _1655.x;
        float _1659 = _1655.y;
        float _1661 = _1655.z;
        float _1663 = _1655.w;
        float2 _5090 = float2(_1348, _1350);
        float3 _1665 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_5090, float2(0.0), isnan(_5090)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_5090, float2(0.0), isnan(_5090)), level(0.0)).xyz;
        float _1667 = _1665.x;
        float _1669 = _1665.y;
        float _1671 = _1665.z;
        float2 _5104 = float2(_1639, _1585);
        float3 _1673 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_5104, float2(0.0), isnan(_5104)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_5104, float2(0.0), isnan(_5104)), level(0.0)).xyz;
        float _1675 = _1673.x;
        float _1677 = _1673.y;
        float _1679 = _1673.z;
        float _1681 = fma(_1393, _1413, _1533);
        float _1683 = precise::max(0.0, _1535);
        float _1685 = _1531 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _1687 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _1689 = precise::max(0.0, _1537);
        bool _1691 = as_type<int>(_101) != 0;
        float _1693 = _1683 * _1687;
        float _1695 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _1697 = _1360 * 2.0;
        float _1699 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _1701 = exp2(_1685);
        float _1703 = _1689 * _1695;
        float _1705 = fma(_1360, _1360, 1.0);
        float _1707 = -_1697;
        float _1709 = fma(_289, _1707, _1705);
        float _1711 = -_1697;
        float _1713 = _1705 + _1711;
        float _1715 = abs(_1709);
        float _1717 = log2(_1715);
        float _1719 = abs(_1713);
        float _1721 = log2(_1719);
        float _1723 = _1717 * 1.5;
        float _1725 = exp2(_1723);
        float _1727 = _1721 * 1.5;
        float _1729 = -_1360;
        float _1731 = fma(_1729, _1360, 1.0);
        float _1733 = exp2(_1727);
        float _1735 = _1725 * 12.56637096405029296875;
        float _1737 = 1.0 / _1735;
        float _1739 = _1733 * 12.56637096405029296875;
        float _1741 = 1.0 / _1739;
        float _1743 = _1731 * _1737;
        float _1745 = _1731 * _1741;
        float _1747 = fma(_1356, -0.99447572231292724609375, 1.0);
        float _1749 = log2(_1747);
        float _1751 = _1749 * (-0.0199999995529651641845703125);
        float _1753 = _380 * _1751;
        float _1755 = precise::max(0.0, _1681);
        float _1757 = _1643 * _1753;
        float _1759 = 1.0 / _380;
        float _1761 = _1755 * _1699;
        float _1763 = _1609 * _1405;
        float _1765 = _1615 * _1405;
        float _1767 = _1623 * _1405;
        float _1769 = _1625 * _1405;
        float _1771 = fma(_1603, 0.88622701168060302734375, _1763);
        float _1773 = fma(_1613, 0.88622701168060302734375, _1765);
        float _1775 = fma(_1605, 0.88622701168060302734375, _1767);
        float _1777 = fma(_1607, 0.88622701168060302734375, _1769);
        float _1779 = fma(_1627, _1409, _1771);
        float _1781 = fma(_1617, _1409, _1773);
        float _1783 = fma(_1629, _1409, _1775);
        float _1785 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _1787 = _1491 + _1785;
        float _1789 = _1775;
        float _1791 = _1619;
        float _1793 = _1777;
        if (_1691)
        {
            _1789 = as_type<float>(_328);
        }
        int _1795 = as_type<int>(_1789);
        float _1797 = fma(_1619, _1413, _1781);
        int _1799 = _1795;
        if (_1691)
        {
            _1791 = as_type<float>(_330);
        }
        int _1801 = as_type<int>(_1791);
        float _1803 = _1787 * _1759;
        float _1805 = precise::clamp(_1803, 0.0, 1.0);
        float _1807 = _1797 * 0.31830990314483642578125;
        float _1809 = precise::clamp(_1807, 0.0, 1.0);
        float _1811 = _1757 * _1805;
        float _1813 = _1649 * _1405;
        float _1815 = precise::min(_1809, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1817 = fma(_1657, _1409, _1777);
        float _1819 = fma(_1659, _1413, _1779);
        float _1821 = fma(_1647, 0.88622701168060302734375, _1813);
        float _1823 = fma(_1661, _1413, _1783);
        float _1825 = _1815 * 0.88622701168060302734375;
        float _1827 = fma(_1663, _1413, _1817);
        float _1829 = fma(_1651, _1409, _1821);
        float _1831 = precise::max(0.0, _1819);
        float _1833 = fma(_1825, (*spvDescriptorSet0.cp_c3)._m0[9].x, _1693);
        float _1835 = precise::max(0.0, _1823);
        float _1837 = fma(_1653, _1413, _1829);
        float _1839 = fma(_1825, (*spvDescriptorSet0.cp_c3)._m0[9].y, _1703);
        float _1841 = precise::max(0.0, _1827);
        float _1843 = fma(_1825, (*spvDescriptorSet0.cp_c3)._m0[9].z, _1761);
        float _1845 = _1837 * 0.31830990314483642578125;
        float _1847 = precise::clamp(_1845, 0.0, 1.0);
        int _1849 = _1801;
        if (_1691)
        {
            _1793 = _332;
        }
        float _1851 = _1793;
        float _1853 = _1847 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _1855 = precise::clamp(_1853, 0.0, 1.0);
        float _1857 = fma(_1831, _1855, _1833);
        float _1859 = _1417 * 0.5;
        float _1861 = fma(_1835, _1855, _1839);
        float _1863 = fma(_1841, _1855, _1843);
        float _1865 = _1857 * _1745;
        float _1867 = _1859 * _1743;
        float _1869 = _1861 * _1745;
        float _1871 = _1863 * _1745;
        float _1873 = _380 * _1859;
        float _1875 = fma(_1867, (*spvDescriptorSet0.cp_c3)._m0[7].x, _1865);
        float _1877 = fma(_1867, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1869);
        float _1879 = fma(_1867, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1871);
        float _1881 = -_1701;
        float _1883 = _1881 + 1.0;
        float _1885 = _1859 * _1675;
        float _1887 = _1669 * _1877;
        float _1889 = _1859 * _1677;
        float _1891 = _1667 * _1875;
        float _1893 = _1671 * _1879;
        int _1895 = _291 + as_type<int>(_101);
        float _1897 = _1859 * _1679;
        float _1899 = _1883 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _1901 = _1879;
        float _1903 = _1855;
        float _1905 = _1851;
        if (_1691)
        {
            _1901 = as_type<float>(_334);
        }
        int _1907 = as_type<int>(_1901);
        int _1909 = _1895 << 2;
        int _1911 = _1909 + 1024;
        uint _1913 = uint(int(uint(_1911) >> uint(2)));
        _26[int(_1913)] = as_type<uint>(_1873);
        int _1915 = _1895 << 4;
        int _1917 = _1915 + 1280;
        uint _1919 = uint(int(uint(_1917) >> uint(2)));
        _26[int(_1919)] = as_type<uint>(_1891);
        int _1921 = _1915 + 1284;
        uint _1923 = uint(int(uint(_1921) >> uint(2)));
        _26[int(_1923)] = as_type<uint>(_1887);
        int _1925 = _1915 + 1288;
        uint _1927 = uint(int(uint(_1925) >> uint(2)));
        _26[int(_1927)] = as_type<uint>(_1893);
        int _1929 = _1915 + 1292;
        uint _1931 = uint(int(uint(_1929) >> uint(2)));
        _26[int(_1931)] = as_type<uint>(_1811);
        int _1933 = _1895 << 4;
        uint _1935 = uint(int(uint(_1933) >> uint(2)));
        _26[int(_1935)] = as_type<uint>(_1885);
        int _1937 = _1933 + 4;
        uint _1939 = uint(int(uint(_1937) >> uint(2)));
        _26[int(_1939)] = as_type<uint>(_1889);
        int _1941 = _1933 + 8;
        uint _1943 = uint(int(uint(_1941) >> uint(2)));
        _26[int(_1943)] = as_type<uint>(_1897);
        int _1945 = _1933 + 12;
        uint _1947 = uint(int(uint(_1945) >> uint(2)));
        _26[int(_1947)] = as_type<uint>(_1899);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1949 = _1907;
        if (!_1691)
        {
            int _1951 = _291 << 4;
            int _1953 = _1951 + 1280;
            uint _1955 = uint(int(uint(_1953) >> uint(2)));
            float _1957 = as_type<float>(_26[int(_1955)]);
            int _1959 = _1951 + 1284;
            uint _1961 = uint(int(uint(_1959) >> uint(2)));
            float _1963 = as_type<float>(_26[int(_1961)]);
            int _1965 = _1951 + 1288;
            uint _1967 = uint(int(uint(_1965) >> uint(2)));
            float _1969 = as_type<float>(_26[int(_1967)]);
            int _1971 = _1951 + 1292;
            uint _1973 = uint(int(uint(_1971) >> uint(2)));
            float _1975 = as_type<float>(_26[int(_1973)]);
            int _1977 = _291 << 4;
            int _1979 = _1977 + 1296;
            uint _1981 = uint(int(uint(_1979) >> uint(2)));
            float _1983 = as_type<float>(_26[int(_1981)]);
            int _1985 = _1977 + 1300;
            uint _1987 = uint(int(uint(_1985) >> uint(2)));
            float _1989 = as_type<float>(_26[int(_1987)]);
            int _1991 = _1977 + 1304;
            uint _1993 = uint(int(uint(_1991) >> uint(2)));
            float _1995 = as_type<float>(_26[int(_1993)]);
            int _1997 = _1977 + 1308;
            uint _1999 = uint(int(uint(_1997) >> uint(2)));
            float _2001 = as_type<float>(_26[int(_1999)]);
            int _2003 = _291 << 4;
            uint _2005 = uint(int(uint(_2003) >> uint(2)));
            float _2007 = as_type<float>(_26[int(_2005)]);
            int _2009 = _2003 + 4;
            uint _2011 = uint(int(uint(_2009) >> uint(2)));
            float _2013 = as_type<float>(_26[int(_2011)]);
            int _2015 = _2003 + 8;
            uint _2017 = uint(int(uint(_2015) >> uint(2)));
            float _2019 = as_type<float>(_26[int(_2017)]);
            int _2021 = _2003 + 12;
            uint _2023 = uint(int(uint(_2021) >> uint(2)));
            float _2025 = as_type<float>(_26[int(_2023)]);
            int _2027 = _291 << 4;
            int _2029 = _2027 + 1312;
            uint _2031 = uint(int(uint(_2029) >> uint(2)));
            float _2033 = as_type<float>(_26[int(_2031)]);
            int _2035 = _2027 + 1316;
            uint _2037 = uint(int(uint(_2035) >> uint(2)));
            float _2039 = as_type<float>(_26[int(_2037)]);
            int _2041 = _2027 + 1320;
            uint _2043 = uint(int(uint(_2041) >> uint(2)));
            float _2045 = as_type<float>(_26[int(_2043)]);
            int _2047 = _2027 + 1324;
            uint _2049 = uint(int(uint(_2047) >> uint(2)));
            float _2051 = as_type<float>(_26[int(_2049)]);
            int _2053 = _291 << 4;
            int _2055 = _2053 + 16;
            uint _2057 = uint(int(uint(_2055) >> uint(2)));
            float _2059 = as_type<float>(_26[int(_2057)]);
            int _2061 = _2053 + 20;
            uint _2063 = uint(int(uint(_2061) >> uint(2)));
            float _2065 = as_type<float>(_26[int(_2063)]);
            int _2067 = _2053 + 24;
            uint _2069 = uint(int(uint(_2067) >> uint(2)));
            float _2071 = as_type<float>(_26[int(_2069)]);
            int _2073 = _2053 + 28;
            uint _2075 = uint(int(uint(_2073) >> uint(2)));
            float _2077 = as_type<float>(_26[int(_2075)]);
            int _2079 = _291 << 4;
            int _2081 = _2079 + 1328;
            uint _2083 = uint(int(uint(_2081) >> uint(2)));
            float _2085 = as_type<float>(_26[int(_2083)]);
            int _2087 = _2079 + 1332;
            uint _2089 = uint(int(uint(_2087) >> uint(2)));
            float _2091 = as_type<float>(_26[int(_2089)]);
            int _2093 = _2079 + 1336;
            uint _2095 = uint(int(uint(_2093) >> uint(2)));
            float _2097 = as_type<float>(_26[int(_2095)]);
            int _2099 = _2079 + 1340;
            uint _2101 = uint(int(uint(_2099) >> uint(2)));
            float _2103 = as_type<float>(_26[int(_2101)]);
            float _2105 = _332 + _1975;
            float _2107 = -_2105;
            float _2109 = exp2(_2107);
            float _2111 = _2105 + _2001;
            float _2113 = -_1957;
            float _2115 = _2113 + _2007;
            float _2117 = -_1963;
            float _2119 = _2117 + _2013;
            float _2121 = -_1969;
            float _2123 = _2121 + _2019;
            float _2125 = -_2111;
            float _2127 = exp2(_2125);
            float _2129 = _2111 + _2051;
            float _2131 = -_1989;
            float _2133 = _2131 + _2065;
            float _2135 = -_1983;
            float _2137 = _2135 + _2059;
            float _2139 = -_1995;
            float _2141 = _2139 + _2071;
            float _2143 = -_2109;
            float _2145 = _2143 + 1.0;
            float _2147 = -_2129;
            float _2149 = exp2(_2147);
            int _2151 = _291 << 4;
            int _2153 = _2151 + 32;
            uint _2155 = uint(int(uint(_2153) >> uint(2)));
            float _2157 = as_type<float>(_26[int(_2155)]);
            int _2159 = _2151 + 36;
            uint _2161 = uint(int(uint(_2159) >> uint(2)));
            float _2163 = as_type<float>(_26[int(_2161)]);
            int _2165 = _2151 + 40;
            uint _2167 = uint(int(uint(_2165) >> uint(2)));
            float _2169 = as_type<float>(_26[int(_2167)]);
            int _2171 = _2151 + 44;
            uint _2173 = uint(int(uint(_2171) >> uint(2)));
            float _2175 = as_type<float>(_26[int(_2173)]);
            float _2177 = _2129 + _2103;
            float _2179 = precise::min(_2145, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2181 = -_2127;
            float _2183 = _2181 + 1.0;
            float _2185 = -_336;
            float _2187 = _2179 + _2185;
            float _2189 = precise::min(_2183, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2191 = _2187 * _2025;
            float _2193 = _2119 * _2191;
            float _2195 = _2115 * _2191;
            float _2197 = _2123 * _2191;
            float _2199 = fma(_1963, _2187, _2193);
            float _2201 = -_2179;
            float _2203 = _2201 + _2189;
            float _2205 = fma(_1957, _2187, _2195);
            float _2207 = fma(_1969, _2187, _2197);
            float _2209 = _2199 + as_type<float>(_330);
            float _2211 = _2203 * _2077;
            float _2213 = -_2149;
            float _2215 = _2213 + 1.0;
            int _2217 = _291 << 4;
            int _2219 = _2217 + 48;
            uint _2221 = uint(int(uint(_2219) >> uint(2)));
            float _2223 = as_type<float>(_26[int(_2221)]);
            int _2225 = _2217 + 52;
            uint _2227 = uint(int(uint(_2225) >> uint(2)));
            float _2229 = as_type<float>(_26[int(_2227)]);
            int _2231 = _2217 + 56;
            uint _2233 = uint(int(uint(_2231) >> uint(2)));
            float _2235 = as_type<float>(_26[int(_2233)]);
            int _2237 = _2217 + 60;
            uint _2239 = uint(int(uint(_2237) >> uint(2)));
            float _2241 = as_type<float>(_26[int(_2239)]);
            float _2243 = _2205 + as_type<float>(_334);
            float _2245 = _2133 * _2211;
            float _2247 = _2137 * _2211;
            int _2249 = _291 << 2;
            int _2251 = _2249 + 1024;
            uint _2253 = uint(int(uint(_2251) >> uint(2)));
            float _2255 = as_type<float>(_26[int(_2253)]);
            float _2257 = _2141 * _2211;
            float _2259 = precise::min(_2215, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2261 = fma(_1983, _2203, _2247);
            int _2263 = _291 << 2;
            int _2265 = _2263 + 1028;
            uint _2267 = uint(int(uint(_2265) >> uint(2)));
            float _2269 = as_type<float>(_26[int(_2267)]);
            float _2271 = fma(_1989, _2203, _2245);
            float _2273 = -_2177;
            float _2275 = exp2(_2273);
            float _2277 = fma(_1995, _2203, _2257);
            int _2279 = _291 << 2;
            int _2281 = _2279 + 1032;
            uint _2283 = uint(int(uint(_2281) >> uint(2)));
            float _2285 = as_type<float>(_26[int(_2283)]);
            float _2287 = -_2033;
            float _2289 = _2287 + _2157;
            float _2291 = -_2189;
            float _2293 = _2291 + _2259;
            float _2295 = -_2039;
            float _2297 = _2295 + _2163;
            int _2299 = _291 << 2;
            int _2301 = _2299 + 1036;
            uint _2303 = uint(int(uint(_2301) >> uint(2)));
            float _2305 = as_type<float>(_26[int(_2303)]);
            float _2307 = -_2045;
            float _2309 = _2307 + _2169;
            float _2311 = _2293 * _2175;
            float _2313 = _2207 + as_type<float>(_328);
            float _2315 = _2297 * _2311;
            float _2317 = _2289 * _2311;
            float _2319 = _2309 * _2311;
            float _2321 = _2313 + _2277;
            float _2323 = -_2275;
            float _2325 = _2323 + 1.0;
            float _2327 = fma(_2033, _2293, _2317);
            float _2329 = fma(_2045, _2293, _2319);
            float _2331 = _2243 + _2261;
            float _2333 = fma(_2039, _2293, _2315);
            float _2335 = precise::min(_2325, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2337 = _2321 + _2329;
            float _2339 = _2331 + _2327;
            float _2341 = _2209 + _2271;
            int _2343 = _291 << 4;
            int _2345 = _2343 + 1280;
            uint _2347 = uint(int(uint(_2345) >> uint(2)));
            _26[int(_2347)] = as_type<uint>(_2243);
            int _2349 = _2343 + 1284;
            uint _2351 = uint(int(uint(_2349) >> uint(2)));
            _26[int(_2351)] = as_type<uint>(_2209);
            int _2353 = _2343 + 1288;
            uint _2355 = uint(int(uint(_2353) >> uint(2)));
            _26[int(_2355)] = as_type<uint>(_2313);
            int _2357 = _2343 + 1292;
            uint _2359 = uint(int(uint(_2357) >> uint(2)));
            _26[int(_2359)] = as_type<uint>(_2105);
            float _2361 = -_2259;
            float _2363 = _2335 + _2361;
            float _2365 = _2341 + _2333;
            int _2367 = _291 << 4;
            int _2369 = _2367 + 1296;
            uint _2371 = uint(int(uint(_2369) >> uint(2)));
            _26[int(_2371)] = as_type<uint>(_2331);
            int _2373 = _2367 + 1300;
            uint _2375 = uint(int(uint(_2373) >> uint(2)));
            _26[int(_2375)] = as_type<uint>(_2341);
            int _2377 = _2367 + 1304;
            uint _2379 = uint(int(uint(_2377) >> uint(2)));
            _26[int(_2379)] = as_type<uint>(_2321);
            int _2381 = _2367 + 1308;
            uint _2383 = uint(int(uint(_2381) >> uint(2)));
            _26[int(_2383)] = as_type<uint>(_2111);
            float _2385 = -_2085;
            float _2387 = _2385 + _2223;
            float _2389 = _2363 * _2241;
            float _2391 = -_2091;
            float _2393 = _2391 + _2229;
            float _2395 = -_2097;
            float _2397 = _2395 + _2235;
            float _2399 = _2255 + _338;
            float _2401 = _2387 * _2389;
            float _2403 = _2393 * _2389;
            float _2405 = _2397 * _2389;
            float _2407 = _2399 + _2269;
            float _2409 = fma(_2085, _2363, _2401);
            float _2411 = fma(_2091, _2363, _2403);
            float _2413 = fma(_2097, _2363, _2405);
            float _2415 = _2407 + _2285;
            float _2417 = _2409 + _2339;
            float _2419 = _2411 + _2365;
            float _2421 = _2413 + _2337;
            float _2423 = _2415 + _2305;
            int _2425 = _291 << 4;
            int _2427 = _2425 + 1312;
            uint _2429 = uint(int(uint(_2427) >> uint(2)));
            _26[int(_2429)] = as_type<uint>(_2339);
            int _2431 = _2425 + 1316;
            uint _2433 = uint(int(uint(_2431) >> uint(2)));
            _26[int(_2433)] = as_type<uint>(_2365);
            int _2435 = _2425 + 1320;
            uint _2437 = uint(int(uint(_2435) >> uint(2)));
            _26[int(_2437)] = as_type<uint>(_2337);
            int _2439 = _2425 + 1324;
            uint _2441 = uint(int(uint(_2439) >> uint(2)));
            _26[int(_2441)] = as_type<uint>(_2129);
            int _2443 = _291 << 2;
            int _2445 = _2443 + 1024;
            uint _2447 = uint(int(uint(_2445) >> uint(2)));
            _26[int(_2447)] = as_type<uint>(_2399);
            int _2449 = _291 << 2;
            int _2451 = _2449 + 1028;
            uint _2453 = uint(int(uint(_2451) >> uint(2)));
            _26[int(_2453)] = as_type<uint>(_2407);
            int _2455 = _291 << 2;
            int _2457 = _2455 + 1032;
            uint _2459 = uint(int(uint(_2457) >> uint(2)));
            _26[int(_2459)] = as_type<uint>(_2415);
            int _2461 = _291 << 2;
            int _2463 = _2461 + 1036;
            uint _2465 = uint(int(uint(_2463) >> uint(2)));
            _26[int(_2465)] = as_type<uint>(_2423);
            int _2467 = _291 << 4;
            int _2469 = _2467 + 1328;
            uint _2471 = uint(int(uint(_2469) >> uint(2)));
            _26[int(_2471)] = as_type<uint>(_2417);
            int _2473 = _2467 + 1332;
            uint _2475 = uint(int(uint(_2473) >> uint(2)));
            _26[int(_2475)] = as_type<uint>(_2419);
            int _2477 = _2467 + 1336;
            uint _2479 = uint(int(uint(_2477) >> uint(2)));
            _26[int(_2479)] = as_type<uint>(_2421);
            int _2481 = _2467 + 1340;
            uint _2483 = uint(int(uint(_2481) >> uint(2)));
            _26[int(_2483)] = as_type<uint>(_2177);
            _1903 = _2313;
            _1437 = _2261;
            _456 = _2335;
            _458 = _2423;
            _1949 = as_type<int>(_2417);
            _1849 = as_type<int>(_2419);
            _1799 = as_type<int>(_2421);
            _1905 = _2177;
        }
        float _2485 = _1903;
        float _2487 = _1437;
        float _2489 = _456;
        float _2491 = _458;
        int _2493 = _1949;
        int _2495 = _1849;
        int _2497 = _1799;
        float _2499 = _1905;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _2501 = _1895 << 4;
        int _2503 = _2501 + 1280;
        uint _2505 = uint(int(uint(_2503) >> uint(2)));
        float _2507 = as_type<float>(_26[int(_2505)]);
        int _2509 = _2501 + 1284;
        uint _2511 = uint(int(uint(_2509) >> uint(2)));
        float _2513 = as_type<float>(_26[int(_2511)]);
        int _2515 = _2501 + 1288;
        uint _2517 = uint(int(uint(_2515) >> uint(2)));
        float _2519 = as_type<float>(_26[int(_2517)]);
        int _2521 = _2501 + 1292;
        uint _2523 = uint(int(uint(_2521) >> uint(2)));
        float _2525 = as_type<float>(_26[int(_2523)]);
        float _2527 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _2529 = _1491 + _2527;
        int _2531 = _1895 << 2;
        int _2533 = _2531 + 1024;
        uint _2535 = uint(int(uint(_2533) >> uint(2)));
        float _2537 = as_type<float>(_26[int(_2535)]);
        float _2539 = _2529 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _2541 = precise::clamp(_2539, 0.0, 1.0);
        float _2543 = abs(_2541);
        float _2545 = log2(_2543);
        float _2547 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
        float _2549 = _2547 + 1.0;
        float _2551 = _2545 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _2553 = 1.0 / _1491;
        float _2555 = exp2(_2551);
        float _2557 = -_2525;
        float _2559 = exp2(_2557);
        float _2561 = _2555 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _2563 = precise::max(_2559, _2549);
        float _2565 = -_2563;
        float _2567 = _2565 + 1.0;
        float _2569 = -_2561;
        float _2571 = _2569 + 1.0;
        float _2573 = 1.0 / _2567;
        bool _2575 = _2571 > _2567;
        bool _2577 = isnan(_2571);
        bool _2579 = _2575 || _2577;
        bool _2581 = isnan(_2567);
        bool _2583 = _2579 || _2581;
        float _2585 = _2571 * _2573;
        bool _2587 = !_2583;
        float _2589 = _2587 ? _2585 : 1.0;
        float _2591 = _2507 * _2589;
        float _2593 = _2513 * _2589;
        float _2595 = _2519 * _2589;
        float _2597 = _2537 * _2553;
        float _2599 = fma(_2567, _2589, _2561);
        float _2601 = precise::clamp(_2599, 0.0, 1.0);
        float _2603 = fma(_2561, (*spvDescriptorSet0.cp_c3)._m0[14].x, _2591);
        float _2605 = fma(_2561, (*spvDescriptorSet0.cp_c3)._m0[14].y, _2593);
        float _2607 = fma(_2561, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2595);
        float _2609 = -_2601;
        float _2611 = _2609 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_2603, _2605, _2607, _2611), uint3(int3(_83, _79, int(_316))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_2597, _2597, _2597, _2597), uint3(int3(_83, _79, int(_316))));
        int _2613 = int(_316) + 4;
        bool _2615 = uint(_2613) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _294 = uint(_2613);
        _296 = _2607;
        _298 = _2485;
        _300 = _2595;
        _277 = _2597;
        _302 = _2487;
        _304 = _2497;
        _306 = _2495;
        _308 = _2499;
        _310 = _2493;
        _312 = _2489;
        _314 = _2491;
        if (_2615)
        {
            _2617 = true;
            if (_2617)
            {
                break;
            }
        }
    } while (true);
    _2617 = false;
}

