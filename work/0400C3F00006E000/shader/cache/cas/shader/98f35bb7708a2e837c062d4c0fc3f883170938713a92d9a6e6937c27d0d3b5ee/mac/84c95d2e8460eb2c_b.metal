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
    texture2d_array<float> cp_t_tcb_A [[id(2)]];
    sampler cp_t_tcb_ASmplr [[id(3)]];
    texture2d_array<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    texture2d_array<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> cp_t_tcb_E [[id(8)]];
    sampler cp_t_tcb_ESmplr [[id(9)]];
    texture3d<float, access::write> cp_i_tcb_48_ [[id(10)]];
    texture3d<float, access::write> cp_i_tcb_4A_ [[id(11)]];
    sampler cp_t_tcb_CSmplr_w [[id(12)]];
    sampler cp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    threadgroup spvUnsafeArray<uint, 576> _26;
    bool _3559 = false;
    float _62 = as_type<float>(gl_WorkGroupID.y);
    float _64 = as_type<float>(gl_LocalInvocationID.y);
    float _66 = as_type<float>(gl_WorkGroupID.x);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    int _71 = as_type<int>(_62) << 2;
    int _73 = _71 + as_type<int>(_64);
    int _75 = as_type<int>(_66) << 2;
    int _77 = _75 + as_type<int>(_68);
    float _79 = float(uint(_73));
    float _81 = float(uint(_77));
    float _83 = _79 + 0.5;
    float _85 = _81 + 0.5;
    float _87 = -_83;
    float _89 = fma(_87, (*spvDescriptorSet0.cp_c4)._m0[0].y, 0.5);
    float _91 = fma(_85, (*spvDescriptorSet0.cp_c4)._m0[0].x, -0.5);
    float _93 = fma(_89, (*spvDescriptorSet0.cp_c3)._m0[4].y, (*spvDescriptorSet0.cp_c3)._m0[4].w);
    float _95 = as_type<float>(gl_LocalInvocationID.z);
    float _97 = fma(_91, (*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _99 = _93 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _101 = _93 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _103 = _93 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _105 = fma(_97, (*spvDescriptorSet0.cp_c3)._m0[1].x, _99);
    float _107 = fma(_97, (*spvDescriptorSet0.cp_c3)._m0[0].x, _101);
    float _109 = fma(_97, (*spvDescriptorSet0.cp_c3)._m0[2].x, _103);
    float _111 = -(*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _113 = _105 + _111;
    float _115 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _117 = _107 + _115;
    float _119 = -(*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _121 = _109 + _119;
    float _123 = _113 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _125 = _117 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _127 = _121 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _129 = -(*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _131 = _123 + _129;
    float _133 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _135 = _125 + _133;
    float _137 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _139 = _127 + _137;
    float _141 = _131 * _131;
    float _143 = fma(_135, _135, _141);
    float _145 = fma(_139, _139, _143);
    float _147 = rsqrt(_145);
    float _149 = _135 * _147;
    float _151 = _139 * _147;
    float _153 = _131 * _147;
    float _155 = _149 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _157 = _151 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _159 = (*spvDescriptorSet0.cp_c3)._m0[3].y + (-220.0);
    float _161 = _155 * _155;
    float _163 = _157 * _157;
    float _165 = precise::max(0.0, _159);
    float _167 = _161 + _163;
    float _169 = sqrt(_167);
    float _171 = -_153;
    float _173 = -_165;
    float _175 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[8].w, _173);
    bool _179 = _169 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _181 = _147;
    float _183 = _175;
    float _185 = _163;
    if (!_179)
    {
        _181 = _161;
    }
    float _187 = _181;
    bool _189 = !_179;
    float _191 = _187;
    if (!_189)
    {
        float _193 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _195 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _197 = _169 + _195;
        float _199 = _175 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _201 = rsqrt(_167);
        float _203 = _197 * _193;
        float _205 = _203 * 0.15915493667125701904296875;
        float _207 = _205 * 6.283185482025146484375;
        float _209 = sin(_207);
        float _211 = _205 * 6.283185482025146484375;
        float _213 = cos(_211);
        float _215 = fma(_209, _199, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _217 = _201 * _215;
        float _219 = _213 + (-1.0);
        float _221 = _155 * _217;
        float _223 = _219 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _225 = _157 * _217;
        float _227 = fma(_175, _213, _223);
        float _229 = _221 * _221;
        float _231 = _225 * _225;
        _183 = _227;
        _191 = _229;
        _185 = _231;
    }
    float _233 = _183;
    float _235 = _191;
    float _237 = _185;
    float _239 = _93 * _93;
    float _241 = fma(_233, _233, _235);
    bool _243 = as_type<uint>(_95) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _245 = fma(_97, _97, _239);
    float _247 = _241 + _237;
    float _249 = _149 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _251 = _245 + 1.0;
    float _253 = rsqrt(_247);
    float _255 = -_153;
    float _257 = -_249;
    float _259 = fma(_255, (*spvDescriptorSet0.cp_c3)._m0[6].y, _257);
    float _261 = -_151;
    float _263 = fma(_261, (*spvDescriptorSet0.cp_c3)._m0[6].z, _259);
    float _265 = sqrt(_251);
    if (_243)
    {
        return;
    }
    int _267 = as_type<int>(_64) << 2;
    int _269 = _267 + as_type<int>(_68);
    float _271 = -_263;
    float _273 = fma(_271, (*spvDescriptorSet0.cp_c3)._m0[15].x, _263);
    float _275 = rsqrt(_251);
    float _277 = _253 * _233;
    float _279 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _281 = _279 + 1.0;
    int _283 = _269 << 2;
    uint _286 = as_type<uint>(_95);
    float _288 = 0.0;
    float _290 = 0.0;
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
    do
    {
        uint _314 = _286;
        float _316 = _288;
        float _318 = _290;
        float _320 = _292;
        float _322 = _294;
        float _324 = _296;
        float _326 = _298;
        float _328 = _300;
        float _330 = _302;
        int _332 = _304;
        int _334 = _306;
        int _336 = _308;
        float _338 = _310;
        float _340 = _312;
        float _342 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _344 = log2(_342);
        float _346 = float(_314);
        int _348 = int(_314) + 1;
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
        float _372 = _265 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _374 = _265 * _370;
        float _376 = _364 * _372;
        float _378 = _374 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _380 = fma(_149, _376, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _382 = _378 * 0.25;
        float _384 = _376 + _382;
        float _386 = fma(_149, _382, _380);
        float _388 = -_275;
        float _390 = _384 * _388;
        float _392 = fma(_153, _376, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _394 = fma(_151, _376, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _396 = -_390;
        float _398 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _400 = _396 + _398;
        float _402 = -_390;
        float _404 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _406 = _402 + _404;
        float _408 = fma(_153, _382, _392);
        float _410 = fma(_151, _382, _394);
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
        float _448 = _316;
        float _450 = _322;
        float _452 = _320;
        float _454 = _328;
        float _456 = _318;
        float _458 = _326;
        float _460 = _410;
        float _462 = _392;
        float _464 = _338;
        float _466 = _340;
        if (!_434)
        {
            _446 = 1.0;
        }
        float _468 = _446;
        bool _470 = !_434;
        float _472 = _468;
        if (!_470)
        {
            float _474 = -_390;
            bool _476 = _474 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _478 = -_390;
            bool _480 = _478 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _482 = !_476;
            int _484 = _482 ? 0 : 1;
            int _486 = 2;
            if (!_476)
            {
                _486 = 1;
            }
            int _488 = _486;
            int _490 = _488;
            if (!_480)
            {
                _490 = _484;
            }
            int _492 = _490;
            int _494 = _492 << 6;
            float _496 = float(_492);
            int _498 = _494 + 304;
            uint _500 = uint(int(uint(_498) >> uint(2)));
            uint _502 = uint(int(uint(int(_500)) >> uint(2)));
            int _504 = int(_500) & 3;
            float _506 = (*spvDescriptorSet0.cp_c3)._m0[int(_502)][_504];
            int _508 = int(_500) + 1;
            uint _510 = uint(int(uint(_508) >> uint(2)));
            int _512 = _508 & 3;
            float _514 = (*spvDescriptorSet0.cp_c3)._m0[int(_510)][_512];
            int _516 = _494 + 312;
            uint _518 = uint(int(uint(_516) >> uint(2)));
            uint _520 = uint(int(uint(int(_518)) >> uint(2)));
            int _522 = int(_518) & 3;
            float _524 = (*spvDescriptorSet0.cp_c3)._m0[int(_520)][_522];
            int _526 = int(_518) + 1;
            uint _528 = uint(int(uint(_526) >> uint(2)));
            int _530 = _526 & 3;
            float _532 = (*spvDescriptorSet0.cp_c3)._m0[int(_528)][_530];
            int _534 = _494 + 256;
            uint _536 = uint(int(uint(_534) >> uint(2)));
            uint _538 = uint(int(uint(int(_536)) >> uint(2)));
            int _540 = int(_536) & 3;
            float _542 = (*spvDescriptorSet0.cp_c3)._m0[int(_538)][_540];
            int _544 = int(_536) + 1;
            uint _546 = uint(int(uint(_544) >> uint(2)));
            int _548 = _544 & 3;
            float _550 = (*spvDescriptorSet0.cp_c3)._m0[int(_546)][_548];
            int _552 = _494 + 272;
            uint _554 = uint(int(uint(_552) >> uint(2)));
            uint _556 = uint(int(uint(int(_554)) >> uint(2)));
            int _558 = int(_554) & 3;
            float _560 = (*spvDescriptorSet0.cp_c3)._m0[int(_556)][_558];
            int _562 = int(_554) + 1;
            uint _564 = uint(int(uint(_562) >> uint(2)));
            int _566 = _562 & 3;
            float _568 = (*spvDescriptorSet0.cp_c3)._m0[int(_564)][_566];
            int _570 = _494 + 288;
            uint _572 = uint(int(uint(_570) >> uint(2)));
            uint _574 = uint(int(uint(int(_572)) >> uint(2)));
            int _576 = int(_572) & 3;
            float _578 = (*spvDescriptorSet0.cp_c3)._m0[int(_574)][_576];
            int _580 = int(_572) + 1;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            int _584 = _580 & 3;
            float _586 = (*spvDescriptorSet0.cp_c3)._m0[int(_582)][_584];
            int _588 = _494 + 264;
            uint _590 = uint(int(uint(_588) >> uint(2)));
            uint _592 = uint(int(uint(int(_590)) >> uint(2)));
            int _594 = int(_590) & 3;
            float _596 = (*spvDescriptorSet0.cp_c3)._m0[int(_592)][_594];
            int _598 = int(_590) + 1;
            uint _600 = uint(int(uint(_598) >> uint(2)));
            int _602 = _598 & 3;
            float _604 = (*spvDescriptorSet0.cp_c3)._m0[int(_600)][_602];
            int _606 = _494 + 280;
            uint _608 = uint(int(uint(_606) >> uint(2)));
            uint _610 = uint(int(uint(int(_608)) >> uint(2)));
            int _612 = int(_608) & 3;
            float _614 = (*spvDescriptorSet0.cp_c3)._m0[int(_610)][_612];
            int _616 = int(_608) + 1;
            uint _618 = uint(int(uint(_616) >> uint(2)));
            int _620 = _616 & 3;
            float _622 = (*spvDescriptorSet0.cp_c3)._m0[int(_618)][_620];
            float _624 = _422 * _514;
            float _626 = fma(_420, _506, _624);
            int _628 = _494 + 296;
            uint _630 = uint(int(uint(_628) >> uint(2)));
            uint _632 = uint(int(uint(int(_630)) >> uint(2)));
            int _634 = int(_630) & 3;
            float _636 = (*spvDescriptorSet0.cp_c3)._m0[int(_632)][_634];
            int _638 = int(_630) + 1;
            uint _640 = uint(int(uint(_638) >> uint(2)));
            int _642 = _638 & 3;
            float _644 = (*spvDescriptorSet0.cp_c3)._m0[int(_640)][_642];
            float _646 = fma(_424, _524, _626);
            float _648 = _646 + _532;
            float _650 = _422 * _550;
            float _652 = 1.0 / _648;
            float _654 = fma(_420, _542, _650);
            float _656 = _422 * _568;
            float _658 = rint(_496);
            float _660 = precise::max(_658, 0.0);
            uint _662 = uint(_660);
            uint _664 = clamp(_662, 0u, 65535u);
            float _666 = fma(_420, _560, _656);
            float _668 = _422 * _586;
            float _670 = fma(_420, _578, _668);
            float _672 = fma(_424, _596, _654);
            float _674 = _672 + _604;
            float _676 = fma(_424, _614, _666);
            float _678 = _674 * _652;
            float _680 = _676 + _622;
            float _682 = fma(_424, _636, _670);
            float _684 = _680 * _652;
            float _686 = _682 + _644;
            float _688 = _686 * _652;
            float _690 = precise::clamp(_688, 0.0, 1.0);
            float3 _4498 = float3(_678, _684, float(int(_664)));
            float3 _4502 = select(_4498, float3(0.0), isnan(_4498));
            float _692 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _4502.xy, uint(rint(_4502.z)), _690, level(0.0));
            float _694 = -_692;
            float _696 = _694 + 1.0;
            float _698 = fma(_696, _414, _692);
            _448 = _692;
            _450 = _550;
            _452 = _690;
            _472 = _698;
            _454 = _496;
            _456 = _684;
            _458 = _622;
        }
        float _700 = _448;
        float _702 = _450;
        float _704 = _452;
        float _706 = _472;
        float _708 = _454;
        float _710 = _456;
        float _712 = _458;
        float _714 = _708;
        float _716 = _704;
        float _718 = _702;
        float _720 = _700;
        float _722 = _710;
        float _724 = _704;
        float _726 = _702;
        float _728 = _706;
        float _730 = _712;
        if (!_444)
        {
            _714 = 1.0;
        }
        float _732 = _714;
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
                float3 _4795 = float3(_848, _884, float(int(_878)));
                float3 _4797 = select(_4795, float3(0.0), isnan(_4795));
                float _890 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_8).sample_compare(spvDescriptorSet0.cp_t_tcb_8Smplr, _4797.xy, uint(rint(_4797.z)), _888, level(0.0));
                _796 = _890;
                _792 = _834;
                _716 = _888;
                _718 = _848;
            }
            float _892 = _796;
            float _894 = _792;
            float _896 = _716;
            float _898 = _718;
            float _900 = -_892;
            float _902 = _900 + 1.0;
            float _904 = fma(_902, _418, _892);
            _736 = _904;
            _720 = _894;
            _722 = _892;
            _724 = _896;
            _726 = _898;
        }
        float _906 = _736;
        float _908 = _720;
        float _910 = _722;
        float _912 = _724;
        float _914 = _726;
        float _916 = -_390;
        float _918 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _920 = _916 + _918;
        float _922 = -_390;
        float _924 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _926 = _922 + _924;
        float _928 = precise::min(_706, _906);
        float _930 = _920 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _932 = precise::clamp(_930, 0.0, 1.0);
        float _934 = _926 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _936 = precise::clamp(_934, 0.0, 1.0);
        float _938 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[3].x, _386);
        float _940 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[3].y, _408);
        float _942 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[3].z, _410);
        bool _944 = _932 != 1.0;
        bool _946 = isnan(_932);
        bool _948 = _944 || _946;
        bool _950 = isnan(1.0);
        bool _952 = _948 || _950;
        bool _954 = _936 != 1.0;
        bool _956 = isnan(_936);
        bool _958 = _954 || _956;
        bool _960 = isnan(1.0);
        bool _962 = _958 || _960;
        float _964 = _908;
        float _966 = _912;
        float _968 = _914;
        float _970 = _910;
        if (!_952)
        {
            _728 = 1.0;
        }
        float _972 = _728;
        bool _974 = !_952;
        float _976 = _972;
        if (!_974)
        {
            float _978 = -_390;
            bool _980 = _978 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _982 = -_390;
            bool _984 = _982 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _986 = !_980;
            int _988 = _986 ? 0 : 1;
            int _990 = 2;
            if (!_980)
            {
                _990 = 1;
            }
            int _992 = _990;
            int _994 = _992;
            if (!_984)
            {
                _994 = _988;
            }
            int _996 = _994;
            int _998 = _996 << 6;
            float _1000 = float(_996);
            int _1002 = _998 + 304;
            uint _1004 = uint(int(uint(_1002) >> uint(2)));
            uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
            int _1008 = int(_1004) & 3;
            float _1010 = (*spvDescriptorSet0.cp_c3)._m0[int(_1006)][_1008];
            int _1012 = int(_1004) + 1;
            uint _1014 = uint(int(uint(_1012) >> uint(2)));
            int _1016 = _1012 & 3;
            float _1018 = (*spvDescriptorSet0.cp_c3)._m0[int(_1014)][_1016];
            int _1020 = _998 + 312;
            uint _1022 = uint(int(uint(_1020) >> uint(2)));
            uint _1024 = uint(int(uint(int(_1022)) >> uint(2)));
            int _1026 = int(_1022) & 3;
            float _1028 = (*spvDescriptorSet0.cp_c3)._m0[int(_1024)][_1026];
            int _1030 = int(_1022) + 1;
            uint _1032 = uint(int(uint(_1030) >> uint(2)));
            int _1034 = _1030 & 3;
            float _1036 = (*spvDescriptorSet0.cp_c3)._m0[int(_1032)][_1034];
            int _1038 = _998 + 256;
            uint _1040 = uint(int(uint(_1038) >> uint(2)));
            uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
            int _1044 = int(_1040) & 3;
            float _1046 = (*spvDescriptorSet0.cp_c3)._m0[int(_1042)][_1044];
            int _1048 = int(_1040) + 1;
            uint _1050 = uint(int(uint(_1048) >> uint(2)));
            int _1052 = _1048 & 3;
            float _1054 = (*spvDescriptorSet0.cp_c3)._m0[int(_1050)][_1052];
            int _1056 = _998 + 272;
            uint _1058 = uint(int(uint(_1056) >> uint(2)));
            uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
            int _1062 = int(_1058) & 3;
            float _1064 = (*spvDescriptorSet0.cp_c3)._m0[int(_1060)][_1062];
            int _1066 = int(_1058) + 1;
            uint _1068 = uint(int(uint(_1066) >> uint(2)));
            int _1070 = _1066 & 3;
            float _1072 = (*spvDescriptorSet0.cp_c3)._m0[int(_1068)][_1070];
            int _1074 = _998 + 288;
            uint _1076 = uint(int(uint(_1074) >> uint(2)));
            uint _1078 = uint(int(uint(int(_1076)) >> uint(2)));
            int _1080 = int(_1076) & 3;
            float _1082 = (*spvDescriptorSet0.cp_c3)._m0[int(_1078)][_1080];
            int _1084 = int(_1076) + 1;
            uint _1086 = uint(int(uint(_1084) >> uint(2)));
            int _1088 = _1084 & 3;
            float _1090 = (*spvDescriptorSet0.cp_c3)._m0[int(_1086)][_1088];
            int _1092 = _998 + 264;
            uint _1094 = uint(int(uint(_1092) >> uint(2)));
            uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
            int _1098 = int(_1094) & 3;
            float _1100 = (*spvDescriptorSet0.cp_c3)._m0[int(_1096)][_1098];
            int _1102 = int(_1094) + 1;
            uint _1104 = uint(int(uint(_1102) >> uint(2)));
            int _1106 = _1102 & 3;
            float _1108 = (*spvDescriptorSet0.cp_c3)._m0[int(_1104)][_1106];
            int _1110 = _998 + 280;
            uint _1112 = uint(int(uint(_1110) >> uint(2)));
            uint _1114 = uint(int(uint(int(_1112)) >> uint(2)));
            int _1116 = int(_1112) & 3;
            float _1118 = (*spvDescriptorSet0.cp_c3)._m0[int(_1114)][_1116];
            int _1120 = int(_1112) + 1;
            uint _1122 = uint(int(uint(_1120) >> uint(2)));
            int _1124 = _1120 & 3;
            float _1126 = (*spvDescriptorSet0.cp_c3)._m0[int(_1122)][_1124];
            float _1128 = _940 * _1018;
            float _1130 = fma(_938, _1010, _1128);
            int _1132 = _998 + 296;
            uint _1134 = uint(int(uint(_1132) >> uint(2)));
            uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
            int _1138 = int(_1134) & 3;
            float _1140 = (*spvDescriptorSet0.cp_c3)._m0[int(_1136)][_1138];
            int _1142 = int(_1134) + 1;
            uint _1144 = uint(int(uint(_1142) >> uint(2)));
            int _1146 = _1142 & 3;
            float _1148 = (*spvDescriptorSet0.cp_c3)._m0[int(_1144)][_1146];
            float _1150 = fma(_942, _1028, _1130);
            float _1152 = _1150 + _1036;
            float _1154 = _940 * _1054;
            float _1156 = 1.0 / _1152;
            float _1158 = fma(_938, _1046, _1154);
            float _1160 = _940 * _1072;
            float _1162 = rint(_1000);
            float _1164 = precise::max(_1162, 0.0);
            uint _1166 = uint(_1164);
            uint _1168 = clamp(_1166, 0u, 65535u);
            float _1170 = fma(_938, _1064, _1160);
            float _1172 = _940 * _1090;
            float _1174 = fma(_938, _1082, _1172);
            float _1176 = fma(_942, _1100, _1158);
            float _1178 = _1176 + _1108;
            float _1180 = fma(_942, _1118, _1170);
            float _1182 = _1178 * _1156;
            float _1184 = _1180 + _1126;
            float _1186 = fma(_942, _1140, _1174);
            float _1188 = _1184 * _1156;
            float _1190 = _1186 + _1148;
            float _1192 = _1190 * _1156;
            float _1194 = precise::clamp(_1192, 0.0, 1.0);
            float3 _5266 = float3(_1182, _1188, float(int(_1168)));
            float3 _5268 = select(_5266, float3(0.0), isnan(_5266));
            float _1196 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5268.xy, uint(rint(_5268.z)), _1194, level(0.0));
            float _1198 = -_1196;
            float _1200 = _1198 + 1.0;
            float _1202 = fma(_932, _1200, _1196);
            _964 = _1182;
            _966 = _1194;
            _968 = _1054;
            _976 = _1202;
            _970 = _1188;
            _730 = _1126;
        }
        float _1204 = _964;
        float _1206 = _966;
        float _1208 = _968;
        float _1210 = _976;
        float _1212 = _970;
        float _1214 = _730;
        float _1216 = precise::min(_928, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1218 = _1204;
        float _1220 = _1208;
        float _1222 = _1206;
        float _1224 = _1212;
        float _1226 = _1206;
        float _1228 = _1208;
        float _1230 = _1214;
        if (!_962)
        {
            _1218 = 1.0;
        }
        float _1232 = _1218;
        bool _1234 = !_962;
        float _1236 = _1232;
        if (!_1234)
        {
            float _1238 = _940 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1240 = _940 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1242 = fma(_938, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1238);
            float _1244 = fma(_938, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1240);
            float _1246 = fma(_942, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1242);
            float _1248 = fma(_942, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1244);
            float _1250 = _1246 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1252 = _1248 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1254 = trunc(_1250);
            int _1256 = int(_1254);
            float _1258 = trunc(_1252);
            int _1260 = int(_1258);
            int _1262 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1264 = _1256 + _1262;
            int _1266 = _1264 + 1;
            bool _1268 = _1266 >= 0;
            int _1270 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1272 = _1260 + _1270;
            int _1274 = _1272 + 1;
            bool _1276 = _1266 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1278 = !_1268;
            bool _1280 = _1276 || _1278;
            bool _1282 = _1274 < 0;
            bool _1284 = _1282 || _1280;
            bool _1286 = _1274 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1288 = _1286 || _1284;
            float _1290 = _1248;
            if (_1288)
            {
                _1220 = 1.0;
            }
            float _1292 = _1220;
            float _1294 = _1292;
            if (!_1288)
            {
                int _1296 = _1274 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1298 = _1296 + _1266;
                float _1300 = floor(_1252);
                int _1302 = _1298 << 2;
                uint _1304 = uint(int(uint(_1298) >> uint(2)));
                int _1306 = 12 & _1302;
                int _1308 = _1298 << 4;
                int _1310 = _1308 + 2112;
                int _1312 = int(_1304) << 4;
                int _1314 = _1312 + _1306;
                uint _1316 = uint(int(uint(_1310) >> uint(2)));
                uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
                int _1320 = int(_1316) & 3;
                float _1322 = (*spvDescriptorSet0.cp_c3)._m0[int(_1318)][_1320];
                int _1324 = int(_1316) + 1;
                uint _1326 = uint(int(uint(_1324) >> uint(2)));
                int _1328 = _1324 & 3;
                float _1330 = (*spvDescriptorSet0.cp_c3)._m0[int(_1326)][_1328];
                float _1332 = floor(_1250);
                int _1334 = _1314 + 464;
                uint _1336 = uint(int(uint(_1334) >> uint(2)));
                uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
                int _1340 = int(_1336) & 3;
                float _1342 = (*spvDescriptorSet0.cp_c3)._m0[int(_1338)][_1340];
                int _1344 = _1310 + 8;
                uint _1346 = uint(int(uint(_1344) >> uint(2)));
                uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
                int _1350 = int(_1346) & 3;
                float _1352 = (*spvDescriptorSet0.cp_c3)._m0[int(_1348)][_1350];
                int _1354 = int(_1346) + 1;
                uint _1356 = uint(int(uint(_1354) >> uint(2)));
                int _1358 = _1354 & 3;
                float _1360 = (*spvDescriptorSet0.cp_c3)._m0[int(_1356)][_1358];
                float _1362 = -_1332;
                float _1364 = _1250 + _1362;
                float _1366 = _940 * _1330;
                float _1368 = fma(_938, _1322, _1366);
                float _1370 = rint(_1342);
                float _1372 = precise::max(_1370, 0.0);
                uint _1374 = uint(_1372);
                uint _1376 = clamp(_1374, 0u, 65535u);
                float _1378 = fma(_942, _1352, _1368);
                float _1380 = -_1300;
                float _1382 = _1252 + _1380;
                float _1384 = _1378 + _1360;
                float _1386 = precise::clamp(_1384, 0.0, 1.0);
                float3 _5554 = float3(_1364, _1382, float(int(_1376)));
                float3 _5556 = select(_5554, float3(0.0), isnan(_5554));
                float _1388 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_8).sample_compare(spvDescriptorSet0.cp_t_tcb_8Smplr, _5556.xy, uint(rint(_5556.z)), _1386, level(0.0));
                _1294 = _1388;
                _1290 = _1378;
                _1222 = _1330;
            }
            float _1390 = _1294;
            float _1392 = _1290;
            float _1394 = _1222;
            float _1396 = -_1390;
            float _1398 = _1396 + 1.0;
            float _1400 = fma(_936, _1398, _1390);
            _1236 = _1400;
            _1224 = _1392;
            _1226 = _1394;
            _1228 = _1390;
        }
        float _1402 = _1236;
        float _1404 = _1224;
        float _1406 = _1226;
        float _1408 = _1228;
        float _1410 = -_390;
        float _1412 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _1414 = _1410 + _1412;
        float _1416 = -_390;
        float _1418 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _1420 = _1416 + _1418;
        float _1422 = precise::min(_1402, _1210);
        float _1424 = _1414 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _1426 = precise::clamp(_1424, 0.0, 1.0);
        float _1428 = _1420 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _1430 = precise::clamp(_1428, 0.0, 1.0);
        float _1432 = precise::min(_1422, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1434 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[4].x, _386);
        float _1436 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[4].y, _408);
        bool _1438 = _1426 != 1.0;
        bool _1440 = isnan(_1426);
        bool _1442 = _1438 || _1440;
        bool _1444 = isnan(1.0);
        bool _1446 = _1442 || _1444;
        float _1448 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[4].z, _410);
        bool _1450 = _1430 != 1.0;
        bool _1452 = isnan(_1430);
        bool _1454 = _1450 || _1452;
        bool _1456 = isnan(1.0);
        bool _1458 = _1454 || _1456;
        float _1460 = _1422;
        float _1462 = _1402;
        float _1464 = _1406;
        float _1466 = _1408;
        float _1468 = _1404;
        if (!_1446)
        {
            _1460 = 1.0;
        }
        float _1470 = _1460;
        bool _1472 = !_1446;
        float _1474 = _1470;
        if (!_1472)
        {
            float _1476 = -_390;
            bool _1478 = _1476 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _1480 = -_390;
            bool _1482 = _1480 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _1484 = !_1478;
            int _1486 = _1484 ? 0 : 1;
            int _1488 = 2;
            if (!_1478)
            {
                _1488 = 1;
            }
            int _1490 = _1488;
            int _1492 = _1490;
            if (!_1482)
            {
                _1492 = _1486;
            }
            int _1494 = _1492;
            int _1496 = _1494 << 6;
            float _1498 = float(_1494);
            int _1500 = _1496 + 304;
            uint _1502 = uint(int(uint(_1500) >> uint(2)));
            uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
            int _1506 = int(_1502) & 3;
            float _1508 = (*spvDescriptorSet0.cp_c3)._m0[int(_1504)][_1506];
            int _1510 = int(_1502) + 1;
            uint _1512 = uint(int(uint(_1510) >> uint(2)));
            int _1514 = _1510 & 3;
            float _1516 = (*spvDescriptorSet0.cp_c3)._m0[int(_1512)][_1514];
            int _1518 = _1496 + 312;
            uint _1520 = uint(int(uint(_1518) >> uint(2)));
            uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
            int _1524 = int(_1520) & 3;
            float _1526 = (*spvDescriptorSet0.cp_c3)._m0[int(_1522)][_1524];
            int _1528 = int(_1520) + 1;
            uint _1530 = uint(int(uint(_1528) >> uint(2)));
            int _1532 = _1528 & 3;
            float _1534 = (*spvDescriptorSet0.cp_c3)._m0[int(_1530)][_1532];
            int _1536 = _1496 + 256;
            uint _1538 = uint(int(uint(_1536) >> uint(2)));
            uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
            int _1542 = int(_1538) & 3;
            float _1544 = (*spvDescriptorSet0.cp_c3)._m0[int(_1540)][_1542];
            int _1546 = int(_1538) + 1;
            uint _1548 = uint(int(uint(_1546) >> uint(2)));
            int _1550 = _1546 & 3;
            float _1552 = (*spvDescriptorSet0.cp_c3)._m0[int(_1548)][_1550];
            int _1554 = _1496 + 272;
            uint _1556 = uint(int(uint(_1554) >> uint(2)));
            uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
            int _1560 = int(_1556) & 3;
            float _1562 = (*spvDescriptorSet0.cp_c3)._m0[int(_1558)][_1560];
            int _1564 = int(_1556) + 1;
            uint _1566 = uint(int(uint(_1564) >> uint(2)));
            int _1568 = _1564 & 3;
            float _1570 = (*spvDescriptorSet0.cp_c3)._m0[int(_1566)][_1568];
            int _1572 = _1496 + 288;
            uint _1574 = uint(int(uint(_1572) >> uint(2)));
            uint _1576 = uint(int(uint(int(_1574)) >> uint(2)));
            int _1578 = int(_1574) & 3;
            float _1580 = (*spvDescriptorSet0.cp_c3)._m0[int(_1576)][_1578];
            int _1582 = int(_1574) + 1;
            uint _1584 = uint(int(uint(_1582) >> uint(2)));
            int _1586 = _1582 & 3;
            float _1588 = (*spvDescriptorSet0.cp_c3)._m0[int(_1584)][_1586];
            int _1590 = _1496 + 264;
            uint _1592 = uint(int(uint(_1590) >> uint(2)));
            uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
            int _1596 = int(_1592) & 3;
            float _1598 = (*spvDescriptorSet0.cp_c3)._m0[int(_1594)][_1596];
            int _1600 = int(_1592) + 1;
            uint _1602 = uint(int(uint(_1600) >> uint(2)));
            int _1604 = _1600 & 3;
            float _1606 = (*spvDescriptorSet0.cp_c3)._m0[int(_1602)][_1604];
            int _1608 = _1496 + 280;
            uint _1610 = uint(int(uint(_1608) >> uint(2)));
            uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
            int _1614 = int(_1610) & 3;
            float _1616 = (*spvDescriptorSet0.cp_c3)._m0[int(_1612)][_1614];
            int _1618 = int(_1610) + 1;
            uint _1620 = uint(int(uint(_1618) >> uint(2)));
            int _1622 = _1618 & 3;
            float _1624 = (*spvDescriptorSet0.cp_c3)._m0[int(_1620)][_1622];
            float _1626 = _1436 * _1516;
            float _1628 = fma(_1434, _1508, _1626);
            int _1630 = _1496 + 296;
            uint _1632 = uint(int(uint(_1630) >> uint(2)));
            uint _1634 = uint(int(uint(int(_1632)) >> uint(2)));
            int _1636 = int(_1632) & 3;
            float _1638 = (*spvDescriptorSet0.cp_c3)._m0[int(_1634)][_1636];
            int _1640 = int(_1632) + 1;
            uint _1642 = uint(int(uint(_1640) >> uint(2)));
            int _1644 = _1640 & 3;
            float _1646 = (*spvDescriptorSet0.cp_c3)._m0[int(_1642)][_1644];
            float _1648 = fma(_1448, _1526, _1628);
            float _1650 = _1648 + _1534;
            float _1652 = _1436 * _1552;
            float _1654 = 1.0 / _1650;
            float _1656 = fma(_1434, _1544, _1652);
            float _1658 = _1436 * _1570;
            float _1660 = rint(_1498);
            float _1662 = precise::max(_1660, 0.0);
            uint _1664 = uint(_1662);
            uint _1666 = clamp(_1664, 0u, 65535u);
            float _1668 = fma(_1434, _1562, _1658);
            float _1670 = _1436 * _1588;
            float _1672 = fma(_1434, _1580, _1670);
            float _1674 = fma(_1448, _1598, _1656);
            float _1676 = _1674 + _1606;
            float _1678 = fma(_1448, _1616, _1668);
            float _1680 = _1676 * _1654;
            float _1682 = _1678 + _1624;
            float _1684 = fma(_1448, _1638, _1672);
            float _1686 = _1682 * _1654;
            float _1688 = _1684 + _1646;
            float _1690 = _1688 * _1654;
            float _1692 = precise::clamp(_1690, 0.0, 1.0);
            float3 _6026 = float3(_1680, _1686, float(int(_1666)));
            float3 _6028 = select(_6026, float3(0.0), isnan(_6026));
            float _1694 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _6028.xy, uint(rint(_6028.z)), _1692, level(0.0));
            float _1696 = -_1694;
            float _1698 = _1696 + 1.0;
            float _1700 = fma(_1426, _1698, _1694);
            _1462 = _1680;
            _1464 = _1692;
            _1466 = _1552;
            _1474 = _1700;
            _1468 = _1686;
            _1230 = _1624;
        }
        float _1702 = _1462;
        float _1704 = _1464;
        float _1706 = _1466;
        float _1708 = _1474;
        float _1710 = _1468;
        float _1712 = _1230;
        float _1714 = _1216 + _1432;
        float _1716 = _1702;
        float _1718 = _1706;
        float _1720 = _1704;
        float _1722 = _1710;
        float _1724 = _1704;
        float _1726 = _1712;
        if (!_1458)
        {
            _1716 = 1.0;
        }
        float _1728 = _1716;
        bool _1730 = !_1458;
        float _1732 = _1728;
        if (!_1730)
        {
            float _1734 = _1436 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1736 = _1436 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1738 = fma(_1434, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1734);
            float _1740 = fma(_1434, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1736);
            float _1742 = fma(_1448, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1738);
            float _1744 = fma(_1448, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1740);
            float _1746 = _1742 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1748 = _1744 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1750 = trunc(_1746);
            int _1752 = int(_1750);
            float _1754 = trunc(_1748);
            int _1756 = int(_1754);
            int _1758 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1760 = _1752 + _1758;
            int _1762 = _1760 + 1;
            bool _1764 = _1762 >= 0;
            int _1766 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1768 = _1756 + _1766;
            int _1770 = _1768 + 1;
            bool _1772 = _1762 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1774 = !_1764;
            bool _1776 = _1772 || _1774;
            bool _1778 = _1770 < 0;
            bool _1780 = _1778 || _1776;
            bool _1782 = _1770 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1784 = _1782 || _1780;
            float _1786 = _1744;
            if (_1784)
            {
                _1718 = 1.0;
            }
            float _1788 = _1718;
            float _1790 = _1788;
            if (!_1784)
            {
                int _1792 = _1770 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1794 = _1792 + _1762;
                float _1796 = floor(_1748);
                int _1798 = _1794 << 2;
                uint _1800 = uint(int(uint(_1794) >> uint(2)));
                int _1802 = 12 & _1798;
                int _1804 = _1794 << 4;
                int _1806 = _1804 + 2112;
                int _1808 = int(_1800) << 4;
                int _1810 = _1808 + _1802;
                uint _1812 = uint(int(uint(_1806) >> uint(2)));
                uint _1814 = uint(int(uint(int(_1812)) >> uint(2)));
                int _1816 = int(_1812) & 3;
                float _1818 = (*spvDescriptorSet0.cp_c3)._m0[int(_1814)][_1816];
                int _1820 = int(_1812) + 1;
                uint _1822 = uint(int(uint(_1820) >> uint(2)));
                int _1824 = _1820 & 3;
                float _1826 = (*spvDescriptorSet0.cp_c3)._m0[int(_1822)][_1824];
                float _1828 = floor(_1746);
                int _1830 = _1810 + 464;
                uint _1832 = uint(int(uint(_1830) >> uint(2)));
                uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
                int _1836 = int(_1832) & 3;
                float _1838 = (*spvDescriptorSet0.cp_c3)._m0[int(_1834)][_1836];
                int _1840 = _1806 + 8;
                uint _1842 = uint(int(uint(_1840) >> uint(2)));
                uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
                int _1846 = int(_1842) & 3;
                float _1848 = (*spvDescriptorSet0.cp_c3)._m0[int(_1844)][_1846];
                int _1850 = int(_1842) + 1;
                uint _1852 = uint(int(uint(_1850) >> uint(2)));
                int _1854 = _1850 & 3;
                float _1856 = (*spvDescriptorSet0.cp_c3)._m0[int(_1852)][_1854];
                float _1858 = -_1828;
                float _1860 = _1746 + _1858;
                float _1862 = _1436 * _1826;
                float _1864 = fma(_1434, _1818, _1862);
                float _1866 = rint(_1838);
                float _1868 = precise::max(_1866, 0.0);
                uint _1870 = uint(_1868);
                uint _1872 = clamp(_1870, 0u, 65535u);
                float _1874 = fma(_1448, _1848, _1864);
                float _1876 = -_1796;
                float _1878 = _1748 + _1876;
                float _1880 = _1874 + _1856;
                float _1882 = precise::clamp(_1880, 0.0, 1.0);
                float3 _6312 = float3(_1860, _1878, float(int(_1872)));
                float3 _6314 = select(_6312, float3(0.0), isnan(_6312));
                float _1884 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_8).sample_compare(spvDescriptorSet0.cp_t_tcb_8Smplr, _6314.xy, uint(rint(_6314.z)), _1882, level(0.0));
                _1790 = _1884;
                _1786 = _1874;
                _1720 = _1826;
            }
            float _1886 = _1790;
            float _1888 = _1786;
            float _1890 = _1720;
            float _1892 = -_1886;
            float _1894 = _1892 + 1.0;
            float _1896 = fma(_1430, _1894, _1886);
            _1732 = _1896;
            _1722 = _1888;
            _1724 = _1890;
        }
        float _1898 = _1732;
        float _1900 = _1722;
        float _1902 = _1724;
        float _1904 = -_390;
        float _1906 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _1908 = _1904 + _1906;
        float _1910 = -_390;
        float _1912 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _1914 = _1910 + _1912;
        float _1916 = precise::min(_1898, _1708);
        float _1918 = _1908 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _1920 = precise::clamp(_1918, 0.0, 1.0);
        float _1922 = _1914 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _1924 = precise::clamp(_1922, 0.0, 1.0);
        float _1926 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[5].z, _410);
        float _1928 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[5].x, _386);
        float _1930 = fma(_390, (*spvDescriptorSet0.cp_c4)._m0[5].y, _408);
        bool _1932 = _1920 != 1.0;
        bool _1934 = isnan(_1920);
        bool _1936 = _1932 || _1934;
        bool _1938 = isnan(1.0);
        bool _1940 = _1936 || _1938;
        bool _1942 = _1924 != 1.0;
        bool _1944 = isnan(_1924);
        bool _1946 = _1942 || _1944;
        bool _1948 = isnan(1.0);
        bool _1950 = _1946 || _1948;
        float _1952 = precise::min(_1916, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1954 = _1902;
        float _1956 = _1900;
        if (!_1940)
        {
            _460 = 1.0;
        }
        float _1958 = _460;
        bool _1960 = !_1940;
        float _1962 = _1958;
        if (!_1960)
        {
            float _1964 = -_390;
            bool _1966 = _1964 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _1968 = -_390;
            bool _1970 = _1968 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _1972 = !_1966;
            int _1974 = _1972 ? 0 : 1;
            int _1976 = 2;
            if (!_1966)
            {
                _1976 = 1;
            }
            int _1978 = _1976;
            int _1980 = _1978;
            if (!_1970)
            {
                _1980 = _1974;
            }
            int _1982 = _1980;
            int _1984 = _1982 << 6;
            float _1986 = float(_1982);
            int _1988 = _1984 + 304;
            uint _1990 = uint(int(uint(_1988) >> uint(2)));
            uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
            int _1994 = int(_1990) & 3;
            float _1996 = (*spvDescriptorSet0.cp_c3)._m0[int(_1992)][_1994];
            int _1998 = int(_1990) + 1;
            uint _2000 = uint(int(uint(_1998) >> uint(2)));
            int _2002 = _1998 & 3;
            float _2004 = (*spvDescriptorSet0.cp_c3)._m0[int(_2000)][_2002];
            int _2006 = _1984 + 312;
            uint _2008 = uint(int(uint(_2006) >> uint(2)));
            uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
            int _2012 = int(_2008) & 3;
            float _2014 = (*spvDescriptorSet0.cp_c3)._m0[int(_2010)][_2012];
            int _2016 = int(_2008) + 1;
            uint _2018 = uint(int(uint(_2016) >> uint(2)));
            int _2020 = _2016 & 3;
            float _2022 = (*spvDescriptorSet0.cp_c3)._m0[int(_2018)][_2020];
            int _2024 = _1984 + 256;
            uint _2026 = uint(int(uint(_2024) >> uint(2)));
            uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
            int _2030 = int(_2026) & 3;
            float _2032 = (*spvDescriptorSet0.cp_c3)._m0[int(_2028)][_2030];
            int _2034 = int(_2026) + 1;
            uint _2036 = uint(int(uint(_2034) >> uint(2)));
            int _2038 = _2034 & 3;
            float _2040 = (*spvDescriptorSet0.cp_c3)._m0[int(_2036)][_2038];
            int _2042 = _1984 + 272;
            uint _2044 = uint(int(uint(_2042) >> uint(2)));
            uint _2046 = uint(int(uint(int(_2044)) >> uint(2)));
            int _2048 = int(_2044) & 3;
            float _2050 = (*spvDescriptorSet0.cp_c3)._m0[int(_2046)][_2048];
            int _2052 = int(_2044) + 1;
            uint _2054 = uint(int(uint(_2052) >> uint(2)));
            int _2056 = _2052 & 3;
            float _2058 = (*spvDescriptorSet0.cp_c3)._m0[int(_2054)][_2056];
            int _2060 = _1984 + 288;
            uint _2062 = uint(int(uint(_2060) >> uint(2)));
            uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
            int _2066 = int(_2062) & 3;
            float _2068 = (*spvDescriptorSet0.cp_c3)._m0[int(_2064)][_2066];
            int _2070 = int(_2062) + 1;
            uint _2072 = uint(int(uint(_2070) >> uint(2)));
            int _2074 = _2070 & 3;
            float _2076 = (*spvDescriptorSet0.cp_c3)._m0[int(_2072)][_2074];
            int _2078 = _1984 + 264;
            uint _2080 = uint(int(uint(_2078) >> uint(2)));
            uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
            int _2084 = int(_2080) & 3;
            float _2086 = (*spvDescriptorSet0.cp_c3)._m0[int(_2082)][_2084];
            int _2088 = int(_2080) + 1;
            uint _2090 = uint(int(uint(_2088) >> uint(2)));
            int _2092 = _2088 & 3;
            float _2094 = (*spvDescriptorSet0.cp_c3)._m0[int(_2090)][_2092];
            int _2096 = _1984 + 280;
            uint _2098 = uint(int(uint(_2096) >> uint(2)));
            uint _2100 = uint(int(uint(int(_2098)) >> uint(2)));
            int _2102 = int(_2098) & 3;
            float _2104 = (*spvDescriptorSet0.cp_c3)._m0[int(_2100)][_2102];
            int _2106 = int(_2098) + 1;
            uint _2108 = uint(int(uint(_2106) >> uint(2)));
            int _2110 = _2106 & 3;
            float _2112 = (*spvDescriptorSet0.cp_c3)._m0[int(_2108)][_2110];
            float _2114 = _1930 * _2004;
            float _2116 = fma(_1928, _1996, _2114);
            int _2118 = _1984 + 296;
            uint _2120 = uint(int(uint(_2118) >> uint(2)));
            uint _2122 = uint(int(uint(int(_2120)) >> uint(2)));
            int _2124 = int(_2120) & 3;
            float _2126 = (*spvDescriptorSet0.cp_c3)._m0[int(_2122)][_2124];
            int _2128 = int(_2120) + 1;
            uint _2130 = uint(int(uint(_2128) >> uint(2)));
            int _2132 = _2128 & 3;
            float _2134 = (*spvDescriptorSet0.cp_c3)._m0[int(_2130)][_2132];
            float _2136 = fma(_1926, _2014, _2116);
            float _2138 = _2136 + _2022;
            float _2140 = _1930 * _2040;
            float _2142 = 1.0 / _2138;
            float _2144 = fma(_1928, _2032, _2140);
            float _2146 = _1930 * _2058;
            float _2148 = rint(_1986);
            float _2150 = precise::max(_2148, 0.0);
            uint _2152 = uint(_2150);
            uint _2154 = clamp(_2152, 0u, 65535u);
            float _2156 = fma(_1928, _2050, _2146);
            float _2158 = _1930 * _2076;
            float _2160 = fma(_1928, _2068, _2158);
            float _2162 = fma(_1926, _2086, _2144);
            float _2164 = _2162 + _2094;
            float _2166 = fma(_1926, _2104, _2156);
            float _2168 = _2164 * _2142;
            float _2170 = _2166 + _2112;
            float _2172 = fma(_1926, _2126, _2160);
            float _2174 = _2170 * _2142;
            float _2176 = _2172 + _2134;
            float _2178 = _2176 * _2142;
            float _2180 = precise::clamp(_2178, 0.0, 1.0);
            float3 _6780 = float3(_2168, _2174, float(int(_2154)));
            float3 _6782 = select(_6780, float3(0.0), isnan(_6780));
            float _2182 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _6782.xy, uint(rint(_6782.z)), _2180, level(0.0));
            float _2184 = -_2182;
            float _2186 = _2184 + 1.0;
            float _2188 = fma(_1920, _2186, _2182);
            _1954 = _2180;
            _1956 = _2174;
            _1962 = _2188;
            _1726 = _2112;
        }
        float _2190 = _1954;
        float _2192 = _1956;
        float _2194 = _1962;
        float _2196 = _1726;
        float _2198 = _1714 + _1952;
        float _2200 = _2192;
        float _2202 = _2190;
        if (!_1950)
        {
            _2200 = 1.0;
        }
        float _2204 = _2200;
        bool _2206 = !_1950;
        float _2208 = _2204;
        if (!_2206)
        {
            float _2210 = _1930 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _2212 = _1930 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _2214 = fma(_1928, (*spvDescriptorSet0.cp_c3)._m0[130].x, _2210);
            float _2216 = fma(_1928, (*spvDescriptorSet0.cp_c3)._m0[131].x, _2212);
            float _2218 = fma(_1926, (*spvDescriptorSet0.cp_c3)._m0[130].z, _2214);
            float _2220 = fma(_1926, (*spvDescriptorSet0.cp_c3)._m0[131].z, _2216);
            float _2222 = _2218 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _2224 = _2220 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _2226 = trunc(_2222);
            int _2228 = int(_2226);
            float _2230 = trunc(_2224);
            int _2232 = int(_2230);
            int _2234 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _2236 = _2228 + _2234;
            int _2238 = _2236 + 1;
            bool _2240 = _2238 >= 0;
            int _2242 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _2244 = _2232 + _2242;
            int _2246 = _2244 + 1;
            bool _2248 = _2238 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _2250 = !_2240;
            bool _2252 = _2248 || _2250;
            bool _2254 = _2246 < 0;
            bool _2256 = _2254 || _2252;
            bool _2258 = _2246 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _2260 = _2258 || _2256;
            if (_2260)
            {
                _2202 = 1.0;
            }
            float _2262 = _2202;
            float _2264 = _2262;
            if (!_2260)
            {
                int _2266 = _2246 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _2268 = _2266 + _2238;
                float _2270 = floor(_2222);
                int _2272 = _2268 << 2;
                uint _2274 = uint(int(uint(_2268) >> uint(2)));
                int _2276 = 12 & _2272;
                float _2278 = floor(_2224);
                int _2280 = _2268 << 4;
                int _2282 = _2280 + 2112;
                int _2284 = int(_2274) << 4;
                int _2286 = _2284 + _2276;
                uint _2288 = uint(int(uint(_2282) >> uint(2)));
                uint _2290 = uint(int(uint(int(_2288)) >> uint(2)));
                int _2292 = int(_2288) & 3;
                float _2294 = (*spvDescriptorSet0.cp_c3)._m0[int(_2290)][_2292];
                int _2296 = int(_2288) + 1;
                uint _2298 = uint(int(uint(_2296) >> uint(2)));
                int _2300 = _2296 & 3;
                float _2302 = (*spvDescriptorSet0.cp_c3)._m0[int(_2298)][_2300];
                float _2304 = -_2270;
                float _2306 = _2222 + _2304;
                int _2308 = _2286 + 464;
                uint _2310 = uint(int(uint(_2308) >> uint(2)));
                uint _2312 = uint(int(uint(int(_2310)) >> uint(2)));
                int _2314 = int(_2310) & 3;
                float _2316 = (*spvDescriptorSet0.cp_c3)._m0[int(_2312)][_2314];
                int _2318 = _2282 + 8;
                uint _2320 = uint(int(uint(_2318) >> uint(2)));
                uint _2322 = uint(int(uint(int(_2320)) >> uint(2)));
                int _2324 = int(_2320) & 3;
                float _2326 = (*spvDescriptorSet0.cp_c3)._m0[int(_2322)][_2324];
                int _2328 = int(_2320) + 1;
                uint _2330 = uint(int(uint(_2328) >> uint(2)));
                int _2332 = _2328 & 3;
                float _2334 = (*spvDescriptorSet0.cp_c3)._m0[int(_2330)][_2332];
                float _2336 = _1930 * _2302;
                float _2338 = fma(_1928, _2294, _2336);
                float _2340 = rint(_2316);
                float _2342 = precise::max(_2340, 0.0);
                uint _2344 = uint(_2342);
                uint _2346 = clamp(_2344, 0u, 65535u);
                float _2348 = fma(_1926, _2326, _2338);
                float _2350 = -_2278;
                float _2352 = _2224 + _2350;
                float _2354 = _2348 + _2334;
                float _2356 = precise::clamp(_2354, 0.0, 1.0);
                float3 _7057 = float3(_2306, _2352, float(int(_2346)));
                float3 _7059 = select(_7057, float3(0.0), isnan(_7057));
                float _2358 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_8).sample_compare(spvDescriptorSet0.cp_t_tcb_8Smplr, _7059.xy, uint(rint(_7059.z)), _2356, level(0.0));
                _2264 = _2358;
            }
            float _2360 = _2264;
            float _2362 = -_2360;
            float _2364 = _2362 + 1.0;
            float _2366 = fma(_1924, _2364, _2360);
            _2208 = _2366;
        }
        float _2368 = _2208;
        float _2370 = fma(_149, _378, _380);
        float _2372 = fma(_151, _378, _394);
        float _2374 = fma(_2370, 6.2500002968590706586837768554688e-05, 0.5);
        float _2376 = fma(_2372, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _7093 = float3(_2374, _2376, float(0));
        float3 _7095 = select(_7093, float3(0.0), isnan(_7093));
        float4 _2379 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7095.xy, uint(rint(_7095.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7095.xy, uint(rint(_7095.z)), level(0.0)).xyzw;
        float _2381 = _2379.x;
        float _2383 = _2379.y;
        float _2385 = _2379.z;
        float _2387 = _2379.w;
        float3 _7110 = float3(_2374, _2376, float(1));
        float3 _7112 = select(_7110, float3(0.0), isnan(_7110));
        float4 _2389 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7112.xy, uint(rint(_7112.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7112.xy, uint(rint(_7112.z)), level(0.0)).xyzw;
        float _2391 = _2389.x;
        float _2393 = _2389.y;
        float _2395 = _2389.z;
        float _2397 = _2389.w;
        float _2399 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _2401 = _2372 + _2399;
        float _2403 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _2405 = _2370 + _2403;
        float _2407 = _364 + _370;
        float _2409 = _2401 * _2401;
        float _2411 = _153 * _378;
        float _2413 = precise::min(_2368, _2194);
        float _2415 = _265 * _2407;
        float _2417 = fma(_2405, _2405, _2409);
        float _2419 = _153 * 1.02332699298858642578125;
        float _2421 = _2415 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _2423 = abs(_2411);
        bool _2425 = _2423 > 0.00999999977648258209228515625;
        float _2427 = sqrt(_2417);
        float _2429 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _2431 = _2429 * 100.0;
        float _2433 = _2429 * 5115.0;
        float _2435 = exp2(_2431);
        bool _2437 = _2427 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _2439 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _2441 = _2427 + _2439;
        float _2443 = fma(_2435, 512.0, -512.0);
        float _2445 = _2196;
        float _2447 = _2441;
        if (_2437)
        {
            float _2449 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _2445 = _2449;
        }
        float _2451 = _2445;
        float _2453 = 1.0 / _2429;
        if (_2437)
        {
            float _2455 = _2441 * _2451;
            _2447 = _2455;
        }
        float _2457 = _2447;
        float _2459 = 1.0 / _2443;
        float _2461 = _2457;
        if (_2437)
        {
            float _2463 = _2457 * 0.15915493667125701904296875;
            _2461 = _2463;
        }
        float _2465 = _2461;
        float _2467 = _2465;
        if (_2437)
        {
            float _2469 = _2465 * 6.283185482025146484375;
            float _2471 = cos(_2469);
            _2467 = _2471;
        }
        float _2473 = _2467;
        float _2475 = _392 + _2411;
        float _2477 = _2433 * _2459;
        float _2479 = fma(_2421, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _2481 = precise::clamp(_2479, 0.0, 1.0);
        float _2483 = _2425 ? _2411 : 0.00999999977648258209228515625;
        float _2485 = -_2481;
        float _2487 = _2485 + 1.0;
        float _2489 = log2(_2477);
        float _2491 = _2481;
        if (!_2437)
        {
            _2491 = _2475;
        }
        float _2493 = _2491;
        float _2495 = _2493;
        if (_2437)
        {
            float _2497 = _2473 + (-1.0);
            _462 = _2497;
        }
        float _2499 = _462;
        float _2501 = _2429 * _2483;
        float _2503 = _2499;
        if (_2437)
        {
            float _2505 = _2499 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _2503 = _2505;
        }
        float _2507 = _2503;
        float _2509 = abs(_2487);
        float _2511 = log2(_2509);
        float _2513 = precise::max(_2501, -127.0);
        if (_2437)
        {
            float _2515 = fma(_2475, _2473, _2507);
            _2495 = _2515;
        }
        float _2517 = _2495;
        float _2519 = -_2517;
        float _2521 = fma(_2475, 2.0, _2519);
        float _2523 = fma(_2489, _2453, 100.0);
        float _2525 = -_2513;
        float _2527 = exp2(_2525);
        float _2529 = -(*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _2531 = _2521 + _2529;
        float _2533 = fma(_273, 0.5, 0.5);
        float _2535 = precise::max(0.0, _2531);
        float _2537 = _2511 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _2539 = 1.0 / _2513;
        float _2541 = -_2523;
        float _2543 = _2541 + _2535;
        float _2545 = _2429 * _2543;
        float _2547 = fma(_273, -0.5, 0.5);
        float _2549 = precise::min(_2413, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _2551 = fma(_2533, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _2553 = exp2(_2537);
        float _2555 = -_2527;
        float _2557 = _2555 + 1.0;
        float _2559 = fma(_2533, _2551, -0.212114393711090087890625);
        float _2561 = _2198 + _2549;
        float _2563 = fma(_2533, _2559, 1.570728778839111328125);
        float _2565 = sqrt(_2547);
        float _2567 = _277 + 1.0;
        float _2569 = -_2545;
        float _2571 = exp2(_2569);
        float _2573 = -_277;
        float _2575 = fma(_2553, _2567, _2573);
        float _2577 = fma(_2575, 0.5, 0.5);
        float _2579 = _2565 * 0.636619746685028076171875;
        float _2581 = -_2563;
        float _2583 = fma(_2579, _2581, 1.0);
        float _2585 = _2571 * _2557;
        float3 _7398 = float3(_2374, _2376, float(2));
        float3 _7400 = select(_7398, float3(0.0), isnan(_7398));
        float4 _2587 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7400.xy, uint(rint(_7400.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7400.xy, uint(rint(_7400.z)), level(0.0)).xyzw;
        float _2589 = _2587.x;
        float _2591 = _2587.y;
        float _2593 = _2587.z;
        float _2595 = _2587.w;
        float3 _7415 = float3(_2374, _2376, float(3));
        float3 _7417 = select(_7415, float3(0.0), isnan(_7415));
        float4 _2597 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7417.xy, uint(rint(_7417.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7417.xy, uint(rint(_7417.z)), level(0.0)).xyzw;
        float _2599 = _2597.x;
        float _2601 = _2597.y;
        float _2603 = _2597.z;
        float _2605 = _2597.w;
        float3 _7432 = float3(_2374, _2376, float(4));
        float3 _7434 = select(_7432, float3(0.0), isnan(_7432));
        float4 _2607 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7434.xy, uint(rint(_7434.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7434.xy, uint(rint(_7434.z)), level(0.0)).xyzw;
        float _2609 = _2607.x;
        float _2611 = _2607.y;
        float _2613 = _2607.z;
        float _2615 = _2607.w;
        float3 _7449 = float3(_2374, _2376, float(6));
        float3 _7451 = select(_7449, float3(0.0), isnan(_7449));
        float4 _2617 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7451.xy, uint(rint(_7451.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7451.xy, uint(rint(_7451.z)), level(0.0)).xyzw;
        float _2619 = _2617.x;
        float _2621 = _2617.y;
        float _2623 = _2617.z;
        float _2625 = _2617.w;
        float3 _7467 = float3(_2374, _2376, float(7));
        float3 _7469 = select(_7467, float3(0.0), isnan(_7467));
        float4 _2627 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7469.xy, uint(rint(_7469.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7469.xy, uint(rint(_7469.z)), level(0.0)).xyzw;
        float _2629 = _2627.x;
        float _2631 = _2627.y;
        float _2633 = _2627.z;
        float _2635 = _2627.w;
        float _2637 = _2585 * _2539;
        float _2639 = _2387 * _2419;
        float _2641 = fma(_2381, 0.88622701168060302734375, _2639);
        float _2643 = _2391 * _2419;
        float _2645 = fma(_2383, 0.88622701168060302734375, _2643);
        float3 _7500 = float3(_2374, _2376, float(5));
        float3 _7502 = select(_7500, float3(0.0), isnan(_7500));
        float4 _2647 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _7502.xy, uint(rint(_7502.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _7502.xy, uint(rint(_7502.z)), level(0.0)).xyzw;
        float _2649 = _2647.x;
        float _2651 = _2647.y;
        float _2653 = _2647.z;
        float _2655 = _2647.w;
        float2 _7517 = float2(_2583, _2577);
        float3 _2659 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_7517, float2(0.0), isnan(_7517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_7517, float2(0.0), isnan(_7517)), level(0.0)).xyz;
        float _2661 = _2659.x;
        float _2663 = _2659.y;
        float _2665 = _2659.z;
        float _2667 = _2393 * _2419;
        float _2669 = _2511 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _2671 = fma(_2385, 0.88622701168060302734375, _2667);
        float _2673 = _151 * 1.02332699298858642578125;
        float _2675 = exp2(_2669);
        float _2677 = _2561 * 0.25;
        float _2679 = fma(_2395, _2673, _2641);
        float _2681 = fma(_2397, _2673, _2645);
        float _2683 = fma((*spvDescriptorSet0.cp_c3)._m0[8].x, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _2685 = (*spvDescriptorSet0.cp_c3)._m0[8].x * 2.0;
        float _2687 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
        float _2689 = fma(_2687, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        bool _2691 = as_type<int>(_95) != 0;
        float _2693 = -_2685;
        float _2695 = fma(_273, _2693, _2683);
        float _2697 = -_2685;
        float _2699 = _2683 + _2697;
        float _2701 = abs(_2695);
        float _2703 = log2(_2701);
        float _2705 = abs(_2699);
        float _2707 = log2(_2705);
        float _2709 = _2703 * 1.5;
        float _2711 = exp2(_2709);
        float _2713 = _2707 * 1.5;
        float _2715 = exp2(_2713);
        float _2717 = _2711 * 12.56637096405029296875;
        float _2719 = 1.0 / _2717;
        float _2721 = _2715 * 12.56637096405029296875;
        float _2723 = 1.0 / _2721;
        float _2725 = _2689 * _2719;
        float _2727 = _2677 * _2725;
        float _2729 = _2689 * _2723;
        float _2731 = fma(_2589, _2673, _2671);
        float _2733 = _149 * 1.02332699298858642578125;
        float _2735 = _2609 * _2419;
        float _2737 = _2621 * _2419;
        float _2739 = _2631 * _2419;
        float _2741 = fma(_2591, _2733, _2679);
        float _2743 = fma(_2593, _2733, _2681);
        float _2745 = fma(_2619, 0.88622701168060302734375, _2737);
        float _2747 = fma(_2595, _2733, _2731);
        float _2749 = fma(_2629, 0.88622701168060302734375, _2739);
        float _2751 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _2753 = _2605 * _2419;
        float _2755 = precise::max(0.0, _2743);
        float _2757 = fma(_2623, _2673, _2745);
        float _2759 = precise::max(0.0, _2741);
        float _2761 = fma(_2599, 0.88622701168060302734375, _2753);
        float _2763 = log2(_2751);
        float _2765 = fma(_2625, _2733, _2757);
        float _2767 = fma(_2601, 0.88622701168060302734375, _2735);
        float _2769 = fma(_2633, _2673, _2749);
        float _2771 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _2773 = _2765 * 0.31830990314483642578125;
        float _2775 = precise::clamp(_2773, 0.0, 1.0);
        float _2777 = fma(_2613, _2673, _2761);
        float _2779 = fma(_2615, _2673, _2767);
        float _2781 = fma(_2635, _2733, _2769);
        float _2783 = _2759 * _2771;
        float _2785 = precise::min(_2775, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _2787 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _2789 = _2421 + _2787;
        float _2791 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _2793 = _2781 * 0.31830990314483642578125;
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        float _2797 = _2763 * (-0.0199999995529651641845703125);
        float _2799 = _2785 * 0.88622701168060302734375;
        float _2801 = _2795 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _2803 = precise::clamp(_2801, 0.0, 1.0);
        int _2805 = _283 + as_type<int>(_95);
        float _2807 = _378 * _2797;
        float _2809 = fma(_2799, (*spvDescriptorSet0.cp_c3)._m0[9].x, _2783);
        float _2811 = _2637 * _2807;
        float _2813 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _2815 = 1.0 / _378;
        float _2817 = _2755 * _2813;
        float _2819 = precise::max(0.0, _2747);
        float _2821 = _2611 * _2419;
        float _2823 = fma(_2799, (*spvDescriptorSet0.cp_c3)._m0[9].y, _2817);
        float _2825 = fma(_2603, 0.88622701168060302734375, _2821);
        float _2827 = _2819 * _2791;
        float _2829 = _378 * _2677;
        float _2831 = fma(_2799, (*spvDescriptorSet0.cp_c3)._m0[9].z, _2827);
        float _2833 = _2789 * _2815;
        float _2835 = precise::clamp(_2833, 0.0, 1.0);
        int _2837 = _2805 << 2;
        int _2839 = _2837 + 1024;
        uint _2841 = uint(int(uint(_2839) >> uint(2)));
        _26[int(_2841)] = as_type<uint>(_2829);
        float _2843 = _2811 * _2835;
        float _2845 = fma(_2649, _2673, _2825);
        float _2847 = fma(_2651, _2733, _2777);
        float _2849 = fma(_2653, _2733, _2779);
        float _2851 = -_2675;
        float _2853 = _2851 + 1.0;
        float _2855 = fma(_2655, _2733, _2845);
        float _2857 = _2677 * _2661;
        float _2859 = precise::max(0.0, _2847);
        float _2861 = _2677 * _2663;
        float _2863 = precise::max(0.0, _2849);
        float _2865 = _2853 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _2867 = precise::max(0.0, _2855);
        float _2869 = fma(_2859, _2803, _2809);
        float _2871 = _2655;
        float _2873 = _2863;
        float _2875 = _2867;
        float _2877 = _2601;
        float _2879 = _2625;
        if (_2691)
        {
            _2871 = _330;
        }
        float _2881 = _2871;
        float _2883 = fma(_2863, _2803, _2823);
        float _2885 = _2881;
        float _2887 = _2881;
        if (_2691)
        {
            _2873 = as_type<float>(_332);
        }
        int _2889 = as_type<int>(_2873);
        float _2891 = fma(_2867, _2803, _2831);
        float _2893 = _2869 * _2729;
        float _2895 = _2883 * _2729;
        float _2897 = _2893;
        int _2899 = _2889;
        if (_2691)
        {
            _2875 = as_type<float>(_334);
        }
        int _2901 = as_type<int>(_2875);
        float _2903 = _2891 * _2729;
        float _2905 = fma(_2727, (*spvDescriptorSet0.cp_c3)._m0[7].x, _2893);
        float _2907 = fma(_2727, (*spvDescriptorSet0.cp_c3)._m0[7].y, _2895);
        int _2909 = _2901;
        if (_2691)
        {
            _2897 = as_type<float>(_336);
        }
        int _2911 = as_type<int>(_2897);
        float _2913 = fma(_2727, (*spvDescriptorSet0.cp_c3)._m0[7].z, _2903);
        float _2915 = _2677 * _2665;
        float _2917 = _2905 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _2919 = _2907 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _2921 = _2913 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _2923 = _2805 << 4;
        uint _2925 = uint(int(uint(_2923) >> uint(2)));
        _26[int(_2925)] = as_type<uint>(_2857);
        int _2927 = _2923 + 4;
        uint _2929 = uint(int(uint(_2927) >> uint(2)));
        _26[int(_2929)] = as_type<uint>(_2861);
        int _2931 = _2923 + 8;
        uint _2933 = uint(int(uint(_2931) >> uint(2)));
        _26[int(_2933)] = as_type<uint>(_2915);
        int _2935 = _2923 + 12;
        uint _2937 = uint(int(uint(_2935) >> uint(2)));
        _26[int(_2937)] = as_type<uint>(_2865);
        int _2939 = _2805 << 4;
        int _2941 = _2939 + 1280;
        uint _2943 = uint(int(uint(_2941) >> uint(2)));
        _26[int(_2943)] = as_type<uint>(_2917);
        int _2945 = _2939 + 1284;
        uint _2947 = uint(int(uint(_2945) >> uint(2)));
        _26[int(_2947)] = as_type<uint>(_2919);
        int _2949 = _2939 + 1288;
        uint _2951 = uint(int(uint(_2949) >> uint(2)));
        _26[int(_2951)] = as_type<uint>(_2921);
        int _2953 = _2939 + 1292;
        uint _2955 = uint(int(uint(_2953) >> uint(2)));
        _26[int(_2955)] = as_type<uint>(_2843);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _2957 = _2911;
        if (!_2691)
        {
            int _2959 = _283 << 4;
            int _2961 = _2959 + 1280;
            uint _2963 = uint(int(uint(_2961) >> uint(2)));
            float _2965 = as_type<float>(_26[int(_2963)]);
            int _2967 = _2959 + 1284;
            uint _2969 = uint(int(uint(_2967) >> uint(2)));
            float _2971 = as_type<float>(_26[int(_2969)]);
            int _2973 = _2959 + 1288;
            uint _2975 = uint(int(uint(_2973) >> uint(2)));
            float _2977 = as_type<float>(_26[int(_2975)]);
            int _2979 = _2959 + 1292;
            uint _2981 = uint(int(uint(_2979) >> uint(2)));
            float _2983 = as_type<float>(_26[int(_2981)]);
            int _2985 = _283 << 4;
            int _2987 = _2985 + 1296;
            uint _2989 = uint(int(uint(_2987) >> uint(2)));
            float _2991 = as_type<float>(_26[int(_2989)]);
            int _2993 = _2985 + 1300;
            uint _2995 = uint(int(uint(_2993) >> uint(2)));
            float _2997 = as_type<float>(_26[int(_2995)]);
            int _2999 = _2985 + 1304;
            uint _3001 = uint(int(uint(_2999) >> uint(2)));
            float _3003 = as_type<float>(_26[int(_3001)]);
            int _3005 = _2985 + 1308;
            uint _3007 = uint(int(uint(_3005) >> uint(2)));
            float _3009 = as_type<float>(_26[int(_3007)]);
            int _3011 = _283 << 4;
            int _3013 = _3011 + 1312;
            uint _3015 = uint(int(uint(_3013) >> uint(2)));
            float _3017 = as_type<float>(_26[int(_3015)]);
            int _3019 = _3011 + 1316;
            uint _3021 = uint(int(uint(_3019) >> uint(2)));
            float _3023 = as_type<float>(_26[int(_3021)]);
            int _3025 = _3011 + 1320;
            uint _3027 = uint(int(uint(_3025) >> uint(2)));
            float _3029 = as_type<float>(_26[int(_3027)]);
            int _3031 = _3011 + 1324;
            uint _3033 = uint(int(uint(_3031) >> uint(2)));
            float _3035 = as_type<float>(_26[int(_3033)]);
            int _3037 = _283 << 4;
            uint _3039 = uint(int(uint(_3037) >> uint(2)));
            float _3041 = as_type<float>(_26[int(_3039)]);
            int _3043 = _3037 + 4;
            uint _3045 = uint(int(uint(_3043) >> uint(2)));
            float _3047 = as_type<float>(_26[int(_3045)]);
            int _3049 = _3037 + 8;
            uint _3051 = uint(int(uint(_3049) >> uint(2)));
            float _3053 = as_type<float>(_26[int(_3051)]);
            int _3055 = _3037 + 12;
            uint _3057 = uint(int(uint(_3055) >> uint(2)));
            float _3059 = as_type<float>(_26[int(_3057)]);
            int _3061 = _283 << 4;
            int _3063 = _3061 + 16;
            uint _3065 = uint(int(uint(_3063) >> uint(2)));
            float _3067 = as_type<float>(_26[int(_3065)]);
            int _3069 = _3061 + 20;
            uint _3071 = uint(int(uint(_3069) >> uint(2)));
            float _3073 = as_type<float>(_26[int(_3071)]);
            int _3075 = _3061 + 24;
            uint _3077 = uint(int(uint(_3075) >> uint(2)));
            float _3079 = as_type<float>(_26[int(_3077)]);
            int _3081 = _3061 + 28;
            uint _3083 = uint(int(uint(_3081) >> uint(2)));
            float _3085 = as_type<float>(_26[int(_3083)]);
            int _3087 = _283 << 4;
            int _3089 = _3087 + 1328;
            uint _3091 = uint(int(uint(_3089) >> uint(2)));
            float _3093 = as_type<float>(_26[int(_3091)]);
            int _3095 = _3087 + 1332;
            uint _3097 = uint(int(uint(_3095) >> uint(2)));
            float _3099 = as_type<float>(_26[int(_3097)]);
            int _3101 = _3087 + 1336;
            uint _3103 = uint(int(uint(_3101) >> uint(2)));
            float _3105 = as_type<float>(_26[int(_3103)]);
            int _3107 = _3087 + 1340;
            uint _3109 = uint(int(uint(_3107) >> uint(2)));
            float _3111 = as_type<float>(_26[int(_3109)]);
            float _3113 = _330 + _2983;
            float _3115 = -_3113;
            float _3117 = exp2(_3115);
            float _3119 = _3113 + _3009;
            float _3121 = _3119 + _3035;
            float _3123 = -_3119;
            float _3125 = exp2(_3123);
            float _3127 = -_2965;
            float _3129 = _3127 + _3041;
            float _3131 = -_2971;
            float _3133 = _3131 + _3047;
            float _3135 = -_2977;
            float _3137 = _3135 + _3053;
            float _3139 = -_2997;
            float _3141 = _3139 + _3073;
            float _3143 = -_2991;
            float _3145 = _3143 + _3067;
            float _3147 = -_3003;
            float _3149 = _3147 + _3079;
            float _3151 = -_3117;
            float _3153 = _3151 + 1.0;
            float _3155 = _3121 + _3111;
            int _3157 = _283 << 4;
            int _3159 = _3157 + 32;
            uint _3161 = uint(int(uint(_3159) >> uint(2)));
            float _3163 = as_type<float>(_26[int(_3161)]);
            int _3165 = _3157 + 36;
            uint _3167 = uint(int(uint(_3165) >> uint(2)));
            float _3169 = as_type<float>(_26[int(_3167)]);
            int _3171 = _3157 + 40;
            uint _3173 = uint(int(uint(_3171) >> uint(2)));
            float _3175 = as_type<float>(_26[int(_3173)]);
            int _3177 = _3157 + 44;
            uint _3179 = uint(int(uint(_3177) >> uint(2)));
            float _3181 = as_type<float>(_26[int(_3179)]);
            float _3183 = precise::min(_3153, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3185 = -_3125;
            float _3187 = _3185 + 1.0;
            float _3189 = -_3121;
            float _3191 = exp2(_3189);
            float _3193 = -_338;
            float _3195 = _3183 + _3193;
            float _3197 = precise::min(_3187, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3199 = _3195 * _3059;
            float _3201 = -_3183;
            float _3203 = _3201 + _3197;
            float _3205 = _3129 * _3199;
            float _3207 = _3133 * _3199;
            float _3209 = _3137 * _3199;
            float _3211 = _3203 * _3085;
            float _3213 = fma(_2965, _3195, _3205);
            float _3215 = fma(_2971, _3195, _3207);
            float _3217 = fma(_2977, _3195, _3209);
            float _3219 = -_3191;
            float _3221 = _3219 + 1.0;
            float _3223 = _3141 * _3211;
            int _3225 = _283 << 4;
            int _3227 = _3225 + 48;
            uint _3229 = uint(int(uint(_3227) >> uint(2)));
            float _3231 = as_type<float>(_26[int(_3229)]);
            int _3233 = _3225 + 52;
            uint _3235 = uint(int(uint(_3233) >> uint(2)));
            float _3237 = as_type<float>(_26[int(_3235)]);
            int _3239 = _3225 + 56;
            uint _3241 = uint(int(uint(_3239) >> uint(2)));
            float _3243 = as_type<float>(_26[int(_3241)]);
            int _3245 = _3225 + 60;
            uint _3247 = uint(int(uint(_3245) >> uint(2)));
            float _3249 = as_type<float>(_26[int(_3247)]);
            float _3251 = _3145 * _3211;
            float _3253 = _3149 * _3211;
            float _3255 = precise::min(_3221, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _3257 = _283 << 2;
            int _3259 = _3257 + 1024;
            uint _3261 = uint(int(uint(_3259) >> uint(2)));
            float _3263 = as_type<float>(_26[int(_3261)]);
            float _3265 = fma(_2991, _3203, _3251);
            float _3267 = fma(_2997, _3203, _3223);
            float _3269 = -_3155;
            float _3271 = exp2(_3269);
            int _3273 = _283 << 2;
            int _3275 = _3273 + 1028;
            uint _3277 = uint(int(uint(_3275) >> uint(2)));
            float _3279 = as_type<float>(_26[int(_3277)]);
            float _3281 = -_3197;
            float _3283 = _3281 + _3255;
            float _3285 = fma(_3003, _3203, _3253);
            float _3287 = _3213 + as_type<float>(_334);
            int _3289 = _283 << 2;
            int _3291 = _3289 + 1032;
            uint _3293 = uint(int(uint(_3291) >> uint(2)));
            float _3295 = as_type<float>(_26[int(_3293)]);
            float _3297 = _3215 + as_type<float>(_336);
            float _3299 = -_3017;
            float _3301 = _3299 + _3163;
            float _3303 = _3283 * _3181;
            int _3305 = _283 << 2;
            int _3307 = _3305 + 1036;
            uint _3309 = uint(int(uint(_3307) >> uint(2)));
            float _3311 = as_type<float>(_26[int(_3309)]);
            float _3313 = -_3023;
            float _3315 = _3313 + _3169;
            float _3317 = -_3029;
            float _3319 = _3317 + _3175;
            float _3321 = _3301 * _3303;
            float _3323 = _3217 + as_type<float>(_332);
            float _3325 = _3315 * _3303;
            float _3327 = _3319 * _3303;
            float _3329 = fma(_3017, _3283, _3321);
            float _3331 = _3297 + _3267;
            float _3333 = fma(_3023, _3283, _3325);
            float _3335 = -_3271;
            float _3337 = _3335 + 1.0;
            float _3339 = fma(_3029, _3283, _3327);
            float _3341 = _3287 + _3265;
            float _3343 = _3323 + _3285;
            float _3345 = _3331 + _3333;
            float _3347 = precise::min(_3337, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3349 = _3341 + _3329;
            float _3351 = _3343 + _3339;
            int _3353 = _283 << 4;
            int _3355 = _3353 + 1280;
            uint _3357 = uint(int(uint(_3355) >> uint(2)));
            _26[int(_3357)] = as_type<uint>(_3287);
            int _3359 = _3353 + 1284;
            uint _3361 = uint(int(uint(_3359) >> uint(2)));
            _26[int(_3361)] = as_type<uint>(_3297);
            int _3363 = _3353 + 1288;
            uint _3365 = uint(int(uint(_3363) >> uint(2)));
            _26[int(_3365)] = as_type<uint>(_3323);
            int _3367 = _3353 + 1292;
            uint _3369 = uint(int(uint(_3367) >> uint(2)));
            _26[int(_3369)] = as_type<uint>(_3113);
            float _3371 = -_3255;
            float _3373 = _3347 + _3371;
            int _3375 = _283 << 4;
            int _3377 = _3375 + 1296;
            uint _3379 = uint(int(uint(_3377) >> uint(2)));
            _26[int(_3379)] = as_type<uint>(_3341);
            int _3381 = _3375 + 1300;
            uint _3383 = uint(int(uint(_3381) >> uint(2)));
            _26[int(_3383)] = as_type<uint>(_3331);
            int _3385 = _3375 + 1304;
            uint _3387 = uint(int(uint(_3385) >> uint(2)));
            _26[int(_3387)] = as_type<uint>(_3343);
            int _3389 = _3375 + 1308;
            uint _3391 = uint(int(uint(_3389) >> uint(2)));
            _26[int(_3391)] = as_type<uint>(_3119);
            float _3393 = -_3093;
            float _3395 = _3393 + _3231;
            float _3397 = _3373 * _3249;
            float _3399 = -_3099;
            float _3401 = _3399 + _3237;
            float _3403 = -_3105;
            float _3405 = _3403 + _3243;
            float _3407 = _3263 + _340;
            float _3409 = _3395 * _3397;
            float _3411 = _3401 * _3397;
            float _3413 = _3405 * _3397;
            float _3415 = _3407 + _3279;
            float _3417 = fma(_3093, _3373, _3409);
            float _3419 = fma(_3099, _3373, _3411);
            float _3421 = fma(_3105, _3373, _3413);
            float _3423 = _3415 + _3295;
            float _3425 = _3417 + _3349;
            float _3427 = _3419 + _3345;
            float _3429 = _3421 + _3351;
            float _3431 = _3423 + _3311;
            int _3433 = _283 << 4;
            int _3435 = _3433 + 1312;
            uint _3437 = uint(int(uint(_3435) >> uint(2)));
            _26[int(_3437)] = as_type<uint>(_3349);
            int _3439 = _3433 + 1316;
            uint _3441 = uint(int(uint(_3439) >> uint(2)));
            _26[int(_3441)] = as_type<uint>(_3345);
            int _3443 = _3433 + 1320;
            uint _3445 = uint(int(uint(_3443) >> uint(2)));
            _26[int(_3445)] = as_type<uint>(_3351);
            int _3447 = _3433 + 1324;
            uint _3449 = uint(int(uint(_3447) >> uint(2)));
            _26[int(_3449)] = as_type<uint>(_3121);
            int _3451 = _283 << 2;
            int _3453 = _3451 + 1024;
            uint _3455 = uint(int(uint(_3453) >> uint(2)));
            _26[int(_3455)] = as_type<uint>(_3407);
            int _3457 = _283 << 2;
            int _3459 = _3457 + 1028;
            uint _3461 = uint(int(uint(_3459) >> uint(2)));
            _26[int(_3461)] = as_type<uint>(_3415);
            int _3463 = _283 << 2;
            int _3465 = _3463 + 1032;
            uint _3467 = uint(int(uint(_3465) >> uint(2)));
            _26[int(_3467)] = as_type<uint>(_3423);
            int _3469 = _283 << 2;
            int _3471 = _3469 + 1036;
            uint _3473 = uint(int(uint(_3471) >> uint(2)));
            _26[int(_3473)] = as_type<uint>(_3431);
            int _3475 = _283 << 4;
            int _3477 = _3475 + 1328;
            uint _3479 = uint(int(uint(_3477) >> uint(2)));
            _26[int(_3479)] = as_type<uint>(_3425);
            int _3481 = _3475 + 1332;
            uint _3483 = uint(int(uint(_3481) >> uint(2)));
            _26[int(_3483)] = as_type<uint>(_3427);
            int _3485 = _3475 + 1336;
            uint _3487 = uint(int(uint(_3485) >> uint(2)));
            _26[int(_3487)] = as_type<uint>(_3429);
            int _3489 = _3475 + 1340;
            uint _3491 = uint(int(uint(_3489) >> uint(2)));
            _26[int(_3491)] = as_type<uint>(_3155);
            _2885 = _3155;
            _2877 = _3397;
            _2879 = _3203;
            _464 = _3347;
            _466 = _3431;
            _2909 = as_type<int>(_3425);
            _2957 = as_type<int>(_3427);
            _2899 = as_type<int>(_3429);
            _2887 = _3155;
        }
        float _3493 = _2885;
        float _3495 = _2877;
        float _3497 = _2879;
        float _3499 = _464;
        float _3501 = _466;
        int _3503 = _2909;
        int _3505 = _2957;
        int _3507 = _2899;
        float _3509 = _2887;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _3511 = _2805 << 4;
        int _3513 = _3511 + 1280;
        uint _3515 = uint(int(uint(_3513) >> uint(2)));
        float _3517 = as_type<float>(_26[int(_3515)]);
        int _3519 = _3511 + 1284;
        uint _3521 = uint(int(uint(_3519) >> uint(2)));
        float _3523 = as_type<float>(_26[int(_3521)]);
        int _3525 = _3511 + 1288;
        uint _3527 = uint(int(uint(_3525) >> uint(2)));
        float _3529 = as_type<float>(_26[int(_3527)]);
        int _3531 = _3511 + 1292;
        uint _3533 = uint(int(uint(_3531) >> uint(2)));
        float _3535 = as_type<float>(_26[int(_3533)]);
        float _3537 = 1.0 / _2421;
        int _3539 = _2805 << 2;
        int _3541 = _3539 + 1024;
        uint _3543 = uint(int(uint(_3541) >> uint(2)));
        float _3545 = as_type<float>(_26[int(_3543)]);
        float _3547 = -_3535;
        float _3549 = exp2(_3547);
        float _3551 = _3545 * _3537;
        float _3553 = precise::max(_3549, _281);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_3517, _3523, _3529, _3553), uint3(int3(_77, _73, int(_314))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_3551, _3551, _3551, _3551), uint3(int3(_77, _73, int(_314))));
        int _3555 = int(_314) + 4;
        bool _3557 = uint(_3555) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _286 = uint(_3555);
        _288 = _3493;
        _290 = _3551;
        _292 = _3551;
        _294 = _3551;
        _296 = _3535;
        _298 = _3495;
        _300 = _3497;
        _302 = _3509;
        _304 = _3507;
        _306 = _3503;
        _308 = _3505;
        _310 = _3499;
        _312 = _3501;
        if (_3557)
        {
            _3559 = true;
            if (_3559)
            {
                break;
            }
        }
    } while (true);
    _3559 = false;
}

