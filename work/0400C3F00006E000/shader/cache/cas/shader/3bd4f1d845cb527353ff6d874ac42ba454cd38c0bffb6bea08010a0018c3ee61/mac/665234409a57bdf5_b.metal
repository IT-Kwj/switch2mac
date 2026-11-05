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
    bool _2013 = false;
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
    int _292 = 0;
    int _294 = 0;
    int _296 = 0;
    int _298 = 0;
    float _300 = 0.0;
    float _302 = 0.0;
    do
    {
        uint _304 = _286;
        float _306 = _288;
        float _308 = _290;
        int _310 = _292;
        int _312 = _294;
        int _314 = _296;
        int _316 = _298;
        float _318 = _300;
        float _320 = _302;
        float _322 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _324 = log2(_322);
        float _326 = float(_304);
        float _328 = _265 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _330 = int(_304) + 1;
        float _332 = _153 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _334 = _151 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _336 = float(uint(_330));
        float _338 = _324 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _340 = _326 * _338;
        float _342 = _336 * _338;
        float _344 = exp2(_340);
        float _346 = exp2(_342);
        float _348 = _344 + (-1.0);
        float _350 = _348 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _352 = _346 + (-1.0);
        float _354 = _149 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _356 = -_350;
        float _358 = fma(_352, (*spvDescriptorSet0.cp_c3)._m0[8].z, _356);
        float _360 = _350 + _358;
        float _362 = _265 * _350;
        float _364 = _358 * _328;
        float _366 = _360 * _328;
        float _368 = fma(_362, _354, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _370 = fma(_362, _332, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _372 = fma(_362, _334, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _374 = -_275;
        float _376 = _366 * _374;
        float _378 = _153 * _364;
        float _380 = fma(_149, _364, _368);
        float _382 = fma(_151, _364, _372);
        float _384 = -_376;
        float _386 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _388 = _384 + _386;
        float _390 = -_376;
        float _392 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _394 = _390 + _392;
        float _396 = _370 + _378;
        float _398 = _388 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _400 = precise::clamp(_398, 0.0, 1.0);
        float _402 = _394 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _404 = precise::clamp(_402, 0.0, 1.0);
        bool _406 = _400 != 1.0;
        bool _408 = isnan(_400);
        bool _410 = _406 || _408;
        bool _412 = isnan(1.0);
        bool _414 = _410 || _412;
        bool _416 = _404 != 1.0;
        bool _418 = isnan(_404);
        bool _420 = _416 || _418;
        bool _422 = isnan(1.0);
        bool _424 = _420 || _422;
        float _426 = _308;
        float _428 = _354;
        float _430 = _332;
        float _432 = _306;
        float _434 = _378;
        float _436 = _318;
        float _438 = _320;
        if (!_414)
        {
            _426 = 1.0;
        }
        float _440 = _426;
        bool _442 = !_414;
        float _444 = _440;
        if (!_442)
        {
            float _446 = -_376;
            bool _448 = _446 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _450 = -_376;
            bool _452 = _450 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _454 = !_448;
            int _456 = _454 ? 0 : 1;
            int _458 = 2;
            if (!_448)
            {
                _458 = 1;
            }
            int _460 = _458;
            int _462 = _460;
            if (!_452)
            {
                _462 = _456;
            }
            int _464 = _462;
            int _466 = _464 << 6;
            float _468 = float(_464);
            int _470 = _466 + 304;
            uint _472 = uint(int(uint(_470) >> uint(2)));
            uint _474 = uint(int(uint(int(_472)) >> uint(2)));
            int _476 = int(_472) & 3;
            float _478 = (*spvDescriptorSet0.cp_c3)._m0[int(_474)][_476];
            int _480 = int(_472) + 1;
            uint _482 = uint(int(uint(_480) >> uint(2)));
            int _484 = _480 & 3;
            float _486 = (*spvDescriptorSet0.cp_c3)._m0[int(_482)][_484];
            int _488 = _466 + 312;
            uint _490 = uint(int(uint(_488) >> uint(2)));
            uint _492 = uint(int(uint(int(_490)) >> uint(2)));
            int _494 = int(_490) & 3;
            float _496 = (*spvDescriptorSet0.cp_c3)._m0[int(_492)][_494];
            int _498 = int(_490) + 1;
            uint _500 = uint(int(uint(_498) >> uint(2)));
            int _502 = _498 & 3;
            float _504 = (*spvDescriptorSet0.cp_c3)._m0[int(_500)][_502];
            int _506 = _466 + 256;
            uint _508 = uint(int(uint(_506) >> uint(2)));
            uint _510 = uint(int(uint(int(_508)) >> uint(2)));
            int _512 = int(_508) & 3;
            float _514 = (*spvDescriptorSet0.cp_c3)._m0[int(_510)][_512];
            int _516 = int(_508) + 1;
            uint _518 = uint(int(uint(_516) >> uint(2)));
            int _520 = _516 & 3;
            float _522 = (*spvDescriptorSet0.cp_c3)._m0[int(_518)][_520];
            int _524 = _466 + 272;
            uint _526 = uint(int(uint(_524) >> uint(2)));
            uint _528 = uint(int(uint(int(_526)) >> uint(2)));
            int _530 = int(_526) & 3;
            float _532 = (*spvDescriptorSet0.cp_c3)._m0[int(_528)][_530];
            int _534 = int(_526) + 1;
            uint _536 = uint(int(uint(_534) >> uint(2)));
            int _538 = _534 & 3;
            float _540 = (*spvDescriptorSet0.cp_c3)._m0[int(_536)][_538];
            int _542 = _466 + 288;
            uint _544 = uint(int(uint(_542) >> uint(2)));
            uint _546 = uint(int(uint(int(_544)) >> uint(2)));
            int _548 = int(_544) & 3;
            float _550 = (*spvDescriptorSet0.cp_c3)._m0[int(_546)][_548];
            int _552 = int(_544) + 1;
            uint _554 = uint(int(uint(_552) >> uint(2)));
            int _556 = _552 & 3;
            float _558 = (*spvDescriptorSet0.cp_c3)._m0[int(_554)][_556];
            int _560 = _466 + 264;
            uint _562 = uint(int(uint(_560) >> uint(2)));
            uint _564 = uint(int(uint(int(_562)) >> uint(2)));
            int _566 = int(_562) & 3;
            float _568 = (*spvDescriptorSet0.cp_c3)._m0[int(_564)][_566];
            int _570 = int(_562) + 1;
            uint _572 = uint(int(uint(_570) >> uint(2)));
            int _574 = _570 & 3;
            float _576 = (*spvDescriptorSet0.cp_c3)._m0[int(_572)][_574];
            int _578 = _466 + 280;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            uint _582 = uint(int(uint(int(_580)) >> uint(2)));
            int _584 = int(_580) & 3;
            float _586 = (*spvDescriptorSet0.cp_c3)._m0[int(_582)][_584];
            int _588 = int(_580) + 1;
            uint _590 = uint(int(uint(_588) >> uint(2)));
            int _592 = _588 & 3;
            float _594 = (*spvDescriptorSet0.cp_c3)._m0[int(_590)][_592];
            float _596 = _396 * _486;
            float _598 = fma(_380, _478, _596);
            int _600 = _466 + 296;
            uint _602 = uint(int(uint(_600) >> uint(2)));
            uint _604 = uint(int(uint(int(_602)) >> uint(2)));
            int _606 = int(_602) & 3;
            float _608 = (*spvDescriptorSet0.cp_c3)._m0[int(_604)][_606];
            int _610 = int(_602) + 1;
            uint _612 = uint(int(uint(_610) >> uint(2)));
            int _614 = _610 & 3;
            float _616 = (*spvDescriptorSet0.cp_c3)._m0[int(_612)][_614];
            float _618 = fma(_382, _496, _598);
            float _620 = _618 + _504;
            float _622 = _396 * _522;
            float _624 = 1.0 / _620;
            float _626 = fma(_380, _514, _622);
            float _628 = _396 * _540;
            float _630 = rint(_468);
            float _632 = precise::max(_630, 0.0);
            uint _634 = uint(_632);
            uint _636 = clamp(_634, 0u, 65535u);
            float _638 = fma(_380, _532, _628);
            float _640 = _396 * _558;
            float _642 = fma(_380, _550, _640);
            float _644 = fma(_382, _568, _626);
            float _646 = _644 + _576;
            float _648 = fma(_382, _586, _638);
            float _650 = _646 * _624;
            float _652 = _648 + _594;
            float _654 = fma(_382, _608, _642);
            float _656 = _652 * _624;
            float _658 = _654 + _616;
            float _660 = _658 * _624;
            float _662 = precise::clamp(_660, 0.0, 1.0);
            float3 _2938 = float3(_650, _656, float(int(_636)));
            float3 _2942 = select(_2938, float3(0.0), isnan(_2938));
            float _664 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _2942.xy, uint(rint(_2942.z)), _662, level(0.0));
            float _666 = -_664;
            float _668 = _666 + 1.0;
            float _670 = fma(_400, _668, _664);
            _428 = _624;
            _430 = _638;
            _444 = _670;
            _432 = _616;
        }
        float _672 = _428;
        float _674 = _430;
        float _676 = _444;
        float _678 = _432;
        float _680 = _674;
        float _682 = _672;
        if (!_424)
        {
            _680 = 1.0;
        }
        float _684 = _680;
        bool _686 = !_424;
        float _688 = _684;
        if (!_686)
        {
            float _690 = _396 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _692 = _396 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _694 = fma(_380, (*spvDescriptorSet0.cp_c3)._m0[130].x, _690);
            float _696 = fma(_380, (*spvDescriptorSet0.cp_c3)._m0[131].x, _692);
            float _698 = fma(_382, (*spvDescriptorSet0.cp_c3)._m0[130].z, _694);
            float _700 = fma(_382, (*spvDescriptorSet0.cp_c3)._m0[131].z, _696);
            float _702 = _698 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _704 = _700 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _706 = trunc(_702);
            int _708 = int(_706);
            float _710 = trunc(_704);
            int _712 = int(_710);
            int _714 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _716 = _708 + _714;
            int _718 = _716 + 1;
            bool _720 = _718 >= 0;
            int _722 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _724 = _712 + _722;
            int _726 = _724 + 1;
            bool _728 = _718 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _730 = !_720;
            bool _732 = _728 || _730;
            bool _734 = _726 < 0;
            bool _736 = _734 || _732;
            bool _738 = _726 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _740 = _738 || _736;
            if (_740)
            {
                _682 = 1.0;
            }
            float _742 = _682;
            float _744 = _742;
            if (!_740)
            {
                int _746 = _726 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _748 = _746 + _718;
                float _750 = floor(_702);
                int _752 = _748 << 2;
                uint _754 = uint(int(uint(_748) >> uint(2)));
                int _756 = 12 & _752;
                float _758 = floor(_704);
                int _760 = _748 << 4;
                int _762 = _760 + 2112;
                int _764 = int(_754) << 4;
                int _766 = _764 + _756;
                uint _768 = uint(int(uint(_762) >> uint(2)));
                uint _770 = uint(int(uint(int(_768)) >> uint(2)));
                int _772 = int(_768) & 3;
                float _774 = (*spvDescriptorSet0.cp_c3)._m0[int(_770)][_772];
                int _776 = int(_768) + 1;
                uint _778 = uint(int(uint(_776) >> uint(2)));
                int _780 = _776 & 3;
                float _782 = (*spvDescriptorSet0.cp_c3)._m0[int(_778)][_780];
                float _784 = -_750;
                float _786 = _702 + _784;
                int _788 = _766 + 464;
                uint _790 = uint(int(uint(_788) >> uint(2)));
                uint _792 = uint(int(uint(int(_790)) >> uint(2)));
                int _794 = int(_790) & 3;
                float _796 = (*spvDescriptorSet0.cp_c3)._m0[int(_792)][_794];
                int _798 = _762 + 8;
                uint _800 = uint(int(uint(_798) >> uint(2)));
                uint _802 = uint(int(uint(int(_800)) >> uint(2)));
                int _804 = int(_800) & 3;
                float _806 = (*spvDescriptorSet0.cp_c3)._m0[int(_802)][_804];
                int _808 = int(_800) + 1;
                uint _810 = uint(int(uint(_808) >> uint(2)));
                int _812 = _808 & 3;
                float _814 = (*spvDescriptorSet0.cp_c3)._m0[int(_810)][_812];
                float _816 = _396 * _782;
                float _818 = fma(_380, _774, _816);
                float _820 = rint(_796);
                float _822 = precise::max(_820, 0.0);
                uint _824 = uint(_822);
                uint _826 = clamp(_824, 0u, 65535u);
                float _828 = fma(_382, _806, _818);
                float _830 = -_758;
                float _832 = _704 + _830;
                float _834 = _828 + _814;
                float _836 = precise::clamp(_834, 0.0, 1.0);
                float3 _3219 = float3(_786, _832, float(int(_826)));
                float3 _3221 = select(_3219, float3(0.0), isnan(_3219));
                float _838 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_8).sample_compare(spvDescriptorSet0.cp_t_tcb_8Smplr, _3221.xy, uint(rint(_3221.z)), _836, level(0.0));
                _744 = _838;
            }
            float _840 = _744;
            float _842 = -_840;
            float _844 = _842 + 1.0;
            float _846 = fma(_404, _844, _840);
            _688 = _846;
        }
        float _848 = _688;
        float _850 = fma(_380, 6.2500002968590706586837768554688e-05, 0.5);
        float _852 = fma(_382, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3247 = float3(_850, _852, float(0));
        float3 _3249 = select(_3247, float3(0.0), isnan(_3247));
        float4 _855 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3249.xy, uint(rint(_3249.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3249.xy, uint(rint(_3249.z)), level(0.0)).xyzw;
        float _857 = _855.x;
        float _859 = _855.y;
        float _861 = _855.z;
        float _863 = _855.w;
        float3 _3264 = float3(_850, _852, float(1));
        float3 _3266 = select(_3264, float3(0.0), isnan(_3264));
        float4 _865 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3266.xy, uint(rint(_3266.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3266.xy, uint(rint(_3266.z)), level(0.0)).xyzw;
        float _867 = _865.x;
        float _869 = _865.y;
        float _871 = _865.z;
        float _873 = _865.w;
        float _875 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _877 = _382 + _875;
        float _879 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _881 = _380 + _879;
        float _883 = _153 * 1.02332699298858642578125;
        float _885 = _877 * _877;
        float _887 = abs(_378);
        bool _889 = _887 > 0.00999999977648258209228515625;
        float _891 = fma(_881, _881, _885);
        float _893 = fma(_366, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _895 = precise::clamp(_893, 0.0, 1.0);
        float _897 = sqrt(_891);
        float _899 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _901 = -_895;
        float _903 = _901 + 1.0;
        float _905 = _899 * 100.0;
        float _907 = 1.0 / _899;
        float _909 = precise::min(_676, _848);
        bool _911 = _897 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _913 = exp2(_905);
        float _915 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _917 = _897 + _915;
        float _919 = _889 ? _378 : 0.00999999977648258209228515625;
        float _921 = _899 * _919;
        float _923 = abs(_903);
        float _925 = log2(_923);
        float _927 = precise::max(_921, -127.0);
        _290 = _909;
        float _929 = _678;
        float _931 = _917;
        if (_911)
        {
            float _933 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _929 = _933;
        }
        float _935 = _929;
        float _937 = fma(_913, 512.0, -512.0);
        float _939 = fma(_273, -0.5, 0.5);
        float _941 = 1.0 / _937;
        float _943 = _935;
        if (_911)
        {
            float _945 = _917 * _935;
            _931 = _945;
        }
        float _947 = _931;
        float _949 = sqrt(_939);
        if (_911)
        {
            float _951 = _947 * 0.15915493667125701904296875;
            _943 = _951;
        }
        float _953 = _943;
        float _955 = _899 * 5115.0;
        float _957 = _955 * _941;
        float _959 = _953;
        float _961 = _941;
        float _963 = _955;
        if (_911)
        {
            float _965 = _953 * 6.283185482025146484375;
            float _967 = cos(_965);
            _959 = _967;
        }
        float _969 = _959;
        if (!_911)
        {
            _961 = _396;
        }
        float _971 = _961;
        float _973 = log2(_957);
        float _975 = _971;
        if (_911)
        {
            float _977 = _969 + (-1.0);
            _963 = _977;
        }
        float _979 = _963;
        float _981 = 1.0 / _927;
        if (_911)
        {
            float _983 = _979 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _434 = _983;
        }
        float _985 = _434;
        if (_911)
        {
            float _987 = fma(_396, _969, _985);
            _975 = _987;
        }
        float _989 = _975;
        float _991 = fma(_973, _907, 100.0);
        float _993 = _925 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _995 = -_927;
        float _997 = exp2(_995);
        float _999 = -_989;
        float _1001 = fma(_396, 2.0, _999);
        float _1003 = -(*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _1005 = _1001 + _1003;
        float _1007 = exp2(_993);
        float _1009 = precise::max(0.0, _1005);
        float _1011 = -_991;
        float _1013 = _1011 + _1009;
        float _1015 = fma(_273, 0.5, 0.5);
        float _1017 = -_997;
        float _1019 = _1017 + 1.0;
        float _1021 = _899 * _1013;
        float _1023 = fma(_1015, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _1025 = _277 + 1.0;
        float _1027 = fma(_1015, _1023, -0.212114393711090087890625);
        float _1029 = -_1021;
        float _1031 = exp2(_1029);
        float _1033 = -_277;
        float _1035 = fma(_1007, _1025, _1033);
        float _1037 = fma(_1015, _1027, 1.570728778839111328125);
        float _1039 = fma(_1035, 0.5, 0.5);
        float _1041 = _1031 * _1019;
        float _1043 = _949 * 0.636619746685028076171875;
        float _1045 = _1041 * _981;
        float _1047 = -_1037;
        float _1049 = fma(_1043, _1047, 1.0);
        float3 _3533 = float3(_850, _852, float(2));
        float3 _3535 = select(_3533, float3(0.0), isnan(_3533));
        float4 _1051 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3535.xy, uint(rint(_3535.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3535.xy, uint(rint(_3535.z)), level(0.0)).xyzw;
        float _1053 = _1051.x;
        float _1055 = _1051.y;
        float _1057 = _1051.z;
        float _1059 = _1051.w;
        float3 _3550 = float3(_850, _852, float(3));
        float3 _3552 = select(_3550, float3(0.0), isnan(_3550));
        float4 _1061 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3552.xy, uint(rint(_3552.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3552.xy, uint(rint(_3552.z)), level(0.0)).xyzw;
        float _1063 = _1061.x;
        float _1065 = _1061.y;
        float _1067 = _1061.z;
        float _1069 = _1061.w;
        float3 _3567 = float3(_850, _852, float(4));
        float3 _3569 = select(_3567, float3(0.0), isnan(_3567));
        float4 _1071 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3569.xy, uint(rint(_3569.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3569.xy, uint(rint(_3569.z)), level(0.0)).xyzw;
        float _1073 = _1071.x;
        float _1075 = _1071.y;
        float _1077 = _1071.z;
        float _1079 = _1071.w;
        float3 _3584 = float3(_850, _852, float(6));
        float3 _3586 = select(_3584, float3(0.0), isnan(_3584));
        float4 _1081 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3586.xy, uint(rint(_3586.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3586.xy, uint(rint(_3586.z)), level(0.0)).xyzw;
        float _1083 = _1081.x;
        float _1085 = _1081.y;
        float _1087 = _1081.z;
        float _1089 = _1081.w;
        float _1091 = _863 * _883;
        float _1093 = fma(_857, 0.88622701168060302734375, _1091);
        float _1095 = _867 * _883;
        float _1097 = fma(_859, 0.88622701168060302734375, _1095);
        float3 _3615 = float3(_850, _852, float(7));
        float3 _3617 = select(_3615, float3(0.0), isnan(_3615));
        float4 _1099 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3617.xy, uint(rint(_3617.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3617.xy, uint(rint(_3617.z)), level(0.0)).xyzw;
        float _1101 = _1099.x;
        float _1103 = _1099.y;
        float _1105 = _1099.z;
        float _1107 = _1099.w;
        float3 _3633 = float3(_850, _852, float(5));
        float3 _3635 = select(_3633, float3(0.0), isnan(_3633));
        float4 _1109 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _3635.xy, uint(rint(_3635.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _3635.xy, uint(rint(_3635.z)), level(0.0)).xyzw;
        float _1111 = _1109.x;
        float _1113 = _1109.y;
        float _1115 = _1109.z;
        float _1117 = _1109.w;
        float2 _3650 = float2(_1049, _1039);
        float3 _1121 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_3650, float2(0.0), isnan(_3650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_3650, float2(0.0), isnan(_3650)), level(0.0)).xyz;
        float _1123 = _1121.x;
        float _1125 = _1121.y;
        float _1127 = _1121.z;
        float _1129 = _869 * _883;
        float _1131 = _925 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _1133 = fma(_861, 0.88622701168060302734375, _1129);
        float _1135 = _151 * 1.02332699298858642578125;
        float _1137 = exp2(_1131);
        bool _1139 = as_type<int>(_95) != 0;
        float _1141 = fma(_871, _1135, _1093);
        float _1143 = fma(_873, _1135, _1097);
        float _1145 = fma((*spvDescriptorSet0.cp_c3)._m0[8].x, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _1147 = (*spvDescriptorSet0.cp_c3)._m0[8].x * 2.0;
        float _1149 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
        float _1151 = fma(_1149, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _1153 = -_1147;
        float _1155 = fma(_273, _1153, _1145);
        float _1157 = -_1147;
        float _1159 = _1145 + _1157;
        float _1161 = abs(_1155);
        float _1163 = log2(_1161);
        float _1165 = abs(_1159);
        float _1167 = log2(_1165);
        float _1169 = _1163 * 1.5;
        float _1171 = exp2(_1169);
        float _1173 = _1167 * 1.5;
        float _1175 = exp2(_1173);
        float _1177 = _1171 * 12.56637096405029296875;
        float _1179 = 1.0 / _1177;
        float _1181 = _1175 * 12.56637096405029296875;
        float _1183 = 1.0 / _1181;
        float _1185 = _1151 * _1179;
        float _1187 = _1151 * _1183;
        float _1189 = fma(_1053, _1135, _1133);
        float _1191 = _149 * 1.02332699298858642578125;
        float _1193 = _1073 * _883;
        float _1195 = _1085 * _883;
        float _1197 = fma(_1055, _1191, _1141);
        float _1199 = fma(_1057, _1191, _1143);
        float _1201 = fma(_1083, 0.88622701168060302734375, _1195);
        float _1203 = fma(_1059, _1191, _1189);
        float _1205 = precise::max(0.0, _1197);
        float _1207 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _1209 = _1069 * _883;
        float _1211 = precise::max(0.0, _1199);
        float _1213 = fma(_1087, _1135, _1201);
        float _1215 = fma(_1065, 0.88622701168060302734375, _1193);
        float _1217 = fma(_1063, 0.88622701168060302734375, _1209);
        float _1219 = log2(_1207);
        float _1221 = fma(_1089, _1191, _1213);
        float _1223 = fma(_1077, _1135, _1217);
        float _1225 = fma(_1079, _1135, _1215);
        float _1227 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _1229 = _1221 * 0.31830990314483642578125;
        float _1231 = precise::clamp(_1229, 0.0, 1.0);
        float _1233 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _1235 = _366 + _1233;
        float _1237 = _1205 * _1227;
        float _1239 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _1241 = precise::min(_1231, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1243 = _1219 * (-0.0199999995529651641845703125);
        float _1245 = _364 * _1243;
        float _1247 = _1045 * _1245;
        float _1249 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _1251 = 1.0 / _364;
        float _1253 = _1211 * _1249;
        float _1255 = precise::max(0.0, _1203);
        float _1257 = _1075 * _883;
        float _1259 = fma(_1067, 0.88622701168060302734375, _1257);
        float _1261 = _1255 * _1239;
        float _1263 = _1235 * _1251;
        float _1265 = precise::clamp(_1263, 0.0, 1.0);
        float _1267 = _1247 * _1265;
        float _1269 = _1103 * _883;
        float _1271 = fma(_1101, 0.88622701168060302734375, _1269);
        float _1273 = fma(_1111, _1135, _1259);
        float _1275 = fma(_1113, _1191, _1223);
        float _1277 = fma(_1115, _1191, _1225);
        float _1279 = fma(_1105, _1135, _1271);
        float _1281 = fma(_1117, _1191, _1273);
        float _1283 = -_1137;
        float _1285 = _1283 + 1.0;
        float _1287 = precise::max(0.0, _1275);
        float _1289 = fma(_1107, _1191, _1279);
        float _1291 = _1241 * 0.88622701168060302734375;
        float _1293 = precise::max(0.0, _1277);
        float _1295 = _1285 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _1297 = _1289 * 0.31830990314483642578125;
        float _1299 = precise::clamp(_1297, 0.0, 1.0);
        float _1301 = precise::max(0.0, _1281);
        float _1303 = fma(_1291, (*spvDescriptorSet0.cp_c3)._m0[9].x, _1237);
        float _1305 = fma(_1291, (*spvDescriptorSet0.cp_c3)._m0[9].y, _1253);
        float _1307 = fma(_1291, (*spvDescriptorSet0.cp_c3)._m0[9].z, _1261);
        float _1309 = _1299 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _1311 = precise::clamp(_1309, 0.0, 1.0);
        float _1313 = precise::min(_909, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        int _1315 = _283 + as_type<int>(_95);
        float _1317 = fma(_1287, _1311, _1303);
        float _1319 = fma(_1293, _1311, _1305);
        float _1321 = fma(_1301, _1311, _1307);
        float _1323 = _1313 * _1185;
        float _1325 = _1317 * _1187;
        float _1327 = _1319 * _1187;
        float _1329 = _1321 * _1187;
        float _1331 = _364 * _1313;
        float _1333 = fma(_1323, (*spvDescriptorSet0.cp_c3)._m0[7].x, _1325);
        float _1335 = fma(_1323, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1327);
        float _1337 = fma(_1323, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1329);
        float _1339 = _1313 * _1123;
        float _1341 = _1313 * _1125;
        float _1343 = _1313 * _1127;
        float _1345 = _1333 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _1347 = _1335 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _1349 = _1337 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _1351 = _1315 << 2;
        int _1353 = _1351 + 1024;
        uint _1355 = uint(int(uint(_1353) >> uint(2)));
        _26[int(_1355)] = as_type<uint>(_1331);
        float _1357 = _1301;
        float _1359 = _1325;
        float _1361 = _1293;
        float _1363 = _1329;
        float _1365 = _1235;
        if (_1139)
        {
            _1357 = as_type<float>(_310);
        }
        int _1367 = as_type<int>(_1357);
        int _1369 = _1367;
        if (_1139)
        {
            _1359 = as_type<float>(_312);
        }
        int _1371 = as_type<int>(_1359);
        int _1373 = _1315 << 4;
        int _1375 = _1373 + 1280;
        uint _1377 = uint(int(uint(_1375) >> uint(2)));
        _26[int(_1377)] = as_type<uint>(_1345);
        int _1379 = _1373 + 1284;
        uint _1381 = uint(int(uint(_1379) >> uint(2)));
        _26[int(_1381)] = as_type<uint>(_1347);
        int _1383 = _1373 + 1288;
        uint _1385 = uint(int(uint(_1383) >> uint(2)));
        _26[int(_1385)] = as_type<uint>(_1349);
        int _1387 = _1373 + 1292;
        uint _1389 = uint(int(uint(_1387) >> uint(2)));
        _26[int(_1389)] = as_type<uint>(_1267);
        int _1391 = _1371;
        if (_1139)
        {
            _1361 = as_type<float>(_314);
        }
        int _1393 = as_type<int>(_1361);
        int _1395 = _1393;
        if (_1139)
        {
            _1363 = as_type<float>(_316);
        }
        int _1397 = as_type<int>(_1363);
        int _1399 = _1315 << 4;
        uint _1401 = uint(int(uint(_1399) >> uint(2)));
        _26[int(_1401)] = as_type<uint>(_1339);
        int _1403 = _1399 + 4;
        uint _1405 = uint(int(uint(_1403) >> uint(2)));
        _26[int(_1405)] = as_type<uint>(_1341);
        int _1407 = _1399 + 8;
        uint _1409 = uint(int(uint(_1407) >> uint(2)));
        _26[int(_1409)] = as_type<uint>(_1343);
        int _1411 = _1399 + 12;
        uint _1413 = uint(int(uint(_1411) >> uint(2)));
        _26[int(_1413)] = as_type<uint>(_1295);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1415 = _1397;
        if (!_1139)
        {
            int _1417 = _283 << 4;
            int _1419 = _1417 + 1280;
            uint _1421 = uint(int(uint(_1419) >> uint(2)));
            float _1423 = as_type<float>(_26[int(_1421)]);
            int _1425 = _1417 + 1284;
            uint _1427 = uint(int(uint(_1425) >> uint(2)));
            float _1429 = as_type<float>(_26[int(_1427)]);
            int _1431 = _1417 + 1288;
            uint _1433 = uint(int(uint(_1431) >> uint(2)));
            float _1435 = as_type<float>(_26[int(_1433)]);
            int _1437 = _1417 + 1292;
            uint _1439 = uint(int(uint(_1437) >> uint(2)));
            float _1441 = as_type<float>(_26[int(_1439)]);
            int _1443 = _283 << 4;
            int _1445 = _1443 + 1296;
            uint _1447 = uint(int(uint(_1445) >> uint(2)));
            float _1449 = as_type<float>(_26[int(_1447)]);
            int _1451 = _1443 + 1300;
            uint _1453 = uint(int(uint(_1451) >> uint(2)));
            float _1455 = as_type<float>(_26[int(_1453)]);
            int _1457 = _1443 + 1304;
            uint _1459 = uint(int(uint(_1457) >> uint(2)));
            float _1461 = as_type<float>(_26[int(_1459)]);
            int _1463 = _1443 + 1308;
            uint _1465 = uint(int(uint(_1463) >> uint(2)));
            float _1467 = as_type<float>(_26[int(_1465)]);
            int _1469 = _283 << 4;
            int _1471 = _1469 + 1312;
            uint _1473 = uint(int(uint(_1471) >> uint(2)));
            float _1475 = as_type<float>(_26[int(_1473)]);
            int _1477 = _1469 + 1316;
            uint _1479 = uint(int(uint(_1477) >> uint(2)));
            float _1481 = as_type<float>(_26[int(_1479)]);
            int _1483 = _1469 + 1320;
            uint _1485 = uint(int(uint(_1483) >> uint(2)));
            float _1487 = as_type<float>(_26[int(_1485)]);
            int _1489 = _1469 + 1324;
            uint _1491 = uint(int(uint(_1489) >> uint(2)));
            float _1493 = as_type<float>(_26[int(_1491)]);
            int _1495 = _283 << 4;
            uint _1497 = uint(int(uint(_1495) >> uint(2)));
            float _1499 = as_type<float>(_26[int(_1497)]);
            int _1501 = _1495 + 4;
            uint _1503 = uint(int(uint(_1501) >> uint(2)));
            float _1505 = as_type<float>(_26[int(_1503)]);
            int _1507 = _1495 + 8;
            uint _1509 = uint(int(uint(_1507) >> uint(2)));
            float _1511 = as_type<float>(_26[int(_1509)]);
            int _1513 = _1495 + 12;
            uint _1515 = uint(int(uint(_1513) >> uint(2)));
            float _1517 = as_type<float>(_26[int(_1515)]);
            int _1519 = _283 << 4;
            int _1521 = _1519 + 16;
            uint _1523 = uint(int(uint(_1521) >> uint(2)));
            float _1525 = as_type<float>(_26[int(_1523)]);
            int _1527 = _1519 + 20;
            uint _1529 = uint(int(uint(_1527) >> uint(2)));
            float _1531 = as_type<float>(_26[int(_1529)]);
            int _1533 = _1519 + 24;
            uint _1535 = uint(int(uint(_1533) >> uint(2)));
            float _1537 = as_type<float>(_26[int(_1535)]);
            int _1539 = _1519 + 28;
            uint _1541 = uint(int(uint(_1539) >> uint(2)));
            float _1543 = as_type<float>(_26[int(_1541)]);
            int _1545 = _283 << 4;
            int _1547 = _1545 + 1328;
            uint _1549 = uint(int(uint(_1547) >> uint(2)));
            float _1551 = as_type<float>(_26[int(_1549)]);
            int _1553 = _1545 + 1332;
            uint _1555 = uint(int(uint(_1553) >> uint(2)));
            float _1557 = as_type<float>(_26[int(_1555)]);
            int _1559 = _1545 + 1336;
            uint _1561 = uint(int(uint(_1559) >> uint(2)));
            float _1563 = as_type<float>(_26[int(_1561)]);
            int _1565 = _1545 + 1340;
            uint _1567 = uint(int(uint(_1565) >> uint(2)));
            float _1569 = as_type<float>(_26[int(_1567)]);
            float _1571 = as_type<float>(_316) + _1441;
            float _1573 = -_1571;
            float _1575 = exp2(_1573);
            float _1577 = _1571 + _1467;
            float _1579 = _1577 + _1493;
            float _1581 = -_1577;
            float _1583 = exp2(_1581);
            float _1585 = -_1423;
            float _1587 = _1585 + _1499;
            float _1589 = -_1429;
            float _1591 = _1589 + _1505;
            float _1593 = -_1435;
            float _1595 = _1593 + _1511;
            float _1597 = -_1455;
            float _1599 = _1597 + _1531;
            float _1601 = -_1449;
            float _1603 = _1601 + _1525;
            float _1605 = -_1461;
            float _1607 = _1605 + _1537;
            float _1609 = -_1575;
            float _1611 = _1609 + 1.0;
            float _1613 = _1579 + _1569;
            int _1615 = _283 << 4;
            int _1617 = _1615 + 32;
            uint _1619 = uint(int(uint(_1617) >> uint(2)));
            float _1621 = as_type<float>(_26[int(_1619)]);
            int _1623 = _1615 + 36;
            uint _1625 = uint(int(uint(_1623) >> uint(2)));
            float _1627 = as_type<float>(_26[int(_1625)]);
            int _1629 = _1615 + 40;
            uint _1631 = uint(int(uint(_1629) >> uint(2)));
            float _1633 = as_type<float>(_26[int(_1631)]);
            int _1635 = _1615 + 44;
            uint _1637 = uint(int(uint(_1635) >> uint(2)));
            float _1639 = as_type<float>(_26[int(_1637)]);
            float _1641 = precise::min(_1611, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1643 = -_1583;
            float _1645 = _1643 + 1.0;
            float _1647 = -_1579;
            float _1649 = exp2(_1647);
            float _1651 = -_318;
            float _1653 = _1641 + _1651;
            float _1655 = precise::min(_1645, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1657 = _1653 * _1517;
            float _1659 = -_1641;
            float _1661 = _1659 + _1655;
            float _1663 = _1587 * _1657;
            float _1665 = _1591 * _1657;
            float _1667 = _1595 * _1657;
            float _1669 = _1661 * _1543;
            float _1671 = fma(_1423, _1653, _1663);
            float _1673 = fma(_1429, _1653, _1665);
            float _1675 = fma(_1435, _1653, _1667);
            float _1677 = -_1649;
            float _1679 = _1677 + 1.0;
            float _1681 = _1599 * _1669;
            int _1683 = _283 << 4;
            int _1685 = _1683 + 48;
            uint _1687 = uint(int(uint(_1685) >> uint(2)));
            float _1689 = as_type<float>(_26[int(_1687)]);
            int _1691 = _1683 + 52;
            uint _1693 = uint(int(uint(_1691) >> uint(2)));
            float _1695 = as_type<float>(_26[int(_1693)]);
            int _1697 = _1683 + 56;
            uint _1699 = uint(int(uint(_1697) >> uint(2)));
            float _1701 = as_type<float>(_26[int(_1699)]);
            int _1703 = _1683 + 60;
            uint _1705 = uint(int(uint(_1703) >> uint(2)));
            float _1707 = as_type<float>(_26[int(_1705)]);
            float _1709 = _1603 * _1669;
            float _1711 = _1607 * _1669;
            float _1713 = precise::min(_1679, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1715 = _283 << 2;
            int _1717 = _1715 + 1024;
            uint _1719 = uint(int(uint(_1717) >> uint(2)));
            float _1721 = as_type<float>(_26[int(_1719)]);
            float _1723 = fma(_1449, _1661, _1709);
            float _1725 = fma(_1455, _1661, _1681);
            float _1727 = -_1613;
            float _1729 = exp2(_1727);
            int _1731 = _283 << 2;
            int _1733 = _1731 + 1028;
            uint _1735 = uint(int(uint(_1733) >> uint(2)));
            float _1737 = as_type<float>(_26[int(_1735)]);
            float _1739 = -_1655;
            float _1741 = _1739 + _1713;
            float _1743 = fma(_1461, _1661, _1711);
            float _1745 = _1671 + as_type<float>(_310);
            int _1747 = _283 << 2;
            int _1749 = _1747 + 1032;
            uint _1751 = uint(int(uint(_1749) >> uint(2)));
            float _1753 = as_type<float>(_26[int(_1751)]);
            float _1755 = _1673 + as_type<float>(_312);
            float _1757 = -_1475;
            float _1759 = _1757 + _1621;
            float _1761 = _1741 * _1639;
            int _1763 = _283 << 2;
            int _1765 = _1763 + 1036;
            uint _1767 = uint(int(uint(_1765) >> uint(2)));
            float _1769 = as_type<float>(_26[int(_1767)]);
            float _1771 = -_1481;
            float _1773 = _1771 + _1627;
            float _1775 = -_1487;
            float _1777 = _1775 + _1633;
            float _1779 = _1759 * _1761;
            float _1781 = _1675 + as_type<float>(_314);
            float _1783 = _1773 * _1761;
            float _1785 = _1777 * _1761;
            float _1787 = fma(_1475, _1741, _1779);
            float _1789 = _1755 + _1725;
            float _1791 = fma(_1481, _1741, _1783);
            float _1793 = -_1729;
            float _1795 = _1793 + 1.0;
            float _1797 = fma(_1487, _1741, _1785);
            float _1799 = _1745 + _1723;
            float _1801 = _1781 + _1743;
            float _1803 = _1789 + _1791;
            float _1805 = precise::min(_1795, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1807 = _1799 + _1787;
            float _1809 = _1801 + _1797;
            int _1811 = _283 << 4;
            int _1813 = _1811 + 1280;
            uint _1815 = uint(int(uint(_1813) >> uint(2)));
            _26[int(_1815)] = as_type<uint>(_1745);
            int _1817 = _1811 + 1284;
            uint _1819 = uint(int(uint(_1817) >> uint(2)));
            _26[int(_1819)] = as_type<uint>(_1755);
            int _1821 = _1811 + 1288;
            uint _1823 = uint(int(uint(_1821) >> uint(2)));
            _26[int(_1823)] = as_type<uint>(_1781);
            int _1825 = _1811 + 1292;
            uint _1827 = uint(int(uint(_1825) >> uint(2)));
            _26[int(_1827)] = as_type<uint>(_1571);
            float _1829 = -_1713;
            float _1831 = _1805 + _1829;
            int _1833 = _283 << 4;
            int _1835 = _1833 + 1296;
            uint _1837 = uint(int(uint(_1835) >> uint(2)));
            _26[int(_1837)] = as_type<uint>(_1799);
            int _1839 = _1833 + 1300;
            uint _1841 = uint(int(uint(_1839) >> uint(2)));
            _26[int(_1841)] = as_type<uint>(_1789);
            int _1843 = _1833 + 1304;
            uint _1845 = uint(int(uint(_1843) >> uint(2)));
            _26[int(_1845)] = as_type<uint>(_1801);
            int _1847 = _1833 + 1308;
            uint _1849 = uint(int(uint(_1847) >> uint(2)));
            _26[int(_1849)] = as_type<uint>(_1577);
            float _1851 = -_1551;
            float _1853 = _1851 + _1689;
            float _1855 = _1831 * _1707;
            float _1857 = -_1557;
            float _1859 = _1857 + _1695;
            float _1861 = -_1563;
            float _1863 = _1861 + _1701;
            float _1865 = _1721 + _320;
            float _1867 = _1853 * _1855;
            float _1869 = _1859 * _1855;
            float _1871 = _1863 * _1855;
            float _1873 = _1865 + _1737;
            float _1875 = fma(_1551, _1831, _1867);
            float _1877 = fma(_1557, _1831, _1869);
            float _1879 = fma(_1563, _1831, _1871);
            float _1881 = _1873 + _1753;
            float _1883 = _1875 + _1807;
            float _1885 = _1877 + _1803;
            float _1887 = _1879 + _1809;
            float _1889 = _1881 + _1769;
            int _1891 = _283 << 4;
            int _1893 = _1891 + 1312;
            uint _1895 = uint(int(uint(_1893) >> uint(2)));
            _26[int(_1895)] = as_type<uint>(_1807);
            int _1897 = _1891 + 1316;
            uint _1899 = uint(int(uint(_1897) >> uint(2)));
            _26[int(_1899)] = as_type<uint>(_1803);
            int _1901 = _1891 + 1320;
            uint _1903 = uint(int(uint(_1901) >> uint(2)));
            _26[int(_1903)] = as_type<uint>(_1809);
            int _1905 = _1891 + 1324;
            uint _1907 = uint(int(uint(_1905) >> uint(2)));
            _26[int(_1907)] = as_type<uint>(_1579);
            int _1909 = _283 << 2;
            int _1911 = _1909 + 1024;
            uint _1913 = uint(int(uint(_1911) >> uint(2)));
            _26[int(_1913)] = as_type<uint>(_1865);
            int _1915 = _283 << 2;
            int _1917 = _1915 + 1028;
            uint _1919 = uint(int(uint(_1917) >> uint(2)));
            _26[int(_1919)] = as_type<uint>(_1873);
            int _1921 = _283 << 2;
            int _1923 = _1921 + 1032;
            uint _1925 = uint(int(uint(_1923) >> uint(2)));
            _26[int(_1925)] = as_type<uint>(_1881);
            int _1927 = _283 << 2;
            int _1929 = _1927 + 1036;
            uint _1931 = uint(int(uint(_1929) >> uint(2)));
            _26[int(_1931)] = as_type<uint>(_1889);
            int _1933 = _283 << 4;
            int _1935 = _1933 + 1328;
            uint _1937 = uint(int(uint(_1935) >> uint(2)));
            _26[int(_1937)] = as_type<uint>(_1883);
            int _1939 = _1933 + 1332;
            uint _1941 = uint(int(uint(_1939) >> uint(2)));
            _26[int(_1941)] = as_type<uint>(_1885);
            int _1943 = _1933 + 1336;
            uint _1945 = uint(int(uint(_1943) >> uint(2)));
            _26[int(_1945)] = as_type<uint>(_1887);
            int _1947 = _1933 + 1340;
            uint _1949 = uint(int(uint(_1947) >> uint(2)));
            _26[int(_1949)] = as_type<uint>(_1613);
            _1365 = _1571;
            _436 = _1805;
            _438 = _1889;
            _1369 = as_type<int>(_1883);
            _1391 = as_type<int>(_1885);
            _1395 = as_type<int>(_1887);
            _1415 = as_type<int>(_1613);
        }
        float _1951 = _1365;
        float _1953 = _436;
        float _1955 = _438;
        int _1957 = _1369;
        int _1959 = _1391;
        int _1961 = _1395;
        int _1963 = _1415;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1965 = _1315 << 4;
        int _1967 = _1965 + 1280;
        uint _1969 = uint(int(uint(_1967) >> uint(2)));
        float _1971 = as_type<float>(_26[int(_1969)]);
        int _1973 = _1965 + 1284;
        uint _1975 = uint(int(uint(_1973) >> uint(2)));
        float _1977 = as_type<float>(_26[int(_1975)]);
        int _1979 = _1965 + 1288;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        float _1983 = as_type<float>(_26[int(_1981)]);
        int _1985 = _1965 + 1292;
        uint _1987 = uint(int(uint(_1985) >> uint(2)));
        float _1989 = as_type<float>(_26[int(_1987)]);
        float _1991 = 1.0 / _366;
        int _1993 = _1315 << 2;
        int _1995 = _1993 + 1024;
        uint _1997 = uint(int(uint(_1995) >> uint(2)));
        float _1999 = as_type<float>(_26[int(_1997)]);
        float _2001 = -_1989;
        float _2003 = exp2(_2001);
        float _2005 = _1999 * _1991;
        float _2007 = precise::max(_2003, _281);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1971, _1977, _1983, _2007), uint3(int3(_77, _73, int(_304))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_2005, _2005, _2005, _2005), uint3(int3(_77, _73, int(_304))));
        int _2009 = int(_304) + 4;
        bool _2011 = uint(_2009) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _286 = uint(_2009);
        _288 = _1951;
        _292 = _1957;
        _294 = _1959;
        _296 = _1961;
        _298 = _1963;
        _300 = _1953;
        _302 = _1955;
        if (_2011)
        {
            _2013 = true;
            if (_2013)
            {
                break;
            }
        }
    } while (true);
    _2013 = false;
}

