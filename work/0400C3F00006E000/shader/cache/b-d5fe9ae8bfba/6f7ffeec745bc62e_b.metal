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
    bool _3567 = false;
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
    float _298 = 0.0;
    float _300 = 0.0;
    float _302 = 0.0;
    int _304 = 0;
    int _306 = 0;
    int _308 = 0;
    float _310 = 0.0;
    float _312 = 0.0;
    float _314 = 0.0;
    do
    {
        uint _316 = _290;
        float _318 = _292;
        float _320 = _294;
        float _322 = _296;
        float _324 = _298;
        float _326 = _300;
        float _328 = _302;
        int _330 = _304;
        int _332 = _306;
        int _334 = _308;
        float _336 = _310;
        float _338 = _312;
        float _340 = _314;
        float _342 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _344 = log2(_342);
        float _346 = float(_316);
        int _348 = int(_316) + 1;
        float _350 = float(uint(_348));
        float _352 = _344 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _354 = _346 * _352;
        float _356 = _350 * _352;
        float _358 = exp2(_354);
        float _360 = exp2(_356);
        float _362 = _358 + (-1.0);
        float _364 = _362 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _366 = _360 + (-1.0);
        float _368 = -_364;
        float _370 = fma(_366, (*spvDescriptorSet0.cp_c3)._m0[8].z, _368);
        float _372 = _269 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _374 = _269 * _370;
        float _376 = _364 * _372;
        float _378 = _374 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _380 = fma(_153, _376, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _382 = _378 * 0.25;
        float _384 = _376 + _382;
        float _386 = fma(_153, _382, _380);
        float _388 = -_279;
        float _390 = _384 * _388;
        float _392 = fma(_157, _376, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _394 = fma(_155, _376, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _396 = -_390;
        float _398 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _400 = _396 + _398;
        float _402 = -_390;
        float _404 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _406 = _402 + _404;
        float _408 = fma(_157, _382, _392);
        float _410 = fma(_155, _382, _394);
        float _412 = _400 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _414 = precise::clamp(_412, 0.0, 1.0);
        float _416 = _406 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _418 = precise::clamp(_416, 0.0, 1.0);
        float _420 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[2].x, _386);
        float _422 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[2].y, _408);
        float _424 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[2].z, _410);
        bool _426 = _414 != 1.0;
        bool _428 = isnan(_414);
        bool _430 = _426 || _428;
        bool _432 = isnan(1.0);
        bool _434 = _430 || _432;
        bool _436 = _418 != 1.0;
        bool _438 = isnan(_418);
        bool _440 = _436 || _438;
        bool _442 = isnan(1.0);
        bool _444 = _440 || _442;
        float _446 = _324;
        float _448 = _318;
        float _450 = _322;
        float _452 = _320;
        float _454 = _326;
        float _456 = _328;
        float _458 = _414;
        float _460 = _410;
        float _462 = _370;
        float _464 = _392;
        float _466 = _338;
        float _468 = _340;
        if (!_434)
        {
            _446 = 1.0;
        }
        float _470 = _446;
        bool _472 = !_434;
        float _474 = _470;
        if (!_472)
        {
            float _476 = -_390;
            bool _478 = _476 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _480 = -_390;
            bool _482 = _480 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _484 = !_478;
            int _486 = _484 ? 0 : 1;
            int _488 = 2;
            if (!_478)
            {
                _488 = 1;
            }
            int _490 = _488;
            int _492 = _490;
            if (!_482)
            {
                _492 = _486;
            }
            int _494 = _492;
            int _496 = _494 << 6;
            float _498 = float(_494);
            int _500 = _496 + 304;
            uint _502 = uint(int(uint(_500) >> uint(2)));
            uint _504 = uint(int(uint(int(_502)) >> uint(2)));
            int _506 = int(_502) & 3;
            float _508 = (*spvDescriptorSet0.cp_c3)._m0[int(_504)][_506];
            int _510 = int(_502) + 1;
            uint _512 = uint(int(uint(_510) >> uint(2)));
            int _514 = _510 & 3;
            float _516 = (*spvDescriptorSet0.cp_c3)._m0[int(_512)][_514];
            int _518 = _496 + 312;
            uint _520 = uint(int(uint(_518) >> uint(2)));
            uint _522 = uint(int(uint(int(_520)) >> uint(2)));
            int _524 = int(_520) & 3;
            float _526 = (*spvDescriptorSet0.cp_c3)._m0[int(_522)][_524];
            int _528 = int(_520) + 1;
            uint _530 = uint(int(uint(_528) >> uint(2)));
            int _532 = _528 & 3;
            float _534 = (*spvDescriptorSet0.cp_c3)._m0[int(_530)][_532];
            int _536 = _496 + 256;
            uint _538 = uint(int(uint(_536) >> uint(2)));
            uint _540 = uint(int(uint(int(_538)) >> uint(2)));
            int _542 = int(_538) & 3;
            float _544 = (*spvDescriptorSet0.cp_c3)._m0[int(_540)][_542];
            int _546 = int(_538) + 1;
            uint _548 = uint(int(uint(_546) >> uint(2)));
            int _550 = _546 & 3;
            float _552 = (*spvDescriptorSet0.cp_c3)._m0[int(_548)][_550];
            int _554 = _496 + 272;
            uint _556 = uint(int(uint(_554) >> uint(2)));
            uint _558 = uint(int(uint(int(_556)) >> uint(2)));
            int _560 = int(_556) & 3;
            float _562 = (*spvDescriptorSet0.cp_c3)._m0[int(_558)][_560];
            int _564 = int(_556) + 1;
            uint _566 = uint(int(uint(_564) >> uint(2)));
            int _568 = _564 & 3;
            float _570 = (*spvDescriptorSet0.cp_c3)._m0[int(_566)][_568];
            int _572 = _496 + 288;
            uint _574 = uint(int(uint(_572) >> uint(2)));
            uint _576 = uint(int(uint(int(_574)) >> uint(2)));
            int _578 = int(_574) & 3;
            float _580 = (*spvDescriptorSet0.cp_c3)._m0[int(_576)][_578];
            int _582 = int(_574) + 1;
            uint _584 = uint(int(uint(_582) >> uint(2)));
            int _586 = _582 & 3;
            float _588 = (*spvDescriptorSet0.cp_c3)._m0[int(_584)][_586];
            int _590 = _496 + 264;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            uint _594 = uint(int(uint(int(_592)) >> uint(2)));
            int _596 = int(_592) & 3;
            float _598 = (*spvDescriptorSet0.cp_c3)._m0[int(_594)][_596];
            int _600 = int(_592) + 1;
            uint _602 = uint(int(uint(_600) >> uint(2)));
            int _604 = _600 & 3;
            float _606 = (*spvDescriptorSet0.cp_c3)._m0[int(_602)][_604];
            int _608 = _496 + 280;
            uint _610 = uint(int(uint(_608) >> uint(2)));
            uint _612 = uint(int(uint(int(_610)) >> uint(2)));
            int _614 = int(_610) & 3;
            float _616 = (*spvDescriptorSet0.cp_c3)._m0[int(_612)][_614];
            int _618 = int(_610) + 1;
            uint _620 = uint(int(uint(_618) >> uint(2)));
            int _622 = _618 & 3;
            float _624 = (*spvDescriptorSet0.cp_c3)._m0[int(_620)][_622];
            float _626 = _422 * _516;
            float _628 = fma(_420, _508, _626);
            int _630 = _496 + 296;
            uint _632 = uint(int(uint(_630) >> uint(2)));
            uint _634 = uint(int(uint(int(_632)) >> uint(2)));
            int _636 = int(_632) & 3;
            float _638 = (*spvDescriptorSet0.cp_c3)._m0[int(_634)][_636];
            int _640 = int(_632) + 1;
            uint _642 = uint(int(uint(_640) >> uint(2)));
            int _644 = _640 & 3;
            float _646 = (*spvDescriptorSet0.cp_c3)._m0[int(_642)][_644];
            float _648 = fma(_424, _526, _628);
            float _650 = _648 + _534;
            float _652 = _422 * _552;
            float _654 = 1.0 / _650;
            float _656 = fma(_420, _544, _652);
            float _658 = _422 * _570;
            float _660 = rint(_498);
            float _662 = precise::max(_660, 0.0);
            uint _664 = uint(_662);
            uint _666 = clamp(_664, 0u, 65535u);
            float _668 = fma(_420, _562, _658);
            float _670 = _422 * _588;
            float _672 = fma(_420, _580, _670);
            float _674 = fma(_424, _598, _656);
            float _676 = _674 + _606;
            float _678 = fma(_424, _616, _668);
            float _680 = _676 * _654;
            float _682 = _678 + _624;
            float _684 = fma(_424, _638, _672);
            float _686 = _682 * _654;
            float _688 = _684 + _646;
            float _690 = _688 * _654;
            float _692 = precise::clamp(_690, 0.0, 1.0);
            float3 _4506 = float3(_680, _686, float(int(_666)));
            float3 _4510 = select(_4506, float3(0.0), isnan(_4506));
            float _694 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _4510.xy, uint(rint(_4510.z)), _692, level(0.0));
            float _696 = -_694;
            float _698 = _696 + 1.0;
            float _700 = fma(_698, _414, _694);
            _448 = _680;
            _450 = _698;
            _452 = _692;
            _474 = _700;
            _454 = _580;
            _456 = _688;
        }
        float _702 = _448;
        float _704 = _450;
        float _706 = _452;
        float _708 = _474;
        float _710 = _454;
        float _712 = _456;
        float _714 = _706;
        float _716 = _704;
        float _718 = _710;
        float _720 = _702;
        float _722 = _706;
        float _724 = _704;
        float _726 = _710;
        float _728 = _708;
        float _730 = _712;
        if (!_444)
        {
            _458 = 1.0;
        }
        float _732 = _458;
        bool _734 = !_444;
        float _736 = _732;
        if (!_734)
        {
            float _738 = _422 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _740 = _422 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _742 = fma(_420, (*spvDescriptorSet0.cp_c3)._m0[130].x, _738);
            float _744 = fma(_420, (*spvDescriptorSet0.cp_c3)._m0[131].x, _740);
            float _746 = fma(_424, (*spvDescriptorSet0.cp_c3)._m0[130].z, _742);
            float _748 = fma(_424, (*spvDescriptorSet0.cp_c3)._m0[131].z, _744);
            float _750 = _746 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _752 = _748 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _754 = trunc(_750);
            int _756 = int(_754);
            float _758 = trunc(_752);
            int _760 = int(_758);
            int _762 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _764 = _756 + _762;
            int _766 = _764 + 1;
            bool _768 = _766 >= 0;
            int _770 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _772 = _760 + _770;
            int _774 = _772 + 1;
            bool _776 = _766 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _778 = !_768;
            bool _780 = _776 || _778;
            bool _782 = _774 < 0;
            bool _784 = _782 || _780;
            bool _786 = _774 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _788 = _786 || _784;
            float _790 = _748;
            float _792 = as_type<float>(_774);
            if (_788)
            {
                _790 = 1.0;
            }
            float _794 = _790;
            float _796 = _794;
            if (!_788)
            {
                int _798 = _774 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _800 = _798 + _766;
                float _802 = floor(_752);
                int _804 = _800 << 2;
                uint _806 = uint(int(uint(_800) >> uint(2)));
                int _808 = 12 & _804;
                float _810 = floor(_750);
                int _812 = _800 << 4;
                int _814 = _812 + 2112;
                int _816 = int(_806) << 4;
                int _818 = _816 + _808;
                uint _820 = uint(int(uint(_814) >> uint(2)));
                uint _822 = uint(int(uint(int(_820)) >> uint(2)));
                int _824 = int(_820) & 3;
                float _826 = (*spvDescriptorSet0.cp_c3)._m0[int(_822)][_824];
                int _828 = int(_820) + 1;
                uint _830 = uint(int(uint(_828) >> uint(2)));
                int _832 = _828 & 3;
                float _834 = (*spvDescriptorSet0.cp_c3)._m0[int(_830)][_832];
                int _836 = _818 + 464;
                uint _838 = uint(int(uint(_836) >> uint(2)));
                uint _840 = uint(int(uint(int(_838)) >> uint(2)));
                int _842 = int(_838) & 3;
                float _844 = (*spvDescriptorSet0.cp_c3)._m0[int(_840)][_842];
                float _846 = -_810;
                float _848 = _846 + _750;
                int _850 = _814 + 8;
                uint _852 = uint(int(uint(_850) >> uint(2)));
                uint _854 = uint(int(uint(int(_852)) >> uint(2)));
                int _856 = int(_852) & 3;
                float _858 = (*spvDescriptorSet0.cp_c3)._m0[int(_854)][_856];
                int _860 = int(_852) + 1;
                uint _862 = uint(int(uint(_860) >> uint(2)));
                int _864 = _860 & 3;
                float _866 = (*spvDescriptorSet0.cp_c3)._m0[int(_862)][_864];
                float _868 = _422 * _834;
                float _870 = fma(_420, _826, _868);
                float _872 = rint(_844);
                float _874 = precise::max(_872, 0.0);
                uint _876 = uint(_874);
                uint _878 = clamp(_876, 0u, 65535u);
                float _880 = fma(_424, _858, _870);
                float _882 = -_802;
                float _884 = _882 + _752;
                float _886 = _880 + _866;
                float _888 = precise::clamp(_886, 0.0, 1.0);
                float3 _4801 = float3(_848, _884, float(int(_878)));
                float3 _4803 = select(_4801, float3(0.0), isnan(_4801));
                float _890 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _4803.xy, uint(rint(_4803.z)), _888, level(0.0));
                _796 = _890;
                _792 = _834;
                _714 = _888;
                _716 = _848;
                _718 = _802;
            }
            float _892 = _796;
            float _894 = _792;
            float _896 = _714;
            float _898 = _716;
            float _900 = _718;
            float _902 = -_892;
            float _904 = _902 + 1.0;
            float _906 = fma(_904, _418, _892);
            _736 = _906;
            _720 = _894;
            _722 = _896;
            _724 = _898;
            _726 = _900;
        }
        float _908 = _736;
        float _910 = _720;
        float _912 = _722;
        float _914 = _724;
        float _916 = _726;
        float _918 = -_390;
        float _920 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _922 = _918 + _920;
        float _924 = -_390;
        float _926 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _928 = _924 + _926;
        float _930 = precise::min(_708, _908);
        float _932 = _922 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _934 = precise::clamp(_932, 0.0, 1.0);
        float _936 = _928 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _938 = precise::clamp(_936, 0.0, 1.0);
        float _940 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[3].x, _386);
        float _942 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[3].y, _408);
        float _944 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[3].z, _410);
        bool _946 = _934 != 1.0;
        bool _948 = isnan(_934);
        bool _950 = _946 || _948;
        bool _952 = isnan(1.0);
        bool _954 = _950 || _952;
        bool _956 = _938 != 1.0;
        bool _958 = isnan(_938);
        bool _960 = _956 || _958;
        bool _962 = isnan(1.0);
        bool _964 = _960 || _962;
        float _966 = _910;
        float _968 = _912;
        float _970 = _914;
        float _972 = _916;
        if (!_954)
        {
            _728 = 1.0;
        }
        float _974 = _728;
        bool _976 = !_954;
        float _978 = _974;
        if (!_976)
        {
            float _980 = -_390;
            bool _982 = _980 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _984 = -_390;
            bool _986 = _984 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _988 = !_982;
            int _990 = _988 ? 0 : 1;
            int _992 = 2;
            if (!_982)
            {
                _992 = 1;
            }
            int _994 = _992;
            int _996 = _994;
            if (!_986)
            {
                _996 = _990;
            }
            int _998 = _996;
            int _1000 = _998 << 6;
            float _1002 = float(_998);
            int _1004 = _1000 + 304;
            uint _1006 = uint(int(uint(_1004) >> uint(2)));
            uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
            int _1010 = int(_1006) & 3;
            float _1012 = (*spvDescriptorSet0.cp_c3)._m0[int(_1008)][_1010];
            int _1014 = int(_1006) + 1;
            uint _1016 = uint(int(uint(_1014) >> uint(2)));
            int _1018 = _1014 & 3;
            float _1020 = (*spvDescriptorSet0.cp_c3)._m0[int(_1016)][_1018];
            int _1022 = _1000 + 312;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
            int _1028 = int(_1024) & 3;
            float _1030 = (*spvDescriptorSet0.cp_c3)._m0[int(_1026)][_1028];
            int _1032 = int(_1024) + 1;
            uint _1034 = uint(int(uint(_1032) >> uint(2)));
            int _1036 = _1032 & 3;
            float _1038 = (*spvDescriptorSet0.cp_c3)._m0[int(_1034)][_1036];
            int _1040 = _1000 + 256;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            uint _1044 = uint(int(uint(int(_1042)) >> uint(2)));
            int _1046 = int(_1042) & 3;
            float _1048 = (*spvDescriptorSet0.cp_c3)._m0[int(_1044)][_1046];
            int _1050 = int(_1042) + 1;
            uint _1052 = uint(int(uint(_1050) >> uint(2)));
            int _1054 = _1050 & 3;
            float _1056 = (*spvDescriptorSet0.cp_c3)._m0[int(_1052)][_1054];
            int _1058 = _1000 + 272;
            uint _1060 = uint(int(uint(_1058) >> uint(2)));
            uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
            int _1064 = int(_1060) & 3;
            float _1066 = (*spvDescriptorSet0.cp_c3)._m0[int(_1062)][_1064];
            int _1068 = int(_1060) + 1;
            uint _1070 = uint(int(uint(_1068) >> uint(2)));
            int _1072 = _1068 & 3;
            float _1074 = (*spvDescriptorSet0.cp_c3)._m0[int(_1070)][_1072];
            int _1076 = _1000 + 288;
            uint _1078 = uint(int(uint(_1076) >> uint(2)));
            uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
            int _1082 = int(_1078) & 3;
            float _1084 = (*spvDescriptorSet0.cp_c3)._m0[int(_1080)][_1082];
            int _1086 = int(_1078) + 1;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            int _1090 = _1086 & 3;
            float _1092 = (*spvDescriptorSet0.cp_c3)._m0[int(_1088)][_1090];
            int _1094 = _1000 + 264;
            uint _1096 = uint(int(uint(_1094) >> uint(2)));
            uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
            int _1100 = int(_1096) & 3;
            float _1102 = (*spvDescriptorSet0.cp_c3)._m0[int(_1098)][_1100];
            int _1104 = int(_1096) + 1;
            uint _1106 = uint(int(uint(_1104) >> uint(2)));
            int _1108 = _1104 & 3;
            float _1110 = (*spvDescriptorSet0.cp_c3)._m0[int(_1106)][_1108];
            int _1112 = _1000 + 280;
            uint _1114 = uint(int(uint(_1112) >> uint(2)));
            uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
            int _1118 = int(_1114) & 3;
            float _1120 = (*spvDescriptorSet0.cp_c3)._m0[int(_1116)][_1118];
            int _1122 = int(_1114) + 1;
            uint _1124 = uint(int(uint(_1122) >> uint(2)));
            int _1126 = _1122 & 3;
            float _1128 = (*spvDescriptorSet0.cp_c3)._m0[int(_1124)][_1126];
            float _1130 = _942 * _1020;
            float _1132 = fma(_940, _1012, _1130);
            int _1134 = _1000 + 296;
            uint _1136 = uint(int(uint(_1134) >> uint(2)));
            uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
            int _1140 = int(_1136) & 3;
            float _1142 = (*spvDescriptorSet0.cp_c3)._m0[int(_1138)][_1140];
            int _1144 = int(_1136) + 1;
            uint _1146 = uint(int(uint(_1144) >> uint(2)));
            int _1148 = _1144 & 3;
            float _1150 = (*spvDescriptorSet0.cp_c3)._m0[int(_1146)][_1148];
            float _1152 = fma(_944, _1030, _1132);
            float _1154 = _1152 + _1038;
            float _1156 = _942 * _1056;
            float _1158 = 1.0 / _1154;
            float _1160 = fma(_940, _1048, _1156);
            float _1162 = _942 * _1074;
            float _1164 = rint(_1002);
            float _1166 = precise::max(_1164, 0.0);
            uint _1168 = uint(_1166);
            uint _1170 = clamp(_1168, 0u, 65535u);
            float _1172 = fma(_940, _1066, _1162);
            float _1174 = _942 * _1092;
            float _1176 = fma(_940, _1084, _1174);
            float _1178 = fma(_944, _1102, _1160);
            float _1180 = _1178 + _1110;
            float _1182 = fma(_944, _1120, _1172);
            float _1184 = _1180 * _1158;
            float _1186 = _1182 + _1128;
            float _1188 = fma(_944, _1142, _1176);
            float _1190 = _1186 * _1158;
            float _1192 = _1188 + _1150;
            float _1194 = _1192 * _1158;
            float _1196 = precise::clamp(_1194, 0.0, 1.0);
            float3 _5274 = float3(_1184, _1190, float(int(_1170)));
            float3 _5276 = select(_5274, float3(0.0), isnan(_5274));
            float _1198 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _5276.xy, uint(rint(_5276.z)), _1196, level(0.0));
            float _1200 = -_1198;
            float _1202 = _1200 + 1.0;
            float _1204 = fma(_934, _1202, _1198);
            _966 = _1184;
            _968 = _1196;
            _970 = _1056;
            _978 = _1204;
            _972 = _1084;
            _730 = _1192;
        }
        float _1206 = _966;
        float _1208 = _968;
        float _1210 = _970;
        float _1212 = _978;
        float _1214 = _972;
        float _1216 = _730;
        float _1218 = precise::min(_930, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1220 = _1206;
        float _1222 = _1210;
        float _1224 = _1208;
        float _1226 = _1214;
        float _1228 = _1208;
        float _1230 = _1210;
        float _1232 = _1214;
        float _1234 = _1216;
        if (!_964)
        {
            _1220 = 1.0;
        }
        float _1236 = _1220;
        bool _1238 = !_964;
        float _1240 = _1236;
        if (!_1238)
        {
            float _1242 = _942 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1244 = _942 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1246 = fma(_940, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1242);
            float _1248 = fma(_940, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1244);
            float _1250 = fma(_944, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1246);
            float _1252 = fma(_944, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1248);
            float _1254 = _1250 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1256 = _1252 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1258 = trunc(_1254);
            int _1260 = int(_1258);
            float _1262 = trunc(_1256);
            int _1264 = int(_1262);
            int _1266 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1268 = _1260 + _1266;
            int _1270 = _1268 + 1;
            bool _1272 = _1270 >= 0;
            int _1274 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1276 = _1264 + _1274;
            int _1278 = _1276 + 1;
            bool _1280 = _1270 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1282 = !_1272;
            bool _1284 = _1280 || _1282;
            bool _1286 = _1278 < 0;
            bool _1288 = _1286 || _1284;
            bool _1290 = _1278 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1292 = _1290 || _1288;
            if (_1292)
            {
                _1222 = 1.0;
            }
            float _1294 = _1222;
            float _1296 = _1294;
            if (!_1292)
            {
                int _1298 = _1278 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1300 = _1298 + _1270;
                float _1302 = floor(_1256);
                int _1304 = _1300 << 2;
                uint _1306 = uint(int(uint(_1300) >> uint(2)));
                int _1308 = 12 & _1304;
                int _1310 = _1300 << 4;
                int _1312 = _1310 + 2112;
                int _1314 = int(_1306) << 4;
                int _1316 = _1314 + _1308;
                uint _1318 = uint(int(uint(_1312) >> uint(2)));
                uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
                int _1322 = int(_1318) & 3;
                float _1324 = (*spvDescriptorSet0.cp_c3)._m0[int(_1320)][_1322];
                int _1326 = int(_1318) + 1;
                uint _1328 = uint(int(uint(_1326) >> uint(2)));
                int _1330 = _1326 & 3;
                float _1332 = (*spvDescriptorSet0.cp_c3)._m0[int(_1328)][_1330];
                float _1334 = floor(_1254);
                int _1336 = _1316 + 464;
                uint _1338 = uint(int(uint(_1336) >> uint(2)));
                uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
                int _1342 = int(_1338) & 3;
                float _1344 = (*spvDescriptorSet0.cp_c3)._m0[int(_1340)][_1342];
                int _1346 = _1312 + 8;
                uint _1348 = uint(int(uint(_1346) >> uint(2)));
                uint _1350 = uint(int(uint(int(_1348)) >> uint(2)));
                int _1352 = int(_1348) & 3;
                float _1354 = (*spvDescriptorSet0.cp_c3)._m0[int(_1350)][_1352];
                int _1356 = int(_1348) + 1;
                uint _1358 = uint(int(uint(_1356) >> uint(2)));
                int _1360 = _1356 & 3;
                float _1362 = (*spvDescriptorSet0.cp_c3)._m0[int(_1358)][_1360];
                float _1364 = -_1334;
                float _1366 = _1254 + _1364;
                float _1368 = _942 * _1332;
                float _1370 = fma(_940, _1324, _1368);
                float _1372 = rint(_1344);
                float _1374 = precise::max(_1372, 0.0);
                uint _1376 = uint(_1374);
                uint _1378 = clamp(_1376, 0u, 65535u);
                float _1380 = fma(_944, _1354, _1370);
                float _1382 = -_1302;
                float _1384 = _1256 + _1382;
                float _1386 = _1380 + _1362;
                float _1388 = precise::clamp(_1386, 0.0, 1.0);
                float3 _5562 = float3(_1366, _1384, float(int(_1378)));
                float3 _5564 = select(_5562, float3(0.0), isnan(_5562));
                float _1390 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _5564.xy, uint(rint(_5564.z)), _1388, level(0.0));
                _1296 = _1390;
                _1224 = _1332;
                _1226 = _1302;
            }
            float _1392 = _1296;
            float _1394 = _1224;
            float _1396 = _1226;
            float _1398 = -_1392;
            float _1400 = _1398 + 1.0;
            float _1402 = fma(_938, _1400, _1392);
            _1240 = _1402;
            _1228 = _1394;
            _1230 = _1392;
            _1232 = _1396;
        }
        float _1404 = _1240;
        float _1406 = _1228;
        float _1408 = _1230;
        float _1410 = _1232;
        float _1412 = -_390;
        float _1414 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _1416 = _1412 + _1414;
        float _1418 = -_390;
        float _1420 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _1422 = _1418 + _1420;
        float _1424 = precise::min(_1404, _1212);
        float _1426 = _1416 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _1428 = precise::clamp(_1426, 0.0, 1.0);
        float _1430 = _1422 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _1432 = precise::clamp(_1430, 0.0, 1.0);
        float _1434 = precise::min(_1424, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1436 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[4].x, _386);
        float _1438 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[4].y, _408);
        bool _1440 = _1428 != 1.0;
        bool _1442 = isnan(_1428);
        bool _1444 = _1440 || _1442;
        bool _1446 = isnan(1.0);
        bool _1448 = _1444 || _1446;
        float _1450 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[4].z, _410);
        bool _1452 = _1432 != 1.0;
        bool _1454 = isnan(_1432);
        bool _1456 = _1452 || _1454;
        bool _1458 = isnan(1.0);
        bool _1460 = _1456 || _1458;
        float _1462 = _1424;
        float _1464 = _1404;
        float _1466 = _1406;
        float _1468 = _1408;
        float _1470 = _1410;
        if (!_1448)
        {
            _1462 = 1.0;
        }
        float _1472 = _1462;
        bool _1474 = !_1448;
        float _1476 = _1472;
        if (!_1474)
        {
            float _1478 = -_390;
            bool _1480 = _1478 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _1482 = -_390;
            bool _1484 = _1482 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _1486 = !_1480;
            int _1488 = _1486 ? 0 : 1;
            int _1490 = 2;
            if (!_1480)
            {
                _1490 = 1;
            }
            int _1492 = _1490;
            int _1494 = _1492;
            if (!_1484)
            {
                _1494 = _1488;
            }
            int _1496 = _1494;
            int _1498 = _1496 << 6;
            float _1500 = float(_1496);
            int _1502 = _1498 + 304;
            uint _1504 = uint(int(uint(_1502) >> uint(2)));
            uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
            int _1508 = int(_1504) & 3;
            float _1510 = (*spvDescriptorSet0.cp_c3)._m0[int(_1506)][_1508];
            int _1512 = int(_1504) + 1;
            uint _1514 = uint(int(uint(_1512) >> uint(2)));
            int _1516 = _1512 & 3;
            float _1518 = (*spvDescriptorSet0.cp_c3)._m0[int(_1514)][_1516];
            int _1520 = _1498 + 312;
            uint _1522 = uint(int(uint(_1520) >> uint(2)));
            uint _1524 = uint(int(uint(int(_1522)) >> uint(2)));
            int _1526 = int(_1522) & 3;
            float _1528 = (*spvDescriptorSet0.cp_c3)._m0[int(_1524)][_1526];
            int _1530 = int(_1522) + 1;
            uint _1532 = uint(int(uint(_1530) >> uint(2)));
            int _1534 = _1530 & 3;
            float _1536 = (*spvDescriptorSet0.cp_c3)._m0[int(_1532)][_1534];
            int _1538 = _1498 + 256;
            uint _1540 = uint(int(uint(_1538) >> uint(2)));
            uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
            int _1544 = int(_1540) & 3;
            float _1546 = (*spvDescriptorSet0.cp_c3)._m0[int(_1542)][_1544];
            int _1548 = int(_1540) + 1;
            uint _1550 = uint(int(uint(_1548) >> uint(2)));
            int _1552 = _1548 & 3;
            float _1554 = (*spvDescriptorSet0.cp_c3)._m0[int(_1550)][_1552];
            int _1556 = _1498 + 272;
            uint _1558 = uint(int(uint(_1556) >> uint(2)));
            uint _1560 = uint(int(uint(int(_1558)) >> uint(2)));
            int _1562 = int(_1558) & 3;
            float _1564 = (*spvDescriptorSet0.cp_c3)._m0[int(_1560)][_1562];
            int _1566 = int(_1558) + 1;
            uint _1568 = uint(int(uint(_1566) >> uint(2)));
            int _1570 = _1566 & 3;
            float _1572 = (*spvDescriptorSet0.cp_c3)._m0[int(_1568)][_1570];
            int _1574 = _1498 + 288;
            uint _1576 = uint(int(uint(_1574) >> uint(2)));
            uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
            int _1580 = int(_1576) & 3;
            float _1582 = (*spvDescriptorSet0.cp_c3)._m0[int(_1578)][_1580];
            int _1584 = int(_1576) + 1;
            uint _1586 = uint(int(uint(_1584) >> uint(2)));
            int _1588 = _1584 & 3;
            float _1590 = (*spvDescriptorSet0.cp_c3)._m0[int(_1586)][_1588];
            int _1592 = _1498 + 264;
            uint _1594 = uint(int(uint(_1592) >> uint(2)));
            uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
            int _1598 = int(_1594) & 3;
            float _1600 = (*spvDescriptorSet0.cp_c3)._m0[int(_1596)][_1598];
            int _1602 = int(_1594) + 1;
            uint _1604 = uint(int(uint(_1602) >> uint(2)));
            int _1606 = _1602 & 3;
            float _1608 = (*spvDescriptorSet0.cp_c3)._m0[int(_1604)][_1606];
            int _1610 = _1498 + 280;
            uint _1612 = uint(int(uint(_1610) >> uint(2)));
            uint _1614 = uint(int(uint(int(_1612)) >> uint(2)));
            int _1616 = int(_1612) & 3;
            float _1618 = (*spvDescriptorSet0.cp_c3)._m0[int(_1614)][_1616];
            int _1620 = int(_1612) + 1;
            uint _1622 = uint(int(uint(_1620) >> uint(2)));
            int _1624 = _1620 & 3;
            float _1626 = (*spvDescriptorSet0.cp_c3)._m0[int(_1622)][_1624];
            float _1628 = _1438 * _1518;
            float _1630 = fma(_1436, _1510, _1628);
            int _1632 = _1498 + 296;
            uint _1634 = uint(int(uint(_1632) >> uint(2)));
            uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
            int _1638 = int(_1634) & 3;
            float _1640 = (*spvDescriptorSet0.cp_c3)._m0[int(_1636)][_1638];
            int _1642 = int(_1634) + 1;
            uint _1644 = uint(int(uint(_1642) >> uint(2)));
            int _1646 = _1642 & 3;
            float _1648 = (*spvDescriptorSet0.cp_c3)._m0[int(_1644)][_1646];
            float _1650 = fma(_1450, _1528, _1630);
            float _1652 = _1650 + _1536;
            float _1654 = _1438 * _1554;
            float _1656 = 1.0 / _1652;
            float _1658 = fma(_1436, _1546, _1654);
            float _1660 = _1438 * _1572;
            float _1662 = rint(_1500);
            float _1664 = precise::max(_1662, 0.0);
            uint _1666 = uint(_1664);
            uint _1668 = clamp(_1666, 0u, 65535u);
            float _1670 = fma(_1436, _1564, _1660);
            float _1672 = _1438 * _1590;
            float _1674 = fma(_1436, _1582, _1672);
            float _1676 = fma(_1450, _1600, _1658);
            float _1678 = _1676 + _1608;
            float _1680 = fma(_1450, _1618, _1670);
            float _1682 = _1678 * _1656;
            float _1684 = _1680 + _1626;
            float _1686 = fma(_1450, _1640, _1674);
            float _1688 = _1684 * _1656;
            float _1690 = _1686 + _1648;
            float _1692 = _1690 * _1656;
            float _1694 = precise::clamp(_1692, 0.0, 1.0);
            float3 _6034 = float3(_1682, _1688, float(int(_1668)));
            float3 _6036 = select(_6034, float3(0.0), isnan(_6034));
            float _1696 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _6036.xy, uint(rint(_6036.z)), _1694, level(0.0));
            float _1698 = -_1696;
            float _1700 = _1698 + 1.0;
            float _1702 = fma(_1428, _1700, _1696);
            _1464 = _1682;
            _1466 = _1694;
            _1468 = _1554;
            _1476 = _1702;
            _1470 = _1582;
            _1234 = _1690;
        }
        float _1704 = _1464;
        float _1706 = _1466;
        float _1708 = _1468;
        float _1710 = _1476;
        float _1712 = _1470;
        float _1714 = _1234;
        float _1716 = _1218 + _1434;
        float _1718 = _1704;
        float _1720 = _1708;
        float _1722 = _1706;
        float _1724 = _1712;
        float _1726 = _1706;
        float _1728 = _1712;
        float _1730 = _1714;
        if (!_1460)
        {
            _1718 = 1.0;
        }
        float _1732 = _1718;
        bool _1734 = !_1460;
        float _1736 = _1732;
        if (!_1734)
        {
            float _1738 = _1438 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1740 = _1438 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1742 = fma(_1436, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1738);
            float _1744 = fma(_1436, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1740);
            float _1746 = fma(_1450, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1742);
            float _1748 = fma(_1450, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1744);
            float _1750 = _1746 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1752 = _1748 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1754 = trunc(_1750);
            int _1756 = int(_1754);
            float _1758 = trunc(_1752);
            int _1760 = int(_1758);
            int _1762 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1764 = _1756 + _1762;
            int _1766 = _1764 + 1;
            bool _1768 = _1766 >= 0;
            int _1770 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1772 = _1760 + _1770;
            int _1774 = _1772 + 1;
            bool _1776 = _1766 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1778 = !_1768;
            bool _1780 = _1776 || _1778;
            bool _1782 = _1774 < 0;
            bool _1784 = _1782 || _1780;
            bool _1786 = _1774 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1788 = _1786 || _1784;
            if (_1788)
            {
                _1720 = 1.0;
            }
            float _1790 = _1720;
            float _1792 = _1790;
            if (!_1788)
            {
                int _1794 = _1774 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1796 = _1794 + _1766;
                float _1798 = floor(_1752);
                int _1800 = _1796 << 2;
                uint _1802 = uint(int(uint(_1796) >> uint(2)));
                int _1804 = 12 & _1800;
                int _1806 = _1796 << 4;
                int _1808 = _1806 + 2112;
                int _1810 = int(_1802) << 4;
                int _1812 = _1810 + _1804;
                uint _1814 = uint(int(uint(_1808) >> uint(2)));
                uint _1816 = uint(int(uint(int(_1814)) >> uint(2)));
                int _1818 = int(_1814) & 3;
                float _1820 = (*spvDescriptorSet0.cp_c3)._m0[int(_1816)][_1818];
                int _1822 = int(_1814) + 1;
                uint _1824 = uint(int(uint(_1822) >> uint(2)));
                int _1826 = _1822 & 3;
                float _1828 = (*spvDescriptorSet0.cp_c3)._m0[int(_1824)][_1826];
                float _1830 = floor(_1750);
                int _1832 = _1812 + 464;
                uint _1834 = uint(int(uint(_1832) >> uint(2)));
                uint _1836 = uint(int(uint(int(_1834)) >> uint(2)));
                int _1838 = int(_1834) & 3;
                float _1840 = (*spvDescriptorSet0.cp_c3)._m0[int(_1836)][_1838];
                int _1842 = _1808 + 8;
                uint _1844 = uint(int(uint(_1842) >> uint(2)));
                uint _1846 = uint(int(uint(int(_1844)) >> uint(2)));
                int _1848 = int(_1844) & 3;
                float _1850 = (*spvDescriptorSet0.cp_c3)._m0[int(_1846)][_1848];
                int _1852 = int(_1844) + 1;
                uint _1854 = uint(int(uint(_1852) >> uint(2)));
                int _1856 = _1852 & 3;
                float _1858 = (*spvDescriptorSet0.cp_c3)._m0[int(_1854)][_1856];
                float _1860 = -_1830;
                float _1862 = _1750 + _1860;
                float _1864 = _1438 * _1828;
                float _1866 = fma(_1436, _1820, _1864);
                float _1868 = rint(_1840);
                float _1870 = precise::max(_1868, 0.0);
                uint _1872 = uint(_1870);
                uint _1874 = clamp(_1872, 0u, 65535u);
                float _1876 = fma(_1450, _1850, _1866);
                float _1878 = -_1798;
                float _1880 = _1752 + _1878;
                float _1882 = _1876 + _1858;
                float _1884 = precise::clamp(_1882, 0.0, 1.0);
                float3 _6320 = float3(_1862, _1880, float(int(_1874)));
                float3 _6322 = select(_6320, float3(0.0), isnan(_6320));
                float _1886 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _6322.xy, uint(rint(_6322.z)), _1884, level(0.0));
                _1792 = _1886;
                _1722 = _1828;
                _1724 = _1798;
            }
            float _1888 = _1792;
            float _1890 = _1722;
            float _1892 = _1724;
            float _1894 = -_1888;
            float _1896 = _1894 + 1.0;
            float _1898 = fma(_1432, _1896, _1888);
            _1736 = _1898;
            _1726 = _1890;
            _1728 = _1892;
        }
        float _1900 = _1736;
        float _1902 = _1726;
        float _1904 = _1728;
        float _1906 = -_390;
        float _1908 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _1910 = _1906 + _1908;
        float _1912 = -_390;
        float _1914 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _1916 = _1912 + _1914;
        float _1918 = precise::min(_1900, _1710);
        float _1920 = _1910 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _1922 = precise::clamp(_1920, 0.0, 1.0);
        float _1924 = _1916 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _1926 = precise::clamp(_1924, 0.0, 1.0);
        float _1928 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[5].z, _410);
        float _1930 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[5].x, _386);
        float _1932 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[5].y, _408);
        bool _1934 = _1922 != 1.0;
        bool _1936 = isnan(_1922);
        bool _1938 = _1934 || _1936;
        bool _1940 = isnan(1.0);
        bool _1942 = _1938 || _1940;
        bool _1944 = _1926 != 1.0;
        bool _1946 = isnan(_1926);
        bool _1948 = _1944 || _1946;
        bool _1950 = isnan(1.0);
        bool _1952 = _1948 || _1950;
        float _1954 = precise::min(_1918, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1956 = _1902;
        float _1958 = _1904;
        if (!_1942)
        {
            _460 = 1.0;
        }
        float _1960 = _460;
        bool _1962 = !_1942;
        float _1964 = _1960;
        if (!_1962)
        {
            float _1966 = -_390;
            bool _1968 = _1966 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _1970 = -_390;
            bool _1972 = _1970 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _1974 = !_1968;
            int _1976 = _1974 ? 0 : 1;
            int _1978 = 2;
            if (!_1968)
            {
                _1978 = 1;
            }
            int _1980 = _1978;
            int _1982 = _1980;
            if (!_1972)
            {
                _1982 = _1976;
            }
            int _1984 = _1982;
            int _1986 = _1984 << 6;
            float _1988 = float(_1984);
            int _1990 = _1986 + 304;
            uint _1992 = uint(int(uint(_1990) >> uint(2)));
            uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
            int _1996 = int(_1992) & 3;
            float _1998 = (*spvDescriptorSet0.cp_c3)._m0[int(_1994)][_1996];
            int _2000 = int(_1992) + 1;
            uint _2002 = uint(int(uint(_2000) >> uint(2)));
            int _2004 = _2000 & 3;
            float _2006 = (*spvDescriptorSet0.cp_c3)._m0[int(_2002)][_2004];
            int _2008 = _1986 + 312;
            uint _2010 = uint(int(uint(_2008) >> uint(2)));
            uint _2012 = uint(int(uint(int(_2010)) >> uint(2)));
            int _2014 = int(_2010) & 3;
            float _2016 = (*spvDescriptorSet0.cp_c3)._m0[int(_2012)][_2014];
            int _2018 = int(_2010) + 1;
            uint _2020 = uint(int(uint(_2018) >> uint(2)));
            int _2022 = _2018 & 3;
            float _2024 = (*spvDescriptorSet0.cp_c3)._m0[int(_2020)][_2022];
            int _2026 = _1986 + 256;
            uint _2028 = uint(int(uint(_2026) >> uint(2)));
            uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
            int _2032 = int(_2028) & 3;
            float _2034 = (*spvDescriptorSet0.cp_c3)._m0[int(_2030)][_2032];
            int _2036 = int(_2028) + 1;
            uint _2038 = uint(int(uint(_2036) >> uint(2)));
            int _2040 = _2036 & 3;
            float _2042 = (*spvDescriptorSet0.cp_c3)._m0[int(_2038)][_2040];
            int _2044 = _1986 + 272;
            uint _2046 = uint(int(uint(_2044) >> uint(2)));
            uint _2048 = uint(int(uint(int(_2046)) >> uint(2)));
            int _2050 = int(_2046) & 3;
            float _2052 = (*spvDescriptorSet0.cp_c3)._m0[int(_2048)][_2050];
            int _2054 = int(_2046) + 1;
            uint _2056 = uint(int(uint(_2054) >> uint(2)));
            int _2058 = _2054 & 3;
            float _2060 = (*spvDescriptorSet0.cp_c3)._m0[int(_2056)][_2058];
            int _2062 = _1986 + 288;
            uint _2064 = uint(int(uint(_2062) >> uint(2)));
            uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
            int _2068 = int(_2064) & 3;
            float _2070 = (*spvDescriptorSet0.cp_c3)._m0[int(_2066)][_2068];
            int _2072 = int(_2064) + 1;
            uint _2074 = uint(int(uint(_2072) >> uint(2)));
            int _2076 = _2072 & 3;
            float _2078 = (*spvDescriptorSet0.cp_c3)._m0[int(_2074)][_2076];
            int _2080 = _1986 + 264;
            uint _2082 = uint(int(uint(_2080) >> uint(2)));
            uint _2084 = uint(int(uint(int(_2082)) >> uint(2)));
            int _2086 = int(_2082) & 3;
            float _2088 = (*spvDescriptorSet0.cp_c3)._m0[int(_2084)][_2086];
            int _2090 = int(_2082) + 1;
            uint _2092 = uint(int(uint(_2090) >> uint(2)));
            int _2094 = _2090 & 3;
            float _2096 = (*spvDescriptorSet0.cp_c3)._m0[int(_2092)][_2094];
            int _2098 = _1986 + 280;
            uint _2100 = uint(int(uint(_2098) >> uint(2)));
            uint _2102 = uint(int(uint(int(_2100)) >> uint(2)));
            int _2104 = int(_2100) & 3;
            float _2106 = (*spvDescriptorSet0.cp_c3)._m0[int(_2102)][_2104];
            int _2108 = int(_2100) + 1;
            uint _2110 = uint(int(uint(_2108) >> uint(2)));
            int _2112 = _2108 & 3;
            float _2114 = (*spvDescriptorSet0.cp_c3)._m0[int(_2110)][_2112];
            float _2116 = _1932 * _2006;
            float _2118 = fma(_1930, _1998, _2116);
            int _2120 = _1986 + 296;
            uint _2122 = uint(int(uint(_2120) >> uint(2)));
            uint _2124 = uint(int(uint(int(_2122)) >> uint(2)));
            int _2126 = int(_2122) & 3;
            float _2128 = (*spvDescriptorSet0.cp_c3)._m0[int(_2124)][_2126];
            int _2130 = int(_2122) + 1;
            uint _2132 = uint(int(uint(_2130) >> uint(2)));
            int _2134 = _2130 & 3;
            float _2136 = (*spvDescriptorSet0.cp_c3)._m0[int(_2132)][_2134];
            float _2138 = fma(_1928, _2016, _2118);
            float _2140 = _2138 + _2024;
            float _2142 = _1932 * _2042;
            float _2144 = 1.0 / _2140;
            float _2146 = fma(_1930, _2034, _2142);
            float _2148 = _1932 * _2060;
            float _2150 = rint(_1988);
            float _2152 = precise::max(_2150, 0.0);
            uint _2154 = uint(_2152);
            uint _2156 = clamp(_2154, 0u, 65535u);
            float _2158 = fma(_1930, _2052, _2148);
            float _2160 = _1932 * _2078;
            float _2162 = fma(_1930, _2070, _2160);
            float _2164 = fma(_1928, _2088, _2146);
            float _2166 = _2164 + _2096;
            float _2168 = fma(_1928, _2106, _2158);
            float _2170 = _2166 * _2144;
            float _2172 = _2168 + _2114;
            float _2174 = fma(_1928, _2128, _2162);
            float _2176 = _2172 * _2144;
            float _2178 = _2174 + _2136;
            float _2180 = _2178 * _2144;
            float _2182 = precise::clamp(_2180, 0.0, 1.0);
            float3 _6788 = float3(_2170, _2176, float(int(_2156)));
            float3 _6790 = select(_6788, float3(0.0), isnan(_6788));
            float _2184 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _6790.xy, uint(rint(_6790.z)), _2182, level(0.0));
            float _2186 = -_2184;
            float _2188 = _2186 + 1.0;
            float _2190 = fma(_1922, _2188, _2184);
            _1956 = _2182;
            _1730 = _2174;
            _1958 = _2070;
            _1964 = _2190;
        }
        float _2192 = _1956;
        float _2194 = _1730;
        float _2196 = _1958;
        float _2198 = _1964;
        float _2200 = _1716 + _1954;
        float _2202 = _2196;
        float _2204 = _2192;
        if (!_1952)
        {
            _2202 = 1.0;
        }
        float _2206 = _2202;
        bool _2208 = !_1952;
        float _2210 = _2206;
        if (!_2208)
        {
            float _2212 = _1932 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _2214 = _1932 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _2216 = fma(_1930, (*spvDescriptorSet0.cp_c3)._m0[130].x, _2212);
            float _2218 = fma(_1930, (*spvDescriptorSet0.cp_c3)._m0[131].x, _2214);
            float _2220 = fma(_1928, (*spvDescriptorSet0.cp_c3)._m0[130].z, _2216);
            float _2222 = fma(_1928, (*spvDescriptorSet0.cp_c3)._m0[131].z, _2218);
            float _2224 = _2220 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _2226 = _2222 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _2228 = trunc(_2224);
            int _2230 = int(_2228);
            float _2232 = trunc(_2226);
            int _2234 = int(_2232);
            int _2236 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _2238 = _2230 + _2236;
            int _2240 = _2238 + 1;
            bool _2242 = _2240 >= 0;
            int _2244 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _2246 = _2234 + _2244;
            int _2248 = _2246 + 1;
            bool _2250 = _2240 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _2252 = !_2242;
            bool _2254 = _2250 || _2252;
            bool _2256 = _2248 < 0;
            bool _2258 = _2256 || _2254;
            bool _2260 = _2248 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _2262 = _2260 || _2258;
            if (_2262)
            {
                _2204 = 1.0;
            }
            float _2264 = _2204;
            float _2266 = _2264;
            if (!_2262)
            {
                int _2268 = _2248 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _2270 = _2268 + _2240;
                float _2272 = floor(_2224);
                int _2274 = _2270 << 2;
                uint _2276 = uint(int(uint(_2270) >> uint(2)));
                int _2278 = 12 & _2274;
                float _2280 = floor(_2226);
                int _2282 = _2270 << 4;
                int _2284 = _2282 + 2112;
                int _2286 = int(_2276) << 4;
                int _2288 = _2286 + _2278;
                uint _2290 = uint(int(uint(_2284) >> uint(2)));
                uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
                int _2294 = int(_2290) & 3;
                float _2296 = (*spvDescriptorSet0.cp_c3)._m0[int(_2292)][_2294];
                int _2298 = int(_2290) + 1;
                uint _2300 = uint(int(uint(_2298) >> uint(2)));
                int _2302 = _2298 & 3;
                float _2304 = (*spvDescriptorSet0.cp_c3)._m0[int(_2300)][_2302];
                float _2306 = -_2272;
                float _2308 = _2224 + _2306;
                int _2310 = _2288 + 464;
                uint _2312 = uint(int(uint(_2310) >> uint(2)));
                uint _2314 = uint(int(uint(int(_2312)) >> uint(2)));
                int _2316 = int(_2312) & 3;
                float _2318 = (*spvDescriptorSet0.cp_c3)._m0[int(_2314)][_2316];
                int _2320 = _2284 + 8;
                uint _2322 = uint(int(uint(_2320) >> uint(2)));
                uint _2324 = uint(int(uint(int(_2322)) >> uint(2)));
                int _2326 = int(_2322) & 3;
                float _2328 = (*spvDescriptorSet0.cp_c3)._m0[int(_2324)][_2326];
                int _2330 = int(_2322) + 1;
                uint _2332 = uint(int(uint(_2330) >> uint(2)));
                int _2334 = _2330 & 3;
                float _2336 = (*spvDescriptorSet0.cp_c3)._m0[int(_2332)][_2334];
                float _2338 = _1932 * _2304;
                float _2340 = fma(_1930, _2296, _2338);
                float _2342 = rint(_2318);
                float _2344 = precise::max(_2342, 0.0);
                uint _2346 = uint(_2344);
                uint _2348 = clamp(_2346, 0u, 65535u);
                float _2350 = fma(_1928, _2328, _2340);
                float _2352 = -_2280;
                float _2354 = _2226 + _2352;
                float _2356 = _2350 + _2336;
                float _2358 = precise::clamp(_2356, 0.0, 1.0);
                float3 _7065 = float3(_2308, _2354, float(int(_2348)));
                float3 _7067 = select(_7065, float3(0.0), isnan(_7065));
                float _2360 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _7067.xy, uint(rint(_7067.z)), _2358, level(0.0));
                _2266 = _2360;
            }
            float _2362 = _2266;
            float _2364 = -_2362;
            float _2366 = _2364 + 1.0;
            float _2368 = fma(_1926, _2366, _2362);
            _2210 = _2368;
        }
        float _2370 = _2210;
        float _2372 = fma(_153, _378, _380);
        float _2374 = fma(_155, _378, _394);
        float _2376 = fma(_2372, 6.2500002968590706586837768554688e-05, 0.5);
        float _2378 = fma(_2374, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _7101 = float2(_2376, _2378);
        float _2380 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7101, float2(0.0), isnan(_7101)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7101, float2(0.0), isnan(_7101)), level(0.0)).x;
        float3 _7112 = float3(_2376, _2378, float(0));
        float3 _7114 = select(_7112, float3(0.0), isnan(_7112));
        float4 _2383 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7114.xy, uint(rint(_7114.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7114.xy, uint(rint(_7114.z)), level(0.0)).xyzw;
        float _2385 = _2383.x;
        float _2387 = _2383.y;
        float _2389 = _2383.z;
        float _2391 = _2383.w;
        float3 _7129 = float3(_2376, _2378, float(1));
        float3 _7131 = select(_7129, float3(0.0), isnan(_7129));
        float4 _2393 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7131.xy, uint(rint(_7131.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7131.xy, uint(rint(_7131.z)), level(0.0)).xyzw;
        float _2395 = _2393.x;
        float _2397 = _2393.y;
        float _2399 = _2393.z;
        float _2401 = _2393.w;
        float _2403 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _2405 = _2374 + _2403;
        float _2407 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _2409 = _2372 + _2407;
        float _2411 = _364 + _370;
        float _2413 = _2405 * _2405;
        float _2415 = _157 * 1.02332699298858642578125;
        float _2417 = _269 * _2411;
        float _2419 = fma(_2409, _2409, _2413);
        float _2421 = _155 * 1.02332699298858642578125;
        float _2423 = _2417 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _2425 = sqrt(_2419);
        float _2427 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _2429 = _2427 * 100.0;
        float _2431 = exp2(_2429);
        bool _2433 = _2425 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _2435 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _2437 = _2425 + _2435;
        float _2439 = _2194;
        float _2441 = _2437;
        if (_2433)
        {
            float _2443 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _2439 = _2443;
        }
        float _2445 = _2439;
        if (_2433)
        {
            float _2447 = _2437 * _2445;
            _2441 = _2447;
        }
        float _2449 = _2441;
        float _2451 = _157 * _378;
        if (_2433)
        {
            float _2453 = _2449 * 0.15915493667125701904296875;
            _462 = _2453;
        }
        float _2455 = _462;
        float _2457 = fma(_2431, 512.0, -512.0);
        float _2459 = fma(_2423, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _2461 = precise::clamp(_2459, 0.0, 1.0);
        float _2463 = _392 + _2451;
        float _2465 = precise::min(_2370, _2198);
        float _2467 = 1.0 / _2457;
        float _2469 = _2427 * 5115.0;
        float _2471 = -_2461;
        float _2473 = _2471 + 1.0;
        float _2475 = _2461;
        if (!_2433)
        {
            _2475 = _2463;
        }
        float _2477 = _2475;
        float _2479 = precise::min(_2465, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _2481 = _2455;
        float _2483 = _2477;
        if (_2433)
        {
            float _2485 = _2455 * 6.283185482025146484375;
            float _2487 = cos(_2485);
            _2481 = _2487;
        }
        float _2489 = _2481;
        float _2491 = _2200 + _2479;
        float _2493 = _2469 * _2467;
        float _2495 = abs(_2473);
        float _2497 = log2(_2495);
        float _2499 = fma(_277, -0.5, 0.5);
        if (_2433)
        {
            float _2501 = _2489 + (-1.0);
            _464 = _2501;
        }
        float _2503 = _464;
        float _2505 = 1.0 / _2427;
        float _2507 = _2503;
        if (_2433)
        {
            float _2509 = _2503 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _2507 = _2509;
        }
        float _2511 = _2507;
        if (_2433)
        {
            float _2513 = fma(_2463, _2489, _2511);
            _2483 = _2513;
        }
        float _2515 = _2483;
        float _2517 = log2(_2493);
        float _2519 = abs(_2451);
        bool _2521 = _2519 > 0.00999999977648258209228515625;
        float _2523 = -_2515;
        float _2525 = fma(_2463, 2.0, _2523);
        float _2527 = _2521 ? _2451 : 0.00999999977648258209228515625;
        float _2529 = sqrt(_2499);
        float _2531 = _2427 * _2527;
        float _2533 = precise::max(_2531, -127.0);
        float _2535 = fma(_2517, _2505, 100.0);
        float _2537 = _281 + 1.0;
        float _2539 = 1.0 / _2533;
        float _2541 = _2529 * 0.636619746685028076171875;
        float _2543 = fma(_2380, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _2545 = _2497 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _2547 = _2391 * _2415;
        float _2549 = _2543 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _2551 = exp2(_2545);
        float _2553 = fma(_2385, 0.88622701168060302734375, _2547);
        float _2555 = -_2549;
        float _2557 = _2525 + _2555;
        float _2559 = precise::max(0.0, _2557);
        float _2561 = -_2533;
        float _2563 = exp2(_2561);
        float _2565 = -_2535;
        float _2567 = _2565 + _2559;
        float _2569 = fma(_277, 0.5, 0.5);
        float _2571 = -_281;
        float _2573 = fma(_2551, _2537, _2571);
        float _2575 = _2427 * _2567;
        float _2577 = fma(_2569, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _2579 = fma(_2573, 0.5, 0.5);
        float _2581 = fma(_2569, _2577, -0.212114393711090087890625);
        float _2583 = -_2575;
        float _2585 = exp2(_2583);
        float _2587 = -_2563;
        float _2589 = _2587 + 1.0;
        float _2591 = fma(_2569, _2581, 1.570728778839111328125);
        float _2593 = -_2591;
        float _2595 = fma(_2541, _2593, 1.0);
        float3 _7431 = float3(_2376, _2378, float(2));
        float3 _7433 = select(_7431, float3(0.0), isnan(_7431));
        float4 _2597 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7433.xy, uint(rint(_7433.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7433.xy, uint(rint(_7433.z)), level(0.0)).xyzw;
        float _2599 = _2597.x;
        float _2601 = _2597.y;
        float _2603 = _2597.z;
        float _2605 = _2597.w;
        float3 _7448 = float3(_2376, _2378, float(3));
        float3 _7450 = select(_7448, float3(0.0), isnan(_7448));
        float4 _2607 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7450.xy, uint(rint(_7450.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7450.xy, uint(rint(_7450.z)), level(0.0)).xyzw;
        float _2609 = _2607.x;
        float _2611 = _2607.y;
        float _2613 = _2607.z;
        float _2615 = _2607.w;
        float3 _7465 = float3(_2376, _2378, float(4));
        float3 _7467 = select(_7465, float3(0.0), isnan(_7465));
        float4 _2617 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7467.xy, uint(rint(_7467.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7467.xy, uint(rint(_7467.z)), level(0.0)).xyzw;
        float _2619 = _2617.x;
        float _2621 = _2617.y;
        float _2623 = _2617.z;
        float _2625 = _2617.w;
        float2 _7481 = float2(_2376, _2378);
        float _2627 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_7481, float2(0.0), isnan(_7481)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_7481, float2(0.0), isnan(_7481)), level(0.0)).z;
        float3 _7490 = float3(_2376, _2378, float(6));
        float3 _7492 = select(_7490, float3(0.0), isnan(_7490));
        float4 _2629 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7492.xy, uint(rint(_7492.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7492.xy, uint(rint(_7492.z)), level(0.0)).xyzw;
        float _2631 = _2629.x;
        float _2633 = _2629.y;
        float _2635 = _2629.z;
        float _2637 = _2629.w;
        float _2639 = _2585 * _2589;
        float _2641 = _2395 * _2415;
        float _2643 = _2397 * _2415;
        float _2645 = fma(_2399, _2421, _2553);
        float _2647 = _2639 * _2539;
        float _2649 = fma(_2387, 0.88622701168060302734375, _2641);
        float3 _7527 = float3(_2376, _2378, float(7));
        float3 _7529 = select(_7527, float3(0.0), isnan(_7527));
        float4 _2651 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7529.xy, uint(rint(_7529.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7529.xy, uint(rint(_7529.z)), level(0.0)).xyzw;
        float _2653 = _2651.x;
        float _2655 = _2651.y;
        float _2657 = _2651.z;
        float _2659 = _2651.w;
        float _2661 = fma(_2389, 0.88622701168060302734375, _2643);
        float3 _7547 = float3(_2376, _2378, float(5));
        float3 _7549 = select(_7547, float3(0.0), isnan(_7547));
        float4 _2663 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7549.xy, uint(rint(_7549.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7549.xy, uint(rint(_7549.z)), level(0.0)).xyzw;
        float _2665 = _2663.x;
        float _2667 = _2663.y;
        float _2669 = _2663.z;
        float _2671 = _2663.w;
        float2 _7563 = float2(_2595, _2579);
        float3 _2675 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_7563, float2(0.0), isnan(_7563)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_7563, float2(0.0), isnan(_7563)), level(0.0)).xyz;
        float _2677 = _2675.x;
        float _2679 = _2675.y;
        float _2681 = _2675.z;
        float _2683 = fma(_2401, _2421, _2649);
        float _2685 = _153 * 1.02332699298858642578125;
        float _2687 = _2497 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _2689 = _2491 * 0.25;
        bool _2691 = as_type<int>(_99) != 0;
        float _2693 = exp2(_2687);
        float _2695 = fma(_2601, _2685, _2645);
        float _2697 = fma(_2603, _2685, _2683);
        float _2699 = fma(_2599, _2421, _2661);
        float _2701 = _2615 * _2415;
        float _2703 = precise::max(0.0, _2695);
        float _2705 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _2707 = fma(_2609, 0.88622701168060302734375, _2701);
        float _2709 = precise::max(0.0, _2697);
        float _2711 = fma(_2605, _2685, _2699);
        float _2713 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _2715 = _2703 * _2705;
        float _2717 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _2719 = _2619 * _2415;
        float _2721 = _2709 * _2713;
        float _2723 = fma(_2611, 0.88622701168060302734375, _2719);
        float _2725 = precise::max(0.0, _2711);
        float _2727 = _2621 * _2415;
        float _2729 = fma(_2623, _2421, _2707);
        float _2731 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _2733 = _2627 * 2.0;
        float _2735 = _2725 * _2717;
        float _2737 = fma(_2627, _2627, 1.0);
        float _2739 = fma(_2613, 0.88622701168060302734375, _2727);
        float _2741 = _2633 * _2415;
        float _2743 = log2(_2731);
        float _2745 = -_2733;
        float _2747 = fma(_277, _2745, _2737);
        float _2749 = -_2733;
        float _2751 = _2737 + _2749;
        float _2753 = fma(_2631, 0.88622701168060302734375, _2741);
        float _2755 = _2655 * _2415;
        float _2757 = fma(_2625, _2421, _2723);
        float _2759 = fma(_2667, _2685, _2729);
        float _2761 = fma(_2635, _2421, _2753);
        float _2763 = abs(_2747);
        float _2765 = log2(_2763);
        float _2767 = fma(_2653, 0.88622701168060302734375, _2755);
        float _2769 = fma(_2665, _2421, _2739);
        float _2771 = fma(_2637, _2685, _2761);
        float _2773 = fma(_2669, _2685, _2757);
        float _2775 = fma(_2657, _2421, _2767);
        float _2777 = fma(_2671, _2685, _2769);
        float _2779 = _2771 * 0.31830990314483642578125;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = abs(_2751);
        float _2785 = log2(_2783);
        float _2787 = _2743 * (-0.0199999995529651641845703125);
        float _2789 = fma(_2659, _2685, _2775);
        float _2791 = precise::max(0.0, _2759);
        float _2793 = -_2627;
        float _2795 = fma(_2793, _2627, 1.0);
        float _2797 = _378 * _2787;
        float _2799 = precise::min(_2781, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _2801 = _2789 * 0.31830990314483642578125;
        float _2803 = precise::clamp(_2801, 0.0, 1.0);
        float _2805 = 1.0 / _378;
        float _2807 = _2647 * _2797;
        float _2809 = _2765 * 1.5;
        float _2811 = _2799 * 0.88622701168060302734375;
        float _2813 = precise::max(0.0, _2773);
        float _2815 = _2803 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _2817 = precise::clamp(_2815, 0.0, 1.0);
        float _2819 = precise::max(0.0, _2777);
        float _2821 = fma(_2811, (*spvDescriptorSet0.cp_c3)._m0[9].x, _2715);
        float _2823 = _2785 * 1.5;
        float _2825 = exp2(_2809);
        float _2827 = fma(_2811, (*spvDescriptorSet0.cp_c3)._m0[9].y, _2721);
        float _2829 = fma(_2811, (*spvDescriptorSet0.cp_c3)._m0[9].z, _2735);
        float _2831 = fma(_2791, _2817, _2821);
        float _2833 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _2835 = _2423 + _2833;
        float _2837 = fma(_2813, _2817, _2827);
        float _2839 = fma(_2819, _2817, _2829);
        float _2841 = _2689 * _2679;
        float _2843 = exp2(_2823);
        float _2845 = _2835 * _2805;
        float _2847 = precise::clamp(_2845, 0.0, 1.0);
        float _2849 = -_2693;
        float _2851 = _2849 + 1.0;
        float _2853 = _378 * _2689;
        float _2855 = _2689 * _2677;
        float _2857 = _2807 * _2847;
        float _2859 = _2689 * _2681;
        int _2861 = _287 + as_type<int>(_99);
        float _2863 = _2825 * 12.56637096405029296875;
        float _2865 = _2851 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _2867 = _2817;
        float _2869 = _2805;
        if (_2691)
        {
            _2867 = as_type<float>(_330);
        }
        int _2871 = as_type<int>(_2867);
        int _2873 = _2861 << 2;
        int _2875 = _2873 + 1024;
        uint _2877 = uint(int(uint(_2875) >> uint(2)));
        _26[int(_2877)] = as_type<uint>(_2853);
        float _2879 = 1.0 / _2863;
        float _2881 = _2843 * 12.56637096405029296875;
        int _2883 = _2861 << 4;
        uint _2885 = uint(int(uint(_2883) >> uint(2)));
        _26[int(_2885)] = as_type<uint>(_2855);
        int _2887 = _2883 + 4;
        uint _2889 = uint(int(uint(_2887) >> uint(2)));
        _26[int(_2889)] = as_type<uint>(_2841);
        int _2891 = _2883 + 8;
        uint _2893 = uint(int(uint(_2891) >> uint(2)));
        _26[int(_2893)] = as_type<uint>(_2859);
        int _2895 = _2883 + 12;
        uint _2897 = uint(int(uint(_2895) >> uint(2)));
        _26[int(_2897)] = as_type<uint>(_2865);
        float _2899 = 1.0 / _2881;
        float _2901 = _2795 * _2879;
        float _2903 = _2689 * _2901;
        float _2905 = _2795 * _2899;
        float _2907 = _2831 * _2905;
        float _2909 = _2837 * _2905;
        float _2911 = _2839 * _2905;
        float _2913 = fma(_2903, (*spvDescriptorSet0.cp_c3)._m0[7].x, _2907);
        float _2915 = fma(_2903, (*spvDescriptorSet0.cp_c3)._m0[7].y, _2909);
        float _2917 = fma(_2903, (*spvDescriptorSet0.cp_c3)._m0[7].z, _2911);
        float _2919 = _2909;
        float _2921 = _2911;
        float _2923 = _2907;
        float _2925 = _2879;
        int _2927 = _2871;
        if (_2691)
        {
            _2919 = as_type<float>(_332);
        }
        int _2929 = as_type<int>(_2919);
        float _2931 = _2913 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _2933 = _2915 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _2935 = _2917 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _2937 = _2929;
        if (_2691)
        {
            _2921 = as_type<float>(_334);
        }
        int _2939 = as_type<int>(_2921);
        int _2941 = _2939;
        if (_2691)
        {
            _2923 = _336;
        }
        float _2943 = _2923;
        int _2945 = _2861 << 4;
        int _2947 = _2945 + 1280;
        uint _2949 = uint(int(uint(_2947) >> uint(2)));
        _26[int(_2949)] = as_type<uint>(_2931);
        int _2951 = _2945 + 1284;
        uint _2953 = uint(int(uint(_2951) >> uint(2)));
        _26[int(_2953)] = as_type<uint>(_2933);
        int _2955 = _2945 + 1288;
        uint _2957 = uint(int(uint(_2955) >> uint(2)));
        _26[int(_2957)] = as_type<uint>(_2935);
        int _2959 = _2945 + 1292;
        uint _2961 = uint(int(uint(_2959) >> uint(2)));
        _26[int(_2961)] = as_type<uint>(_2857);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        float _2963 = _2943;
        float _2965 = _2943;
        if (!_2691)
        {
            int _2967 = _287 << 4;
            int _2969 = _2967 + 1280;
            uint _2971 = uint(int(uint(_2969) >> uint(2)));
            float _2973 = as_type<float>(_26[int(_2971)]);
            int _2975 = _2967 + 1284;
            uint _2977 = uint(int(uint(_2975) >> uint(2)));
            float _2979 = as_type<float>(_26[int(_2977)]);
            int _2981 = _2967 + 1288;
            uint _2983 = uint(int(uint(_2981) >> uint(2)));
            float _2985 = as_type<float>(_26[int(_2983)]);
            int _2987 = _2967 + 1292;
            uint _2989 = uint(int(uint(_2987) >> uint(2)));
            float _2991 = as_type<float>(_26[int(_2989)]);
            int _2993 = _287 << 4;
            int _2995 = _2993 + 1296;
            uint _2997 = uint(int(uint(_2995) >> uint(2)));
            float _2999 = as_type<float>(_26[int(_2997)]);
            int _3001 = _2993 + 1300;
            uint _3003 = uint(int(uint(_3001) >> uint(2)));
            float _3005 = as_type<float>(_26[int(_3003)]);
            int _3007 = _2993 + 1304;
            uint _3009 = uint(int(uint(_3007) >> uint(2)));
            float _3011 = as_type<float>(_26[int(_3009)]);
            int _3013 = _2993 + 1308;
            uint _3015 = uint(int(uint(_3013) >> uint(2)));
            float _3017 = as_type<float>(_26[int(_3015)]);
            int _3019 = _287 << 4;
            uint _3021 = uint(int(uint(_3019) >> uint(2)));
            float _3023 = as_type<float>(_26[int(_3021)]);
            int _3025 = _3019 + 4;
            uint _3027 = uint(int(uint(_3025) >> uint(2)));
            float _3029 = as_type<float>(_26[int(_3027)]);
            int _3031 = _3019 + 8;
            uint _3033 = uint(int(uint(_3031) >> uint(2)));
            float _3035 = as_type<float>(_26[int(_3033)]);
            int _3037 = _3019 + 12;
            uint _3039 = uint(int(uint(_3037) >> uint(2)));
            float _3041 = as_type<float>(_26[int(_3039)]);
            int _3043 = _287 << 4;
            int _3045 = _3043 + 16;
            uint _3047 = uint(int(uint(_3045) >> uint(2)));
            float _3049 = as_type<float>(_26[int(_3047)]);
            int _3051 = _3043 + 20;
            uint _3053 = uint(int(uint(_3051) >> uint(2)));
            float _3055 = as_type<float>(_26[int(_3053)]);
            int _3057 = _3043 + 24;
            uint _3059 = uint(int(uint(_3057) >> uint(2)));
            float _3061 = as_type<float>(_26[int(_3059)]);
            int _3063 = _3043 + 28;
            uint _3065 = uint(int(uint(_3063) >> uint(2)));
            float _3067 = as_type<float>(_26[int(_3065)]);
            int _3069 = _287 << 4;
            int _3071 = _3069 + 1312;
            uint _3073 = uint(int(uint(_3071) >> uint(2)));
            float _3075 = as_type<float>(_26[int(_3073)]);
            int _3077 = _3069 + 1316;
            uint _3079 = uint(int(uint(_3077) >> uint(2)));
            float _3081 = as_type<float>(_26[int(_3079)]);
            int _3083 = _3069 + 1320;
            uint _3085 = uint(int(uint(_3083) >> uint(2)));
            float _3087 = as_type<float>(_26[int(_3085)]);
            int _3089 = _3069 + 1324;
            uint _3091 = uint(int(uint(_3089) >> uint(2)));
            float _3093 = as_type<float>(_26[int(_3091)]);
            int _3095 = _287 << 4;
            int _3097 = _3095 + 1328;
            uint _3099 = uint(int(uint(_3097) >> uint(2)));
            float _3101 = as_type<float>(_26[int(_3099)]);
            int _3103 = _3095 + 1332;
            uint _3105 = uint(int(uint(_3103) >> uint(2)));
            float _3107 = as_type<float>(_26[int(_3105)]);
            int _3109 = _3095 + 1336;
            uint _3111 = uint(int(uint(_3109) >> uint(2)));
            float _3113 = as_type<float>(_26[int(_3111)]);
            int _3115 = _3095 + 1340;
            uint _3117 = uint(int(uint(_3115) >> uint(2)));
            float _3119 = as_type<float>(_26[int(_3117)]);
            float _3121 = _336 + _2991;
            float _3123 = -_3121;
            float _3125 = exp2(_3123);
            float _3127 = _3121 + _3017;
            float _3129 = -_2973;
            float _3131 = _3129 + _3023;
            float _3133 = -_2979;
            float _3135 = _3133 + _3029;
            float _3137 = -_2985;
            float _3139 = _3137 + _3035;
            float _3141 = -_3127;
            float _3143 = exp2(_3141);
            float _3145 = -_3005;
            float _3147 = _3145 + _3055;
            float _3149 = -_3011;
            float _3151 = _3149 + _3061;
            float _3153 = -_2999;
            float _3155 = _3153 + _3049;
            float _3157 = _3127 + _3093;
            float _3159 = -_3125;
            float _3161 = _3159 + 1.0;
            float _3163 = -_3157;
            float _3165 = exp2(_3163);
            int _3167 = _287 << 4;
            int _3169 = _3167 + 32;
            uint _3171 = uint(int(uint(_3169) >> uint(2)));
            float _3173 = as_type<float>(_26[int(_3171)]);
            int _3175 = _3167 + 36;
            uint _3177 = uint(int(uint(_3175) >> uint(2)));
            float _3179 = as_type<float>(_26[int(_3177)]);
            int _3181 = _3167 + 40;
            uint _3183 = uint(int(uint(_3181) >> uint(2)));
            float _3185 = as_type<float>(_26[int(_3183)]);
            int _3187 = _3167 + 44;
            uint _3189 = uint(int(uint(_3187) >> uint(2)));
            float _3191 = as_type<float>(_26[int(_3189)]);
            float _3193 = _3157 + _3119;
            float _3195 = precise::min(_3161, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3197 = -_3143;
            float _3199 = _3197 + 1.0;
            float _3201 = -_338;
            float _3203 = _3195 + _3201;
            float _3205 = precise::min(_3199, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3207 = _3203 * _3041;
            float _3209 = -_3165;
            float _3211 = _3209 + 1.0;
            float _3213 = _3135 * _3207;
            float _3215 = _3139 * _3207;
            float _3217 = _3131 * _3207;
            float _3219 = fma(_2979, _3203, _3213);
            float _3221 = -_3195;
            float _3223 = _3221 + _3205;
            float _3225 = fma(_2973, _3203, _3217);
            float _3227 = fma(_2985, _3203, _3215);
            float _3229 = _3219 + as_type<float>(_332);
            float _3231 = _3223 * _3067;
            int _3233 = _287 << 4;
            int _3235 = _3233 + 48;
            uint _3237 = uint(int(uint(_3235) >> uint(2)));
            float _3239 = as_type<float>(_26[int(_3237)]);
            int _3241 = _3233 + 52;
            uint _3243 = uint(int(uint(_3241) >> uint(2)));
            float _3245 = as_type<float>(_26[int(_3243)]);
            int _3247 = _3233 + 56;
            uint _3249 = uint(int(uint(_3247) >> uint(2)));
            float _3251 = as_type<float>(_26[int(_3249)]);
            int _3253 = _3233 + 60;
            uint _3255 = uint(int(uint(_3253) >> uint(2)));
            float _3257 = as_type<float>(_26[int(_3255)]);
            float _3259 = _3225 + as_type<float>(_330);
            float _3261 = _3227 + as_type<float>(_334);
            float _3263 = _3147 * _3231;
            float _3265 = _3151 * _3231;
            int _3267 = _287 << 2;
            int _3269 = _3267 + 1024;
            uint _3271 = uint(int(uint(_3269) >> uint(2)));
            float _3273 = as_type<float>(_26[int(_3271)]);
            float _3275 = _3155 * _3231;
            float _3277 = fma(_3005, _3223, _3263);
            float _3279 = precise::min(_3211, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _3281 = _287 << 2;
            int _3283 = _3281 + 1028;
            uint _3285 = uint(int(uint(_3283) >> uint(2)));
            float _3287 = as_type<float>(_26[int(_3285)]);
            float _3289 = fma(_2999, _3223, _3275);
            float _3291 = fma(_3011, _3223, _3265);
            float _3293 = -_3193;
            float _3295 = exp2(_3293);
            int _3297 = _287 << 2;
            int _3299 = _3297 + 1032;
            uint _3301 = uint(int(uint(_3299) >> uint(2)));
            float _3303 = as_type<float>(_26[int(_3301)]);
            float _3305 = -_3075;
            float _3307 = _3305 + _3173;
            float _3309 = -_3205;
            float _3311 = _3309 + _3279;
            float _3313 = -_3081;
            float _3315 = _3313 + _3179;
            int _3317 = _287 << 2;
            int _3319 = _3317 + 1036;
            uint _3321 = uint(int(uint(_3319) >> uint(2)));
            float _3323 = as_type<float>(_26[int(_3321)]);
            float _3325 = -_3087;
            float _3327 = _3325 + _3185;
            float _3329 = _3311 * _3191;
            float _3331 = _3261 + _3291;
            int _3333 = _287 << 4;
            int _3335 = _3333 + 1280;
            uint _3337 = uint(int(uint(_3335) >> uint(2)));
            _26[int(_3337)] = as_type<uint>(_3259);
            int _3339 = _3333 + 1284;
            uint _3341 = uint(int(uint(_3339) >> uint(2)));
            _26[int(_3341)] = as_type<uint>(_3229);
            int _3343 = _3333 + 1288;
            uint _3345 = uint(int(uint(_3343) >> uint(2)));
            _26[int(_3345)] = as_type<uint>(_3261);
            int _3347 = _3333 + 1292;
            uint _3349 = uint(int(uint(_3347) >> uint(2)));
            _26[int(_3349)] = as_type<uint>(_3121);
            float _3351 = _3315 * _3329;
            float _3353 = _3307 * _3329;
            float _3355 = _3327 * _3329;
            float _3357 = fma(_3081, _3311, _3351);
            float _3359 = -_3295;
            float _3361 = _3359 + 1.0;
            float _3363 = fma(_3075, _3311, _3353);
            float _3365 = fma(_3087, _3311, _3355);
            float _3367 = _3259 + _3289;
            float _3369 = _3229 + _3277;
            float _3371 = precise::min(_3361, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3373 = _3331 + _3365;
            float _3375 = _3367 + _3363;
            float _3377 = _3369 + _3357;
            int _3379 = _287 << 4;
            int _3381 = _3379 + 1296;
            uint _3383 = uint(int(uint(_3381) >> uint(2)));
            _26[int(_3383)] = as_type<uint>(_3367);
            int _3385 = _3379 + 1300;
            uint _3387 = uint(int(uint(_3385) >> uint(2)));
            _26[int(_3387)] = as_type<uint>(_3369);
            int _3389 = _3379 + 1304;
            uint _3391 = uint(int(uint(_3389) >> uint(2)));
            _26[int(_3391)] = as_type<uint>(_3331);
            int _3393 = _3379 + 1308;
            uint _3395 = uint(int(uint(_3393) >> uint(2)));
            _26[int(_3395)] = as_type<uint>(_3127);
            float _3397 = -_3279;
            float _3399 = _3371 + _3397;
            float _3401 = -_3101;
            float _3403 = _3401 + _3239;
            float _3405 = -_3107;
            float _3407 = _3405 + _3245;
            float _3409 = _3399 * _3257;
            float _3411 = -_3113;
            float _3413 = _3411 + _3251;
            int _3415 = _287 << 4;
            int _3417 = _3415 + 1312;
            uint _3419 = uint(int(uint(_3417) >> uint(2)));
            _26[int(_3419)] = as_type<uint>(_3375);
            int _3421 = _3415 + 1316;
            uint _3423 = uint(int(uint(_3421) >> uint(2)));
            _26[int(_3423)] = as_type<uint>(_3377);
            int _3425 = _3415 + 1320;
            uint _3427 = uint(int(uint(_3425) >> uint(2)));
            _26[int(_3427)] = as_type<uint>(_3373);
            int _3429 = _3415 + 1324;
            uint _3431 = uint(int(uint(_3429) >> uint(2)));
            _26[int(_3431)] = as_type<uint>(_3157);
            float _3433 = _3273 + _340;
            float _3435 = _3403 * _3409;
            float _3437 = _3407 * _3409;
            float _3439 = _3413 * _3409;
            float _3441 = _3433 + _3287;
            float _3443 = fma(_3101, _3399, _3435);
            float _3445 = fma(_3107, _3399, _3437);
            float _3447 = fma(_3113, _3399, _3439);
            float _3449 = _3441 + _3303;
            float _3451 = _3443 + _3375;
            float _3453 = _3445 + _3377;
            float _3455 = _3447 + _3373;
            float _3457 = _3449 + _3323;
            int _3459 = _287 << 2;
            int _3461 = _3459 + 1024;
            uint _3463 = uint(int(uint(_3461) >> uint(2)));
            _26[int(_3463)] = as_type<uint>(_3433);
            int _3465 = _287 << 2;
            int _3467 = _3465 + 1028;
            uint _3469 = uint(int(uint(_3467) >> uint(2)));
            _26[int(_3469)] = as_type<uint>(_3441);
            int _3471 = _287 << 2;
            int _3473 = _3471 + 1032;
            uint _3475 = uint(int(uint(_3473) >> uint(2)));
            _26[int(_3475)] = as_type<uint>(_3449);
            int _3477 = _287 << 2;
            int _3479 = _3477 + 1036;
            uint _3481 = uint(int(uint(_3479) >> uint(2)));
            _26[int(_3481)] = as_type<uint>(_3457);
            int _3483 = _287 << 4;
            int _3485 = _3483 + 1328;
            uint _3487 = uint(int(uint(_3485) >> uint(2)));
            _26[int(_3487)] = as_type<uint>(_3451);
            int _3489 = _3483 + 1332;
            uint _3491 = uint(int(uint(_3489) >> uint(2)));
            _26[int(_3491)] = as_type<uint>(_3453);
            int _3493 = _3483 + 1336;
            uint _3495 = uint(int(uint(_3493) >> uint(2)));
            _26[int(_3495)] = as_type<uint>(_3455);
            int _3497 = _3483 + 1340;
            uint _3499 = uint(int(uint(_3497) >> uint(2)));
            _26[int(_3499)] = as_type<uint>(_3193);
            _2963 = _3193;
            _2925 = _3261;
            _2869 = _3399;
            _466 = _3371;
            _468 = _3457;
            _2927 = as_type<int>(_3451);
            _2937 = as_type<int>(_3453);
            _2941 = as_type<int>(_3455);
            _2965 = _3193;
        }
        float _3501 = _2963;
        float _3503 = _2925;
        float _3505 = _2869;
        float _3507 = _466;
        float _3509 = _468;
        int _3511 = _2927;
        int _3513 = _2937;
        int _3515 = _2941;
        float _3517 = _2965;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _3519 = _2861 << 4;
        int _3521 = _3519 + 1280;
        uint _3523 = uint(int(uint(_3521) >> uint(2)));
        float _3525 = as_type<float>(_26[int(_3523)]);
        int _3527 = _3519 + 1284;
        uint _3529 = uint(int(uint(_3527) >> uint(2)));
        float _3531 = as_type<float>(_26[int(_3529)]);
        int _3533 = _3519 + 1288;
        uint _3535 = uint(int(uint(_3533) >> uint(2)));
        float _3537 = as_type<float>(_26[int(_3535)]);
        int _3539 = _3519 + 1292;
        uint _3541 = uint(int(uint(_3539) >> uint(2)));
        float _3543 = as_type<float>(_26[int(_3541)]);
        float _3545 = 1.0 / _2423;
        int _3547 = _2861 << 2;
        int _3549 = _3547 + 1024;
        uint _3551 = uint(int(uint(_3549) >> uint(2)));
        float _3553 = as_type<float>(_26[int(_3551)]);
        float _3555 = -_3543;
        float _3557 = exp2(_3555);
        float _3559 = _3553 * _3545;
        float _3561 = precise::max(_3557, _285);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_3525, _3531, _3537, _3561), uint3(int3(_81, _77, int(_316))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_3559, _3559, _3559, _3559), uint3(int3(_81, _77, int(_316))));
        int _3563 = int(_316) + 4;
        bool _3565 = uint(_3563) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _290 = uint(_3563);
        _292 = _3501;
        _294 = _3559;
        _296 = _3559;
        _298 = _3543;
        _300 = _3503;
        _302 = _3505;
        _304 = _3511;
        _306 = _3513;
        _308 = _3515;
        _310 = _3517;
        _312 = _3507;
        _314 = _3509;
        if (_3565)
        {
            _3567 = true;
            if (_3567)
            {
                break;
            }
        }
    } while (true);
    _3567 = false;
}

