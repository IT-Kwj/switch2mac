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
    bool _2527 = false;
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
    int _298 = 0;
    int _300 = 0;
    int _302 = 0;
    int _304 = 0;
    float _306 = 0.0;
    float _308 = 0.0;
    do
    {
        uint _310 = _286;
        float _312 = _288;
        float _314 = _290;
        float _316 = _292;
        float _318 = _294;
        float _320 = _296;
        int _322 = _298;
        int _324 = _300;
        int _326 = _302;
        int _328 = _304;
        float _330 = _306;
        float _332 = _308;
        float _334 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _336 = log2(_334);
        float _338 = float(_310);
        float _340 = _265 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _342 = int(_310) + 1;
        float _344 = float(uint(_342));
        float _346 = _336 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _348 = _338 * _346;
        float _350 = _344 * _346;
        float _352 = exp2(_348);
        float _354 = exp2(_350);
        float _356 = _352 + (-1.0);
        float _358 = _356 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _360 = _354 + (-1.0);
        float _362 = _358 * _340;
        float _364 = -_358;
        float _366 = fma(_360, (*spvDescriptorSet0.cp_c3)._m0[8].z, _364);
        float _368 = fma(_149, _362, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _370 = fma(_153, _362, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _372 = _265 * _366;
        float _374 = _372 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _376 = _374 * 0.5;
        float _378 = _362 + _376;
        float _380 = fma(_151, _362, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _382 = fma(_149, _376, _368);
        float _384 = fma(_153, _376, _370);
        float _386 = -_275;
        float _388 = _378 * _386;
        float _390 = fma(_151, _376, _380);
        float _392 = -_388;
        float _394 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _396 = _392 + _394;
        float _398 = -_388;
        float _400 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _402 = _398 + _400;
        float _404 = fma(_388, (*spvDescriptorSet0.cp_c4)._m0[2].x, _382);
        float _406 = fma(_388, (*spvDescriptorSet0.cp_c4)._m0[2].y, _384);
        float _408 = _396 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _410 = precise::clamp(_408, 0.0, 1.0);
        float _412 = _402 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _414 = precise::clamp(_412, 0.0, 1.0);
        float _416 = fma(_388, (*spvDescriptorSet0.cp_c4)._m0[2].z, _390);
        bool _418 = _410 != 1.0;
        bool _420 = isnan(_410);
        bool _422 = _418 || _420;
        bool _424 = isnan(1.0);
        bool _426 = _422 || _424;
        bool _428 = _414 != 1.0;
        bool _430 = isnan(_414);
        bool _432 = _428 || _430;
        bool _434 = isnan(1.0);
        bool _436 = _432 || _434;
        float _438 = _312;
        float _440 = _314;
        float _442 = _316;
        float _444 = _318;
        float _446 = _320;
        float _448 = _370;
        float _450 = _330;
        float _452 = _332;
        if (!_426)
        {
            _438 = 1.0;
        }
        float _454 = _438;
        bool _456 = !_426;
        float _458 = _454;
        if (!_456)
        {
            float _460 = -_388;
            bool _462 = _460 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _464 = -_388;
            bool _466 = _464 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _468 = !_462;
            int _470 = _468 ? 0 : 1;
            int _472 = 2;
            if (!_462)
            {
                _472 = 1;
            }
            int _474 = _472;
            int _476 = _474;
            if (!_466)
            {
                _476 = _470;
            }
            int _478 = _476;
            int _480 = _478 << 6;
            float _482 = float(_478);
            int _484 = _480 + 304;
            uint _486 = uint(int(uint(_484) >> uint(2)));
            uint _488 = uint(int(uint(int(_486)) >> uint(2)));
            int _490 = int(_486) & 3;
            float _492 = (*spvDescriptorSet0.cp_c3)._m0[int(_488)][_490];
            int _494 = int(_486) + 1;
            uint _496 = uint(int(uint(_494) >> uint(2)));
            int _498 = _494 & 3;
            float _500 = (*spvDescriptorSet0.cp_c3)._m0[int(_496)][_498];
            int _502 = _480 + 312;
            uint _504 = uint(int(uint(_502) >> uint(2)));
            uint _506 = uint(int(uint(int(_504)) >> uint(2)));
            int _508 = int(_504) & 3;
            float _510 = (*spvDescriptorSet0.cp_c3)._m0[int(_506)][_508];
            int _512 = int(_504) + 1;
            uint _514 = uint(int(uint(_512) >> uint(2)));
            int _516 = _512 & 3;
            float _518 = (*spvDescriptorSet0.cp_c3)._m0[int(_514)][_516];
            int _520 = _480 + 256;
            uint _522 = uint(int(uint(_520) >> uint(2)));
            uint _524 = uint(int(uint(int(_522)) >> uint(2)));
            int _526 = int(_522) & 3;
            float _528 = (*spvDescriptorSet0.cp_c3)._m0[int(_524)][_526];
            int _530 = int(_522) + 1;
            uint _532 = uint(int(uint(_530) >> uint(2)));
            int _534 = _530 & 3;
            float _536 = (*spvDescriptorSet0.cp_c3)._m0[int(_532)][_534];
            int _538 = _480 + 272;
            uint _540 = uint(int(uint(_538) >> uint(2)));
            uint _542 = uint(int(uint(int(_540)) >> uint(2)));
            int _544 = int(_540) & 3;
            float _546 = (*spvDescriptorSet0.cp_c3)._m0[int(_542)][_544];
            int _548 = int(_540) + 1;
            uint _550 = uint(int(uint(_548) >> uint(2)));
            int _552 = _548 & 3;
            float _554 = (*spvDescriptorSet0.cp_c3)._m0[int(_550)][_552];
            int _556 = _480 + 288;
            uint _558 = uint(int(uint(_556) >> uint(2)));
            uint _560 = uint(int(uint(int(_558)) >> uint(2)));
            int _562 = int(_558) & 3;
            float _564 = (*spvDescriptorSet0.cp_c3)._m0[int(_560)][_562];
            int _566 = int(_558) + 1;
            uint _568 = uint(int(uint(_566) >> uint(2)));
            int _570 = _566 & 3;
            float _572 = (*spvDescriptorSet0.cp_c3)._m0[int(_568)][_570];
            int _574 = _480 + 264;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            uint _578 = uint(int(uint(int(_576)) >> uint(2)));
            int _580 = int(_576) & 3;
            float _582 = (*spvDescriptorSet0.cp_c3)._m0[int(_578)][_580];
            int _584 = int(_576) + 1;
            uint _586 = uint(int(uint(_584) >> uint(2)));
            int _588 = _584 & 3;
            float _590 = (*spvDescriptorSet0.cp_c3)._m0[int(_586)][_588];
            int _592 = _480 + 280;
            uint _594 = uint(int(uint(_592) >> uint(2)));
            uint _596 = uint(int(uint(int(_594)) >> uint(2)));
            int _598 = int(_594) & 3;
            float _600 = (*spvDescriptorSet0.cp_c3)._m0[int(_596)][_598];
            int _602 = int(_594) + 1;
            uint _604 = uint(int(uint(_602) >> uint(2)));
            int _606 = _602 & 3;
            float _608 = (*spvDescriptorSet0.cp_c3)._m0[int(_604)][_606];
            float _610 = _406 * _500;
            float _612 = fma(_404, _492, _610);
            int _614 = _480 + 296;
            uint _616 = uint(int(uint(_614) >> uint(2)));
            uint _618 = uint(int(uint(int(_616)) >> uint(2)));
            int _620 = int(_616) & 3;
            float _622 = (*spvDescriptorSet0.cp_c3)._m0[int(_618)][_620];
            int _624 = int(_616) + 1;
            uint _626 = uint(int(uint(_624) >> uint(2)));
            int _628 = _624 & 3;
            float _630 = (*spvDescriptorSet0.cp_c3)._m0[int(_626)][_628];
            float _632 = fma(_416, _510, _612);
            float _634 = _632 + _518;
            float _636 = _406 * _536;
            float _638 = 1.0 / _634;
            float _640 = fma(_404, _528, _636);
            float _642 = _406 * _554;
            float _644 = rint(_482);
            float _646 = precise::max(_644, 0.0);
            uint _648 = uint(_646);
            uint _650 = clamp(_648, 0u, 65535u);
            float _652 = fma(_404, _546, _642);
            float _654 = _406 * _572;
            float _656 = fma(_404, _564, _654);
            float _658 = fma(_416, _582, _640);
            float _660 = _658 + _590;
            float _662 = fma(_416, _600, _652);
            float _664 = _660 * _638;
            float _666 = _662 + _608;
            float _668 = fma(_416, _622, _656);
            float _670 = _666 * _638;
            float _672 = _668 + _630;
            float _674 = _672 * _638;
            float _676 = precise::clamp(_674, 0.0, 1.0);
            float3 _3460 = float3(_664, _670, float(int(_650)));
            float3 _3464 = select(_3460, float3(0.0), isnan(_3460));
            float _678 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _3464.xy, uint(rint(_3464.z)), _676, level(0.0));
            float _680 = -_678;
            float _682 = _680 + 1.0;
            float _684 = fma(_682, _410, _678);
            _458 = _684;
            _440 = _582;
            _442 = _590;
            _444 = _630;
        }
        float _686 = _458;
        float _688 = _440;
        float _690 = _442;
        float _692 = _444;
        float _694 = _688;
        float _696 = _690;
        float _698 = _692;
        if (!_436)
        {
            _446 = 1.0;
        }
        float _700 = _446;
        bool _702 = !_436;
        float _704 = _700;
        if (!_702)
        {
            float _706 = _406 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _708 = _406 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _710 = fma(_404, (*spvDescriptorSet0.cp_c3)._m0[130].x, _706);
            float _712 = fma(_404, (*spvDescriptorSet0.cp_c3)._m0[131].x, _708);
            float _714 = fma(_416, (*spvDescriptorSet0.cp_c3)._m0[130].z, _710);
            float _716 = fma(_416, (*spvDescriptorSet0.cp_c3)._m0[131].z, _712);
            float _718 = _714 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _720 = _716 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _722 = trunc(_718);
            int _724 = int(_722);
            float _726 = trunc(_720);
            int _728 = int(_726);
            int _730 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _732 = _724 + _730;
            int _734 = _732 + 1;
            bool _736 = _734 >= 0;
            int _738 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _740 = _728 + _738;
            int _742 = _740 + 1;
            bool _744 = _734 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _746 = !_736;
            bool _748 = _744 || _746;
            bool _750 = _742 < 0;
            bool _752 = _750 || _748;
            bool _754 = _742 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _756 = _754 || _752;
            float _758 = _716;
            _694 = _718;
            _696 = _720;
            if (_756)
            {
                _758 = 1.0;
            }
            float _760 = _758;
            float _762 = _760;
            if (!_756)
            {
                int _764 = _742 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _766 = _764 + _734;
                float _768 = floor(_720);
                int _770 = _766 << 2;
                uint _772 = uint(int(uint(_766) >> uint(2)));
                int _774 = 12 & _770;
                float _776 = floor(_718);
                int _778 = _766 << 4;
                int _780 = _778 + 2112;
                int _782 = int(_772) << 4;
                int _784 = _782 + _774;
                uint _786 = uint(int(uint(_780) >> uint(2)));
                uint _788 = uint(int(uint(int(_786)) >> uint(2)));
                int _790 = int(_786) & 3;
                float _792 = (*spvDescriptorSet0.cp_c3)._m0[int(_788)][_790];
                int _794 = int(_786) + 1;
                uint _796 = uint(int(uint(_794) >> uint(2)));
                int _798 = _794 & 3;
                float _800 = (*spvDescriptorSet0.cp_c3)._m0[int(_796)][_798];
                int _802 = _784 + 464;
                uint _804 = uint(int(uint(_802) >> uint(2)));
                uint _806 = uint(int(uint(int(_804)) >> uint(2)));
                int _808 = int(_804) & 3;
                float _810 = (*spvDescriptorSet0.cp_c3)._m0[int(_806)][_808];
                float _812 = -_776;
                float _814 = _812 + _718;
                int _816 = _780 + 8;
                uint _818 = uint(int(uint(_816) >> uint(2)));
                uint _820 = uint(int(uint(int(_818)) >> uint(2)));
                int _822 = int(_818) & 3;
                float _824 = (*spvDescriptorSet0.cp_c3)._m0[int(_820)][_822];
                int _826 = int(_818) + 1;
                uint _828 = uint(int(uint(_826) >> uint(2)));
                int _830 = _826 & 3;
                float _832 = (*spvDescriptorSet0.cp_c3)._m0[int(_828)][_830];
                float _834 = _406 * _800;
                float _836 = fma(_404, _792, _834);
                float _838 = rint(_810);
                float _840 = precise::max(_838, 0.0);
                uint _842 = uint(_840);
                uint _844 = clamp(_842, 0u, 65535u);
                float _846 = fma(_416, _824, _836);
                float _848 = -_768;
                float _850 = _848 + _720;
                float _852 = _846 + _832;
                float _854 = precise::clamp(_852, 0.0, 1.0);
                float3 _3745 = float3(_814, _850, float(int(_844)));
                float3 _3747 = select(_3745, float3(0.0), isnan(_3745));
                float _856 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_8).sample_compare(spvDescriptorSet0.cp_t_tcb_8Smplr, _3747.xy, uint(rint(_3747.z)), _854, level(0.0));
                _762 = _856;
            }
            float _858 = _762;
            float _860 = -_858;
            float _862 = _860 + 1.0;
            float _864 = fma(_862, _414, _858);
            _704 = _864;
        }
        float _866 = _704;
        float _868 = _694;
        float _870 = _696;
        float _872 = -_388;
        float _874 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _876 = _872 + _874;
        float _878 = -_388;
        float _880 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _882 = _878 + _880;
        float _884 = precise::min(_686, _866);
        float _886 = _876 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _888 = precise::clamp(_886, 0.0, 1.0);
        float _890 = _882 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _892 = precise::clamp(_890, 0.0, 1.0);
        float _894 = fma(_388, (*spvDescriptorSet0.cp_c4)._m0[3].x, _382);
        float _896 = fma(_388, (*spvDescriptorSet0.cp_c4)._m0[3].y, _384);
        float _898 = fma(_388, (*spvDescriptorSet0.cp_c4)._m0[3].z, _390);
        bool _900 = _888 != 1.0;
        bool _902 = isnan(_888);
        bool _904 = _900 || _902;
        bool _906 = isnan(1.0);
        bool _908 = _904 || _906;
        bool _910 = _892 != 1.0;
        bool _912 = isnan(_892);
        bool _914 = _910 || _912;
        bool _916 = isnan(1.0);
        bool _918 = _914 || _916;
        float _920 = _868;
        float _922 = _870;
        if (!_908)
        {
            _920 = 1.0;
        }
        float _924 = _920;
        bool _926 = !_908;
        float _928 = _924;
        if (!_926)
        {
            float _930 = -_388;
            bool _932 = _930 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _934 = -_388;
            bool _936 = _934 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _938 = !_932;
            int _940 = _938 ? 0 : 1;
            int _942 = 2;
            if (!_932)
            {
                _942 = 1;
            }
            int _944 = _942;
            int _946 = _944;
            if (!_936)
            {
                _946 = _940;
            }
            int _948 = _946;
            int _950 = _948 << 6;
            float _952 = float(_948);
            int _954 = _950 + 304;
            uint _956 = uint(int(uint(_954) >> uint(2)));
            uint _958 = uint(int(uint(int(_956)) >> uint(2)));
            int _960 = int(_956) & 3;
            float _962 = (*spvDescriptorSet0.cp_c3)._m0[int(_958)][_960];
            int _964 = int(_956) + 1;
            uint _966 = uint(int(uint(_964) >> uint(2)));
            int _968 = _964 & 3;
            float _970 = (*spvDescriptorSet0.cp_c3)._m0[int(_966)][_968];
            int _972 = _950 + 312;
            uint _974 = uint(int(uint(_972) >> uint(2)));
            uint _976 = uint(int(uint(int(_974)) >> uint(2)));
            int _978 = int(_974) & 3;
            float _980 = (*spvDescriptorSet0.cp_c3)._m0[int(_976)][_978];
            int _982 = int(_974) + 1;
            uint _984 = uint(int(uint(_982) >> uint(2)));
            int _986 = _982 & 3;
            float _988 = (*spvDescriptorSet0.cp_c3)._m0[int(_984)][_986];
            int _990 = _950 + 256;
            uint _992 = uint(int(uint(_990) >> uint(2)));
            uint _994 = uint(int(uint(int(_992)) >> uint(2)));
            int _996 = int(_992) & 3;
            float _998 = (*spvDescriptorSet0.cp_c3)._m0[int(_994)][_996];
            int _1000 = int(_992) + 1;
            uint _1002 = uint(int(uint(_1000) >> uint(2)));
            int _1004 = _1000 & 3;
            float _1006 = (*spvDescriptorSet0.cp_c3)._m0[int(_1002)][_1004];
            int _1008 = _950 + 272;
            uint _1010 = uint(int(uint(_1008) >> uint(2)));
            uint _1012 = uint(int(uint(int(_1010)) >> uint(2)));
            int _1014 = int(_1010) & 3;
            float _1016 = (*spvDescriptorSet0.cp_c3)._m0[int(_1012)][_1014];
            int _1018 = int(_1010) + 1;
            uint _1020 = uint(int(uint(_1018) >> uint(2)));
            int _1022 = _1018 & 3;
            float _1024 = (*spvDescriptorSet0.cp_c3)._m0[int(_1020)][_1022];
            int _1026 = _950 + 288;
            uint _1028 = uint(int(uint(_1026) >> uint(2)));
            uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
            int _1032 = int(_1028) & 3;
            float _1034 = (*spvDescriptorSet0.cp_c3)._m0[int(_1030)][_1032];
            int _1036 = int(_1028) + 1;
            uint _1038 = uint(int(uint(_1036) >> uint(2)));
            int _1040 = _1036 & 3;
            float _1042 = (*spvDescriptorSet0.cp_c3)._m0[int(_1038)][_1040];
            int _1044 = _950 + 264;
            uint _1046 = uint(int(uint(_1044) >> uint(2)));
            uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
            int _1050 = int(_1046) & 3;
            float _1052 = (*spvDescriptorSet0.cp_c3)._m0[int(_1048)][_1050];
            int _1054 = int(_1046) + 1;
            uint _1056 = uint(int(uint(_1054) >> uint(2)));
            int _1058 = _1054 & 3;
            float _1060 = (*spvDescriptorSet0.cp_c3)._m0[int(_1056)][_1058];
            int _1062 = _950 + 280;
            uint _1064 = uint(int(uint(_1062) >> uint(2)));
            uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
            int _1068 = int(_1064) & 3;
            float _1070 = (*spvDescriptorSet0.cp_c3)._m0[int(_1066)][_1068];
            int _1072 = int(_1064) + 1;
            uint _1074 = uint(int(uint(_1072) >> uint(2)));
            int _1076 = _1072 & 3;
            float _1078 = (*spvDescriptorSet0.cp_c3)._m0[int(_1074)][_1076];
            float _1080 = _896 * _970;
            float _1082 = fma(_894, _962, _1080);
            int _1084 = _950 + 296;
            uint _1086 = uint(int(uint(_1084) >> uint(2)));
            uint _1088 = uint(int(uint(int(_1086)) >> uint(2)));
            int _1090 = int(_1086) & 3;
            float _1092 = (*spvDescriptorSet0.cp_c3)._m0[int(_1088)][_1090];
            int _1094 = int(_1086) + 1;
            uint _1096 = uint(int(uint(_1094) >> uint(2)));
            int _1098 = _1094 & 3;
            float _1100 = (*spvDescriptorSet0.cp_c3)._m0[int(_1096)][_1098];
            float _1102 = fma(_898, _980, _1082);
            float _1104 = _1102 + _988;
            float _1106 = _896 * _1006;
            float _1108 = 1.0 / _1104;
            float _1110 = fma(_894, _998, _1106);
            float _1112 = _896 * _1024;
            float _1114 = rint(_952);
            float _1116 = precise::max(_1114, 0.0);
            uint _1118 = uint(_1116);
            uint _1120 = clamp(_1118, 0u, 65535u);
            float _1122 = fma(_894, _1016, _1112);
            float _1124 = _896 * _1042;
            float _1126 = fma(_894, _1034, _1124);
            float _1128 = fma(_898, _1052, _1110);
            float _1130 = _1128 + _1060;
            float _1132 = fma(_898, _1070, _1122);
            float _1134 = _1130 * _1108;
            float _1136 = _1132 + _1078;
            float _1138 = fma(_898, _1092, _1126);
            float _1140 = _1136 * _1108;
            float _1142 = _1138 + _1100;
            float _1144 = _1142 * _1108;
            float _1146 = precise::clamp(_1144, 0.0, 1.0);
            float3 _4202 = float3(_1134, _1140, float(int(_1120)));
            float3 _4204 = select(_4202, float3(0.0), isnan(_4202));
            float _1148 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _4204.xy, uint(rint(_4204.z)), _1146, level(0.0));
            float _1150 = -_1148;
            float _1152 = _1150 + 1.0;
            float _1154 = fma(_888, _1152, _1148);
            _922 = _1060;
            _928 = _1154;
            _698 = _1100;
        }
        float _1156 = _922;
        float _1158 = _928;
        float _1160 = _698;
        float _1162 = precise::min(_884, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1164 = _1156;
        if (!_918)
        {
            _1164 = 1.0;
        }
        float _1166 = _1164;
        bool _1168 = !_918;
        float _1170 = _1166;
        if (!_1168)
        {
            float _1172 = _896 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1174 = _896 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1176 = fma(_894, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1172);
            float _1178 = fma(_894, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1174);
            float _1180 = fma(_898, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1176);
            float _1182 = fma(_898, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1178);
            float _1184 = _1180 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1186 = _1182 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1188 = trunc(_1184);
            int _1190 = int(_1188);
            float _1192 = trunc(_1186);
            int _1194 = int(_1192);
            int _1196 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1198 = _1190 + _1196;
            int _1200 = _1198 + 1;
            bool _1202 = _1200 >= 0;
            int _1204 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1206 = _1194 + _1204;
            int _1208 = _1206 + 1;
            bool _1210 = _1200 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1212 = !_1202;
            bool _1214 = _1210 || _1212;
            bool _1216 = _1208 < 0;
            bool _1218 = _1216 || _1214;
            bool _1220 = _1208 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1222 = _1220 || _1218;
            float _1224 = _1182;
            if (_1222)
            {
                _1224 = 1.0;
            }
            float _1226 = _1224;
            float _1228 = _1226;
            if (!_1222)
            {
                int _1230 = _1208 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1232 = _1230 + _1200;
                float _1234 = floor(_1186);
                int _1236 = _1232 << 2;
                uint _1238 = uint(int(uint(_1232) >> uint(2)));
                int _1240 = 12 & _1236;
                float _1242 = floor(_1184);
                int _1244 = _1232 << 4;
                int _1246 = _1244 + 2112;
                int _1248 = int(_1238) << 4;
                int _1250 = _1248 + _1240;
                uint _1252 = uint(int(uint(_1246) >> uint(2)));
                uint _1254 = uint(int(uint(int(_1252)) >> uint(2)));
                int _1256 = int(_1252) & 3;
                float _1258 = (*spvDescriptorSet0.cp_c3)._m0[int(_1254)][_1256];
                int _1260 = int(_1252) + 1;
                uint _1262 = uint(int(uint(_1260) >> uint(2)));
                int _1264 = _1260 & 3;
                float _1266 = (*spvDescriptorSet0.cp_c3)._m0[int(_1262)][_1264];
                int _1268 = _1250 + 464;
                uint _1270 = uint(int(uint(_1268) >> uint(2)));
                uint _1272 = uint(int(uint(int(_1270)) >> uint(2)));
                int _1274 = int(_1270) & 3;
                float _1276 = (*spvDescriptorSet0.cp_c3)._m0[int(_1272)][_1274];
                float _1278 = -_1242;
                float _1280 = _1184 + _1278;
                int _1282 = _1246 + 8;
                uint _1284 = uint(int(uint(_1282) >> uint(2)));
                uint _1286 = uint(int(uint(int(_1284)) >> uint(2)));
                int _1288 = int(_1284) & 3;
                float _1290 = (*spvDescriptorSet0.cp_c3)._m0[int(_1286)][_1288];
                int _1292 = int(_1284) + 1;
                uint _1294 = uint(int(uint(_1292) >> uint(2)));
                int _1296 = _1292 & 3;
                float _1298 = (*spvDescriptorSet0.cp_c3)._m0[int(_1294)][_1296];
                float _1300 = _896 * _1266;
                float _1302 = fma(_894, _1258, _1300);
                float _1304 = rint(_1276);
                float _1306 = precise::max(_1304, 0.0);
                uint _1308 = uint(_1306);
                uint _1310 = clamp(_1308, 0u, 65535u);
                float _1312 = fma(_898, _1290, _1302);
                float _1314 = -_1234;
                float _1316 = _1186 + _1314;
                float _1318 = _1312 + _1298;
                float _1320 = precise::clamp(_1318, 0.0, 1.0);
                float3 _4478 = float3(_1280, _1316, float(int(_1310)));
                float3 _4480 = select(_4478, float3(0.0), isnan(_4478));
                float _1322 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_8).sample_compare(spvDescriptorSet0.cp_t_tcb_8Smplr, _4480.xy, uint(rint(_4480.z)), _1320, level(0.0));
                _1228 = _1322;
            }
            float _1324 = _1228;
            float _1326 = -_1324;
            float _1328 = _1326 + 1.0;
            float _1330 = fma(_892, _1328, _1324);
            _1170 = _1330;
        }
        float _1332 = _1170;
        float _1334 = fma(_149, _374, _368);
        float _1336 = fma(_151, _374, _380);
        float _1338 = fma(_1334, 6.2500002968590706586837768554688e-05, 0.5);
        float _1340 = fma(_1336, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _4514 = float3(_1338, _1340, float(0));
        float3 _4516 = select(_4514, float3(0.0), isnan(_4514));
        float4 _1343 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4516.xy, uint(rint(_4516.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4516.xy, uint(rint(_4516.z)), level(0.0)).xyzw;
        float _1345 = _1343.x;
        float _1347 = _1343.y;
        float _1349 = _1343.z;
        float _1351 = _1343.w;
        float3 _4531 = float3(_1338, _1340, float(1));
        float3 _4533 = select(_4531, float3(0.0), isnan(_4531));
        float4 _1353 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4533.xy, uint(rint(_4533.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4533.xy, uint(rint(_4533.z)), level(0.0)).xyzw;
        float _1355 = _1353.x;
        float _1357 = _1353.y;
        float _1359 = _1353.z;
        float _1361 = _1353.w;
        float _1363 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _1365 = _1336 + _1363;
        float _1367 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _1369 = _1334 + _1367;
        float _1371 = _358 + _366;
        float _1373 = _1365 * _1365;
        float _1375 = _153 * _374;
        float _1377 = precise::min(_1332, _1158);
        float _1379 = _265 * _1371;
        float _1381 = fma(_1369, _1369, _1373);
        float _1383 = _370 + _1375;
        float _1385 = _1379 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _1387 = abs(_1375);
        bool _1389 = _1387 > 0.00999999977648258209228515625;
        float _1391 = sqrt(_1381);
        float _1393 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _1395 = _153 * 1.02332699298858642578125;
        float _1397 = _1393 * 100.0;
        float _1399 = exp2(_1397);
        bool _1401 = _1391 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _1403 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _1405 = _1391 + _1403;
        float _1407 = fma(_1399, 512.0, -512.0);
        float _1409 = _1160;
        float _1411 = _1405;
        float _1413 = _1391;
        float _1415 = (*spvDescriptorSet0.cp_c3)._m0[11].y;
        if (_1401)
        {
            float _1417 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _1409 = _1417;
        }
        float _1419 = _1409;
        float _1421 = 1.0 / _1393;
        if (_1401)
        {
            float _1423 = _1405 * _1419;
            _1411 = _1423;
        }
        float _1425 = _1411;
        float _1427 = 1.0 / _1407;
        if (_1401)
        {
            float _1429 = _1425 * 0.15915493667125701904296875;
            _1413 = _1429;
        }
        float _1431 = _1413;
        float _1433 = _1393 * 5115.0;
        float _1435 = _1431;
        if (_1401)
        {
            float _1437 = _1431 * 6.283185482025146484375;
            float _1439 = cos(_1437);
            _1435 = _1439;
        }
        float _1441 = _1435;
        float _1443 = _1389 ? _1375 : 0.00999999977648258209228515625;
        float _1445 = _1393 * _1443;
        float _1447 = _1433 * _1427;
        float _1449 = fma(_1385, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _1451 = precise::clamp(_1449, 0.0, 1.0);
        float _1453 = precise::max(_1445, -127.0);
        float _1455 = -_1451;
        float _1457 = _1455 + 1.0;
        float _1459 = log2(_1447);
        float _1461 = _1451;
        if (!_1401)
        {
            _1461 = _1383;
        }
        float _1463 = _1461;
        float _1465 = _1463;
        if (_1401)
        {
            float _1467 = _1441 + (-1.0);
            _1415 = _1467;
        }
        float _1469 = _1415;
        if (_1401)
        {
            float _1471 = _1469 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _448 = _1471;
        }
        float _1473 = _448;
        float _1475 = abs(_1457);
        float _1477 = log2(_1475);
        if (_1401)
        {
            float _1479 = fma(_1383, _1441, _1473);
            _1465 = _1479;
        }
        float _1481 = _1465;
        float _1483 = fma(_273, -0.5, 0.5);
        float _1485 = -_1481;
        float _1487 = fma(_1383, 2.0, _1485);
        float _1489 = fma(_1459, _1421, 100.0);
        float _1491 = sqrt(_1483);
        float _1493 = -(*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _1495 = _1487 + _1493;
        float _1497 = precise::max(0.0, _1495);
        float _1499 = _1477 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _1501 = -_1453;
        float _1503 = exp2(_1501);
        float _1505 = -_1489;
        float _1507 = _1505 + _1497;
        float _1509 = _1393 * _1507;
        float _1511 = fma(_273, 0.5, 0.5);
        float _1513 = 1.0 / _1453;
        float _1515 = -_1503;
        float _1517 = _1515 + 1.0;
        float _1519 = exp2(_1499);
        float _1521 = precise::min(_1377, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1523 = fma(_1511, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _1525 = fma(_1511, _1523, -0.212114393711090087890625);
        float _1527 = _1162 + _1521;
        float _1529 = -_1509;
        float _1531 = exp2(_1529);
        float _1533 = _277 + 1.0;
        float _1535 = fma(_1511, _1525, 1.570728778839111328125);
        float _1537 = _1491 * 0.636619746685028076171875;
        float _1539 = -_1535;
        float _1541 = fma(_1537, _1539, 1.0);
        float _1543 = -_277;
        float _1545 = fma(_1519, _1533, _1543);
        float _1547 = _1531 * _1517;
        float _1549 = fma(_1545, 0.5, 0.5);
        float3 _4820 = float3(_1338, _1340, float(2));
        float3 _4822 = select(_4820, float3(0.0), isnan(_4820));
        float4 _1551 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4822.xy, uint(rint(_4822.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4822.xy, uint(rint(_4822.z)), level(0.0)).xyzw;
        float _1553 = _1551.x;
        float _1555 = _1551.y;
        float _1557 = _1551.z;
        float _1559 = _1551.w;
        float3 _4837 = float3(_1338, _1340, float(3));
        float3 _4839 = select(_4837, float3(0.0), isnan(_4837));
        float4 _1561 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4839.xy, uint(rint(_4839.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4839.xy, uint(rint(_4839.z)), level(0.0)).xyzw;
        float _1563 = _1561.x;
        float _1565 = _1561.y;
        float _1567 = _1561.z;
        float _1569 = _1561.w;
        float3 _4854 = float3(_1338, _1340, float(4));
        float3 _4856 = select(_4854, float3(0.0), isnan(_4854));
        float4 _1571 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4856.xy, uint(rint(_4856.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4856.xy, uint(rint(_4856.z)), level(0.0)).xyzw;
        float _1573 = _1571.x;
        float _1575 = _1571.y;
        float _1577 = _1571.z;
        float _1579 = _1571.w;
        float3 _4871 = float3(_1338, _1340, float(6));
        float3 _4873 = select(_4871, float3(0.0), isnan(_4871));
        float4 _1581 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4873.xy, uint(rint(_4873.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4873.xy, uint(rint(_4873.z)), level(0.0)).xyzw;
        float _1583 = _1581.x;
        float _1585 = _1581.y;
        float _1587 = _1581.z;
        float _1589 = _1581.w;
        float _1591 = _1547 * _1513;
        float _1593 = _1351 * _1395;
        float _1595 = fma(_1345, 0.88622701168060302734375, _1593);
        float _1597 = _1355 * _1395;
        float _1599 = fma(_1347, 0.88622701168060302734375, _1597);
        float3 _4905 = float3(_1338, _1340, float(7));
        float3 _4907 = select(_4905, float3(0.0), isnan(_4905));
        float4 _1601 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4907.xy, uint(rint(_4907.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4907.xy, uint(rint(_4907.z)), level(0.0)).xyzw;
        float _1603 = _1601.x;
        float _1605 = _1601.y;
        float _1607 = _1601.z;
        float _1609 = _1601.w;
        float3 _4923 = float3(_1338, _1340, float(5));
        float3 _4925 = select(_4923, float3(0.0), isnan(_4923));
        float4 _1611 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _4925.xy, uint(rint(_4925.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _4925.xy, uint(rint(_4925.z)), level(0.0)).xyzw;
        float _1613 = _1611.x;
        float _1615 = _1611.y;
        float _1617 = _1611.z;
        float _1619 = _1611.w;
        float2 _4940 = float2(_1541, _1549);
        float3 _1623 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_4940, float2(0.0), isnan(_4940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_4940, float2(0.0), isnan(_4940)), level(0.0)).xyz;
        float _1625 = _1623.x;
        float _1627 = _1623.y;
        float _1629 = _1623.z;
        float _1631 = _1357 * _1395;
        float _1633 = _1477 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _1635 = fma(_1349, 0.88622701168060302734375, _1631);
        float _1637 = _151 * 1.02332699298858642578125;
        float _1639 = exp2(_1633);
        float _1641 = _1527 * 0.5;
        float _1643 = fma(_1359, _1637, _1595);
        float _1645 = fma(_1361, _1637, _1599);
        float _1647 = fma((*spvDescriptorSet0.cp_c3)._m0[8].x, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _1649 = (*spvDescriptorSet0.cp_c3)._m0[8].x * 2.0;
        float _1651 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
        float _1653 = fma(_1651, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        bool _1655 = as_type<int>(_95) != 0;
        float _1657 = -_1649;
        float _1659 = fma(_273, _1657, _1647);
        float _1661 = -_1649;
        float _1663 = _1647 + _1661;
        float _1665 = abs(_1659);
        float _1667 = log2(_1665);
        float _1669 = abs(_1663);
        float _1671 = log2(_1669);
        float _1673 = _1667 * 1.5;
        float _1675 = exp2(_1673);
        float _1677 = _1671 * 1.5;
        float _1679 = exp2(_1677);
        float _1681 = _1675 * 12.56637096405029296875;
        float _1683 = 1.0 / _1681;
        float _1685 = _1679 * 12.56637096405029296875;
        float _1687 = 1.0 / _1685;
        float _1689 = _1653 * _1683;
        float _1691 = _1641 * _1689;
        float _1693 = _1653 * _1687;
        float _1695 = fma(_1553, _1637, _1635);
        float _1697 = _149 * 1.02332699298858642578125;
        float _1699 = _1573 * _1395;
        float _1701 = _1585 * _1395;
        float _1703 = fma(_1555, _1697, _1643);
        float _1705 = fma(_1557, _1697, _1645);
        float _1707 = fma(_1583, 0.88622701168060302734375, _1701);
        float _1709 = fma(_1559, _1697, _1695);
        float _1711 = precise::max(0.0, _1703);
        float _1713 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _1715 = _1569 * _1395;
        float _1717 = precise::max(0.0, _1705);
        float _1719 = fma(_1587, _1637, _1707);
        float _1721 = fma(_1565, 0.88622701168060302734375, _1699);
        float _1723 = fma(_1563, 0.88622701168060302734375, _1715);
        float _1725 = log2(_1713);
        float _1727 = fma(_1589, _1697, _1719);
        float _1729 = fma(_1577, _1637, _1723);
        float _1731 = fma(_1579, _1637, _1721);
        float _1733 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _1735 = _1727 * 0.31830990314483642578125;
        float _1737 = precise::clamp(_1735, 0.0, 1.0);
        float _1739 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _1741 = _1385 + _1739;
        float _1743 = _1711 * _1733;
        float _1745 = precise::min(_1737, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1747 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _1749 = _1725 * (-0.0199999995529651641845703125);
        float _1751 = _374 * _1749;
        float _1753 = _1591 * _1751;
        float _1755 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _1757 = 1.0 / _374;
        float _1759 = _1717 * _1755;
        float _1761 = precise::max(0.0, _1709);
        float _1763 = _1575 * _1395;
        float _1765 = fma(_1567, 0.88622701168060302734375, _1763);
        float _1767 = _1761 * _1747;
        float _1769 = _374 * _1641;
        float _1771 = _1741 * _1757;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        float _1775 = _1753 * _1773;
        float _1777 = _1605 * _1395;
        float _1779 = fma(_1603, 0.88622701168060302734375, _1777);
        float _1781 = fma(_1613, _1637, _1765);
        float _1783 = fma(_1615, _1697, _1729);
        float _1785 = fma(_1617, _1697, _1731);
        float _1787 = fma(_1607, _1637, _1779);
        float _1789 = fma(_1619, _1697, _1781);
        float _1791 = -_1639;
        float _1793 = _1791 + 1.0;
        float _1795 = precise::max(0.0, _1783);
        float _1797 = fma(_1609, _1697, _1787);
        float _1799 = _1745 * 0.88622701168060302734375;
        float _1801 = precise::max(0.0, _1785);
        float _1803 = _1641 * _1625;
        float _1805 = _1797 * 0.31830990314483642578125;
        float _1807 = precise::clamp(_1805, 0.0, 1.0);
        float _1809 = fma(_1799, (*spvDescriptorSet0.cp_c3)._m0[9].x, _1743);
        float _1811 = fma(_1799, (*spvDescriptorSet0.cp_c3)._m0[9].y, _1759);
        float _1813 = precise::max(0.0, _1789);
        float _1815 = fma(_1799, (*spvDescriptorSet0.cp_c3)._m0[9].z, _1767);
        float _1817 = _1807 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _1819 = precise::clamp(_1817, 0.0, 1.0);
        float _1821 = _1641 * _1627;
        int _1823 = _283 + as_type<int>(_95);
        float _1825 = _1793 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _1827 = fma(_1795, _1819, _1809);
        float _1829 = fma(_1801, _1819, _1811);
        float _1831 = fma(_1813, _1819, _1815);
        int _1833 = _1823 << 2;
        int _1835 = _1833 + 1024;
        uint _1837 = uint(int(uint(_1835) >> uint(2)));
        _26[int(_1837)] = as_type<uint>(_1769);
        float _1839 = _1827 * _1693;
        float _1841 = _1829 * _1693;
        float _1843 = _1831 * _1693;
        float _1845 = _1813;
        float _1847 = _1839;
        float _1849 = _1801;
        float _1851 = _1619;
        float _1853 = _1697;
        float _1855 = _1741;
        float _1857 = _1565;
        float _1859 = _1641;
        if (_1655)
        {
            _1845 = as_type<float>(_322);
        }
        int _1861 = as_type<int>(_1845);
        float _1863 = fma(_1691, (*spvDescriptorSet0.cp_c3)._m0[7].x, _1839);
        float _1865 = fma(_1691, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1841);
        float _1867 = fma(_1691, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1843);
        float _1869 = _1641 * _1629;
        float _1871 = _1863 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _1873 = _1865 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _1875 = _1867 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _1877 = _1861;
        if (_1655)
        {
            _1847 = as_type<float>(_324);
        }
        int _1879 = as_type<int>(_1847);
        int _1881 = _1823 << 4;
        uint _1883 = uint(int(uint(_1881) >> uint(2)));
        _26[int(_1883)] = as_type<uint>(_1803);
        int _1885 = _1881 + 4;
        uint _1887 = uint(int(uint(_1885) >> uint(2)));
        _26[int(_1887)] = as_type<uint>(_1821);
        int _1889 = _1881 + 8;
        uint _1891 = uint(int(uint(_1889) >> uint(2)));
        _26[int(_1891)] = as_type<uint>(_1869);
        int _1893 = _1881 + 12;
        uint _1895 = uint(int(uint(_1893) >> uint(2)));
        _26[int(_1895)] = as_type<uint>(_1825);
        int _1897 = _1879;
        if (_1655)
        {
            _1849 = as_type<float>(_326);
        }
        int _1899 = as_type<int>(_1849);
        int _1901 = _1899;
        if (_1655)
        {
            _1851 = as_type<float>(_328);
        }
        int _1903 = as_type<int>(_1851);
        int _1905 = _1823 << 4;
        int _1907 = _1905 + 1280;
        uint _1909 = uint(int(uint(_1907) >> uint(2)));
        _26[int(_1909)] = as_type<uint>(_1871);
        int _1911 = _1905 + 1284;
        uint _1913 = uint(int(uint(_1911) >> uint(2)));
        _26[int(_1913)] = as_type<uint>(_1873);
        int _1915 = _1905 + 1288;
        uint _1917 = uint(int(uint(_1915) >> uint(2)));
        _26[int(_1917)] = as_type<uint>(_1875);
        int _1919 = _1905 + 1292;
        uint _1921 = uint(int(uint(_1919) >> uint(2)));
        _26[int(_1921)] = as_type<uint>(_1775);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1923 = _1903;
        if (!_1655)
        {
            int _1925 = _283 << 4;
            int _1927 = _1925 + 1280;
            uint _1929 = uint(int(uint(_1927) >> uint(2)));
            float _1931 = as_type<float>(_26[int(_1929)]);
            int _1933 = _1925 + 1284;
            uint _1935 = uint(int(uint(_1933) >> uint(2)));
            float _1937 = as_type<float>(_26[int(_1935)]);
            int _1939 = _1925 + 1288;
            uint _1941 = uint(int(uint(_1939) >> uint(2)));
            float _1943 = as_type<float>(_26[int(_1941)]);
            int _1945 = _1925 + 1292;
            uint _1947 = uint(int(uint(_1945) >> uint(2)));
            float _1949 = as_type<float>(_26[int(_1947)]);
            int _1951 = _283 << 4;
            int _1953 = _1951 + 1296;
            uint _1955 = uint(int(uint(_1953) >> uint(2)));
            float _1957 = as_type<float>(_26[int(_1955)]);
            int _1959 = _1951 + 1300;
            uint _1961 = uint(int(uint(_1959) >> uint(2)));
            float _1963 = as_type<float>(_26[int(_1961)]);
            int _1965 = _1951 + 1304;
            uint _1967 = uint(int(uint(_1965) >> uint(2)));
            float _1969 = as_type<float>(_26[int(_1967)]);
            int _1971 = _1951 + 1308;
            uint _1973 = uint(int(uint(_1971) >> uint(2)));
            float _1975 = as_type<float>(_26[int(_1973)]);
            int _1977 = _283 << 4;
            int _1979 = _1977 + 1312;
            uint _1981 = uint(int(uint(_1979) >> uint(2)));
            float _1983 = as_type<float>(_26[int(_1981)]);
            int _1985 = _1977 + 1316;
            uint _1987 = uint(int(uint(_1985) >> uint(2)));
            float _1989 = as_type<float>(_26[int(_1987)]);
            int _1991 = _1977 + 1320;
            uint _1993 = uint(int(uint(_1991) >> uint(2)));
            float _1995 = as_type<float>(_26[int(_1993)]);
            int _1997 = _1977 + 1324;
            uint _1999 = uint(int(uint(_1997) >> uint(2)));
            float _2001 = as_type<float>(_26[int(_1999)]);
            int _2003 = _283 << 4;
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
            int _2027 = _283 << 4;
            int _2029 = _2027 + 16;
            uint _2031 = uint(int(uint(_2029) >> uint(2)));
            float _2033 = as_type<float>(_26[int(_2031)]);
            int _2035 = _2027 + 20;
            uint _2037 = uint(int(uint(_2035) >> uint(2)));
            float _2039 = as_type<float>(_26[int(_2037)]);
            int _2041 = _2027 + 24;
            uint _2043 = uint(int(uint(_2041) >> uint(2)));
            float _2045 = as_type<float>(_26[int(_2043)]);
            int _2047 = _2027 + 28;
            uint _2049 = uint(int(uint(_2047) >> uint(2)));
            float _2051 = as_type<float>(_26[int(_2049)]);
            int _2053 = _283 << 4;
            int _2055 = _2053 + 1328;
            uint _2057 = uint(int(uint(_2055) >> uint(2)));
            float _2059 = as_type<float>(_26[int(_2057)]);
            int _2061 = _2053 + 1332;
            uint _2063 = uint(int(uint(_2061) >> uint(2)));
            float _2065 = as_type<float>(_26[int(_2063)]);
            int _2067 = _2053 + 1336;
            uint _2069 = uint(int(uint(_2067) >> uint(2)));
            float _2071 = as_type<float>(_26[int(_2069)]);
            int _2073 = _2053 + 1340;
            uint _2075 = uint(int(uint(_2073) >> uint(2)));
            float _2077 = as_type<float>(_26[int(_2075)]);
            float _2079 = as_type<float>(_328) + _1949;
            float _2081 = -_2079;
            float _2083 = exp2(_2081);
            float _2085 = _2079 + _1975;
            float _2087 = _2085 + _2001;
            float _2089 = -_2085;
            float _2091 = exp2(_2089);
            float _2093 = -_1931;
            float _2095 = _2093 + _2007;
            float _2097 = -_1937;
            float _2099 = _2097 + _2013;
            float _2101 = -_1943;
            float _2103 = _2101 + _2019;
            float _2105 = -_1963;
            float _2107 = _2105 + _2039;
            float _2109 = -_1957;
            float _2111 = _2109 + _2033;
            float _2113 = -_1969;
            float _2115 = _2113 + _2045;
            float _2117 = -_2083;
            float _2119 = _2117 + 1.0;
            float _2121 = _2087 + _2077;
            int _2123 = _283 << 4;
            int _2125 = _2123 + 32;
            uint _2127 = uint(int(uint(_2125) >> uint(2)));
            float _2129 = as_type<float>(_26[int(_2127)]);
            int _2131 = _2123 + 36;
            uint _2133 = uint(int(uint(_2131) >> uint(2)));
            float _2135 = as_type<float>(_26[int(_2133)]);
            int _2137 = _2123 + 40;
            uint _2139 = uint(int(uint(_2137) >> uint(2)));
            float _2141 = as_type<float>(_26[int(_2139)]);
            int _2143 = _2123 + 44;
            uint _2145 = uint(int(uint(_2143) >> uint(2)));
            float _2147 = as_type<float>(_26[int(_2145)]);
            float _2149 = precise::min(_2119, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2151 = -_2091;
            float _2153 = _2151 + 1.0;
            float _2155 = -_2087;
            float _2157 = exp2(_2155);
            float _2159 = -_330;
            float _2161 = _2149 + _2159;
            float _2163 = precise::min(_2153, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2165 = _2161 * _2025;
            float _2167 = -_2149;
            float _2169 = _2167 + _2163;
            float _2171 = _2095 * _2165;
            float _2173 = _2099 * _2165;
            float _2175 = _2103 * _2165;
            float _2177 = _2169 * _2051;
            float _2179 = fma(_1931, _2161, _2171);
            float _2181 = fma(_1937, _2161, _2173);
            float _2183 = fma(_1943, _2161, _2175);
            float _2185 = -_2157;
            float _2187 = _2185 + 1.0;
            float _2189 = _2107 * _2177;
            int _2191 = _283 << 4;
            int _2193 = _2191 + 48;
            uint _2195 = uint(int(uint(_2193) >> uint(2)));
            float _2197 = as_type<float>(_26[int(_2195)]);
            int _2199 = _2191 + 52;
            uint _2201 = uint(int(uint(_2199) >> uint(2)));
            float _2203 = as_type<float>(_26[int(_2201)]);
            int _2205 = _2191 + 56;
            uint _2207 = uint(int(uint(_2205) >> uint(2)));
            float _2209 = as_type<float>(_26[int(_2207)]);
            int _2211 = _2191 + 60;
            uint _2213 = uint(int(uint(_2211) >> uint(2)));
            float _2215 = as_type<float>(_26[int(_2213)]);
            float _2217 = _2111 * _2177;
            float _2219 = _2115 * _2177;
            float _2221 = precise::min(_2187, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _2223 = _283 << 2;
            int _2225 = _2223 + 1024;
            uint _2227 = uint(int(uint(_2225) >> uint(2)));
            float _2229 = as_type<float>(_26[int(_2227)]);
            float _2231 = fma(_1957, _2169, _2217);
            float _2233 = fma(_1963, _2169, _2189);
            float _2235 = -_2121;
            float _2237 = exp2(_2235);
            int _2239 = _283 << 2;
            int _2241 = _2239 + 1028;
            uint _2243 = uint(int(uint(_2241) >> uint(2)));
            float _2245 = as_type<float>(_26[int(_2243)]);
            float _2247 = -_2163;
            float _2249 = _2247 + _2221;
            float _2251 = fma(_1969, _2169, _2219);
            float _2253 = _2179 + as_type<float>(_322);
            int _2255 = _283 << 2;
            int _2257 = _2255 + 1032;
            uint _2259 = uint(int(uint(_2257) >> uint(2)));
            float _2261 = as_type<float>(_26[int(_2259)]);
            float _2263 = _2181 + as_type<float>(_324);
            float _2265 = -_1983;
            float _2267 = _2265 + _2129;
            float _2269 = _2249 * _2147;
            int _2271 = _283 << 2;
            int _2273 = _2271 + 1036;
            uint _2275 = uint(int(uint(_2273) >> uint(2)));
            float _2277 = as_type<float>(_26[int(_2275)]);
            float _2279 = -_1989;
            float _2281 = _2279 + _2135;
            float _2283 = -_1995;
            float _2285 = _2283 + _2141;
            float _2287 = _2267 * _2269;
            float _2289 = _2183 + as_type<float>(_326);
            float _2291 = _2281 * _2269;
            float _2293 = _2285 * _2269;
            float _2295 = fma(_1983, _2249, _2287);
            float _2297 = _2263 + _2233;
            float _2299 = fma(_1989, _2249, _2291);
            float _2301 = -_2237;
            float _2303 = _2301 + 1.0;
            float _2305 = fma(_1995, _2249, _2293);
            float _2307 = _2253 + _2231;
            float _2309 = _2289 + _2251;
            float _2311 = _2297 + _2299;
            float _2313 = precise::min(_2303, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _2315 = _2307 + _2295;
            float _2317 = _2309 + _2305;
            int _2319 = _283 << 4;
            int _2321 = _2319 + 1280;
            uint _2323 = uint(int(uint(_2321) >> uint(2)));
            _26[int(_2323)] = as_type<uint>(_2253);
            int _2325 = _2319 + 1284;
            uint _2327 = uint(int(uint(_2325) >> uint(2)));
            _26[int(_2327)] = as_type<uint>(_2263);
            int _2329 = _2319 + 1288;
            uint _2331 = uint(int(uint(_2329) >> uint(2)));
            _26[int(_2331)] = as_type<uint>(_2289);
            int _2333 = _2319 + 1292;
            uint _2335 = uint(int(uint(_2333) >> uint(2)));
            _26[int(_2335)] = as_type<uint>(_2079);
            float _2337 = -_2221;
            float _2339 = _2313 + _2337;
            int _2341 = _283 << 4;
            int _2343 = _2341 + 1296;
            uint _2345 = uint(int(uint(_2343) >> uint(2)));
            _26[int(_2345)] = as_type<uint>(_2307);
            int _2347 = _2341 + 1300;
            uint _2349 = uint(int(uint(_2347) >> uint(2)));
            _26[int(_2349)] = as_type<uint>(_2297);
            int _2351 = _2341 + 1304;
            uint _2353 = uint(int(uint(_2351) >> uint(2)));
            _26[int(_2353)] = as_type<uint>(_2309);
            int _2355 = _2341 + 1308;
            uint _2357 = uint(int(uint(_2355) >> uint(2)));
            _26[int(_2357)] = as_type<uint>(_2085);
            float _2359 = -_2059;
            float _2361 = _2359 + _2197;
            float _2363 = _2339 * _2215;
            float _2365 = -_2065;
            float _2367 = _2365 + _2203;
            float _2369 = -_2071;
            float _2371 = _2369 + _2209;
            float _2373 = _2229 + _332;
            float _2375 = _2361 * _2363;
            float _2377 = _2367 * _2363;
            float _2379 = _2371 * _2363;
            float _2381 = _2373 + _2245;
            float _2383 = fma(_2059, _2339, _2375);
            float _2385 = fma(_2065, _2339, _2377);
            float _2387 = fma(_2071, _2339, _2379);
            float _2389 = _2381 + _2261;
            float _2391 = _2383 + _2315;
            float _2393 = _2385 + _2311;
            float _2395 = _2387 + _2317;
            float _2397 = _2389 + _2277;
            int _2399 = _283 << 4;
            int _2401 = _2399 + 1312;
            uint _2403 = uint(int(uint(_2401) >> uint(2)));
            _26[int(_2403)] = as_type<uint>(_2315);
            int _2405 = _2399 + 1316;
            uint _2407 = uint(int(uint(_2405) >> uint(2)));
            _26[int(_2407)] = as_type<uint>(_2311);
            int _2409 = _2399 + 1320;
            uint _2411 = uint(int(uint(_2409) >> uint(2)));
            _26[int(_2411)] = as_type<uint>(_2317);
            int _2413 = _2399 + 1324;
            uint _2415 = uint(int(uint(_2413) >> uint(2)));
            _26[int(_2415)] = as_type<uint>(_2087);
            int _2417 = _283 << 2;
            int _2419 = _2417 + 1024;
            uint _2421 = uint(int(uint(_2419) >> uint(2)));
            _26[int(_2421)] = as_type<uint>(_2373);
            int _2423 = _283 << 2;
            int _2425 = _2423 + 1028;
            uint _2427 = uint(int(uint(_2425) >> uint(2)));
            _26[int(_2427)] = as_type<uint>(_2381);
            int _2429 = _283 << 2;
            int _2431 = _2429 + 1032;
            uint _2433 = uint(int(uint(_2431) >> uint(2)));
            _26[int(_2433)] = as_type<uint>(_2389);
            int _2435 = _283 << 2;
            int _2437 = _2435 + 1036;
            uint _2439 = uint(int(uint(_2437) >> uint(2)));
            _26[int(_2439)] = as_type<uint>(_2397);
            int _2441 = _283 << 4;
            int _2443 = _2441 + 1328;
            uint _2445 = uint(int(uint(_2443) >> uint(2)));
            _26[int(_2445)] = as_type<uint>(_2391);
            int _2447 = _2441 + 1332;
            uint _2449 = uint(int(uint(_2447) >> uint(2)));
            _26[int(_2449)] = as_type<uint>(_2393);
            int _2451 = _2441 + 1336;
            uint _2453 = uint(int(uint(_2451) >> uint(2)));
            _26[int(_2453)] = as_type<uint>(_2395);
            int _2455 = _2441 + 1340;
            uint _2457 = uint(int(uint(_2455) >> uint(2)));
            _26[int(_2457)] = as_type<uint>(_2121);
            _1853 = _2289;
            _1855 = _2079;
            _1857 = _2363;
            _1859 = _2231;
            _450 = _2313;
            _452 = _2397;
            _1877 = as_type<int>(_2391);
            _1897 = as_type<int>(_2393);
            _1901 = as_type<int>(_2395);
            _1923 = as_type<int>(_2121);
        }
        float _2459 = _1853;
        float _2461 = _1855;
        float _2463 = _1857;
        float _2465 = _1859;
        float _2467 = _450;
        float _2469 = _452;
        int _2471 = _1877;
        int _2473 = _1897;
        int _2475 = _1901;
        int _2477 = _1923;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _2479 = _1823 << 4;
        int _2481 = _2479 + 1280;
        uint _2483 = uint(int(uint(_2481) >> uint(2)));
        float _2485 = as_type<float>(_26[int(_2483)]);
        int _2487 = _2479 + 1284;
        uint _2489 = uint(int(uint(_2487) >> uint(2)));
        float _2491 = as_type<float>(_26[int(_2489)]);
        int _2493 = _2479 + 1288;
        uint _2495 = uint(int(uint(_2493) >> uint(2)));
        float _2497 = as_type<float>(_26[int(_2495)]);
        int _2499 = _2479 + 1292;
        uint _2501 = uint(int(uint(_2499) >> uint(2)));
        float _2503 = as_type<float>(_26[int(_2501)]);
        float _2505 = 1.0 / _1385;
        int _2507 = _1823 << 2;
        int _2509 = _2507 + 1024;
        uint _2511 = uint(int(uint(_2509) >> uint(2)));
        float _2513 = as_type<float>(_26[int(_2511)]);
        float _2515 = -_2503;
        float _2517 = exp2(_2515);
        float _2519 = _2513 * _2505;
        float _2521 = precise::max(_2517, _281);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_2485, _2491, _2497, _2521), uint3(int3(_77, _73, int(_310))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_2519, _2519, _2519, _2519), uint3(int3(_77, _73, int(_310))));
        int _2523 = int(_310) + 4;
        bool _2525 = uint(_2523) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _286 = uint(_2523);
        _288 = _2519;
        _290 = _2459;
        _292 = _2461;
        _294 = _2463;
        _296 = _2465;
        _298 = _2471;
        _300 = _2473;
        _302 = _2475;
        _304 = _2477;
        _306 = _2467;
        _308 = _2469;
        if (_2525)
        {
            _2527 = true;
            if (_2527)
            {
                break;
            }
        }
    } while (true);
    _2527 = false;
}

