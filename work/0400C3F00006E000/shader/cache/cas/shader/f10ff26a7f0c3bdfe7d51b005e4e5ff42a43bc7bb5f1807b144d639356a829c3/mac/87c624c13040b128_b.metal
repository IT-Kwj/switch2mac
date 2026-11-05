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
    bool _2603 = false;
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
    float _191 = _173;
    if (!_183)
    {
        _185 = _165;
    }
    float _193 = _185;
    bool _195 = !_183;
    float _197 = _193;
    if (!_195)
    {
        float _199 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _201 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _203 = _173 + _201;
        float _205 = _179 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _207 = rsqrt(_171);
        float _209 = _203 * _199;
        float _211 = _209 * 0.15915493667125701904296875;
        float _213 = _211 * 6.283185482025146484375;
        float _215 = sin(_213);
        float _217 = _211 * 6.283185482025146484375;
        float _219 = cos(_217);
        float _221 = fma(_215, _205, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _223 = _207 * _221;
        float _225 = _219 + (-1.0);
        float _227 = _159 * _223;
        float _229 = _225 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _231 = _161 * _223;
        float _233 = fma(_179, _219, _229);
        float _235 = _227 * _227;
        float _237 = _231 * _231;
        _187 = _233;
        _197 = _235;
        _189 = _237;
        _191 = _211;
    }
    float _239 = _187;
    float _241 = _197;
    float _243 = _189;
    float _245 = _191;
    float _247 = _97 * _97;
    float _249 = fma(_239, _239, _241);
    bool _251 = as_type<uint>(_99) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _253 = fma(_101, _101, _247);
    float _255 = _249 + _243;
    float _257 = _153 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _259 = _253 + 1.0;
    float _261 = rsqrt(_255);
    float _263 = -_157;
    float _265 = -_257;
    float _267 = fma(_263, (*spvDescriptorSet0.cp_c3)._m0[6].y, _265);
    float _269 = -_155;
    float _271 = fma(_269, (*spvDescriptorSet0.cp_c3)._m0[6].z, _267);
    float _273 = sqrt(_259);
    float _275 = _245;
    if (_251)
    {
        return;
    }
    int _277 = as_type<int>(_68) << 2;
    int _279 = _277 + as_type<int>(_72);
    float _281 = -_271;
    float _283 = fma(_281, (*spvDescriptorSet0.cp_c3)._m0[15].x, _271);
    float _285 = rsqrt(_259);
    float _287 = _261 * _239;
    float _289 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _291 = _289 + 1.0;
    int _293 = _279 << 2;
    uint _296 = as_type<uint>(_99);
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
        uint _316 = _296;
        float _318 = _275;
        float _320 = _298;
        float _322 = _300;
        float _324 = _302;
        int _326 = _304;
        int _328 = _306;
        float _330 = _308;
        int _332 = _310;
        float _334 = _312;
        float _336 = _314;
        float _338 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _340 = log2(_338);
        float _342 = float(_316);
        float _344 = _273 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _346 = int(_316) + 1;
        float _348 = float(uint(_346));
        float _350 = _340 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _352 = _342 * _350;
        float _354 = _348 * _350;
        float _356 = exp2(_352);
        float _358 = exp2(_354);
        float _360 = _356 + (-1.0);
        float _362 = _360 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _364 = _358 + (-1.0);
        float _366 = _362 * _344;
        float _368 = -_362;
        float _370 = fma(_364, (*spvDescriptorSet0.cp_c3)._m0[8].z, _368);
        float _372 = fma(_153, _366, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _374 = fma(_157, _366, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _376 = _273 * _370;
        float _378 = _376 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _380 = _378 * 0.5;
        float _382 = _366 + _380;
        float _384 = fma(_155, _366, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _386 = fma(_153, _380, _372);
        float _388 = fma(_157, _380, _374);
        float _390 = -_285;
        float _392 = _382 * _390;
        float _394 = fma(_155, _380, _384);
        float _396 = -_392;
        float _398 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _400 = _396 + _398;
        float _402 = -_392;
        float _404 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _406 = _402 + _404;
        float _408 = fma(_392, (*spvDescriptorSet0.cp_c4)._m0[2].x, _386);
        float _410 = fma(_392, (*spvDescriptorSet0.cp_c4)._m0[2].y, _388);
        float _412 = _400 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _414 = precise::clamp(_412, 0.0, 1.0);
        float _416 = _406 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _418 = precise::clamp(_416, 0.0, 1.0);
        float _420 = fma(_392, (*spvDescriptorSet0.cp_c4)._m0[2].z, _394);
        bool _422 = _414 != 1.0;
        bool _424 = isnan(_414);
        bool _426 = _422 || _424;
        bool _428 = isnan(1.0);
        bool _430 = _426 || _428;
        bool _432 = _418 != 1.0;
        bool _434 = isnan(_418);
        bool _436 = _432 || _434;
        bool _438 = isnan(1.0);
        bool _440 = _436 || _438;
        float _442 = _318;
        float _444 = _358;
        float _446 = _320;
        float _448 = _322;
        float _450 = _324;
        float _452 = _370;
        float _454 = _374;
        float _456 = _334;
        float _458 = _336;
        if (!_430)
        {
            _442 = 1.0;
        }
        float _460 = _442;
        bool _462 = !_430;
        float _464 = _460;
        if (!_462)
        {
            float _466 = -_392;
            bool _468 = _466 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _470 = -_392;
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
            int _544 = _486 + 272;
            uint _546 = uint(int(uint(_544) >> uint(2)));
            uint _548 = uint(int(uint(int(_546)) >> uint(2)));
            int _550 = int(_546) & 3;
            float _552 = (*spvDescriptorSet0.cp_c3)._m0[int(_548)][_550];
            int _554 = int(_546) + 1;
            uint _556 = uint(int(uint(_554) >> uint(2)));
            int _558 = _554 & 3;
            float _560 = (*spvDescriptorSet0.cp_c3)._m0[int(_556)][_558];
            int _562 = _486 + 288;
            uint _564 = uint(int(uint(_562) >> uint(2)));
            uint _566 = uint(int(uint(int(_564)) >> uint(2)));
            int _568 = int(_564) & 3;
            float _570 = (*spvDescriptorSet0.cp_c3)._m0[int(_566)][_568];
            int _572 = int(_564) + 1;
            uint _574 = uint(int(uint(_572) >> uint(2)));
            int _576 = _572 & 3;
            float _578 = (*spvDescriptorSet0.cp_c3)._m0[int(_574)][_576];
            int _580 = _486 + 264;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            uint _584 = uint(int(uint(int(_582)) >> uint(2)));
            int _586 = int(_582) & 3;
            float _588 = (*spvDescriptorSet0.cp_c3)._m0[int(_584)][_586];
            int _590 = int(_582) + 1;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            int _594 = _590 & 3;
            float _596 = (*spvDescriptorSet0.cp_c3)._m0[int(_592)][_594];
            int _598 = _486 + 280;
            uint _600 = uint(int(uint(_598) >> uint(2)));
            uint _602 = uint(int(uint(int(_600)) >> uint(2)));
            int _604 = int(_600) & 3;
            float _606 = (*spvDescriptorSet0.cp_c3)._m0[int(_602)][_604];
            int _608 = int(_600) + 1;
            uint _610 = uint(int(uint(_608) >> uint(2)));
            int _612 = _608 & 3;
            float _614 = (*spvDescriptorSet0.cp_c3)._m0[int(_610)][_612];
            float _616 = _410 * _506;
            float _618 = fma(_408, _498, _616);
            int _620 = _486 + 296;
            uint _622 = uint(int(uint(_620) >> uint(2)));
            uint _624 = uint(int(uint(int(_622)) >> uint(2)));
            int _626 = int(_622) & 3;
            float _628 = (*spvDescriptorSet0.cp_c3)._m0[int(_624)][_626];
            int _630 = int(_622) + 1;
            uint _632 = uint(int(uint(_630) >> uint(2)));
            int _634 = _630 & 3;
            float _636 = (*spvDescriptorSet0.cp_c3)._m0[int(_632)][_634];
            float _638 = fma(_420, _516, _618);
            float _640 = _638 + _524;
            float _642 = _410 * _542;
            float _644 = 1.0 / _640;
            float _646 = fma(_408, _534, _642);
            float _648 = _410 * _560;
            float _650 = rint(_488);
            float _652 = precise::max(_650, 0.0);
            uint _654 = uint(_652);
            uint _656 = clamp(_654, 0u, 65535u);
            float _658 = fma(_408, _552, _648);
            float _660 = _410 * _578;
            float _662 = fma(_408, _570, _660);
            float _664 = fma(_420, _588, _646);
            float _666 = _664 + _596;
            float _668 = fma(_420, _606, _658);
            float _670 = _666 * _644;
            float _672 = _668 + _614;
            float _674 = fma(_420, _628, _662);
            float _676 = _672 * _644;
            float _678 = _674 + _636;
            float _680 = _678 * _644;
            float _682 = precise::clamp(_680, 0.0, 1.0);
            float3 _3540 = float3(_670, _676, float(int(_656)));
            float3 _3544 = select(_3540, float3(0.0), isnan(_3540));
            float _684 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _3544.xy, uint(rint(_3544.z)), _682, level(0.0));
            float _686 = -_684;
            float _688 = _686 + 1.0;
            float _690 = fma(_688, _414, _684);
            _444 = _670;
            _464 = _690;
            _446 = _570;
            _448 = _596;
            _450 = _614;
        }
        float _692 = _444;
        float _694 = _464;
        float _696 = _446;
        float _698 = _448;
        float _700 = _450;
        float _702 = _692;
        float _704 = _696;
        float _706 = _696;
        float _708 = _698;
        float _710 = _700;
        if (!_440)
        {
            _702 = 1.0;
        }
        float _712 = _702;
        bool _714 = !_440;
        float _716 = _712;
        if (!_714)
        {
            float _718 = _410 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _720 = _410 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _722 = fma(_408, (*spvDescriptorSet0.cp_c3)._m0[130].x, _718);
            float _724 = fma(_408, (*spvDescriptorSet0.cp_c3)._m0[131].x, _720);
            float _726 = fma(_420, (*spvDescriptorSet0.cp_c3)._m0[130].z, _722);
            float _728 = fma(_420, (*spvDescriptorSet0.cp_c3)._m0[131].z, _724);
            float _730 = _726 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _732 = _728 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _734 = trunc(_730);
            int _736 = int(_734);
            float _738 = trunc(_732);
            int _740 = int(_738);
            int _742 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _744 = _736 + _742;
            int _746 = _744 + 1;
            bool _748 = _746 >= 0;
            int _750 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _752 = _740 + _750;
            int _754 = _752 + 1;
            bool _756 = _746 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _758 = !_748;
            bool _760 = _756 || _758;
            bool _762 = _754 < 0;
            bool _764 = _762 || _760;
            bool _766 = _754 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _768 = _766 || _764;
            float _770 = _728;
            _708 = _732;
            if (_768)
            {
                _770 = 1.0;
            }
            float _772 = _770;
            float _774 = _772;
            if (!_768)
            {
                int _776 = _754 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _778 = _776 + _746;
                float _780 = floor(_732);
                int _782 = _778 << 2;
                uint _784 = uint(int(uint(_778) >> uint(2)));
                int _786 = 12 & _782;
                float _788 = floor(_730);
                int _790 = _778 << 4;
                int _792 = _790 + 2112;
                int _794 = int(_784) << 4;
                int _796 = _794 + _786;
                uint _798 = uint(int(uint(_792) >> uint(2)));
                uint _800 = uint(int(uint(int(_798)) >> uint(2)));
                int _802 = int(_798) & 3;
                float _804 = (*spvDescriptorSet0.cp_c3)._m0[int(_800)][_802];
                int _806 = int(_798) + 1;
                uint _808 = uint(int(uint(_806) >> uint(2)));
                int _810 = _806 & 3;
                float _812 = (*spvDescriptorSet0.cp_c3)._m0[int(_808)][_810];
                int _814 = _796 + 464;
                uint _816 = uint(int(uint(_814) >> uint(2)));
                uint _818 = uint(int(uint(int(_816)) >> uint(2)));
                int _820 = int(_816) & 3;
                float _822 = (*spvDescriptorSet0.cp_c3)._m0[int(_818)][_820];
                float _824 = -_788;
                float _826 = _824 + _730;
                int _828 = _792 + 8;
                uint _830 = uint(int(uint(_828) >> uint(2)));
                uint _832 = uint(int(uint(int(_830)) >> uint(2)));
                int _834 = int(_830) & 3;
                float _836 = (*spvDescriptorSet0.cp_c3)._m0[int(_832)][_834];
                int _838 = int(_830) + 1;
                uint _840 = uint(int(uint(_838) >> uint(2)));
                int _842 = _838 & 3;
                float _844 = (*spvDescriptorSet0.cp_c3)._m0[int(_840)][_842];
                float _846 = _410 * _812;
                float _848 = fma(_408, _804, _846);
                float _850 = rint(_822);
                float _852 = precise::max(_850, 0.0);
                uint _854 = uint(_852);
                uint _856 = clamp(_854, 0u, 65535u);
                float _858 = fma(_420, _836, _848);
                float _860 = -_780;
                float _862 = _860 + _732;
                float _864 = _858 + _844;
                float _866 = precise::clamp(_864, 0.0, 1.0);
                float3 _3828 = float3(_826, _862, float(int(_856)));
                float3 _3830 = select(_3828, float3(0.0), isnan(_3828));
                float _868 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _3830.xy, uint(rint(_3830.z)), _866, level(0.0));
                _774 = _868;
                _704 = _780;
            }
            float _870 = _774;
            float _872 = _704;
            float _874 = -_870;
            float _876 = _874 + 1.0;
            float _878 = fma(_876, _418, _870);
            _716 = _878;
            _706 = _872;
        }
        float _880 = _716;
        float _882 = _706;
        float _884 = _708;
        float _886 = -_392;
        float _888 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _890 = _886 + _888;
        float _892 = -_392;
        float _894 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _896 = _892 + _894;
        float _898 = precise::min(_694, _880);
        float _900 = _890 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _902 = precise::clamp(_900, 0.0, 1.0);
        float _904 = _896 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _906 = precise::clamp(_904, 0.0, 1.0);
        float _908 = fma(_392, (*spvDescriptorSet0.cp_c4)._m0[3].x, _386);
        float _910 = fma(_392, (*spvDescriptorSet0.cp_c4)._m0[3].y, _388);
        float _912 = fma(_392, (*spvDescriptorSet0.cp_c4)._m0[3].z, _394);
        bool _914 = _902 != 1.0;
        bool _916 = isnan(_902);
        bool _918 = _914 || _916;
        bool _920 = isnan(1.0);
        bool _922 = _918 || _920;
        bool _924 = _906 != 1.0;
        bool _926 = isnan(_906);
        bool _928 = _924 || _926;
        bool _930 = isnan(1.0);
        bool _932 = _928 || _930;
        float _934 = _882;
        float _936 = _884;
        if (!_922)
        {
            _934 = 1.0;
        }
        float _938 = _934;
        bool _940 = !_922;
        float _942 = _938;
        if (!_940)
        {
            float _944 = -_392;
            bool _946 = _944 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _948 = -_392;
            bool _950 = _948 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _952 = !_946;
            int _954 = _952 ? 0 : 1;
            int _956 = 2;
            if (!_946)
            {
                _956 = 1;
            }
            int _958 = _956;
            int _960 = _958;
            if (!_950)
            {
                _960 = _954;
            }
            int _962 = _960;
            int _964 = _962 << 6;
            float _966 = float(_962);
            int _968 = _964 + 304;
            uint _970 = uint(int(uint(_968) >> uint(2)));
            uint _972 = uint(int(uint(int(_970)) >> uint(2)));
            int _974 = int(_970) & 3;
            float _976 = (*spvDescriptorSet0.cp_c3)._m0[int(_972)][_974];
            int _978 = int(_970) + 1;
            uint _980 = uint(int(uint(_978) >> uint(2)));
            int _982 = _978 & 3;
            float _984 = (*spvDescriptorSet0.cp_c3)._m0[int(_980)][_982];
            int _986 = _964 + 312;
            uint _988 = uint(int(uint(_986) >> uint(2)));
            uint _990 = uint(int(uint(int(_988)) >> uint(2)));
            int _992 = int(_988) & 3;
            float _994 = (*spvDescriptorSet0.cp_c3)._m0[int(_990)][_992];
            int _996 = int(_988) + 1;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            int _1000 = _996 & 3;
            float _1002 = (*spvDescriptorSet0.cp_c3)._m0[int(_998)][_1000];
            int _1004 = _964 + 256;
            uint _1006 = uint(int(uint(_1004) >> uint(2)));
            uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
            int _1010 = int(_1006) & 3;
            float _1012 = (*spvDescriptorSet0.cp_c3)._m0[int(_1008)][_1010];
            int _1014 = int(_1006) + 1;
            uint _1016 = uint(int(uint(_1014) >> uint(2)));
            int _1018 = _1014 & 3;
            float _1020 = (*spvDescriptorSet0.cp_c3)._m0[int(_1016)][_1018];
            int _1022 = _964 + 272;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
            int _1028 = int(_1024) & 3;
            float _1030 = (*spvDescriptorSet0.cp_c3)._m0[int(_1026)][_1028];
            int _1032 = int(_1024) + 1;
            uint _1034 = uint(int(uint(_1032) >> uint(2)));
            int _1036 = _1032 & 3;
            float _1038 = (*spvDescriptorSet0.cp_c3)._m0[int(_1034)][_1036];
            int _1040 = _964 + 288;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            uint _1044 = uint(int(uint(int(_1042)) >> uint(2)));
            int _1046 = int(_1042) & 3;
            float _1048 = (*spvDescriptorSet0.cp_c3)._m0[int(_1044)][_1046];
            int _1050 = int(_1042) + 1;
            uint _1052 = uint(int(uint(_1050) >> uint(2)));
            int _1054 = _1050 & 3;
            float _1056 = (*spvDescriptorSet0.cp_c3)._m0[int(_1052)][_1054];
            int _1058 = _964 + 264;
            uint _1060 = uint(int(uint(_1058) >> uint(2)));
            uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
            int _1064 = int(_1060) & 3;
            float _1066 = (*spvDescriptorSet0.cp_c3)._m0[int(_1062)][_1064];
            int _1068 = int(_1060) + 1;
            uint _1070 = uint(int(uint(_1068) >> uint(2)));
            int _1072 = _1068 & 3;
            float _1074 = (*spvDescriptorSet0.cp_c3)._m0[int(_1070)][_1072];
            int _1076 = _964 + 280;
            uint _1078 = uint(int(uint(_1076) >> uint(2)));
            uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
            int _1082 = int(_1078) & 3;
            float _1084 = (*spvDescriptorSet0.cp_c3)._m0[int(_1080)][_1082];
            int _1086 = int(_1078) + 1;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            int _1090 = _1086 & 3;
            float _1092 = (*spvDescriptorSet0.cp_c3)._m0[int(_1088)][_1090];
            float _1094 = _910 * _984;
            float _1096 = fma(_908, _976, _1094);
            int _1098 = _964 + 296;
            uint _1100 = uint(int(uint(_1098) >> uint(2)));
            uint _1102 = uint(int(uint(int(_1100)) >> uint(2)));
            int _1104 = int(_1100) & 3;
            float _1106 = (*spvDescriptorSet0.cp_c3)._m0[int(_1102)][_1104];
            int _1108 = int(_1100) + 1;
            uint _1110 = uint(int(uint(_1108) >> uint(2)));
            int _1112 = _1108 & 3;
            float _1114 = (*spvDescriptorSet0.cp_c3)._m0[int(_1110)][_1112];
            float _1116 = fma(_912, _994, _1096);
            float _1118 = _1116 + _1002;
            float _1120 = _910 * _1020;
            float _1122 = 1.0 / _1118;
            float _1124 = fma(_908, _1012, _1120);
            float _1126 = _910 * _1038;
            float _1128 = rint(_966);
            float _1130 = precise::max(_1128, 0.0);
            uint _1132 = uint(_1130);
            uint _1134 = clamp(_1132, 0u, 65535u);
            float _1136 = fma(_908, _1030, _1126);
            float _1138 = _910 * _1056;
            float _1140 = fma(_908, _1048, _1138);
            float _1142 = fma(_912, _1066, _1124);
            float _1144 = _1142 + _1074;
            float _1146 = fma(_912, _1084, _1136);
            float _1148 = _1144 * _1122;
            float _1150 = _1146 + _1092;
            float _1152 = fma(_912, _1106, _1140);
            float _1154 = _1150 * _1122;
            float _1156 = _1152 + _1114;
            float _1158 = _1156 * _1122;
            float _1160 = precise::clamp(_1158, 0.0, 1.0);
            float3 _4288 = float3(_1148, _1154, float(int(_1134)));
            float3 _4290 = select(_4288, float3(0.0), isnan(_4288));
            float _1162 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _4290.xy, uint(rint(_4290.z)), _1160, level(0.0));
            float _1164 = -_1162;
            float _1166 = _1164 + 1.0;
            float _1168 = fma(_902, _1166, _1162);
            _710 = _1092;
            _936 = _1074;
            _942 = _1168;
        }
        float _1170 = _710;
        float _1172 = _936;
        float _1174 = _942;
        float _1176 = precise::min(_898, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1178 = _1172;
        if (!_932)
        {
            _1178 = 1.0;
        }
        float _1180 = _1178;
        bool _1182 = !_932;
        float _1184 = _1180;
        if (!_1182)
        {
            float _1186 = _910 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1188 = _910 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1190 = fma(_908, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1186);
            float _1192 = fma(_908, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1188);
            float _1194 = fma(_912, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1190);
            float _1196 = fma(_912, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1192);
            float _1198 = _1194 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1200 = _1196 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1202 = trunc(_1198);
            int _1204 = int(_1202);
            float _1206 = trunc(_1200);
            int _1208 = int(_1206);
            int _1210 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1212 = _1204 + _1210;
            int _1214 = _1212 + 1;
            bool _1216 = _1214 >= 0;
            int _1218 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1220 = _1208 + _1218;
            int _1222 = _1220 + 1;
            bool _1224 = _1214 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1226 = !_1216;
            bool _1228 = _1224 || _1226;
            bool _1230 = _1222 < 0;
            bool _1232 = _1230 || _1228;
            bool _1234 = _1222 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1236 = _1234 || _1232;
            float _1238 = _1196;
            if (_1236)
            {
                _1238 = 1.0;
            }
            float _1240 = _1238;
            float _1242 = _1240;
            if (!_1236)
            {
                int _1244 = _1222 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1246 = _1244 + _1214;
                float _1248 = floor(_1200);
                int _1250 = _1246 << 2;
                uint _1252 = uint(int(uint(_1246) >> uint(2)));
                int _1254 = 12 & _1250;
                float _1256 = floor(_1198);
                int _1258 = _1246 << 4;
                int _1260 = _1258 + 2112;
                int _1262 = int(_1252) << 4;
                int _1264 = _1262 + _1254;
                uint _1266 = uint(int(uint(_1260) >> uint(2)));
                uint _1268 = uint(int(uint(int(_1266)) >> uint(2)));
                int _1270 = int(_1266) & 3;
                float _1272 = (*spvDescriptorSet0.cp_c3)._m0[int(_1268)][_1270];
                int _1274 = int(_1266) + 1;
                uint _1276 = uint(int(uint(_1274) >> uint(2)));
                int _1278 = _1274 & 3;
                float _1280 = (*spvDescriptorSet0.cp_c3)._m0[int(_1276)][_1278];
                int _1282 = _1264 + 464;
                uint _1284 = uint(int(uint(_1282) >> uint(2)));
                uint _1286 = uint(int(uint(int(_1284)) >> uint(2)));
                int _1288 = int(_1284) & 3;
                float _1290 = (*spvDescriptorSet0.cp_c3)._m0[int(_1286)][_1288];
                float _1292 = -_1256;
                float _1294 = _1198 + _1292;
                int _1296 = _1260 + 8;
                uint _1298 = uint(int(uint(_1296) >> uint(2)));
                uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
                int _1302 = int(_1298) & 3;
                float _1304 = (*spvDescriptorSet0.cp_c3)._m0[int(_1300)][_1302];
                int _1306 = int(_1298) + 1;
                uint _1308 = uint(int(uint(_1306) >> uint(2)));
                int _1310 = _1306 & 3;
                float _1312 = (*spvDescriptorSet0.cp_c3)._m0[int(_1308)][_1310];
                float _1314 = _910 * _1280;
                float _1316 = fma(_908, _1272, _1314);
                float _1318 = rint(_1290);
                float _1320 = precise::max(_1318, 0.0);
                uint _1322 = uint(_1320);
                uint _1324 = clamp(_1322, 0u, 65535u);
                float _1326 = fma(_912, _1304, _1316);
                float _1328 = -_1248;
                float _1330 = _1200 + _1328;
                float _1332 = _1326 + _1312;
                float _1334 = precise::clamp(_1332, 0.0, 1.0);
                float3 _4564 = float3(_1294, _1330, float(int(_1324)));
                float3 _4566 = select(_4564, float3(0.0), isnan(_4564));
                float _1336 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _4566.xy, uint(rint(_4566.z)), _1334, level(0.0));
                _1242 = _1336;
            }
            float _1338 = _1242;
            float _1340 = -_1338;
            float _1342 = _1340 + 1.0;
            float _1344 = fma(_906, _1342, _1338);
            _1184 = _1344;
        }
        float _1346 = _1184;
        float _1348 = fma(_153, _378, _372);
        float _1350 = fma(_155, _378, _384);
        float _1352 = fma(_1348, 6.2500002968590706586837768554688e-05, 0.5);
        float _1354 = fma(_1350, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _4600 = float2(_1352, _1354);
        float _1356 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_4600, float2(0.0), isnan(_4600)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_4600, float2(0.0), isnan(_4600)), level(0.0)).x;
        float3 _4611 = float3(_1352, _1354, float(0));
        float3 _4613 = select(_4611, float3(0.0), isnan(_4611));
        float4 _1359 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4613.xy, uint(rint(_4613.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4613.xy, uint(rint(_4613.z)), level(0.0)).xyzw;
        float _1361 = _1359.x;
        float _1363 = _1359.y;
        float _1365 = _1359.z;
        float _1367 = _1359.w;
        float3 _4628 = float3(_1352, _1354, float(1));
        float3 _4630 = select(_4628, float3(0.0), isnan(_4628));
        float4 _1369 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4630.xy, uint(rint(_4630.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4630.xy, uint(rint(_4630.z)), level(0.0)).xyzw;
        float _1371 = _1369.x;
        float _1373 = _1369.y;
        float _1375 = _1369.z;
        float _1377 = _1369.w;
        float _1379 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _1381 = _1350 + _1379;
        float _1383 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _1385 = _1348 + _1383;
        float _1387 = _362 + _370;
        float _1389 = _1381 * _1381;
        float _1391 = _157 * _378;
        float _1393 = _157 * 1.02332699298858642578125;
        float _1395 = _273 * _1387;
        float _1397 = fma(_1385, _1385, _1389);
        float _1399 = _374 + _1391;
        float _1401 = _1395 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _1403 = sqrt(_1397);
        float _1405 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _1407 = fma(_1401, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        float _1411 = _155 * 1.02332699298858642578125;
        float _1413 = _1405 * 100.0;
        float _1415 = -_1409;
        float _1417 = _1415 + 1.0;
        float _1419 = exp2(_1413);
        bool _1421 = _1403 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _1423 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _1425 = _1403 + _1423;
        float _1427 = abs(_1417);
        float _1429 = log2(_1427);
        float _1431 = _1170;
        float _1433 = _1409;
        float _1435 = _1425;
        if (_1421)
        {
            float _1437 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _1431 = _1437;
        }
        float _1439 = _1431;
        if (!_1421)
        {
            _1433 = _1399;
        }
        float _1441 = _1433;
        float _1443 = _1441;
        if (_1421)
        {
            float _1445 = _1425 * _1439;
            _1435 = _1445;
        }
        float _1447 = _1435;
        if (_1421)
        {
            float _1449 = _1447 * 0.15915493667125701904296875;
            _452 = _1449;
        }
        float _1451 = _452;
        float _1453 = fma(_1419, 512.0, -512.0);
        float _1455 = precise::min(_1346, _1174);
        float _1457 = _1405 * 5115.0;
        float _1459 = 1.0 / _1405;
        float _1461 = precise::min(_1455, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1463 = _1176 + _1461;
        float _1465 = _1451;
        if (_1421)
        {
            float _1467 = _1451 * 6.283185482025146484375;
            float _1469 = cos(_1467);
            _1465 = _1469;
        }
        float _1471 = _1465;
        float _1473 = 1.0 / _1453;
        if (_1421)
        {
            float _1475 = _1471 + (-1.0);
            _454 = _1475;
        }
        float _1477 = _454;
        float _1479 = fma(_283, -0.5, 0.5);
        float _1481 = _1477;
        if (_1421)
        {
            float _1483 = _1477 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _1481 = _1483;
        }
        float _1485 = _1481;
        float _1487 = sqrt(_1479);
        float _1489 = _1457 * _1473;
        if (_1421)
        {
            float _1491 = fma(_1399, _1471, _1485);
            _1443 = _1491;
        }
        float _1493 = _1443;
        float _1495 = abs(_1391);
        bool _1497 = _1495 > 0.00999999977648258209228515625;
        float _1499 = -_1493;
        float _1501 = fma(_1399, 2.0, _1499);
        float _1503 = log2(_1489);
        float _1505 = fma(_1503, _1459, 100.0);
        float _1507 = fma(_1356, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _1509 = _1429 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _1511 = _1497 ? _1391 : 0.00999999977648258209228515625;
        float _1513 = _1367 * _1393;
        float _1515 = _1507 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _1517 = exp2(_1509);
        float _1519 = -_1515;
        float _1521 = _1501 + _1519;
        float _1523 = _1405 * _1511;
        float _1525 = fma(_1361, 0.88622701168060302734375, _1513);
        float _1527 = precise::max(0.0, _1521);
        float _1529 = precise::max(_1523, -127.0);
        float _1531 = _287 + 1.0;
        float _1533 = -_1505;
        float _1535 = _1533 + _1527;
        float _1537 = -_1529;
        float _1539 = exp2(_1537);
        float _1541 = _1405 * _1535;
        float _1543 = -_287;
        float _1545 = fma(_1517, _1531, _1543);
        float _1547 = fma(_283, 0.5, 0.5);
        float _1549 = fma(_1545, 0.5, 0.5);
        float _1551 = -_1541;
        float _1553 = exp2(_1551);
        float _1555 = fma(_1547, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _1557 = fma(_1547, _1555, -0.212114393711090087890625);
        float _1559 = 1.0 / _1529;
        float _1561 = fma(_1547, _1557, 1.570728778839111328125);
        float _1563 = _1487 * 0.636619746685028076171875;
        float _1565 = -_1539;
        float _1567 = _1565 + 1.0;
        float _1569 = -_1561;
        float _1571 = fma(_1563, _1569, 1.0);
        float _1573 = _1553 * _1567;
        float3 _4933 = float3(_1352, _1354, float(2));
        float3 _4935 = select(_4933, float3(0.0), isnan(_4933));
        float4 _1575 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4935.xy, uint(rint(_4935.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4935.xy, uint(rint(_4935.z)), level(0.0)).xyzw;
        float _1577 = _1575.x;
        float _1579 = _1575.y;
        float _1581 = _1575.z;
        float _1583 = _1575.w;
        float _1585 = _1573 * _1559;
        float3 _4953 = float3(_1352, _1354, float(3));
        float3 _4955 = select(_4953, float3(0.0), isnan(_4953));
        float4 _1587 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4955.xy, uint(rint(_4955.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4955.xy, uint(rint(_4955.z)), level(0.0)).xyzw;
        float _1589 = _1587.x;
        float _1591 = _1587.y;
        float _1593 = _1587.z;
        float _1595 = _1587.w;
        float3 _4970 = float3(_1352, _1354, float(4));
        float3 _4972 = select(_4970, float3(0.0), isnan(_4970));
        float4 _1597 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4972.xy, uint(rint(_4972.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4972.xy, uint(rint(_4972.z)), level(0.0)).xyzw;
        float _1599 = _1597.x;
        float _1601 = _1597.y;
        float _1603 = _1597.z;
        float _1605 = _1597.w;
        float2 _4986 = float2(_1352, _1354);
        float _1607 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_4986, float2(0.0), isnan(_4986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_4986, float2(0.0), isnan(_4986)), level(0.0)).z;
        float3 _4995 = float3(_1352, _1354, float(6));
        float3 _4997 = select(_4995, float3(0.0), isnan(_4995));
        float4 _1609 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _4997.xy, uint(rint(_4997.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _4997.xy, uint(rint(_4997.z)), level(0.0)).xyzw;
        float _1611 = _1609.x;
        float _1613 = _1609.y;
        float _1615 = _1609.z;
        float _1617 = _1609.w;
        float _1619 = _1373 * _1393;
        float _1621 = fma(_1375, _1411, _1525);
        float _1623 = _1371 * _1393;
        float _1625 = fma(_1365, 0.88622701168060302734375, _1619);
        float _1627 = fma(_1363, 0.88622701168060302734375, _1623);
        float3 _5029 = float3(_1352, _1354, float(7));
        float3 _5031 = select(_5029, float3(0.0), isnan(_5029));
        float4 _1629 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _5031.xy, uint(rint(_5031.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _5031.xy, uint(rint(_5031.z)), level(0.0)).xyzw;
        float _1631 = _1629.x;
        float _1633 = _1629.y;
        float _1635 = _1629.z;
        float _1637 = _1629.w;
        float3 _5047 = float3(_1352, _1354, float(5));
        float3 _5049 = select(_5047, float3(0.0), isnan(_5047));
        float4 _1639 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _5049.xy, uint(rint(_5049.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _5049.xy, uint(rint(_5049.z)), level(0.0)).xyzw;
        float _1641 = _1639.x;
        float _1643 = _1639.y;
        float _1645 = _1639.z;
        float _1647 = _1639.w;
        float2 _5063 = float2(_1571, _1549);
        float3 _1651 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).xyz;
        float _1653 = _1651.x;
        float _1655 = _1651.y;
        float _1657 = _1651.z;
        float _1659 = fma(_1377, _1411, _1627);
        float _1661 = _153 * 1.02332699298858642578125;
        float _1663 = _1429 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _1665 = _1463 * 0.5;
        bool _1667 = as_type<int>(_99) != 0;
        float _1669 = exp2(_1663);
        float _1671 = fma(_1579, _1661, _1621);
        float _1673 = fma(_1581, _1661, _1659);
        float _1675 = _1595 * _1393;
        float _1677 = fma(_1577, _1411, _1625);
        float _1679 = precise::max(0.0, _1671);
        float _1681 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _1683 = fma(_1589, 0.88622701168060302734375, _1675);
        float _1685 = precise::max(0.0, _1673);
        float _1687 = fma(_1583, _1661, _1677);
        float _1689 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _1691 = _1679 * _1681;
        float _1693 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _1695 = _1599 * _1393;
        float _1697 = _1685 * _1689;
        float _1699 = fma(_1591, 0.88622701168060302734375, _1695);
        float _1701 = precise::max(0.0, _1687);
        float _1703 = _1601 * _1393;
        float _1705 = fma(_1603, _1411, _1683);
        float _1707 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _1709 = _1607 * 2.0;
        float _1711 = _1701 * _1693;
        float _1713 = fma(_1607, _1607, 1.0);
        float _1715 = fma(_1593, 0.88622701168060302734375, _1703);
        float _1717 = _1613 * _1393;
        float _1719 = log2(_1707);
        float _1721 = -_1709;
        float _1723 = fma(_283, _1721, _1713);
        float _1725 = -_1709;
        float _1727 = _1713 + _1725;
        float _1729 = fma(_1611, 0.88622701168060302734375, _1717);
        float _1731 = _1633 * _1393;
        float _1733 = fma(_1605, _1411, _1699);
        float _1735 = fma(_1643, _1661, _1705);
        float _1737 = fma(_1615, _1411, _1729);
        float _1739 = abs(_1723);
        float _1741 = log2(_1739);
        float _1743 = fma(_1631, 0.88622701168060302734375, _1731);
        float _1745 = fma(_1641, _1411, _1715);
        float _1747 = fma(_1617, _1661, _1737);
        float _1749 = fma(_1645, _1661, _1733);
        float _1751 = fma(_1635, _1411, _1743);
        float _1753 = fma(_1647, _1661, _1745);
        float _1755 = _1747 * 0.31830990314483642578125;
        float _1757 = precise::clamp(_1755, 0.0, 1.0);
        float _1759 = abs(_1727);
        float _1761 = log2(_1759);
        float _1763 = _1719 * (-0.0199999995529651641845703125);
        float _1765 = fma(_1637, _1661, _1751);
        float _1767 = precise::max(0.0, _1735);
        float _1769 = -_1607;
        float _1771 = fma(_1769, _1607, 1.0);
        float _1773 = _378 * _1763;
        float _1775 = precise::min(_1757, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1777 = _1765 * 0.31830990314483642578125;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        float _1781 = 1.0 / _378;
        float _1783 = _1585 * _1773;
        float _1785 = _1741 * 1.5;
        float _1787 = _1775 * 0.88622701168060302734375;
        float _1789 = precise::max(0.0, _1749);
        float _1791 = _1779 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = precise::max(0.0, _1753);
        float _1797 = fma(_1787, (*spvDescriptorSet0.cp_c3)._m0[9].x, _1691);
        float _1799 = _1761 * 1.5;
        float _1801 = exp2(_1785);
        float _1803 = fma(_1787, (*spvDescriptorSet0.cp_c3)._m0[9].y, _1697);
        float _1805 = fma(_1787, (*spvDescriptorSet0.cp_c3)._m0[9].z, _1711);
        float _1807 = fma(_1767, _1793, _1797);
        float _1809 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _1811 = _1401 + _1809;
        float _1813 = fma(_1789, _1793, _1803);
        float _1815 = fma(_1795, _1793, _1805);
        float _1817 = _1665 * _1655;
        float _1819 = exp2(_1799);
        float _1821 = _1811 * _1781;
        float _1823 = precise::clamp(_1821, 0.0, 1.0);
        float _1825 = -_1669;
        float _1827 = _1825 + 1.0;
        float _1829 = _378 * _1665;
        float _1831 = _1665 * _1653;
        float _1833 = _1783 * _1823;
        float _1835 = _1665 * _1657;
        int _1837 = _293 + as_type<int>(_99);
        float _1839 = _1801 * 12.56637096405029296875;
        float _1841 = _1827 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _1843 = _1793;
        float _1845 = _1811;
        if (_1667)
        {
            _1843 = as_type<float>(_326);
        }
        int _1847 = as_type<int>(_1843);
        int _1849 = _1837 << 2;
        int _1851 = _1849 + 1024;
        uint _1853 = uint(int(uint(_1851) >> uint(2)));
        _26[int(_1853)] = as_type<uint>(_1829);
        float _1855 = 1.0 / _1839;
        float _1857 = _1819 * 12.56637096405029296875;
        int _1859 = _1837 << 4;
        uint _1861 = uint(int(uint(_1859) >> uint(2)));
        _26[int(_1861)] = as_type<uint>(_1831);
        int _1863 = _1859 + 4;
        uint _1865 = uint(int(uint(_1863) >> uint(2)));
        _26[int(_1865)] = as_type<uint>(_1817);
        int _1867 = _1859 + 8;
        uint _1869 = uint(int(uint(_1867) >> uint(2)));
        _26[int(_1869)] = as_type<uint>(_1835);
        int _1871 = _1859 + 12;
        uint _1873 = uint(int(uint(_1871) >> uint(2)));
        _26[int(_1873)] = as_type<uint>(_1841);
        float _1875 = 1.0 / _1857;
        float _1877 = _1771 * _1855;
        float _1879 = _1665 * _1877;
        float _1881 = _1771 * _1875;
        float _1883 = _1807 * _1881;
        float _1885 = _1813 * _1881;
        float _1887 = _1815 * _1881;
        float _1889 = fma(_1879, (*spvDescriptorSet0.cp_c3)._m0[7].x, _1883);
        float _1891 = fma(_1879, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1885);
        float _1893 = fma(_1879, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1887);
        float _1895 = _1885;
        float _1897 = _1887;
        float _1899 = _1883;
        int _1901 = _1847;
        if (_1667)
        {
            _1895 = as_type<float>(_328);
        }
        int _1903 = as_type<int>(_1895);
        float _1905 = _1889 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _1907 = _1891 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _1909 = _1893 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _1911 = _1903;
        if (_1667)
        {
            _1897 = _330;
        }
        float _1913 = _1897;
        float _1915 = _1913;
        float _1917 = _1913;
        if (_1667)
        {
            _1899 = as_type<float>(_332);
        }
        int _1919 = as_type<int>(_1899);
        int _1921 = _1837 << 4;
        int _1923 = _1921 + 1280;
        uint _1925 = uint(int(uint(_1923) >> uint(2)));
        _26[int(_1925)] = as_type<uint>(_1905);
        int _1927 = _1921 + 1284;
        uint _1929 = uint(int(uint(_1927) >> uint(2)));
        _26[int(_1929)] = as_type<uint>(_1907);
        int _1931 = _1921 + 1288;
        uint _1933 = uint(int(uint(_1931) >> uint(2)));
        _26[int(_1933)] = as_type<uint>(_1909);
        int _1935 = _1921 + 1292;
        uint _1937 = uint(int(uint(_1935) >> uint(2)));
        _26[int(_1937)] = as_type<uint>(_1833);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1939 = _1919;
        if (!_1667)
        {
            int _1941 = _293 << 4;
            int _1943 = _1941 + 1280;
            uint _1945 = uint(int(uint(_1943) >> uint(2)));
            float _1947 = as_type<float>(_26[int(_1945)]);
            int _1949 = _1941 + 1284;
            uint _1951 = uint(int(uint(_1949) >> uint(2)));
            float _1953 = as_type<float>(_26[int(_1951)]);
            int _1955 = _1941 + 1288;
            uint _1957 = uint(int(uint(_1955) >> uint(2)));
            float _1959 = as_type<float>(_26[int(_1957)]);
            int _1961 = _1941 + 1292;
            uint _1963 = uint(int(uint(_1961) >> uint(2)));
            float _1965 = as_type<float>(_26[int(_1963)]);
            int _1967 = _293 << 4;
            int _1969 = _1967 + 1296;
            uint _1971 = uint(int(uint(_1969) >> uint(2)));
            float _1973 = as_type<float>(_26[int(_1971)]);
            int _1975 = _1967 + 1300;
            uint _1977 = uint(int(uint(_1975) >> uint(2)));
            float _1979 = as_type<float>(_26[int(_1977)]);
            int _1981 = _1967 + 1304;
            uint _1983 = uint(int(uint(_1981) >> uint(2)));
            float _1985 = as_type<float>(_26[int(_1983)]);
            int _1987 = _1967 + 1308;
            uint _1989 = uint(int(uint(_1987) >> uint(2)));
            float _1991 = as_type<float>(_26[int(_1989)]);
            int _1993 = _293 << 4;
            uint _1995 = uint(int(uint(_1993) >> uint(2)));
            float _1997 = as_type<float>(_26[int(_1995)]);
            int _1999 = _1993 + 4;
            uint _2001 = uint(int(uint(_1999) >> uint(2)));
            float _2003 = as_type<float>(_26[int(_2001)]);
            int _2005 = _1993 + 8;
            uint _2007 = uint(int(uint(_2005) >> uint(2)));
            float _2009 = as_type<float>(_26[int(_2007)]);
            int _2011 = _1993 + 12;
            uint _2013 = uint(int(uint(_2011) >> uint(2)));
            float _2015 = as_type<float>(_26[int(_2013)]);
            int _2017 = _293 << 4;
            int _2019 = _2017 + 16;
            uint _2021 = uint(int(uint(_2019) >> uint(2)));
            float _2023 = as_type<float>(_26[int(_2021)]);
            int _2025 = _2017 + 20;
            uint _2027 = uint(int(uint(_2025) >> uint(2)));
            float _2029 = as_type<float>(_26[int(_2027)]);
            int _2031 = _2017 + 24;
            uint _2033 = uint(int(uint(_2031) >> uint(2)));
            float _2035 = as_type<float>(_26[int(_2033)]);
            int _2037 = _2017 + 28;
            uint _2039 = uint(int(uint(_2037) >> uint(2)));
            float _2041 = as_type<float>(_26[int(_2039)]);
            int _2043 = _293 << 4;
            int _2045 = _2043 + 1312;
            uint _2047 = uint(int(uint(_2045) >> uint(2)));
            float _2049 = as_type<float>(_26[int(_2047)]);
            int _2051 = _2043 + 1316;
            uint _2053 = uint(int(uint(_2051) >> uint(2)));
            float _2055 = as_type<float>(_26[int(_2053)]);
            int _2057 = _2043 + 1320;
            uint _2059 = uint(int(uint(_2057) >> uint(2)));
            float _2061 = as_type<float>(_26[int(_2059)]);
            int _2063 = _2043 + 1324;
            uint _2065 = uint(int(uint(_2063) >> uint(2)));
            float _2067 = as_type<float>(_26[int(_2065)]);
            int _2069 = _293 << 4;
            int _2071 = _2069 + 1328;
            uint _2073 = uint(int(uint(_2071) >> uint(2)));
            float _2075 = as_type<float>(_26[int(_2073)]);
            int _2077 = _2069 + 1332;
            uint _2079 = uint(int(uint(_2077) >> uint(2)));
            float _2081 = as_type<float>(_26[int(_2079)]);
            int _2083 = _2069 + 1336;
            uint _2085 = uint(int(uint(_2083) >> uint(2)));
            float _2087 = as_type<float>(_26[int(_2085)]);
            int _2089 = _2069 + 1340;
            uint _2091 = uint(int(uint(_2089) >> uint(2)));
            float _2093 = as_type<float>(_26[int(_2091)]);
            float _2095 = as_type<float>(_332) + _1965;
            float _2097 = -_2095;
            float _2099 = exp2(_2097);
            float _2101 = _2095 + _1991;
            float _2103 = -_1947;
            float _2105 = _2103 + _1997;
            float _2107 = -_1953;
            float _2109 = _2107 + _2003;
            float _2111 = -_1959;
            float _2113 = _2111 + _2009;
            float _2115 = -_2101;
            float _2117 = exp2(_2115);
            float _2119 = -_1979;
            float _2121 = _2119 + _2029;
            float _2123 = -_1985;
            float _2125 = _2123 + _2035;
            float _2127 = -_1973;
            float _2129 = _2127 + _2023;
            float _2131 = _2101 + _2067;
            float _2133 = -_2099;
            float _2135 = _2133 + 1.0;
            float _2137 = -_2131;
            float _2139 = exp2(_2137);
            int _2141 = _293 << 4;
            int _2143 = _2141 + 32;
            uint _2145 = uint(int(uint(_2143) >> uint(2)));
            float _2147 = as_type<float>(_26[int(_2145)]);
            int _2149 = _2141 + 36;
            uint _2151 = uint(int(uint(_2149) >> uint(2)));
            float _2153 = as_type<float>(_26[int(_2151)]);
            int _2155 = _2141 + 40;
            uint _2157 = uint(int(uint(_2155) >> uint(2)));
            float _2159 = as_type<float>(_26[int(_2157)]);
            int _2161 = _2141 + 44;
            uint _2163 = uint(int(uint(_2161) >> uint(2)));
            float _2165 = as_type<float>(_26[int(_2163)]);
            float _2167 = _2131 + _2093;
            float _2169 = precise::min(_2135, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2171 = -_2117;
            float _2173 = _2171 + 1.0;
            float _2175 = -_334;
            float _2177 = _2169 + _2175;
            float _2179 = precise::min(_2173, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2181 = _2177 * _2015;
            float _2183 = -_2139;
            float _2185 = _2183 + 1.0;
            float _2187 = _2109 * _2181;
            float _2189 = _2113 * _2181;
            float _2191 = _2105 * _2181;
            float _2193 = fma(_1953, _2177, _2187);
            float _2195 = -_2169;
            float _2197 = _2195 + _2179;
            float _2199 = fma(_1947, _2177, _2191);
            float _2201 = fma(_1959, _2177, _2189);
            float _2203 = _2193 + as_type<float>(_328);
            float _2205 = _2197 * _2041;
            int _2207 = _293 << 4;
            int _2209 = _2207 + 48;
            uint _2211 = uint(int(uint(_2209) >> uint(2)));
            float _2213 = as_type<float>(_26[int(_2211)]);
            int _2215 = _2207 + 52;
            uint _2217 = uint(int(uint(_2215) >> uint(2)));
            float _2219 = as_type<float>(_26[int(_2217)]);
            int _2221 = _2207 + 56;
            uint _2223 = uint(int(uint(_2221) >> uint(2)));
            float _2225 = as_type<float>(_26[int(_2223)]);
            int _2227 = _2207 + 60;
            uint _2229 = uint(int(uint(_2227) >> uint(2)));
            float _2231 = as_type<float>(_26[int(_2229)]);
            float _2233 = _2199 + as_type<float>(_326);
            float _2235 = _2201 + _330;
            float _2237 = _2121 * _2205;
            float _2239 = _2125 * _2205;
            int _2241 = _293 << 2;
            int _2243 = _2241 + 1024;
            uint _2245 = uint(int(uint(_2243) >> uint(2)));
            float _2247 = as_type<float>(_26[int(_2245)]);
            float _2249 = _2129 * _2205;
            float _2251 = fma(_1979, _2197, _2237);
            float _2253 = precise::min(_2185, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _2255 = _293 << 2;
            int _2257 = _2255 + 1028;
            uint _2259 = uint(int(uint(_2257) >> uint(2)));
            float _2261 = as_type<float>(_26[int(_2259)]);
            float _2263 = fma(_1973, _2197, _2249);
            float _2265 = fma(_1985, _2197, _2239);
            float _2267 = -_2167;
            float _2269 = exp2(_2267);
            int _2271 = _293 << 2;
            int _2273 = _2271 + 1032;
            uint _2275 = uint(int(uint(_2273) >> uint(2)));
            float _2277 = as_type<float>(_26[int(_2275)]);
            float _2279 = -_2049;
            float _2281 = _2279 + _2147;
            float _2283 = -_2179;
            float _2285 = _2283 + _2253;
            float _2287 = -_2055;
            float _2289 = _2287 + _2153;
            int _2291 = _293 << 2;
            int _2293 = _2291 + 1036;
            uint _2295 = uint(int(uint(_2293) >> uint(2)));
            float _2297 = as_type<float>(_26[int(_2295)]);
            float _2299 = -_2061;
            float _2301 = _2299 + _2159;
            float _2303 = _2285 * _2165;
            float _2305 = _2235 + _2265;
            int _2307 = _293 << 4;
            int _2309 = _2307 + 1280;
            uint _2311 = uint(int(uint(_2309) >> uint(2)));
            _26[int(_2311)] = as_type<uint>(_2233);
            int _2313 = _2307 + 1284;
            uint _2315 = uint(int(uint(_2313) >> uint(2)));
            _26[int(_2315)] = as_type<uint>(_2203);
            int _2317 = _2307 + 1288;
            uint _2319 = uint(int(uint(_2317) >> uint(2)));
            _26[int(_2319)] = as_type<uint>(_2235);
            int _2321 = _2307 + 1292;
            uint _2323 = uint(int(uint(_2321) >> uint(2)));
            _26[int(_2323)] = as_type<uint>(_2095);
            float _2325 = _2289 * _2303;
            float _2327 = _2281 * _2303;
            float _2329 = _2301 * _2303;
            float _2331 = fma(_2055, _2285, _2325);
            float _2333 = -_2269;
            float _2335 = _2333 + 1.0;
            float _2337 = fma(_2049, _2285, _2327);
            float _2339 = fma(_2061, _2285, _2329);
            float _2341 = _2233 + _2263;
            float _2343 = _2203 + _2251;
            float _2345 = precise::min(_2335, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2347 = _2305 + _2339;
            float _2349 = _2341 + _2337;
            float _2351 = _2343 + _2331;
            int _2353 = _293 << 4;
            int _2355 = _2353 + 1296;
            uint _2357 = uint(int(uint(_2355) >> uint(2)));
            _26[int(_2357)] = as_type<uint>(_2341);
            int _2359 = _2353 + 1300;
            uint _2361 = uint(int(uint(_2359) >> uint(2)));
            _26[int(_2361)] = as_type<uint>(_2343);
            int _2363 = _2353 + 1304;
            uint _2365 = uint(int(uint(_2363) >> uint(2)));
            _26[int(_2365)] = as_type<uint>(_2305);
            int _2367 = _2353 + 1308;
            uint _2369 = uint(int(uint(_2367) >> uint(2)));
            _26[int(_2369)] = as_type<uint>(_2101);
            float _2371 = -_2253;
            float _2373 = _2345 + _2371;
            float _2375 = -_2075;
            float _2377 = _2375 + _2213;
            float _2379 = -_2081;
            float _2381 = _2379 + _2219;
            float _2383 = _2373 * _2231;
            float _2385 = -_2087;
            float _2387 = _2385 + _2225;
            int _2389 = _293 << 4;
            int _2391 = _2389 + 1312;
            uint _2393 = uint(int(uint(_2391) >> uint(2)));
            _26[int(_2393)] = as_type<uint>(_2349);
            int _2395 = _2389 + 1316;
            uint _2397 = uint(int(uint(_2395) >> uint(2)));
            _26[int(_2397)] = as_type<uint>(_2351);
            int _2399 = _2389 + 1320;
            uint _2401 = uint(int(uint(_2399) >> uint(2)));
            _26[int(_2401)] = as_type<uint>(_2347);
            int _2403 = _2389 + 1324;
            uint _2405 = uint(int(uint(_2403) >> uint(2)));
            _26[int(_2405)] = as_type<uint>(_2131);
            float _2407 = _2247 + _336;
            float _2409 = _2377 * _2383;
            float _2411 = _2381 * _2383;
            float _2413 = _2387 * _2383;
            float _2415 = _2407 + _2261;
            float _2417 = fma(_2075, _2373, _2409);
            float _2419 = fma(_2081, _2373, _2411);
            float _2421 = fma(_2087, _2373, _2413);
            float _2423 = _2415 + _2277;
            float _2425 = _2417 + _2349;
            float _2427 = _2419 + _2351;
            float _2429 = _2421 + _2347;
            float _2431 = _2423 + _2297;
            int _2433 = _293 << 2;
            int _2435 = _2433 + 1024;
            uint _2437 = uint(int(uint(_2435) >> uint(2)));
            _26[int(_2437)] = as_type<uint>(_2407);
            int _2439 = _293 << 2;
            int _2441 = _2439 + 1028;
            uint _2443 = uint(int(uint(_2441) >> uint(2)));
            _26[int(_2443)] = as_type<uint>(_2415);
            int _2445 = _293 << 2;
            int _2447 = _2445 + 1032;
            uint _2449 = uint(int(uint(_2447) >> uint(2)));
            _26[int(_2449)] = as_type<uint>(_2423);
            int _2451 = _293 << 2;
            int _2453 = _2451 + 1036;
            uint _2455 = uint(int(uint(_2453) >> uint(2)));
            _26[int(_2455)] = as_type<uint>(_2431);
            int _2457 = _293 << 4;
            int _2459 = _2457 + 1328;
            uint _2461 = uint(int(uint(_2459) >> uint(2)));
            _26[int(_2461)] = as_type<uint>(_2425);
            int _2463 = _2457 + 1332;
            uint _2465 = uint(int(uint(_2463) >> uint(2)));
            _26[int(_2465)] = as_type<uint>(_2427);
            int _2467 = _2457 + 1336;
            uint _2469 = uint(int(uint(_2467) >> uint(2)));
            _26[int(_2469)] = as_type<uint>(_2429);
            int _2471 = _2457 + 1340;
            uint _2473 = uint(int(uint(_2471) >> uint(2)));
            _26[int(_2473)] = as_type<uint>(_2167);
            _1915 = _2429;
            _1845 = _2381;
            _456 = _2345;
            _458 = _2431;
            _1901 = as_type<int>(_2425);
            _1911 = as_type<int>(_2427);
            _1917 = _2429;
            _1939 = as_type<int>(_2167);
        }
        float _2475 = _1915;
        float _2477 = _1845;
        float _2479 = _456;
        float _2481 = _458;
        int _2483 = _1901;
        int _2485 = _1911;
        float _2487 = _1917;
        int _2489 = _1939;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _2491 = _1837 << 4;
        int _2493 = _2491 + 1280;
        uint _2495 = uint(int(uint(_2493) >> uint(2)));
        float _2497 = as_type<float>(_26[int(_2495)]);
        int _2499 = _2491 + 1284;
        uint _2501 = uint(int(uint(_2499) >> uint(2)));
        float _2503 = as_type<float>(_26[int(_2501)]);
        int _2505 = _2491 + 1288;
        uint _2507 = uint(int(uint(_2505) >> uint(2)));
        float _2509 = as_type<float>(_26[int(_2507)]);
        int _2511 = _2491 + 1292;
        uint _2513 = uint(int(uint(_2511) >> uint(2)));
        float _2515 = as_type<float>(_26[int(_2513)]);
        float _2517 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _2519 = _1401 + _2517;
        float _2521 = 1.0 / _1401;
        int _2523 = _1837 << 2;
        int _2525 = _2523 + 1024;
        uint _2527 = uint(int(uint(_2525) >> uint(2)));
        float _2529 = as_type<float>(_26[int(_2527)]);
        float _2531 = _2519 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _2533 = precise::clamp(_2531, 0.0, 1.0);
        float _2535 = abs(_2533);
        float _2537 = log2(_2535);
        float _2539 = _2537 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _2541 = exp2(_2539);
        float _2543 = -_2515;
        float _2545 = exp2(_2543);
        float _2547 = _2541 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _2549 = precise::max(_2545, _291);
        float _2551 = -_2549;
        float _2553 = _2551 + 1.0;
        float _2555 = -_2547;
        float _2557 = _2555 + 1.0;
        float _2559 = 1.0 / _2553;
        bool _2561 = _2557 > _2553;
        bool _2563 = isnan(_2557);
        bool _2565 = _2561 || _2563;
        bool _2567 = isnan(_2553);
        bool _2569 = _2565 || _2567;
        float _2571 = _2557 * _2559;
        float _2573 = _2529 * _2521;
        bool _2575 = !_2569;
        float _2577 = _2575 ? _2571 : 1.0;
        float _2579 = _2497 * _2577;
        float _2581 = _2503 * _2577;
        float _2583 = _2509 * _2577;
        float _2585 = fma(_2553, _2577, _2547);
        float _2587 = precise::clamp(_2585, 0.0, 1.0);
        float _2589 = fma(_2547, (*spvDescriptorSet0.cp_c3)._m0[14].x, _2579);
        float _2591 = fma(_2547, (*spvDescriptorSet0.cp_c3)._m0[14].y, _2581);
        float _2593 = fma(_2547, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2583);
        float _2595 = -_2587;
        float _2597 = _2595 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_2589, _2591, _2593, _2597), uint3(int3(_81, _77, int(_316))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_2573, _2573, _2573, _2573), uint3(int3(_81, _77, int(_316))));
        int _2599 = int(_316) + 4;
        bool _2601 = uint(_2599) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _296 = uint(_2599);
        _275 = _2475;
        _298 = _2547;
        _300 = _2579;
        _302 = _2477;
        _304 = _2483;
        _306 = _2485;
        _308 = _2487;
        _310 = _2489;
        _312 = _2479;
        _314 = _2481;
        if (_2601)
        {
            _2603 = true;
            if (_2603)
            {
                break;
            }
        }
    } while (true);
    _2603 = false;
}

