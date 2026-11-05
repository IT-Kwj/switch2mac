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
    bool _3521 = false;
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
    float _193 = _173;
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
        _193 = _209;
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
    float _304 = 0.0;
    float _306 = 0.0;
    int _308 = 0;
    int _310 = 0;
    float _312 = 0.0;
    float _314 = 0.0;
    float _316 = 0.0;
    do
    {
        uint _318 = _294;
        float _320 = _277;
        float _322 = _296;
        float _324 = _298;
        float _326 = _300;
        float _328 = _302;
        float _330 = _304;
        float _332 = _306;
        int _334 = _308;
        int _336 = _310;
        float _338 = _312;
        float _340 = _314;
        float _342 = _316;
        float _344 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _346 = log2(_344);
        float _348 = float(_318);
        float _350 = _275 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _352 = int(_318) + 1;
        float _354 = float(uint(_352));
        float _356 = _346 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _358 = _348 * _356;
        float _360 = _354 * _356;
        float _362 = exp2(_358);
        float _364 = exp2(_360);
        float _366 = _362 + (-1.0);
        float _368 = _366 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _370 = _364 + (-1.0);
        float _372 = _368 * _350;
        float _374 = -_368;
        float _376 = fma(_370, (*spvDescriptorSet0.cp_c3)._m0[8].z, _374);
        float _378 = fma(_155, _372, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _380 = fma(_159, _372, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _382 = _275 * _376;
        float _384 = _382 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _386 = _384 * 0.25;
        float _388 = _372 + _386;
        float _390 = fma(_157, _372, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _392 = fma(_155, _386, _378);
        float _394 = fma(_159, _386, _380);
        float _396 = -_285;
        float _398 = _388 * _396;
        float _400 = fma(_157, _386, _390);
        float _402 = -_398;
        float _404 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _406 = _402 + _404;
        float _408 = -_398;
        float _410 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _412 = _408 + _410;
        float _414 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[2].x, _392);
        float _416 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[2].y, _394);
        float _418 = _406 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _420 = precise::clamp(_418, 0.0, 1.0);
        float _422 = _412 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _424 = precise::clamp(_422, 0.0, 1.0);
        float _426 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[2].z, _400);
        bool _428 = _420 != 1.0;
        bool _430 = isnan(_420);
        bool _432 = _428 || _430;
        bool _434 = isnan(1.0);
        bool _436 = _432 || _434;
        bool _438 = _424 != 1.0;
        bool _440 = isnan(_424);
        bool _442 = _438 || _440;
        bool _444 = isnan(1.0);
        bool _446 = _442 || _444;
        float _448 = _324;
        float _450 = _320;
        float _452 = _322;
        float _454 = _330;
        float _456 = _326;
        float _458 = _328;
        float _460 = _380;
        float _462 = _340;
        float _464 = _342;
        if (!_436)
        {
            _448 = 1.0;
        }
        float _466 = _448;
        bool _468 = !_436;
        float _470 = _466;
        if (!_468)
        {
            float _472 = -_398;
            bool _474 = _472 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _476 = -_398;
            bool _478 = _476 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _480 = !_474;
            int _482 = _480 ? 0 : 1;
            int _484 = 2;
            if (!_474)
            {
                _484 = 1;
            }
            int _486 = _484;
            int _488 = _486;
            if (!_478)
            {
                _488 = _482;
            }
            int _490 = _488;
            int _492 = _490 << 6;
            float _494 = float(_490);
            int _496 = _492 + 304;
            uint _498 = uint(int(uint(_496) >> uint(2)));
            uint _500 = uint(int(uint(int(_498)) >> uint(2)));
            int _502 = int(_498) & 3;
            float _504 = (*spvDescriptorSet0.cp_c3)._m0[int(_500)][_502];
            int _506 = int(_498) + 1;
            uint _508 = uint(int(uint(_506) >> uint(2)));
            int _510 = _506 & 3;
            float _512 = (*spvDescriptorSet0.cp_c3)._m0[int(_508)][_510];
            int _514 = _492 + 312;
            uint _516 = uint(int(uint(_514) >> uint(2)));
            uint _518 = uint(int(uint(int(_516)) >> uint(2)));
            int _520 = int(_516) & 3;
            float _522 = (*spvDescriptorSet0.cp_c3)._m0[int(_518)][_520];
            int _524 = int(_516) + 1;
            uint _526 = uint(int(uint(_524) >> uint(2)));
            int _528 = _524 & 3;
            float _530 = (*spvDescriptorSet0.cp_c3)._m0[int(_526)][_528];
            int _532 = _492 + 256;
            uint _534 = uint(int(uint(_532) >> uint(2)));
            uint _536 = uint(int(uint(int(_534)) >> uint(2)));
            int _538 = int(_534) & 3;
            float _540 = (*spvDescriptorSet0.cp_c3)._m0[int(_536)][_538];
            int _542 = int(_534) + 1;
            uint _544 = uint(int(uint(_542) >> uint(2)));
            int _546 = _542 & 3;
            float _548 = (*spvDescriptorSet0.cp_c3)._m0[int(_544)][_546];
            int _550 = _492 + 272;
            uint _552 = uint(int(uint(_550) >> uint(2)));
            uint _554 = uint(int(uint(int(_552)) >> uint(2)));
            int _556 = int(_552) & 3;
            float _558 = (*spvDescriptorSet0.cp_c3)._m0[int(_554)][_556];
            int _560 = int(_552) + 1;
            uint _562 = uint(int(uint(_560) >> uint(2)));
            int _564 = _560 & 3;
            float _566 = (*spvDescriptorSet0.cp_c3)._m0[int(_562)][_564];
            int _568 = _492 + 288;
            uint _570 = uint(int(uint(_568) >> uint(2)));
            uint _572 = uint(int(uint(int(_570)) >> uint(2)));
            int _574 = int(_570) & 3;
            float _576 = (*spvDescriptorSet0.cp_c3)._m0[int(_572)][_574];
            int _578 = int(_570) + 1;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            int _582 = _578 & 3;
            float _584 = (*spvDescriptorSet0.cp_c3)._m0[int(_580)][_582];
            int _586 = _492 + 264;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            uint _590 = uint(int(uint(int(_588)) >> uint(2)));
            int _592 = int(_588) & 3;
            float _594 = (*spvDescriptorSet0.cp_c3)._m0[int(_590)][_592];
            int _596 = int(_588) + 1;
            uint _598 = uint(int(uint(_596) >> uint(2)));
            int _600 = _596 & 3;
            float _602 = (*spvDescriptorSet0.cp_c3)._m0[int(_598)][_600];
            int _604 = _492 + 280;
            uint _606 = uint(int(uint(_604) >> uint(2)));
            uint _608 = uint(int(uint(int(_606)) >> uint(2)));
            int _610 = int(_606) & 3;
            float _612 = (*spvDescriptorSet0.cp_c3)._m0[int(_608)][_610];
            int _614 = int(_606) + 1;
            uint _616 = uint(int(uint(_614) >> uint(2)));
            int _618 = _614 & 3;
            float _620 = (*spvDescriptorSet0.cp_c3)._m0[int(_616)][_618];
            float _622 = _416 * _512;
            float _624 = fma(_414, _504, _622);
            int _626 = _492 + 296;
            uint _628 = uint(int(uint(_626) >> uint(2)));
            uint _630 = uint(int(uint(int(_628)) >> uint(2)));
            int _632 = int(_628) & 3;
            float _634 = (*spvDescriptorSet0.cp_c3)._m0[int(_630)][_632];
            int _636 = int(_628) + 1;
            uint _638 = uint(int(uint(_636) >> uint(2)));
            int _640 = _636 & 3;
            float _642 = (*spvDescriptorSet0.cp_c3)._m0[int(_638)][_640];
            float _644 = fma(_426, _522, _624);
            float _646 = _644 + _530;
            float _648 = _416 * _548;
            float _650 = 1.0 / _646;
            float _652 = fma(_414, _540, _648);
            float _654 = _416 * _566;
            float _656 = rint(_494);
            float _658 = precise::max(_656, 0.0);
            uint _660 = uint(_658);
            uint _662 = clamp(_660, 0u, 65535u);
            float _664 = fma(_414, _558, _654);
            float _666 = _416 * _584;
            float _668 = fma(_414, _576, _666);
            float _670 = fma(_426, _594, _652);
            float _672 = _670 + _602;
            float _674 = fma(_426, _612, _664);
            float _676 = _672 * _650;
            float _678 = _674 + _620;
            float _680 = fma(_426, _634, _668);
            float _682 = _678 * _650;
            float _684 = _680 + _642;
            float _686 = _684 * _650;
            float _688 = precise::clamp(_686, 0.0, 1.0);
            float3 _4456 = float3(_676, _682, float(int(_662)));
            float3 _4460 = select(_4456, float3(0.0), isnan(_4456));
            float _690 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _4460.xy, uint(rint(_4460.z)), _688, level(0.0));
            float _692 = -_690;
            float _694 = _692 + 1.0;
            float _696 = fma(_694, _420, _690);
            _450 = _676;
            _452 = _688;
            _470 = _696;
            _454 = _494;
            _456 = _594;
            _458 = _620;
        }
        float _698 = _450;
        float _700 = _452;
        float _702 = _470;
        float _704 = _454;
        float _706 = _456;
        float _708 = _458;
        float _710 = _704;
        float _712 = _700;
        float _714 = _698;
        float _716 = _706;
        float _718 = _702;
        float _720 = _708;
        if (!_446)
        {
            _710 = 1.0;
        }
        float _722 = _710;
        bool _724 = !_446;
        float _726 = _722;
        if (!_724)
        {
            float _728 = _416 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _730 = _416 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _732 = fma(_414, (*spvDescriptorSet0.cp_c3)._m0[130].x, _728);
            float _734 = fma(_414, (*spvDescriptorSet0.cp_c3)._m0[131].x, _730);
            float _736 = fma(_426, (*spvDescriptorSet0.cp_c3)._m0[130].z, _732);
            float _738 = fma(_426, (*spvDescriptorSet0.cp_c3)._m0[131].z, _734);
            float _740 = _736 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _742 = _738 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _744 = trunc(_740);
            int _746 = int(_744);
            float _748 = trunc(_742);
            int _750 = int(_748);
            int _752 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _754 = _746 + _752;
            int _756 = _754 + 1;
            bool _758 = _756 >= 0;
            int _760 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _762 = _750 + _760;
            int _764 = _762 + 1;
            bool _766 = _756 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _768 = !_758;
            bool _770 = _766 || _768;
            bool _772 = _764 < 0;
            bool _774 = _772 || _770;
            bool _776 = _764 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _778 = _776 || _774;
            float _780 = as_type<float>(_764);
            _716 = _740;
            if (_778)
            {
                _712 = 1.0;
            }
            float _782 = _712;
            float _784 = _782;
            if (!_778)
            {
                int _786 = _764 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _788 = _786 + _756;
                float _790 = floor(_740);
                int _792 = _788 << 2;
                uint _794 = uint(int(uint(_788) >> uint(2)));
                int _796 = 12 & _792;
                float _798 = floor(_742);
                int _800 = _788 << 4;
                int _802 = _800 + 2112;
                int _804 = int(_794) << 4;
                int _806 = _804 + _796;
                uint _808 = uint(int(uint(_802) >> uint(2)));
                uint _810 = uint(int(uint(int(_808)) >> uint(2)));
                int _812 = int(_808) & 3;
                float _814 = (*spvDescriptorSet0.cp_c3)._m0[int(_810)][_812];
                int _816 = int(_808) + 1;
                uint _818 = uint(int(uint(_816) >> uint(2)));
                int _820 = _816 & 3;
                float _822 = (*spvDescriptorSet0.cp_c3)._m0[int(_818)][_820];
                float _824 = -_790;
                float _826 = _824 + _740;
                int _828 = _806 + 464;
                uint _830 = uint(int(uint(_828) >> uint(2)));
                uint _832 = uint(int(uint(int(_830)) >> uint(2)));
                int _834 = int(_830) & 3;
                float _836 = (*spvDescriptorSet0.cp_c3)._m0[int(_832)][_834];
                int _838 = _802 + 8;
                uint _840 = uint(int(uint(_838) >> uint(2)));
                uint _842 = uint(int(uint(int(_840)) >> uint(2)));
                int _844 = int(_840) & 3;
                float _846 = (*spvDescriptorSet0.cp_c3)._m0[int(_842)][_844];
                int _848 = int(_840) + 1;
                uint _850 = uint(int(uint(_848) >> uint(2)));
                int _852 = _848 & 3;
                float _854 = (*spvDescriptorSet0.cp_c3)._m0[int(_850)][_852];
                float _856 = _416 * _822;
                float _858 = fma(_414, _814, _856);
                float _860 = rint(_836);
                float _862 = precise::max(_860, 0.0);
                uint _864 = uint(_862);
                uint _866 = clamp(_864, 0u, 65535u);
                float _868 = fma(_426, _846, _858);
                float _870 = -_798;
                float _872 = _870 + _742;
                float _874 = _868 + _854;
                float _876 = precise::clamp(_874, 0.0, 1.0);
                float3 _4748 = float3(_826, _872, float(int(_866)));
                float3 _4750 = select(_4748, float3(0.0), isnan(_4748));
                float _878 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _4750.xy, uint(rint(_4750.z)), _876, level(0.0));
                _784 = _878;
                _780 = _822;
            }
            float _880 = _784;
            float _882 = _780;
            float _884 = -_880;
            float _886 = _884 + 1.0;
            float _888 = fma(_886, _424, _880);
            _726 = _888;
            _714 = _882;
        }
        float _890 = _726;
        float _892 = _714;
        float _894 = _716;
        float _896 = -_398;
        float _898 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _900 = _896 + _898;
        float _902 = -_398;
        float _904 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _906 = _902 + _904;
        float _908 = precise::min(_702, _890);
        float _910 = _900 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _912 = precise::clamp(_910, 0.0, 1.0);
        float _914 = _906 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _916 = precise::clamp(_914, 0.0, 1.0);
        float _918 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[3].x, _392);
        float _920 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[3].y, _394);
        float _922 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[3].z, _400);
        bool _924 = _912 != 1.0;
        bool _926 = isnan(_912);
        bool _928 = _924 || _926;
        bool _930 = isnan(1.0);
        bool _932 = _928 || _930;
        bool _934 = _916 != 1.0;
        bool _936 = isnan(_916);
        bool _938 = _934 || _936;
        bool _940 = isnan(1.0);
        bool _942 = _938 || _940;
        float _944 = _892;
        float _946 = _894;
        if (!_932)
        {
            _718 = 1.0;
        }
        float _948 = _718;
        bool _950 = !_932;
        float _952 = _948;
        if (!_950)
        {
            float _954 = -_398;
            bool _956 = _954 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _958 = -_398;
            bool _960 = _958 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _962 = !_956;
            int _964 = _962 ? 0 : 1;
            int _966 = 2;
            if (!_956)
            {
                _966 = 1;
            }
            int _968 = _966;
            int _970 = _968;
            if (!_960)
            {
                _970 = _964;
            }
            int _972 = _970;
            int _974 = _972 << 6;
            float _976 = float(_972);
            int _978 = _974 + 304;
            uint _980 = uint(int(uint(_978) >> uint(2)));
            uint _982 = uint(int(uint(int(_980)) >> uint(2)));
            int _984 = int(_980) & 3;
            float _986 = (*spvDescriptorSet0.cp_c3)._m0[int(_982)][_984];
            int _988 = int(_980) + 1;
            uint _990 = uint(int(uint(_988) >> uint(2)));
            int _992 = _988 & 3;
            float _994 = (*spvDescriptorSet0.cp_c3)._m0[int(_990)][_992];
            int _996 = _974 + 312;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
            int _1002 = int(_998) & 3;
            float _1004 = (*spvDescriptorSet0.cp_c3)._m0[int(_1000)][_1002];
            int _1006 = int(_998) + 1;
            uint _1008 = uint(int(uint(_1006) >> uint(2)));
            int _1010 = _1006 & 3;
            float _1012 = (*spvDescriptorSet0.cp_c3)._m0[int(_1008)][_1010];
            int _1014 = _974 + 256;
            uint _1016 = uint(int(uint(_1014) >> uint(2)));
            uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
            int _1020 = int(_1016) & 3;
            float _1022 = (*spvDescriptorSet0.cp_c3)._m0[int(_1018)][_1020];
            int _1024 = int(_1016) + 1;
            uint _1026 = uint(int(uint(_1024) >> uint(2)));
            int _1028 = _1024 & 3;
            float _1030 = (*spvDescriptorSet0.cp_c3)._m0[int(_1026)][_1028];
            int _1032 = _974 + 272;
            uint _1034 = uint(int(uint(_1032) >> uint(2)));
            uint _1036 = uint(int(uint(int(_1034)) >> uint(2)));
            int _1038 = int(_1034) & 3;
            float _1040 = (*spvDescriptorSet0.cp_c3)._m0[int(_1036)][_1038];
            int _1042 = int(_1034) + 1;
            uint _1044 = uint(int(uint(_1042) >> uint(2)));
            int _1046 = _1042 & 3;
            float _1048 = (*spvDescriptorSet0.cp_c3)._m0[int(_1044)][_1046];
            int _1050 = _974 + 288;
            uint _1052 = uint(int(uint(_1050) >> uint(2)));
            uint _1054 = uint(int(uint(int(_1052)) >> uint(2)));
            int _1056 = int(_1052) & 3;
            float _1058 = (*spvDescriptorSet0.cp_c3)._m0[int(_1054)][_1056];
            int _1060 = int(_1052) + 1;
            uint _1062 = uint(int(uint(_1060) >> uint(2)));
            int _1064 = _1060 & 3;
            float _1066 = (*spvDescriptorSet0.cp_c3)._m0[int(_1062)][_1064];
            int _1068 = _974 + 264;
            uint _1070 = uint(int(uint(_1068) >> uint(2)));
            uint _1072 = uint(int(uint(int(_1070)) >> uint(2)));
            int _1074 = int(_1070) & 3;
            float _1076 = (*spvDescriptorSet0.cp_c3)._m0[int(_1072)][_1074];
            int _1078 = int(_1070) + 1;
            uint _1080 = uint(int(uint(_1078) >> uint(2)));
            int _1082 = _1078 & 3;
            float _1084 = (*spvDescriptorSet0.cp_c3)._m0[int(_1080)][_1082];
            int _1086 = _974 + 280;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
            int _1092 = int(_1088) & 3;
            float _1094 = (*spvDescriptorSet0.cp_c3)._m0[int(_1090)][_1092];
            int _1096 = int(_1088) + 1;
            uint _1098 = uint(int(uint(_1096) >> uint(2)));
            int _1100 = _1096 & 3;
            float _1102 = (*spvDescriptorSet0.cp_c3)._m0[int(_1098)][_1100];
            float _1104 = _920 * _994;
            float _1106 = fma(_918, _986, _1104);
            int _1108 = _974 + 296;
            uint _1110 = uint(int(uint(_1108) >> uint(2)));
            uint _1112 = uint(int(uint(int(_1110)) >> uint(2)));
            int _1114 = int(_1110) & 3;
            float _1116 = (*spvDescriptorSet0.cp_c3)._m0[int(_1112)][_1114];
            int _1118 = int(_1110) + 1;
            uint _1120 = uint(int(uint(_1118) >> uint(2)));
            int _1122 = _1118 & 3;
            float _1124 = (*spvDescriptorSet0.cp_c3)._m0[int(_1120)][_1122];
            float _1126 = fma(_922, _1004, _1106);
            float _1128 = _1126 + _1012;
            float _1130 = _920 * _1030;
            float _1132 = 1.0 / _1128;
            float _1134 = fma(_918, _1022, _1130);
            float _1136 = _920 * _1048;
            float _1138 = rint(_976);
            float _1140 = precise::max(_1138, 0.0);
            uint _1142 = uint(_1140);
            uint _1144 = clamp(_1142, 0u, 65535u);
            float _1146 = fma(_918, _1040, _1136);
            float _1148 = _920 * _1066;
            float _1150 = fma(_918, _1058, _1148);
            float _1152 = fma(_922, _1076, _1134);
            float _1154 = _1152 + _1084;
            float _1156 = fma(_922, _1094, _1146);
            float _1158 = _1154 * _1132;
            float _1160 = _1156 + _1102;
            float _1162 = fma(_922, _1116, _1150);
            float _1164 = _1160 * _1132;
            float _1166 = _1162 + _1124;
            float _1168 = _1166 * _1132;
            float _1170 = precise::clamp(_1168, 0.0, 1.0);
            float3 _5208 = float3(_1158, _1164, float(int(_1144)));
            float3 _5210 = select(_5208, float3(0.0), isnan(_5208));
            float _1172 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _5210.xy, uint(rint(_5210.z)), _1170, level(0.0));
            float _1174 = -_1172;
            float _1176 = _1174 + 1.0;
            float _1178 = fma(_912, _1176, _1172);
            _944 = _1172;
            _952 = _1178;
            _946 = _1076;
            _720 = _1102;
        }
        float _1180 = _944;
        float _1182 = _952;
        float _1184 = _946;
        float _1186 = _720;
        float _1188 = precise::min(_908, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1190 = _1180;
        float _1192 = _1184;
        float _1194 = _1186;
        if (!_942)
        {
            _1190 = 1.0;
        }
        float _1196 = _1190;
        bool _1198 = !_942;
        float _1200 = _1196;
        if (!_1198)
        {
            float _1202 = _920 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1204 = _920 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1206 = fma(_918, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1202);
            float _1208 = fma(_918, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1204);
            float _1210 = fma(_922, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1206);
            float _1212 = fma(_922, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1208);
            float _1214 = _1210 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1216 = _1212 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1218 = trunc(_1214);
            int _1220 = int(_1218);
            float _1222 = trunc(_1216);
            int _1224 = int(_1222);
            int _1226 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1228 = _1220 + _1226;
            int _1230 = _1228 + 1;
            bool _1232 = _1230 >= 0;
            int _1234 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1236 = _1224 + _1234;
            int _1238 = _1236 + 1;
            bool _1240 = _1230 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1242 = !_1232;
            bool _1244 = _1240 || _1242;
            bool _1246 = _1238 < 0;
            bool _1248 = _1246 || _1244;
            bool _1250 = _1238 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1252 = _1250 || _1248;
            float _1254 = _1212;
            _1192 = _1214;
            if (_1252)
            {
                _1254 = 1.0;
            }
            float _1256 = _1254;
            float _1258 = _1256;
            if (!_1252)
            {
                int _1260 = _1238 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1262 = _1260 + _1230;
                float _1264 = floor(_1216);
                int _1266 = _1262 << 2;
                uint _1268 = uint(int(uint(_1262) >> uint(2)));
                int _1270 = 12 & _1266;
                float _1272 = floor(_1214);
                int _1274 = _1262 << 4;
                int _1276 = _1274 + 2112;
                int _1278 = int(_1268) << 4;
                int _1280 = _1278 + _1270;
                uint _1282 = uint(int(uint(_1276) >> uint(2)));
                uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
                int _1286 = int(_1282) & 3;
                float _1288 = (*spvDescriptorSet0.cp_c3)._m0[int(_1284)][_1286];
                int _1290 = int(_1282) + 1;
                uint _1292 = uint(int(uint(_1290) >> uint(2)));
                int _1294 = _1290 & 3;
                float _1296 = (*spvDescriptorSet0.cp_c3)._m0[int(_1292)][_1294];
                int _1298 = _1280 + 464;
                uint _1300 = uint(int(uint(_1298) >> uint(2)));
                uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
                int _1304 = int(_1300) & 3;
                float _1306 = (*spvDescriptorSet0.cp_c3)._m0[int(_1302)][_1304];
                float _1308 = -_1272;
                float _1310 = _1214 + _1308;
                int _1312 = _1276 + 8;
                uint _1314 = uint(int(uint(_1312) >> uint(2)));
                uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
                int _1318 = int(_1314) & 3;
                float _1320 = (*spvDescriptorSet0.cp_c3)._m0[int(_1316)][_1318];
                int _1322 = int(_1314) + 1;
                uint _1324 = uint(int(uint(_1322) >> uint(2)));
                int _1326 = _1322 & 3;
                float _1328 = (*spvDescriptorSet0.cp_c3)._m0[int(_1324)][_1326];
                float _1330 = _920 * _1296;
                float _1332 = fma(_918, _1288, _1330);
                float _1334 = rint(_1306);
                float _1336 = precise::max(_1334, 0.0);
                uint _1338 = uint(_1336);
                uint _1340 = clamp(_1338, 0u, 65535u);
                float _1342 = fma(_922, _1320, _1332);
                float _1344 = -_1264;
                float _1346 = _1216 + _1344;
                float _1348 = _1342 + _1328;
                float _1350 = precise::clamp(_1348, 0.0, 1.0);
                float3 _5489 = float3(_1310, _1346, float(int(_1340)));
                float3 _5491 = select(_5489, float3(0.0), isnan(_5489));
                float _1352 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _5491.xy, uint(rint(_5491.z)), _1350, level(0.0));
                _1258 = _1352;
            }
            float _1354 = _1258;
            float _1356 = -_1354;
            float _1358 = _1356 + 1.0;
            float _1360 = fma(_916, _1358, _1354);
            _1200 = _1360;
        }
        float _1362 = _1200;
        float _1364 = _1192;
        float _1366 = -_398;
        float _1368 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _1370 = _1366 + _1368;
        float _1372 = -_398;
        float _1374 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _1376 = _1372 + _1374;
        float _1378 = precise::min(_1362, _1182);
        float _1380 = _1370 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _1382 = precise::clamp(_1380, 0.0, 1.0);
        float _1384 = _1376 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _1386 = precise::clamp(_1384, 0.0, 1.0);
        float _1388 = precise::min(_1378, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1390 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[4].x, _392);
        float _1392 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[4].y, _394);
        bool _1394 = _1382 != 1.0;
        bool _1396 = isnan(_1382);
        bool _1398 = _1394 || _1396;
        bool _1400 = isnan(1.0);
        bool _1402 = _1398 || _1400;
        float _1404 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[4].z, _400);
        bool _1406 = _1386 != 1.0;
        bool _1408 = isnan(_1386);
        bool _1410 = _1406 || _1408;
        bool _1412 = isnan(1.0);
        bool _1414 = _1410 || _1412;
        float _1416 = _1378;
        float _1418 = _1362;
        float _1420 = _1364;
        if (!_1402)
        {
            _1416 = 1.0;
        }
        float _1422 = _1416;
        bool _1424 = !_1402;
        float _1426 = _1422;
        if (!_1424)
        {
            float _1428 = -_398;
            bool _1430 = _1428 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _1432 = -_398;
            bool _1434 = _1432 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _1436 = !_1430;
            int _1438 = _1436 ? 0 : 1;
            int _1440 = 2;
            if (!_1430)
            {
                _1440 = 1;
            }
            int _1442 = _1440;
            int _1444 = _1442;
            if (!_1434)
            {
                _1444 = _1438;
            }
            int _1446 = _1444;
            int _1448 = _1446 << 6;
            float _1450 = float(_1446);
            int _1452 = _1448 + 304;
            uint _1454 = uint(int(uint(_1452) >> uint(2)));
            uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
            int _1458 = int(_1454) & 3;
            float _1460 = (*spvDescriptorSet0.cp_c3)._m0[int(_1456)][_1458];
            int _1462 = int(_1454) + 1;
            uint _1464 = uint(int(uint(_1462) >> uint(2)));
            int _1466 = _1462 & 3;
            float _1468 = (*spvDescriptorSet0.cp_c3)._m0[int(_1464)][_1466];
            int _1470 = _1448 + 312;
            uint _1472 = uint(int(uint(_1470) >> uint(2)));
            uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
            int _1476 = int(_1472) & 3;
            float _1478 = (*spvDescriptorSet0.cp_c3)._m0[int(_1474)][_1476];
            int _1480 = int(_1472) + 1;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            int _1484 = _1480 & 3;
            float _1486 = (*spvDescriptorSet0.cp_c3)._m0[int(_1482)][_1484];
            int _1488 = _1448 + 256;
            uint _1490 = uint(int(uint(_1488) >> uint(2)));
            uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
            int _1494 = int(_1490) & 3;
            float _1496 = (*spvDescriptorSet0.cp_c3)._m0[int(_1492)][_1494];
            int _1498 = int(_1490) + 1;
            uint _1500 = uint(int(uint(_1498) >> uint(2)));
            int _1502 = _1498 & 3;
            float _1504 = (*spvDescriptorSet0.cp_c3)._m0[int(_1500)][_1502];
            int _1506 = _1448 + 272;
            uint _1508 = uint(int(uint(_1506) >> uint(2)));
            uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
            int _1512 = int(_1508) & 3;
            float _1514 = (*spvDescriptorSet0.cp_c3)._m0[int(_1510)][_1512];
            int _1516 = int(_1508) + 1;
            uint _1518 = uint(int(uint(_1516) >> uint(2)));
            int _1520 = _1516 & 3;
            float _1522 = (*spvDescriptorSet0.cp_c3)._m0[int(_1518)][_1520];
            int _1524 = _1448 + 288;
            uint _1526 = uint(int(uint(_1524) >> uint(2)));
            uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
            int _1530 = int(_1526) & 3;
            float _1532 = (*spvDescriptorSet0.cp_c3)._m0[int(_1528)][_1530];
            int _1534 = int(_1526) + 1;
            uint _1536 = uint(int(uint(_1534) >> uint(2)));
            int _1538 = _1534 & 3;
            float _1540 = (*spvDescriptorSet0.cp_c3)._m0[int(_1536)][_1538];
            int _1542 = _1448 + 264;
            uint _1544 = uint(int(uint(_1542) >> uint(2)));
            uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
            int _1548 = int(_1544) & 3;
            float _1550 = (*spvDescriptorSet0.cp_c3)._m0[int(_1546)][_1548];
            int _1552 = int(_1544) + 1;
            uint _1554 = uint(int(uint(_1552) >> uint(2)));
            int _1556 = _1552 & 3;
            float _1558 = (*spvDescriptorSet0.cp_c3)._m0[int(_1554)][_1556];
            int _1560 = _1448 + 280;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            uint _1564 = uint(int(uint(int(_1562)) >> uint(2)));
            int _1566 = int(_1562) & 3;
            float _1568 = (*spvDescriptorSet0.cp_c3)._m0[int(_1564)][_1566];
            int _1570 = int(_1562) + 1;
            uint _1572 = uint(int(uint(_1570) >> uint(2)));
            int _1574 = _1570 & 3;
            float _1576 = (*spvDescriptorSet0.cp_c3)._m0[int(_1572)][_1574];
            float _1578 = _1392 * _1468;
            float _1580 = fma(_1390, _1460, _1578);
            int _1582 = _1448 + 296;
            uint _1584 = uint(int(uint(_1582) >> uint(2)));
            uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
            int _1588 = int(_1584) & 3;
            float _1590 = (*spvDescriptorSet0.cp_c3)._m0[int(_1586)][_1588];
            int _1592 = int(_1584) + 1;
            uint _1594 = uint(int(uint(_1592) >> uint(2)));
            int _1596 = _1592 & 3;
            float _1598 = (*spvDescriptorSet0.cp_c3)._m0[int(_1594)][_1596];
            float _1600 = fma(_1404, _1478, _1580);
            float _1602 = _1600 + _1486;
            float _1604 = _1392 * _1504;
            float _1606 = 1.0 / _1602;
            float _1608 = fma(_1390, _1496, _1604);
            float _1610 = _1392 * _1522;
            float _1612 = rint(_1450);
            float _1614 = precise::max(_1612, 0.0);
            uint _1616 = uint(_1614);
            uint _1618 = clamp(_1616, 0u, 65535u);
            float _1620 = fma(_1390, _1514, _1610);
            float _1622 = _1392 * _1540;
            float _1624 = fma(_1390, _1532, _1622);
            float _1626 = fma(_1404, _1550, _1608);
            float _1628 = _1626 + _1558;
            float _1630 = fma(_1404, _1568, _1620);
            float _1632 = _1628 * _1606;
            float _1634 = _1630 + _1576;
            float _1636 = fma(_1404, _1590, _1624);
            float _1638 = _1634 * _1606;
            float _1640 = _1636 + _1598;
            float _1642 = _1640 * _1606;
            float _1644 = precise::clamp(_1642, 0.0, 1.0);
            float3 _5950 = float3(_1632, _1638, float(int(_1618)));
            float3 _5952 = select(_5950, float3(0.0), isnan(_5950));
            float _1646 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _5952.xy, uint(rint(_5952.z)), _1644, level(0.0));
            float _1648 = -_1646;
            float _1650 = _1648 + 1.0;
            float _1652 = fma(_1382, _1650, _1646);
            _1418 = _1632;
            _1426 = _1652;
            _1420 = _1550;
            _1194 = _1576;
        }
        float _1654 = _1418;
        float _1656 = _1426;
        float _1658 = _1420;
        float _1660 = _1194;
        float _1662 = _1188 + _1388;
        float _1664 = _1654;
        float _1666 = _1658;
        float _1668 = _1660;
        if (!_1414)
        {
            _1664 = 1.0;
        }
        float _1670 = _1664;
        bool _1672 = !_1414;
        float _1674 = _1670;
        if (!_1672)
        {
            float _1676 = _1392 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _1678 = _1392 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _1680 = fma(_1390, (*spvDescriptorSet0.cp_c3)._m0[130].x, _1676);
            float _1682 = fma(_1390, (*spvDescriptorSet0.cp_c3)._m0[131].x, _1678);
            float _1684 = fma(_1404, (*spvDescriptorSet0.cp_c3)._m0[130].z, _1680);
            float _1686 = fma(_1404, (*spvDescriptorSet0.cp_c3)._m0[131].z, _1682);
            float _1688 = _1684 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _1690 = _1686 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _1692 = trunc(_1688);
            int _1694 = int(_1692);
            float _1696 = trunc(_1690);
            int _1698 = int(_1696);
            int _1700 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _1702 = _1694 + _1700;
            int _1704 = _1702 + 1;
            bool _1706 = _1704 >= 0;
            int _1708 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _1710 = _1698 + _1708;
            int _1712 = _1710 + 1;
            bool _1714 = _1704 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1716 = !_1706;
            bool _1718 = _1714 || _1716;
            bool _1720 = _1712 < 0;
            bool _1722 = _1720 || _1718;
            bool _1724 = _1712 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _1726 = _1724 || _1722;
            float _1728 = _1686;
            _1666 = _1688;
            if (_1726)
            {
                _1728 = 1.0;
            }
            float _1730 = _1728;
            float _1732 = _1730;
            if (!_1726)
            {
                int _1734 = _1712 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _1736 = _1734 + _1704;
                float _1738 = floor(_1690);
                int _1740 = _1736 << 2;
                uint _1742 = uint(int(uint(_1736) >> uint(2)));
                int _1744 = 12 & _1740;
                float _1746 = floor(_1688);
                int _1748 = _1736 << 4;
                int _1750 = _1748 + 2112;
                int _1752 = int(_1742) << 4;
                int _1754 = _1752 + _1744;
                uint _1756 = uint(int(uint(_1750) >> uint(2)));
                uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
                int _1760 = int(_1756) & 3;
                float _1762 = (*spvDescriptorSet0.cp_c3)._m0[int(_1758)][_1760];
                int _1764 = int(_1756) + 1;
                uint _1766 = uint(int(uint(_1764) >> uint(2)));
                int _1768 = _1764 & 3;
                float _1770 = (*spvDescriptorSet0.cp_c3)._m0[int(_1766)][_1768];
                int _1772 = _1754 + 464;
                uint _1774 = uint(int(uint(_1772) >> uint(2)));
                uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
                int _1778 = int(_1774) & 3;
                float _1780 = (*spvDescriptorSet0.cp_c3)._m0[int(_1776)][_1778];
                float _1782 = -_1746;
                float _1784 = _1688 + _1782;
                int _1786 = _1750 + 8;
                uint _1788 = uint(int(uint(_1786) >> uint(2)));
                uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
                int _1792 = int(_1788) & 3;
                float _1794 = (*spvDescriptorSet0.cp_c3)._m0[int(_1790)][_1792];
                int _1796 = int(_1788) + 1;
                uint _1798 = uint(int(uint(_1796) >> uint(2)));
                int _1800 = _1796 & 3;
                float _1802 = (*spvDescriptorSet0.cp_c3)._m0[int(_1798)][_1800];
                float _1804 = _1392 * _1770;
                float _1806 = fma(_1390, _1762, _1804);
                float _1808 = rint(_1780);
                float _1810 = precise::max(_1808, 0.0);
                uint _1812 = uint(_1810);
                uint _1814 = clamp(_1812, 0u, 65535u);
                float _1816 = fma(_1404, _1794, _1806);
                float _1818 = -_1738;
                float _1820 = _1690 + _1818;
                float _1822 = _1816 + _1802;
                float _1824 = precise::clamp(_1822, 0.0, 1.0);
                float3 _6230 = float3(_1784, _1820, float(int(_1814)));
                float3 _6232 = select(_6230, float3(0.0), isnan(_6230));
                float _1826 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _6232.xy, uint(rint(_6232.z)), _1824, level(0.0));
                _1732 = _1826;
            }
            float _1828 = _1732;
            float _1830 = -_1828;
            float _1832 = _1830 + 1.0;
            float _1834 = fma(_1386, _1832, _1828);
            _1674 = _1834;
        }
        float _1836 = _1674;
        float _1838 = _1666;
        float _1840 = -_398;
        float _1842 = -(*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _1844 = _1840 + _1842;
        float _1846 = -_398;
        float _1848 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        float _1850 = _1846 + _1848;
        float _1852 = precise::min(_1836, _1656);
        float _1854 = _1844 * (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _1856 = precise::clamp(_1854, 0.0, 1.0);
        float _1858 = _1850 * (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _1860 = precise::clamp(_1858, 0.0, 1.0);
        float _1862 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[5].x, _392);
        float _1864 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[5].y, _394);
        float _1866 = fma(_398, (*spvDescriptorSet0.cp_c4)._m0[5].z, _400);
        bool _1868 = _1856 != 1.0;
        bool _1870 = isnan(_1856);
        bool _1872 = _1868 || _1870;
        bool _1874 = isnan(1.0);
        bool _1876 = _1872 || _1874;
        bool _1878 = _1860 != 1.0;
        bool _1880 = isnan(_1860);
        bool _1882 = _1878 || _1880;
        bool _1884 = isnan(1.0);
        bool _1886 = _1882 || _1884;
        float _1888 = precise::min(_1852, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _1890 = _1838;
        if (!_1876)
        {
            _1890 = 1.0;
        }
        float _1892 = _1890;
        bool _1894 = !_1876;
        float _1896 = _1892;
        if (!_1894)
        {
            float _1898 = -_398;
            bool _1900 = _1898 > (*spvDescriptorSet0.cp_c3)._m0[28].y;
            float _1902 = -_398;
            bool _1904 = _1902 > (*spvDescriptorSet0.cp_c3)._m0[28].x;
            bool _1906 = !_1900;
            int _1908 = _1906 ? 0 : 1;
            int _1910 = 2;
            if (!_1900)
            {
                _1910 = 1;
            }
            int _1912 = _1910;
            int _1914 = _1912;
            if (!_1904)
            {
                _1914 = _1908;
            }
            int _1916 = _1914;
            int _1918 = _1916 << 6;
            float _1920 = float(_1916);
            int _1922 = _1918 + 304;
            uint _1924 = uint(int(uint(_1922) >> uint(2)));
            uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
            int _1928 = int(_1924) & 3;
            float _1930 = (*spvDescriptorSet0.cp_c3)._m0[int(_1926)][_1928];
            int _1932 = int(_1924) + 1;
            uint _1934 = uint(int(uint(_1932) >> uint(2)));
            int _1936 = _1932 & 3;
            float _1938 = (*spvDescriptorSet0.cp_c3)._m0[int(_1934)][_1936];
            int _1940 = _1918 + 312;
            uint _1942 = uint(int(uint(_1940) >> uint(2)));
            uint _1944 = uint(int(uint(int(_1942)) >> uint(2)));
            int _1946 = int(_1942) & 3;
            float _1948 = (*spvDescriptorSet0.cp_c3)._m0[int(_1944)][_1946];
            int _1950 = int(_1942) + 1;
            uint _1952 = uint(int(uint(_1950) >> uint(2)));
            int _1954 = _1950 & 3;
            float _1956 = (*spvDescriptorSet0.cp_c3)._m0[int(_1952)][_1954];
            int _1958 = _1918 + 256;
            uint _1960 = uint(int(uint(_1958) >> uint(2)));
            uint _1962 = uint(int(uint(int(_1960)) >> uint(2)));
            int _1964 = int(_1960) & 3;
            float _1966 = (*spvDescriptorSet0.cp_c3)._m0[int(_1962)][_1964];
            int _1968 = int(_1960) + 1;
            uint _1970 = uint(int(uint(_1968) >> uint(2)));
            int _1972 = _1968 & 3;
            float _1974 = (*spvDescriptorSet0.cp_c3)._m0[int(_1970)][_1972];
            int _1976 = _1918 + 272;
            uint _1978 = uint(int(uint(_1976) >> uint(2)));
            uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
            int _1982 = int(_1978) & 3;
            float _1984 = (*spvDescriptorSet0.cp_c3)._m0[int(_1980)][_1982];
            int _1986 = int(_1978) + 1;
            uint _1988 = uint(int(uint(_1986) >> uint(2)));
            int _1990 = _1986 & 3;
            float _1992 = (*spvDescriptorSet0.cp_c3)._m0[int(_1988)][_1990];
            int _1994 = _1918 + 288;
            uint _1996 = uint(int(uint(_1994) >> uint(2)));
            uint _1998 = uint(int(uint(int(_1996)) >> uint(2)));
            int _2000 = int(_1996) & 3;
            float _2002 = (*spvDescriptorSet0.cp_c3)._m0[int(_1998)][_2000];
            int _2004 = int(_1996) + 1;
            uint _2006 = uint(int(uint(_2004) >> uint(2)));
            int _2008 = _2004 & 3;
            float _2010 = (*spvDescriptorSet0.cp_c3)._m0[int(_2006)][_2008];
            int _2012 = _1918 + 264;
            uint _2014 = uint(int(uint(_2012) >> uint(2)));
            uint _2016 = uint(int(uint(int(_2014)) >> uint(2)));
            int _2018 = int(_2014) & 3;
            float _2020 = (*spvDescriptorSet0.cp_c3)._m0[int(_2016)][_2018];
            int _2022 = int(_2014) + 1;
            uint _2024 = uint(int(uint(_2022) >> uint(2)));
            int _2026 = _2022 & 3;
            float _2028 = (*spvDescriptorSet0.cp_c3)._m0[int(_2024)][_2026];
            int _2030 = _1918 + 280;
            uint _2032 = uint(int(uint(_2030) >> uint(2)));
            uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
            int _2036 = int(_2032) & 3;
            float _2038 = (*spvDescriptorSet0.cp_c3)._m0[int(_2034)][_2036];
            int _2040 = int(_2032) + 1;
            uint _2042 = uint(int(uint(_2040) >> uint(2)));
            int _2044 = _2040 & 3;
            float _2046 = (*spvDescriptorSet0.cp_c3)._m0[int(_2042)][_2044];
            float _2048 = _1864 * _1938;
            float _2050 = fma(_1862, _1930, _2048);
            int _2052 = _1918 + 296;
            uint _2054 = uint(int(uint(_2052) >> uint(2)));
            uint _2056 = uint(int(uint(int(_2054)) >> uint(2)));
            int _2058 = int(_2054) & 3;
            float _2060 = (*spvDescriptorSet0.cp_c3)._m0[int(_2056)][_2058];
            int _2062 = int(_2054) + 1;
            uint _2064 = uint(int(uint(_2062) >> uint(2)));
            int _2066 = _2062 & 3;
            float _2068 = (*spvDescriptorSet0.cp_c3)._m0[int(_2064)][_2066];
            float _2070 = fma(_1866, _1948, _2050);
            float _2072 = _2070 + _1956;
            float _2074 = _1864 * _1974;
            float _2076 = 1.0 / _2072;
            float _2078 = fma(_1862, _1966, _2074);
            float _2080 = _1864 * _1992;
            float _2082 = rint(_1920);
            float _2084 = precise::max(_2082, 0.0);
            uint _2086 = uint(_2084);
            uint _2088 = clamp(_2086, 0u, 65535u);
            float _2090 = fma(_1862, _1984, _2080);
            float _2092 = _1864 * _2010;
            float _2094 = fma(_1862, _2002, _2092);
            float _2096 = fma(_1866, _2020, _2078);
            float _2098 = _2096 + _2028;
            float _2100 = fma(_1866, _2038, _2090);
            float _2102 = _2098 * _2076;
            float _2104 = _2100 + _2046;
            float _2106 = fma(_1866, _2060, _2094);
            float _2108 = _2104 * _2076;
            float _2110 = _2106 + _2068;
            float _2112 = _2110 * _2076;
            float _2114 = precise::clamp(_2112, 0.0, 1.0);
            float3 _6690 = float3(_2102, _2108, float(int(_2088)));
            float3 _6692 = select(_6690, float3(0.0), isnan(_6690));
            float _2116 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_10).sample_compare(spvDescriptorSet0.cp_t_tcb_10Smplr, _6692.xy, uint(rint(_6692.z)), _2114, level(0.0));
            float _2118 = -_2116;
            float _2120 = _2118 + 1.0;
            float _2122 = fma(_1856, _2120, _2116);
            _1668 = _2068;
            _1896 = _2122;
        }
        float _2124 = _1668;
        float _2126 = _1896;
        float _2128 = _1662 + _1888;
        float _2130 = _2124;
        if (!_1886)
        {
            _2130 = 1.0;
        }
        float _2132 = _2130;
        bool _2134 = !_1886;
        float _2136 = _2132;
        if (!_2134)
        {
            float _2138 = _1864 * (*spvDescriptorSet0.cp_c3)._m0[130].y;
            float _2140 = _1864 * (*spvDescriptorSet0.cp_c3)._m0[131].y;
            float _2142 = fma(_1862, (*spvDescriptorSet0.cp_c3)._m0[130].x, _2138);
            float _2144 = fma(_1862, (*spvDescriptorSet0.cp_c3)._m0[131].x, _2140);
            float _2146 = fma(_1866, (*spvDescriptorSet0.cp_c3)._m0[130].z, _2142);
            float _2148 = fma(_1866, (*spvDescriptorSet0.cp_c3)._m0[131].z, _2144);
            float _2150 = _2146 + (*spvDescriptorSet0.cp_c3)._m0[130].w;
            float _2152 = _2148 + (*spvDescriptorSet0.cp_c3)._m0[131].w;
            float _2154 = trunc(_2150);
            int _2156 = int(_2154);
            float _2158 = trunc(_2152);
            int _2160 = int(_2158);
            int _2162 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].y);
            int _2164 = _2156 + _2162;
            int _2166 = _2164 + 1;
            bool _2168 = _2166 >= 0;
            int _2170 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].z);
            int _2172 = _2160 + _2170;
            int _2174 = _2172 + 1;
            bool _2176 = _2166 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _2178 = !_2168;
            bool _2180 = _2176 || _2178;
            bool _2182 = _2174 < 0;
            bool _2184 = _2182 || _2180;
            bool _2186 = _2174 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
            bool _2188 = _2186 || _2184;
            float _2190 = as_type<float>(_2160);
            if (_2188)
            {
                _2190 = 1.0;
            }
            float _2192 = _2190;
            float _2194 = _2192;
            if (!_2188)
            {
                int _2196 = _2174 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[129].x);
                int _2198 = _2196 + _2166;
                float _2200 = floor(_2150);
                int _2202 = _2198 << 2;
                uint _2204 = uint(int(uint(_2198) >> uint(2)));
                int _2206 = 12 & _2202;
                float _2208 = floor(_2152);
                int _2210 = _2198 << 4;
                int _2212 = _2210 + 2112;
                int _2214 = int(_2204) << 4;
                int _2216 = _2214 + _2206;
                uint _2218 = uint(int(uint(_2212) >> uint(2)));
                uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
                int _2222 = int(_2218) & 3;
                float _2224 = (*spvDescriptorSet0.cp_c3)._m0[int(_2220)][_2222];
                int _2226 = int(_2218) + 1;
                uint _2228 = uint(int(uint(_2226) >> uint(2)));
                int _2230 = _2226 & 3;
                float _2232 = (*spvDescriptorSet0.cp_c3)._m0[int(_2228)][_2230];
                float _2234 = -_2200;
                float _2236 = _2150 + _2234;
                int _2238 = _2216 + 464;
                uint _2240 = uint(int(uint(_2238) >> uint(2)));
                uint _2242 = uint(int(uint(int(_2240)) >> uint(2)));
                int _2244 = int(_2240) & 3;
                float _2246 = (*spvDescriptorSet0.cp_c3)._m0[int(_2242)][_2244];
                int _2248 = _2212 + 8;
                uint _2250 = uint(int(uint(_2248) >> uint(2)));
                uint _2252 = uint(int(uint(int(_2250)) >> uint(2)));
                int _2254 = int(_2250) & 3;
                float _2256 = (*spvDescriptorSet0.cp_c3)._m0[int(_2252)][_2254];
                int _2258 = int(_2250) + 1;
                uint _2260 = uint(int(uint(_2258) >> uint(2)));
                int _2262 = _2258 & 3;
                float _2264 = (*spvDescriptorSet0.cp_c3)._m0[int(_2260)][_2262];
                float _2266 = _1864 * _2232;
                float _2268 = fma(_1862, _2224, _2266);
                float _2270 = rint(_2246);
                float _2272 = precise::max(_2270, 0.0);
                uint _2274 = uint(_2272);
                uint _2276 = clamp(_2274, 0u, 65535u);
                float _2278 = fma(_1866, _2256, _2268);
                float _2280 = -_2208;
                float _2282 = _2152 + _2280;
                float _2284 = _2278 + _2264;
                float _2286 = precise::clamp(_2284, 0.0, 1.0);
                float3 _6964 = float3(_2236, _2282, float(int(_2276)));
                float3 _6966 = select(_6964, float3(0.0), isnan(_6964));
                float _2288 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_E).sample_compare(spvDescriptorSet0.cp_t_tcb_ESmplr, _6966.xy, uint(rint(_6966.z)), _2286, level(0.0));
                _2194 = _2288;
            }
            float _2290 = _2194;
            float _2292 = -_2290;
            float _2294 = _2292 + 1.0;
            float _2296 = fma(_1860, _2294, _2290);
            _2136 = _2296;
        }
        float _2298 = _2136;
        float _2300 = fma(_155, _384, _378);
        float _2302 = fma(_157, _384, _390);
        float _2304 = fma(_2300, 6.2500002968590706586837768554688e-05, 0.5);
        float _2306 = fma(_2302, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _7000 = float2(_2304, _2306);
        float3 _2310 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_7000, float2(0.0), isnan(_7000)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_7000, float2(0.0), isnan(_7000)), level(0.0)).xyz;
        float _2312 = _2310.x;
        float _2314 = _2310.y;
        float _2316 = _2310.z;
        float2 _7016 = float2(_2304, _2306);
        float _2318 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7016, float2(0.0), isnan(_7016)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7016, float2(0.0), isnan(_7016)), level(0.0)).x;
        float3 _7025 = float3(_2304, _2306, float(0));
        float3 _7027 = select(_7025, float3(0.0), isnan(_7025));
        float4 _2321 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7027.xy, uint(rint(_7027.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7027.xy, uint(rint(_7027.z)), level(0.0)).xyzw;
        float _2323 = _2321.x;
        float _2325 = _2321.y;
        float _2327 = _2321.z;
        float _2329 = _2321.w;
        float3 _7042 = float3(_2304, _2306, float(1));
        float3 _7044 = select(_7042, float3(0.0), isnan(_7042));
        float4 _2331 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7044.xy, uint(rint(_7044.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7044.xy, uint(rint(_7044.z)), level(0.0)).xyzw;
        float _2333 = _2331.x;
        float _2335 = _2331.y;
        float _2337 = _2331.z;
        float _2339 = _2331.w;
        float3 _7059 = float3(_2304, _2306, float(2));
        float3 _7061 = select(_7059, float3(0.0), isnan(_7059));
        float4 _2341 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7061.xy, uint(rint(_7061.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7061.xy, uint(rint(_7061.z)), level(0.0)).xyzw;
        float _2343 = _2341.x;
        float _2345 = _2341.y;
        float _2347 = _2341.z;
        float _2349 = _2341.w;
        float _2351 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _2353 = _2302 + _2351;
        float _2355 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _2357 = _2300 + _2355;
        float _2359 = precise::min(_2298, _2126);
        float _2361 = _159 * 1.02332699298858642578125;
        float _2363 = _2353 * _2353;
        float _2365 = _157 * 1.02332699298858642578125;
        float _2367 = precise::min(_2359, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _2369 = _155 * 1.02332699298858642578125;
        float _2371 = fma(_2357, _2357, _2363);
        float _2373 = _2128 + _2367;
        float _2375 = sqrt(_2371);
        bool _2377 = _2375 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _2379 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _2381 = _2375 + _2379;
        float _2383 = _1866;
        float _2385 = _2381;
        float _2387 = 0.0;
        float _2389 = _2298;
        float _2391 = _2373;
        if (_2377)
        {
            float _2393 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _2383 = _2393;
        }
        float _2395 = _2383;
        float _2397 = _2395;
        if (_2377)
        {
            float _2399 = _2381 * _2395;
            _2385 = _2399;
        }
        float _2401 = _2385;
        if (_2377)
        {
            float _2403 = _2401 * 0.15915493667125701904296875;
            _2397 = _2403;
        }
        float _2405 = _2397;
        float _2407 = _159 * _384;
        float _2409 = _2353;
        if (_2377)
        {
            float _2411 = _2405 * 6.283185482025146484375;
            float _2413 = cos(_2411);
            _2409 = _2413;
        }
        float _2415 = _2409;
        float _2417 = _380 + _2407;
        if (!_2377)
        {
            _460 = _2417;
        }
        float _2419 = _460;
        float _2421 = _2419;
        if (_2377)
        {
            float _2423 = _2415 + (-1.0);
            _2387 = _2423;
        }
        float _2425 = _2387;
        if (_2377)
        {
            float _2427 = _2425 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _2389 = _2427;
        }
        float _2429 = _2389;
        float _2431 = fma(_289, -0.5, 0.5);
        if (_2377)
        {
            float _2433 = fma(_2417, _2415, _2429);
            _2421 = _2433;
        }
        float _2435 = _2421;
        float _2437 = _368 + _376;
        float _2439 = abs(_2407);
        bool _2441 = _2439 > 0.00999999977648258209228515625;
        float _2443 = _275 * _2437;
        float _2445 = -_2435;
        float _2447 = fma(_2417, 2.0, _2445);
        float _2449 = _2443 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _2451 = fma(_2314, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _2453 = fma(_2449, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _2455 = precise::clamp(_2453, 0.0, 1.0);
        float _2457 = _2329 * _2361;
        float _2459 = _2451 * 100.0;
        float _2461 = -_2455;
        float _2463 = _2461 + 1.0;
        float _2465 = _2451 * 5115.0;
        float _2467 = 1.0 / _2451;
        float _2469 = fma(_2323, 0.88622701168060302734375, _2457);
        float _2471 = _2335 * _2361;
        float _2473 = _2333 * _2361;
        float _2475 = fma(_2337, _2365, _2469);
        float _2477 = fma(_2327, 0.88622701168060302734375, _2471);
        float _2479 = exp2(_2459);
        float _2481 = fma(_2325, 0.88622701168060302734375, _2473);
        float _2483 = abs(_2463);
        float _2485 = log2(_2483);
        float _2487 = fma(_2339, _2365, _2481);
        float _2489 = fma(_2345, _2369, _2475);
        float _2491 = fma(_2343, _2365, _2477);
        float _2493 = fma(_2347, _2369, _2487);
        float _2495 = fma(_2479, 512.0, -512.0);
        float _2497 = 1.0 / _2495;
        float _2499 = fma(_2318, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _2501 = _2441 ? _2407 : 0.00999999977648258209228515625;
        float _2503 = _283 + 1.0;
        float _2505 = -_2499;
        float _2507 = _2505 + _2447;
        float _2509 = _2451 * _2501;
        float _2511 = sqrt(_2431);
        float _2513 = fma(_289, 0.5, 0.5);
        float _2515 = precise::max(0.0, _2507);
        float _2517 = _2465 * _2497;
        float _2519 = _2485 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _2521 = exp2(_2519);
        float _2523 = _2511 * 0.636619746685028076171875;
        float _2525 = log2(_2517);
        float _2527 = -_283;
        float _2529 = fma(_2521, _2503, _2527);
        float _2531 = precise::max(_2509, -127.0);
        float _2533 = 1.0 / _2531;
        float _2535 = fma(_2525, _2467, 100.0);
        float _2537 = -_2535;
        float _2539 = _2537 + _2515;
        float _2541 = fma(_2529, 0.5, 0.5);
        float _2543 = -_2531;
        float _2545 = exp2(_2543);
        float _2547 = _2451 * _2539;
        float _2549 = fma(_2513, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _2551 = fma(_2513, _2549, -0.212114393711090087890625);
        float _2553 = -_2547;
        float _2555 = exp2(_2553);
        float _2557 = fma(_2513, _2551, 1.570728778839111328125);
        float _2559 = -_2557;
        float _2561 = fma(_2523, _2559, 1.0);
        float _2563 = -_2545;
        float _2565 = _2563 + 1.0;
        float3 _7391 = float3(_2304, _2306, float(3));
        float3 _7393 = select(_7391, float3(0.0), isnan(_7391));
        float4 _2567 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7393.xy, uint(rint(_7393.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7393.xy, uint(rint(_7393.z)), level(0.0)).xyzw;
        float _2569 = _2567.x;
        float _2571 = _2567.y;
        float _2573 = _2567.z;
        float _2575 = _2567.w;
        float3 _7408 = float3(_2304, _2306, float(6));
        float3 _7410 = select(_7408, float3(0.0), isnan(_7408));
        float4 _2577 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7410.xy, uint(rint(_7410.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7410.xy, uint(rint(_7410.z)), level(0.0)).xyzw;
        float _2579 = _2577.x;
        float _2581 = _2577.y;
        float _2583 = _2577.z;
        float _2585 = _2577.w;
        float3 _7425 = float3(_2304, _2306, float(4));
        float3 _7427 = select(_7425, float3(0.0), isnan(_7425));
        float4 _2587 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7427.xy, uint(rint(_7427.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7427.xy, uint(rint(_7427.z)), level(0.0)).xyzw;
        float _2589 = _2587.x;
        float _2591 = _2587.y;
        float _2593 = _2587.z;
        float _2595 = _2587.w;
        float _2597 = _2555 * _2565;
        float _2599 = _2597 * _2533;
        float3 _7449 = float3(_2304, _2306, float(7));
        float3 _7451 = select(_7449, float3(0.0), isnan(_7449));
        float4 _2601 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7451.xy, uint(rint(_7451.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7451.xy, uint(rint(_7451.z)), level(0.0)).xyzw;
        float _2603 = _2601.x;
        float _2605 = _2601.y;
        float _2607 = _2601.z;
        float _2609 = _2601.w;
        float3 _7466 = float3(_2304, _2306, float(5));
        float3 _7468 = select(_7466, float3(0.0), isnan(_7466));
        float4 _2611 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _7468.xy, uint(rint(_7468.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _7468.xy, uint(rint(_7468.z)), level(0.0)).xyzw;
        float _2613 = _2611.x;
        float _2615 = _2611.y;
        float _2617 = _2611.z;
        float _2619 = _2611.w;
        float2 _7482 = float2(_2304, _2306);
        float3 _2621 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_7482, float2(0.0), isnan(_7482)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_7482, float2(0.0), isnan(_7482)), level(0.0)).xyz;
        float _2623 = _2621.x;
        float _2625 = _2621.y;
        float _2627 = _2621.z;
        float2 _7496 = float2(_2561, _2541);
        float3 _2629 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_7496, float2(0.0), isnan(_7496)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_7496, float2(0.0), isnan(_7496)), level(0.0)).xyz;
        float _2631 = _2629.x;
        float _2633 = _2629.y;
        float _2635 = _2629.z;
        float _2637 = fma(_2349, _2369, _2491);
        float _2639 = _2485 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _2641 = precise::max(0.0, _2489);
        float _2643 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _2645 = precise::max(0.0, _2493);
        float _2647 = exp2(_2639);
        bool _2649 = as_type<int>(_101) != 0;
        float _2651 = _2641 * _2643;
        float _2653 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _2655 = _2316 * 2.0;
        float _2657 = _2645 * _2653;
        float _2659 = fma(_2316, _2316, 1.0);
        float _2661 = -_2655;
        float _2663 = fma(_289, _2661, _2659);
        float _2665 = -_2655;
        float _2667 = _2659 + _2665;
        float _2669 = abs(_2663);
        float _2671 = log2(_2669);
        float _2673 = abs(_2667);
        float _2675 = log2(_2673);
        float _2677 = _2671 * 1.5;
        float _2679 = exp2(_2677);
        float _2681 = _2675 * 1.5;
        float _2683 = -_2316;
        float _2685 = fma(_2683, _2316, 1.0);
        float _2687 = exp2(_2681);
        float _2689 = _2679 * 12.56637096405029296875;
        float _2691 = 1.0 / _2689;
        float _2693 = _2687 * 12.56637096405029296875;
        float _2695 = 1.0 / _2693;
        float _2697 = _2685 * _2691;
        float _2699 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _2701 = _2685 * _2695;
        float _2703 = fma(_2312, -0.99447572231292724609375, 1.0);
        float _2705 = log2(_2703);
        float _2707 = _2705 * (-0.0199999995529651641845703125);
        float _2709 = _384 * _2707;
        float _2711 = precise::max(0.0, _2637);
        float _2713 = _2599 * _2709;
        float _2715 = 1.0 / _384;
        float _2717 = _2711 * _2699;
        float _2719 = _2575 * _2361;
        float _2721 = _2581 * _2361;
        float _2723 = _2589 * _2361;
        float _2725 = _2591 * _2361;
        float _2727 = fma(_2569, 0.88622701168060302734375, _2719);
        float _2729 = fma(_2579, 0.88622701168060302734375, _2721);
        float _2731 = fma(_2571, 0.88622701168060302734375, _2723);
        float _2733 = fma(_2573, 0.88622701168060302734375, _2725);
        float _2735 = fma(_2593, _2365, _2727);
        float _2737 = fma(_2583, _2365, _2729);
        float _2739 = _2605 * _2361;
        float _2741 = fma(_2595, _2365, _2731);
        float _2743 = fma(_2613, _2365, _2733);
        float _2745 = fma(_2585, _2369, _2737);
        float _2747 = fma(_2603, 0.88622701168060302734375, _2739);
        float _2749 = fma(_2615, _2369, _2735);
        float _2751 = fma(_2617, _2369, _2741);
        float _2753 = _2745 * 0.31830990314483642578125;
        float _2755 = precise::clamp(_2753, 0.0, 1.0);
        float _2757 = fma(_2607, _2365, _2747);
        float _2759 = fma(_2619, _2369, _2743);
        float _2761 = precise::max(0.0, _2749);
        float _2763 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _2765 = _2449 + _2763;
        float _2767 = precise::min(_2755, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _2769 = fma(_2609, _2369, _2757);
        float _2771 = precise::max(0.0, _2751);
        float _2773 = _2765 * _2715;
        float _2775 = precise::clamp(_2773, 0.0, 1.0);
        float _2777 = precise::max(0.0, _2759);
        float _2779 = _2769 * 0.31830990314483642578125;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = _2767 * 0.88622701168060302734375;
        float _2785 = _2713 * _2775;
        float _2787 = _2585;
        float _2789 = _2731;
        float _2791 = _2733;
        float _2793 = _2615;
        if (_2649)
        {
            _2787 = _332;
        }
        float _2795 = _2787;
        float _2797 = _2781 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _2799 = precise::clamp(_2797, 0.0, 1.0);
        float _2801 = fma(_2783, (*spvDescriptorSet0.cp_c3)._m0[9].x, _2651);
        float _2803 = fma(_2783, (*spvDescriptorSet0.cp_c3)._m0[9].y, _2657);
        float _2805 = fma(_2783, (*spvDescriptorSet0.cp_c3)._m0[9].z, _2717);
        float _2807 = _2795;
        float _2809 = _2799;
        float _2811 = _2795;
        if (_2649)
        {
            _2789 = as_type<float>(_334);
        }
        int _2813 = as_type<int>(_2789);
        float _2815 = fma(_2761, _2799, _2801);
        float _2817 = _2373 * 0.25;
        float _2819 = fma(_2771, _2799, _2803);
        float _2821 = fma(_2777, _2799, _2805);
        float _2823 = _2815 * _2701;
        float _2825 = _2817 * _2697;
        float _2827 = _2819 * _2701;
        float _2829 = _2821 * _2701;
        float _2831 = _384 * _2817;
        float _2833 = fma(_2825, (*spvDescriptorSet0.cp_c3)._m0[7].x, _2823);
        float _2835 = fma(_2825, (*spvDescriptorSet0.cp_c3)._m0[7].y, _2827);
        float _2837 = fma(_2825, (*spvDescriptorSet0.cp_c3)._m0[7].z, _2829);
        float _2839 = -_2647;
        float _2841 = _2839 + 1.0;
        float _2843 = _2817 * _2631;
        float _2845 = _2625 * _2835;
        float _2847 = _2817 * _2633;
        float _2849 = _2623 * _2833;
        float _2851 = _2627 * _2837;
        int _2853 = _291 + as_type<int>(_101);
        float _2855 = _2817 * _2635;
        float _2857 = _2841 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _2859 = _2837;
        int _2861 = _2813;
        if (_2649)
        {
            _2859 = as_type<float>(_336);
        }
        int _2863 = as_type<int>(_2859);
        int _2865 = _2853 << 2;
        int _2867 = _2865 + 1024;
        uint _2869 = uint(int(uint(_2867) >> uint(2)));
        _26[int(_2869)] = as_type<uint>(_2831);
        int _2871 = _2863;
        if (_2649)
        {
            _2791 = _338;
        }
        float _2873 = _2791;
        int _2875 = _2853 << 4;
        int _2877 = _2875 + 1280;
        uint _2879 = uint(int(uint(_2877) >> uint(2)));
        _26[int(_2879)] = as_type<uint>(_2849);
        int _2881 = _2875 + 1284;
        uint _2883 = uint(int(uint(_2881) >> uint(2)));
        _26[int(_2883)] = as_type<uint>(_2845);
        int _2885 = _2875 + 1288;
        uint _2887 = uint(int(uint(_2885) >> uint(2)));
        _26[int(_2887)] = as_type<uint>(_2851);
        int _2889 = _2875 + 1292;
        uint _2891 = uint(int(uint(_2889) >> uint(2)));
        _26[int(_2891)] = as_type<uint>(_2785);
        int _2893 = _2853 << 4;
        uint _2895 = uint(int(uint(_2893) >> uint(2)));
        _26[int(_2895)] = as_type<uint>(_2843);
        int _2897 = _2893 + 4;
        uint _2899 = uint(int(uint(_2897) >> uint(2)));
        _26[int(_2899)] = as_type<uint>(_2847);
        int _2901 = _2893 + 8;
        uint _2903 = uint(int(uint(_2901) >> uint(2)));
        _26[int(_2903)] = as_type<uint>(_2855);
        int _2905 = _2893 + 12;
        uint _2907 = uint(int(uint(_2905) >> uint(2)));
        _26[int(_2907)] = as_type<uint>(_2857);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        float _2909 = _2873;
        float _2911 = _2873;
        if (!_2649)
        {
            int _2913 = _291 << 4;
            int _2915 = _2913 + 1280;
            uint _2917 = uint(int(uint(_2915) >> uint(2)));
            float _2919 = as_type<float>(_26[int(_2917)]);
            int _2921 = _2913 + 1284;
            uint _2923 = uint(int(uint(_2921) >> uint(2)));
            float _2925 = as_type<float>(_26[int(_2923)]);
            int _2927 = _2913 + 1288;
            uint _2929 = uint(int(uint(_2927) >> uint(2)));
            float _2931 = as_type<float>(_26[int(_2929)]);
            int _2933 = _2913 + 1292;
            uint _2935 = uint(int(uint(_2933) >> uint(2)));
            float _2937 = as_type<float>(_26[int(_2935)]);
            int _2939 = _291 << 4;
            int _2941 = _2939 + 1296;
            uint _2943 = uint(int(uint(_2941) >> uint(2)));
            float _2945 = as_type<float>(_26[int(_2943)]);
            int _2947 = _2939 + 1300;
            uint _2949 = uint(int(uint(_2947) >> uint(2)));
            float _2951 = as_type<float>(_26[int(_2949)]);
            int _2953 = _2939 + 1304;
            uint _2955 = uint(int(uint(_2953) >> uint(2)));
            float _2957 = as_type<float>(_26[int(_2955)]);
            int _2959 = _2939 + 1308;
            uint _2961 = uint(int(uint(_2959) >> uint(2)));
            float _2963 = as_type<float>(_26[int(_2961)]);
            int _2965 = _291 << 4;
            uint _2967 = uint(int(uint(_2965) >> uint(2)));
            float _2969 = as_type<float>(_26[int(_2967)]);
            int _2971 = _2965 + 4;
            uint _2973 = uint(int(uint(_2971) >> uint(2)));
            float _2975 = as_type<float>(_26[int(_2973)]);
            int _2977 = _2965 + 8;
            uint _2979 = uint(int(uint(_2977) >> uint(2)));
            float _2981 = as_type<float>(_26[int(_2979)]);
            int _2983 = _2965 + 12;
            uint _2985 = uint(int(uint(_2983) >> uint(2)));
            float _2987 = as_type<float>(_26[int(_2985)]);
            int _2989 = _291 << 4;
            int _2991 = _2989 + 1312;
            uint _2993 = uint(int(uint(_2991) >> uint(2)));
            float _2995 = as_type<float>(_26[int(_2993)]);
            int _2997 = _2989 + 1316;
            uint _2999 = uint(int(uint(_2997) >> uint(2)));
            float _3001 = as_type<float>(_26[int(_2999)]);
            int _3003 = _2989 + 1320;
            uint _3005 = uint(int(uint(_3003) >> uint(2)));
            float _3007 = as_type<float>(_26[int(_3005)]);
            int _3009 = _2989 + 1324;
            uint _3011 = uint(int(uint(_3009) >> uint(2)));
            float _3013 = as_type<float>(_26[int(_3011)]);
            int _3015 = _291 << 4;
            int _3017 = _3015 + 16;
            uint _3019 = uint(int(uint(_3017) >> uint(2)));
            float _3021 = as_type<float>(_26[int(_3019)]);
            int _3023 = _3015 + 20;
            uint _3025 = uint(int(uint(_3023) >> uint(2)));
            float _3027 = as_type<float>(_26[int(_3025)]);
            int _3029 = _3015 + 24;
            uint _3031 = uint(int(uint(_3029) >> uint(2)));
            float _3033 = as_type<float>(_26[int(_3031)]);
            int _3035 = _3015 + 28;
            uint _3037 = uint(int(uint(_3035) >> uint(2)));
            float _3039 = as_type<float>(_26[int(_3037)]);
            int _3041 = _291 << 4;
            int _3043 = _3041 + 1328;
            uint _3045 = uint(int(uint(_3043) >> uint(2)));
            float _3047 = as_type<float>(_26[int(_3045)]);
            int _3049 = _3041 + 1332;
            uint _3051 = uint(int(uint(_3049) >> uint(2)));
            float _3053 = as_type<float>(_26[int(_3051)]);
            int _3055 = _3041 + 1336;
            uint _3057 = uint(int(uint(_3055) >> uint(2)));
            float _3059 = as_type<float>(_26[int(_3057)]);
            int _3061 = _3041 + 1340;
            uint _3063 = uint(int(uint(_3061) >> uint(2)));
            float _3065 = as_type<float>(_26[int(_3063)]);
            float _3067 = _338 + _2937;
            float _3069 = -_3067;
            float _3071 = exp2(_3069);
            float _3073 = _3067 + _2963;
            float _3075 = -_2919;
            float _3077 = _3075 + _2969;
            float _3079 = -_2925;
            float _3081 = _3079 + _2975;
            float _3083 = -_2931;
            float _3085 = _3083 + _2981;
            float _3087 = -_3073;
            float _3089 = exp2(_3087);
            float _3091 = _3073 + _3013;
            float _3093 = -_2951;
            float _3095 = _3093 + _3027;
            float _3097 = -_2945;
            float _3099 = _3097 + _3021;
            float _3101 = -_2957;
            float _3103 = _3101 + _3033;
            float _3105 = -_3071;
            float _3107 = _3105 + 1.0;
            float _3109 = -_3091;
            float _3111 = exp2(_3109);
            int _3113 = _291 << 4;
            int _3115 = _3113 + 32;
            uint _3117 = uint(int(uint(_3115) >> uint(2)));
            float _3119 = as_type<float>(_26[int(_3117)]);
            int _3121 = _3113 + 36;
            uint _3123 = uint(int(uint(_3121) >> uint(2)));
            float _3125 = as_type<float>(_26[int(_3123)]);
            int _3127 = _3113 + 40;
            uint _3129 = uint(int(uint(_3127) >> uint(2)));
            float _3131 = as_type<float>(_26[int(_3129)]);
            int _3133 = _3113 + 44;
            uint _3135 = uint(int(uint(_3133) >> uint(2)));
            float _3137 = as_type<float>(_26[int(_3135)]);
            float _3139 = _3091 + _3065;
            float _3141 = precise::min(_3107, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3143 = -_3089;
            float _3145 = _3143 + 1.0;
            float _3147 = -_340;
            float _3149 = _3141 + _3147;
            float _3151 = precise::min(_3145, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3153 = _3149 * _2987;
            float _3155 = _3081 * _3153;
            float _3157 = _3077 * _3153;
            float _3159 = _3085 * _3153;
            float _3161 = fma(_2925, _3149, _3155);
            float _3163 = -_3141;
            float _3165 = _3163 + _3151;
            float _3167 = fma(_2919, _3149, _3157);
            float _3169 = fma(_2931, _3149, _3159);
            float _3171 = _3161 + _332;
            float _3173 = _3165 * _3039;
            float _3175 = -_3111;
            float _3177 = _3175 + 1.0;
            int _3179 = _291 << 4;
            int _3181 = _3179 + 48;
            uint _3183 = uint(int(uint(_3181) >> uint(2)));
            float _3185 = as_type<float>(_26[int(_3183)]);
            int _3187 = _3179 + 52;
            uint _3189 = uint(int(uint(_3187) >> uint(2)));
            float _3191 = as_type<float>(_26[int(_3189)]);
            int _3193 = _3179 + 56;
            uint _3195 = uint(int(uint(_3193) >> uint(2)));
            float _3197 = as_type<float>(_26[int(_3195)]);
            int _3199 = _3179 + 60;
            uint _3201 = uint(int(uint(_3199) >> uint(2)));
            float _3203 = as_type<float>(_26[int(_3201)]);
            float _3205 = _3167 + as_type<float>(_336);
            float _3207 = _3095 * _3173;
            float _3209 = _3099 * _3173;
            int _3211 = _291 << 2;
            int _3213 = _3211 + 1024;
            uint _3215 = uint(int(uint(_3213) >> uint(2)));
            float _3217 = as_type<float>(_26[int(_3215)]);
            float _3219 = _3103 * _3173;
            float _3221 = precise::min(_3177, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3223 = fma(_2945, _3165, _3209);
            int _3225 = _291 << 2;
            int _3227 = _3225 + 1028;
            uint _3229 = uint(int(uint(_3227) >> uint(2)));
            float _3231 = as_type<float>(_26[int(_3229)]);
            float _3233 = fma(_2951, _3165, _3207);
            float _3235 = -_3139;
            float _3237 = exp2(_3235);
            float _3239 = fma(_2957, _3165, _3219);
            int _3241 = _291 << 2;
            int _3243 = _3241 + 1032;
            uint _3245 = uint(int(uint(_3243) >> uint(2)));
            float _3247 = as_type<float>(_26[int(_3245)]);
            float _3249 = -_2995;
            float _3251 = _3249 + _3119;
            float _3253 = -_3151;
            float _3255 = _3253 + _3221;
            float _3257 = -_3001;
            float _3259 = _3257 + _3125;
            int _3261 = _291 << 2;
            int _3263 = _3261 + 1036;
            uint _3265 = uint(int(uint(_3263) >> uint(2)));
            float _3267 = as_type<float>(_26[int(_3265)]);
            float _3269 = -_3007;
            float _3271 = _3269 + _3131;
            float _3273 = _3255 * _3137;
            float _3275 = _3169 + as_type<float>(_334);
            float _3277 = _3259 * _3273;
            float _3279 = _3251 * _3273;
            float _3281 = _3271 * _3273;
            float _3283 = _3275 + _3239;
            float _3285 = -_3237;
            float _3287 = _3285 + 1.0;
            float _3289 = fma(_2995, _3255, _3279);
            float _3291 = fma(_3007, _3255, _3281);
            float _3293 = _3205 + _3223;
            float _3295 = fma(_3001, _3255, _3277);
            float _3297 = precise::min(_3287, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _3299 = _3283 + _3291;
            float _3301 = _3293 + _3289;
            float _3303 = _3171 + _3233;
            int _3305 = _291 << 4;
            int _3307 = _3305 + 1280;
            uint _3309 = uint(int(uint(_3307) >> uint(2)));
            _26[int(_3309)] = as_type<uint>(_3205);
            int _3311 = _3305 + 1284;
            uint _3313 = uint(int(uint(_3311) >> uint(2)));
            _26[int(_3313)] = as_type<uint>(_3171);
            int _3315 = _3305 + 1288;
            uint _3317 = uint(int(uint(_3315) >> uint(2)));
            _26[int(_3317)] = as_type<uint>(_3275);
            int _3319 = _3305 + 1292;
            uint _3321 = uint(int(uint(_3319) >> uint(2)));
            _26[int(_3321)] = as_type<uint>(_3067);
            float _3323 = -_3221;
            float _3325 = _3297 + _3323;
            float _3327 = _3303 + _3295;
            int _3329 = _291 << 4;
            int _3331 = _3329 + 1296;
            uint _3333 = uint(int(uint(_3331) >> uint(2)));
            _26[int(_3333)] = as_type<uint>(_3293);
            int _3335 = _3329 + 1300;
            uint _3337 = uint(int(uint(_3335) >> uint(2)));
            _26[int(_3337)] = as_type<uint>(_3303);
            int _3339 = _3329 + 1304;
            uint _3341 = uint(int(uint(_3339) >> uint(2)));
            _26[int(_3341)] = as_type<uint>(_3283);
            int _3343 = _3329 + 1308;
            uint _3345 = uint(int(uint(_3343) >> uint(2)));
            _26[int(_3345)] = as_type<uint>(_3073);
            float _3347 = -_3047;
            float _3349 = _3347 + _3185;
            float _3351 = _3325 * _3203;
            float _3353 = -_3053;
            float _3355 = _3353 + _3191;
            float _3357 = -_3059;
            float _3359 = _3357 + _3197;
            float _3361 = _3217 + _342;
            float _3363 = _3349 * _3351;
            float _3365 = _3355 * _3351;
            float _3367 = _3359 * _3351;
            float _3369 = _3361 + _3231;
            float _3371 = fma(_3047, _3325, _3363);
            float _3373 = fma(_3053, _3325, _3365);
            float _3375 = fma(_3059, _3325, _3367);
            float _3377 = _3369 + _3247;
            float _3379 = _3371 + _3301;
            float _3381 = _3373 + _3327;
            float _3383 = _3375 + _3299;
            float _3385 = _3377 + _3267;
            int _3387 = _291 << 4;
            int _3389 = _3387 + 1312;
            uint _3391 = uint(int(uint(_3389) >> uint(2)));
            _26[int(_3391)] = as_type<uint>(_3301);
            int _3393 = _3387 + 1316;
            uint _3395 = uint(int(uint(_3393) >> uint(2)));
            _26[int(_3395)] = as_type<uint>(_3327);
            int _3397 = _3387 + 1320;
            uint _3399 = uint(int(uint(_3397) >> uint(2)));
            _26[int(_3399)] = as_type<uint>(_3299);
            int _3401 = _3387 + 1324;
            uint _3403 = uint(int(uint(_3401) >> uint(2)));
            _26[int(_3403)] = as_type<uint>(_3091);
            int _3405 = _291 << 2;
            int _3407 = _3405 + 1024;
            uint _3409 = uint(int(uint(_3407) >> uint(2)));
            _26[int(_3409)] = as_type<uint>(_3361);
            int _3411 = _291 << 2;
            int _3413 = _3411 + 1028;
            uint _3415 = uint(int(uint(_3413) >> uint(2)));
            _26[int(_3415)] = as_type<uint>(_3369);
            int _3417 = _291 << 2;
            int _3419 = _3417 + 1032;
            uint _3421 = uint(int(uint(_3419) >> uint(2)));
            _26[int(_3421)] = as_type<uint>(_3377);
            int _3423 = _291 << 2;
            int _3425 = _3423 + 1036;
            uint _3427 = uint(int(uint(_3425) >> uint(2)));
            _26[int(_3427)] = as_type<uint>(_3385);
            int _3429 = _291 << 4;
            int _3431 = _3429 + 1328;
            uint _3433 = uint(int(uint(_3431) >> uint(2)));
            _26[int(_3433)] = as_type<uint>(_3379);
            int _3435 = _3429 + 1332;
            uint _3437 = uint(int(uint(_3435) >> uint(2)));
            _26[int(_3437)] = as_type<uint>(_3381);
            int _3439 = _3429 + 1336;
            uint _3441 = uint(int(uint(_3439) >> uint(2)));
            _26[int(_3441)] = as_type<uint>(_3383);
            int _3443 = _3429 + 1340;
            uint _3445 = uint(int(uint(_3443) >> uint(2)));
            _26[int(_3445)] = as_type<uint>(_3139);
            _2807 = _3381;
            _2909 = _3139;
            _2809 = _3275;
            _2793 = _3355;
            _2391 = _3223;
            _462 = _3297;
            _464 = _3385;
            _2871 = as_type<int>(_3379);
            _2811 = _3381;
            _2861 = as_type<int>(_3383);
            _2911 = _3139;
        }
        float _3447 = _2807;
        float _3449 = _2909;
        float _3451 = _2809;
        float _3453 = _2793;
        float _3455 = _2391;
        float _3457 = _462;
        float _3459 = _464;
        int _3461 = _2871;
        float _3463 = _2811;
        int _3465 = _2861;
        float _3467 = _2911;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _3469 = _2853 << 4;
        int _3471 = _3469 + 1280;
        uint _3473 = uint(int(uint(_3471) >> uint(2)));
        float _3475 = as_type<float>(_26[int(_3473)]);
        int _3477 = _3469 + 1284;
        uint _3479 = uint(int(uint(_3477) >> uint(2)));
        float _3481 = as_type<float>(_26[int(_3479)]);
        int _3483 = _3469 + 1288;
        uint _3485 = uint(int(uint(_3483) >> uint(2)));
        float _3487 = as_type<float>(_26[int(_3485)]);
        int _3489 = _3469 + 1292;
        uint _3491 = uint(int(uint(_3489) >> uint(2)));
        float _3493 = as_type<float>(_26[int(_3491)]);
        float _3495 = 1.0 / _2449;
        int _3497 = _2853 << 2;
        int _3499 = _3497 + 1024;
        uint _3501 = uint(int(uint(_3499) >> uint(2)));
        float _3503 = as_type<float>(_26[int(_3501)]);
        float _3505 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
        float _3507 = _3505 + 1.0;
        float _3509 = -_3493;
        float _3511 = exp2(_3509);
        float _3513 = _3503 * _3495;
        float _3515 = precise::max(_3511, _3507);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_3475, _3481, _3487, _3515), uint3(int3(_83, _79, int(_318))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_3513, _3513, _3513, _3513), uint3(int3(_83, _79, int(_318))));
        int _3517 = int(_318) + 4;
        bool _3519 = uint(_3517) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _294 = uint(_3517);
        _277 = _3447;
        _296 = _3449;
        _298 = _3513;
        _300 = _3451;
        _302 = _3453;
        _304 = _3455;
        _306 = _3463;
        _308 = _3465;
        _310 = _3461;
        _312 = _3467;
        _314 = _3457;
        _316 = _3459;
        if (_3519)
        {
            _3521 = true;
            if (_3521)
            {
                break;
            }
        }
    } while (true);
    _3521 = false;
}

