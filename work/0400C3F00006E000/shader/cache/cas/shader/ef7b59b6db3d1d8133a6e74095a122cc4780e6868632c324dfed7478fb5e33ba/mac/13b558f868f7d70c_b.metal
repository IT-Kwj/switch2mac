#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _3045, thread const int& _3046, constant _10& support_buffer)
{
    int _3049 = 1 + _3046;
    float _3051 = support_buffer._m5[_3049].x;
    bool _3053 = _3051 == 1.0;
    if (_3053)
    {
        return _3045;
    }
    float _3055 = float(_3045);
    float _3057 = _3055 * _3051;
    int _3059 = int(_3057);
    return _3059;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3081, thread const int& _3082, thread const int& _3083, thread int& _3084, thread uint& gl_SubgroupInvocationID)
{
    int _3087 = _3083 & 31;
    uint _3089 = uint(int(uint(_3083) >> uint(8)));
    int _3091 = int(_3089) & 31;
    float _3093 = as_type<float>(gl_SubgroupInvocationID);
    int _3095 = as_type<int>(_3093) & _3091;
    int _3097 = ~_3091;
    int _3099 = _3087 & _3097;
    int _3101 = _3099 | _3095;
    int _3103 = ~_3091;
    int _3105 = _3082 & _3103;
    int _3107 = _3105 | _3095;
    bool _3109 = uint(_3107) <= uint(_3101);
    _3084 = _3109 ? (-1) : 0;
    float _3111 = spvSubgroupShuffle(as_type<float>(_3081), uint(_3107));
    uint _3113 = uint(_3109 ? as_type<int>(_3111) : _3081);
    return int(_3113);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _813 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = _72 + 8;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    uint _87 = uint(int(uint(int(_85)) >> uint(2)));
    int _89 = int(_85) & 3;
    float _91 = (*spvDescriptorSet0.cp_c5)._m0[int(_87)][_89];
    int _93 = _66;
    int _95 = 0;
    int _97 = _54(_93, _95, (*spvDescriptorSet0.support_buffer));
    int _99 = as_type<int>(_81);
    int _101 = 0;
    int _103 = _54(_99, _101, (*spvDescriptorSet0.support_buffer));
    int3 _1340 = int3(_97, _103, 1);
    float3 _107 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1340.xy), uint(_1340.z), 0).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    int _115 = _66;
    int _117 = 1;
    int _119 = _54(_115, _117, (*spvDescriptorSet0.support_buffer));
    int _121 = as_type<int>(_91);
    int _123 = 1;
    int _125 = _54(_121, _123, (*spvDescriptorSet0.support_buffer));
    int3 _1358 = int3(_119, _125, 1);
    float3 _127 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1358.xy), uint(_1358.z), 0).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    int _135 = _66;
    int _137 = 1;
    int _139 = _54(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = as_type<int>(_91);
    int _143 = 1;
    int _145 = _54(_141, _143, (*spvDescriptorSet0.support_buffer));
    int3 _1376 = int3(_139, _145, 0);
    float3 _147 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1376.xy), uint(_1376.z), 0).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    int _155 = _66;
    int _157 = 0;
    int _159 = _54(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = as_type<int>(_81);
    int _163 = 0;
    int _165 = _54(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _1394 = int3(_159, _165, 0);
    float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1394.xy), uint(_1394.z), 0).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    int _175 = _66;
    int _177 = 1;
    int _179 = _54(_175, _177, (*spvDescriptorSet0.support_buffer));
    int _181 = as_type<int>(_91);
    int _183 = 1;
    int _185 = _54(_181, _183, (*spvDescriptorSet0.support_buffer));
    int3 _1412 = int3(_179, _185, 2);
    float3 _187 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1412.xy), uint(_1412.z), 0).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    int _195 = _66;
    int _197 = 0;
    int _199 = _54(_195, _197, (*spvDescriptorSet0.support_buffer));
    int _201 = as_type<int>(_81);
    int _203 = 0;
    int _205 = _54(_201, _203, (*spvDescriptorSet0.support_buffer));
    int3 _1430 = int3(_199, _205, 2);
    float3 _207 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1430.xy), uint(_1430.z), 0).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    bool _215 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _217 = _72 + 28;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
    float _227 = _109 * 0.15915493667125701904296875;
    float _229 = _111 * 0.15915493667125701904296875;
    float _231 = _113 * 0.15915493667125701904296875;
    float _233 = _227 * 6.283185482025146484375;
    float _235 = cos(_233);
    int _237 = _72 + 20;
    uint _239 = uint(int(uint(_237) >> uint(2)));
    uint _241 = uint(int(uint(int(_239)) >> uint(2)));
    int _243 = int(_239) & 3;
    float _245 = (*spvDescriptorSet0.cp_c5)._m0[int(_241)][_243];
    float _247 = _131 * 0.15915493667125701904296875;
    float _249 = _133 * 0.15915493667125701904296875;
    float _251 = _129 * 0.15915493667125701904296875;
    float _253 = _229 * 6.283185482025146484375;
    float _255 = cos(_253);
    float _257 = _231 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = _231 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = _235 * _255;
    float _267 = _227 * 6.283185482025146484375;
    float _269 = sin(_267);
    float _271 = _229 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _235 * _263;
    float _277 = _259 * _235;
    float _279 = _247 * 6.283185482025146484375;
    float _281 = sin(_279);
    float _283 = _269 * _259;
    float _285 = _249 * 6.283185482025146484375;
    float _287 = cos(_285);
    float _289 = _269 * _273;
    float _291 = _251 * 6.283185482025146484375;
    float _293 = cos(_291);
    float _295 = _249 * 6.283185482025146484375;
    float _297 = sin(_295);
    float _299 = _247 * 6.283185482025146484375;
    float _301 = cos(_299);
    float _303 = -_277;
    float _305 = fma(_263, _289, _303);
    float _307 = _293 * _287;
    float _309 = _259 * _255;
    float _311 = fma(_259, _289, _275);
    float _313 = _255 * _263;
    float _315 = _269 * _255;
    float _317 = fma(_273, _275, _283);
    float _319 = _251 * 6.283185482025146484375;
    float _321 = sin(_319);
    float _323 = _269 * _263;
    float _325 = _297 * _293;
    float _327 = -_323;
    float _329 = fma(_273, _277, _327);
    float _331 = _293 * _301;
    float _333 = _297 * _301;
    float _335 = _301 * _287;
    float _337 = _331 * _225;
    float _339 = _335 * _225;
    float _341 = _321 * _281;
    float _343 = _321 * _301;
    float _345 = _321 * _297;
    float _347 = _321 * _287;
    float _349 = fma(_297, _341, _307);
    float _351 = -_325;
    float _353 = fma(_287, _341, _351);
    float _355 = _333 * _225;
    float _357 = -_347;
    float _359 = fma(_281, _325, _357);
    float _361 = _349 * _225;
    float _363 = _353 * _225;
    float _365 = fma(_309, _245, _355);
    float _367 = fma(_281, _307, _345);
    float _369 = fma(_311, _245, _361);
    float _371 = _359 * _225;
    float _373 = _273 * _245;
    float _375 = fma(_313, _245, _339);
    float _377 = _365 * _365;
    float _379 = _343 * _225;
    float _381 = fma(_305, _245, _363);
    float _383 = _369 * _369;
    float _385 = _367 * _225;
    float _387 = fma(_329, _245, _371);
    float _389 = -_281;
    float _391 = -_373;
    float _393 = fma(_389, _225, _391);
    float _395 = fma(_375, _375, _377);
    float _397 = fma(_315, _245, _379);
    float _399 = fma(_381, _381, _383);
    float _401 = fma(_317, _245, _385);
    float _403 = _387 * _387;
    float _405 = fma(_393, _393, _395);
    float _407 = fma(_397, _397, _399);
    float _409 = fma(_265, _245, _337);
    float _411 = fma(_401, _401, _403);
    float _413 = _149 * _225;
    float _415 = _151 * _225;
    float _417 = rsqrt(_405);
    float _419 = fma(_409, _409, _411);
    float _421 = fma(_169, _245, _413);
    float _423 = fma(_171, _245, _415);
    float _425 = _153 * _225;
    float _427 = rsqrt(_407);
    float _429 = fma(_173, _245, _425);
    float _431 = rsqrt(_419);
    float _433 = _421 * _417;
    float _435 = _393 * _433;
    float _437 = _365 * _433;
    float _439 = _189 * _225;
    float _441 = _423 * _427;
    float _443 = _193 * _225;
    float _445 = _375 * _433;
    float _447 = fma(_209, _245, _439);
    float _449 = _397 * _441;
    float _451 = _191 * _225;
    float _453 = _369 * _441;
    int _455 = _66 * 112;
    float _457 = _429 * _431;
    float _459 = fma(_211, _245, _451);
    float _461 = _381 * _441;
    float _463 = fma(_213, _245, _443);
    float _465 = _401 * _457;
    float _467 = _387 * _457;
    float _469 = _409 * _457;
    bool _471 = !_215;
    float _789;
    float _791;
    float _793;
    float _795;
    float _797;
    float _799;
    float _801;
    float _803;
    float _805;
    float _807;
    float _809;
    float _811;
    if (!_471)
    {
        int _473 = 0;
        float _475 = _445;
        float _477 = _461;
        float _479 = _465;
        float _481 = _447;
        float _483 = _437;
        float _485 = _453;
        float _487 = _467;
        float _489 = _459;
        float _491 = _435;
        float _493 = _449;
        float _495 = _469;
        float _497 = _463;
        bool _499;
        int _547;
        int _557;
        int _567;
        int _577;
        int _587;
        int _597;
        int _607;
        int _617;
        int _627;
        int _637;
        int _647;
        int _657;
        int _765;
        int _769;
        int _771;
        int _775;
        int _777;
        int _779;
        int _783;
        int _785;
        int _787;
        do
        {
            int _501 = _473;
            int _503 = as_type<int>(_475);
            int _505 = as_type<int>(_477);
            int _507 = as_type<int>(_479);
            int _509 = as_type<int>(_481);
            int _511 = as_type<int>(_483);
            int _513 = as_type<int>(_485);
            int _515 = as_type<int>(_487);
            int _517 = as_type<int>(_489);
            int _519 = as_type<int>(_491);
            int _521 = as_type<int>(_493);
            int _523 = as_type<int>(_495);
            int _525 = as_type<int>(_497);
            uint _527 = uint(int(uint(_455) >> uint(2)));
            uint _529 = uint(int(uint(int(_527)) >> uint(2)));
            int _531 = int(_527) & 3;
            float _533 = (*spvDescriptorSet0.cp_c6)._m0[int(_529)][_531];
            bool _535 = _66 != 0;
            int _537 = _501 + 1;
            bool _539 = uint(_537) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _541 = _503;
            int _543 = as_type<int>(_533);
            int _545 = 31;
            int _1897 = _56(_541, _543, _545, _547, gl_SubgroupInvocationID);
            int _549 = _1897;
            int _551 = _505;
            int _553 = as_type<int>(_533);
            int _555 = 31;
            int _1901 = _56(_551, _553, _555, _557, gl_SubgroupInvocationID);
            int _559 = _1901;
            int _561 = _507;
            int _563 = as_type<int>(_533);
            int _565 = 31;
            int _1905 = _56(_561, _563, _565, _567, gl_SubgroupInvocationID);
            int _569 = _1905;
            int _571 = _509;
            int _573 = as_type<int>(_533);
            int _575 = 31;
            int _1909 = _56(_571, _573, _575, _577, gl_SubgroupInvocationID);
            int _579 = _1909;
            int _581 = _511;
            int _583 = as_type<int>(_533);
            int _585 = 31;
            int _1913 = _56(_581, _583, _585, _587, gl_SubgroupInvocationID);
            int _589 = _1913;
            int _591 = _513;
            int _593 = as_type<int>(_533);
            int _595 = 31;
            int _1917 = _56(_591, _593, _595, _597, gl_SubgroupInvocationID);
            int _599 = _1917;
            int _601 = _515;
            int _603 = as_type<int>(_533);
            int _605 = 31;
            int _1921 = _56(_601, _603, _605, _607, gl_SubgroupInvocationID);
            int _609 = _1921;
            int _611 = _517;
            int _613 = as_type<int>(_533);
            int _615 = 31;
            int _1925 = _56(_611, _613, _615, _617, gl_SubgroupInvocationID);
            int _619 = _1925;
            int _621 = _519;
            int _623 = as_type<int>(_533);
            int _625 = 31;
            int _1929 = _56(_621, _623, _625, _627, gl_SubgroupInvocationID);
            int _629 = _1929;
            int _631 = _521;
            int _633 = as_type<int>(_533);
            int _635 = 31;
            int _1933 = _56(_631, _633, _635, _637, gl_SubgroupInvocationID);
            int _639 = _1933;
            int _641 = _523;
            int _643 = as_type<int>(_533);
            int _645 = 31;
            int _1937 = _56(_641, _643, _645, _647, gl_SubgroupInvocationID);
            int _649 = _1937;
            int _651 = _525;
            int _653 = as_type<int>(_533);
            int _655 = 31;
            int _1941 = _56(_651, _653, _655, _657, gl_SubgroupInvocationID);
            int _659 = _1941;
            bool _661 = !_535;
            _473 = _537;
            int _663 = _503;
            int _665 = _505;
            int _667 = _507;
            int _669 = _509;
            int _671 = _511;
            int _673 = _513;
            int _675 = _515;
            int _677 = _517;
            int _679 = _519;
            int _681 = _521;
            int _683 = _523;
            int _685 = _525;
            if (!_661)
            {
                float _687 = _437 * as_type<float>(_559);
                float _689 = _467 * as_type<float>(_559);
                float _691 = _459 * as_type<float>(_559);
                float _693 = _453 * as_type<float>(_599);
                float _695 = fma(_445, as_type<float>(_549), _687);
                float _697 = fma(_465, as_type<float>(_549), _689);
                float _699 = fma(_447, as_type<float>(_549), _691);
                float _701 = _437 * as_type<float>(_599);
                float _703 = _467 * as_type<float>(_599);
                float _705 = _459 * as_type<float>(_599);
                float _707 = _453 * as_type<float>(_559);
                float _709 = fma(_445, as_type<float>(_589), _701);
                float _711 = fma(_461, as_type<float>(_589), _693);
                float _713 = fma(_465, as_type<float>(_589), _703);
                float _715 = fma(_447, as_type<float>(_589), _705);
                float _717 = _459 * as_type<float>(_639);
                float _719 = _437 * as_type<float>(_639);
                float _721 = _467 * as_type<float>(_639);
                float _723 = fma(_461, as_type<float>(_549), _707);
                float _725 = _453 * as_type<float>(_639);
                float _727 = fma(_447, as_type<float>(_629), _717);
                float _729 = fma(_445, as_type<float>(_629), _719);
                float _731 = fma(_465, as_type<float>(_629), _721);
                float _733 = fma(_435, as_type<float>(_569), _695);
                float _735 = fma(_461, as_type<float>(_629), _725);
                float _737 = fma(_449, as_type<float>(_569), _723);
                float _739 = fma(_469, as_type<float>(_569), _697);
                float _741 = fma(_469, as_type<float>(_609), _713);
                float _743 = fma(_463, as_type<float>(_569), _699);
                float _745 = fma(_463, as_type<float>(_609), _715);
                float _747 = fma(_463, as_type<float>(_649), _727);
                float _749 = fma(_435, as_type<float>(_609), _709);
                float _751 = fma(_449, as_type<float>(_609), _711);
                float _753 = fma(_449, as_type<float>(_649), _735);
                float _755 = fma(_435, as_type<float>(_649), _729);
                float _757 = fma(_469, as_type<float>(_649), _731);
                float _759 = as_type<float>(_579) + _743;
                float _761 = as_type<float>(_619) + _745;
                float _763 = as_type<float>(_659) + _747;
                _663 = as_type<int>(_733);
                _665 = as_type<int>(_737);
                _667 = as_type<int>(_739);
                _669 = as_type<int>(_759);
                _671 = as_type<int>(_749);
                _673 = as_type<int>(_751);
                _675 = as_type<int>(_741);
                _677 = as_type<int>(_761);
                _679 = as_type<int>(_755);
                _681 = as_type<int>(_753);
                _683 = as_type<int>(_757);
                _685 = as_type<int>(_763);
            }
            _765 = _663;
            int _767 = _665;
            _769 = _667;
            _771 = _669;
            int _773 = _671;
            _775 = _673;
            _777 = _675;
            _779 = _677;
            int _781 = _679;
            _783 = _681;
            _785 = _683;
            _787 = _685;
            _499 = !_539;
            _475 = as_type<float>(_765);
            _477 = as_type<float>(_767);
            _479 = as_type<float>(_769);
            _481 = as_type<float>(_771);
            _483 = as_type<float>(_773);
            _485 = as_type<float>(_775);
            _487 = as_type<float>(_777);
            _489 = as_type<float>(_779);
            _491 = as_type<float>(_781);
            _493 = as_type<float>(_783);
            _495 = as_type<float>(_785);
            _497 = as_type<float>(_787);
            _789 = as_type<float>(_767);
            _791 = as_type<float>(_773);
            _793 = as_type<float>(_781);
        } while (_499);
        _795 = as_type<float>(_775);
        _797 = as_type<float>(_783);
        _799 = as_type<float>(_765);
        _801 = as_type<float>(_769);
        _803 = as_type<float>(_777);
        _805 = as_type<float>(_785);
        _807 = as_type<float>(_779);
        _809 = as_type<float>(_787);
        _811 = as_type<float>(_771);
        _813 = true;
    }
    else
    {
        _789 = _461;
        _795 = _453;
        _797 = _449;
        _799 = _445;
        _791 = _437;
        _793 = _435;
        _801 = _465;
        _803 = _467;
        _805 = _469;
        _807 = _459;
        _809 = _463;
        _811 = _447;
    }
    _813 = false;
    float _815 = _789;
    float _817 = _795;
    float _819 = _797;
    float _821 = _799;
    float _823 = _791;
    float _825 = _793;
    float _827 = _801;
    float _829 = _803;
    float _831 = _805;
    float _833 = _807;
    float _835 = _809;
    float _837 = _811;
    int _839 = _455 + 80;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.cp_c6)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
    int _857 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _859 = _857 + _66;
    int _861 = _455 + 64;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.cp_c6)._m0[int(_873)][_875];
    int _879 = _859 * 48;
    int _881 = _455 + 88;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    int _899 = _455 + 72;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    uint _903 = uint(int(uint(int(_901)) >> uint(2)));
    int _905 = int(_901) & 3;
    float _907 = (*spvDescriptorSet0.cp_c6)._m0[int(_903)][_905];
    int _909 = int(_901) + 1;
    uint _911 = uint(int(uint(_909) >> uint(2)));
    int _913 = _909 & 3;
    float _915 = (*spvDescriptorSet0.cp_c6)._m0[int(_911)][_913];
    int _917 = _455 + 96;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    uint _921 = uint(int(uint(int(_919)) >> uint(2)));
    int _923 = int(_919) & 3;
    float _925 = (*spvDescriptorSet0.cp_c6)._m0[int(_921)][_923];
    int _927 = int(_919) + 1;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    int _931 = _927 & 3;
    float _933 = (*spvDescriptorSet0.cp_c6)._m0[int(_929)][_931];
    int _935 = _455 + 104;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.cp_c6)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.cp_c6)._m0[int(_947)][_949];
    float _953 = _815 * _847;
    float _955 = _817 * _847;
    float _957 = _819 * _847;
    float _959 = _815 * _855;
    float _961 = _819 * _855;
    int _963 = _455 + 16;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.cp_c6)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.cp_c6)._m0[int(_975)][_977];
    float _981 = fma(_821, _869, _953);
    float _983 = fma(_823, _869, _955);
    float _985 = fma(_825, _869, _957);
    float _987 = _817 * _855;
    float _989 = fma(_821, _877, _959);
    int _991 = _455 + 32;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    uint _995 = uint(int(uint(int(_993)) >> uint(2)));
    int _997 = int(_993) & 3;
    float _999 = (*spvDescriptorSet0.cp_c6)._m0[int(_995)][_997];
    int _1001 = int(_993) + 1;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    int _1005 = _1001 & 3;
    float _1007 = (*spvDescriptorSet0.cp_c6)._m0[int(_1003)][_1005];
    float _1009 = fma(_825, _877, _961);
    float _1011 = fma(_823, _877, _987);
    float _1013 = _815 * _889;
    float _1015 = _817 * _889;
    float _1017 = _815 * _897;
    float _1019 = _817 * _897;
    float _1021 = _819 * _889;
    int _1023 = _455 + 48;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.cp_c6)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.cp_c6)._m0[int(_1035)][_1037];
    float _1041 = _819 * _897;
    float _1043 = fma(_821, _907, _1013);
    float _1045 = fma(_823, _907, _1015);
    float _1047 = fma(_821, _915, _1017);
    float _1049 = fma(_823, _915, _1019);
    float _1051 = fma(_825, _907, _1021);
    int _1053 = _455 + 24;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    uint _1057 = uint(int(uint(int(_1055)) >> uint(2)));
    int _1059 = int(_1055) & 3;
    float _1061 = (*spvDescriptorSet0.cp_c6)._m0[int(_1057)][_1059];
    int _1063 = int(_1055) + 1;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    int _1067 = _1063 & 3;
    float _1069 = (*spvDescriptorSet0.cp_c6)._m0[int(_1065)][_1067];
    float _1071 = fma(_825, _915, _1041);
    float _1073 = fma(_827, _925, _981);
    float _1075 = fma(_827, _933, _989);
    float _1077 = fma(_829, _925, _983);
    float _1079 = fma(_829, _933, _1011);
    float _1081 = fma(_831, _925, _985);
    int _1083 = _455 + 40;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.cp_c6)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.cp_c6)._m0[int(_1095)][_1097];
    float _1101 = fma(_831, _933, _1009);
    float _1103 = fma(_827, _943, _1043);
    float _1105 = fma(_829, _951, _1049);
    float _1107 = fma(_827, _951, _1047);
    float _1109 = fma(_831, _951, _1071);
    float _1111 = fma(_829, _943, _1045);
    int _1113 = _455 + 56;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.cp_c6)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    float _1131 = _1105 + _833;
    float _1133 = fma(_831, _943, _1051);
    float _1135 = _1109 + _835;
    float _1137 = _1107 + _837;
    float _1139 = _1077 * _979;
    float _1141 = _1079 * _979;
    float _1143 = _1111 * _979;
    float _1145 = _1131 * _979;
    float _1147 = fma(_1073, _971, _1139);
    float _1149 = fma(_1075, _971, _1141);
    float _1151 = fma(_1103, _971, _1143);
    float _1153 = fma(_1137, _971, _1145);
    float _1155 = _1131 * _1007;
    float _1157 = _1077 * _1007;
    float _1159 = _1079 * _1007;
    float _1161 = _1111 * _1007;
    float _1163 = fma(_1137, _999, _1155);
    float _1165 = fma(_1073, _999, _1157);
    float _1167 = fma(_1075, _999, _1159);
    float _1169 = fma(_1103, _999, _1161);
    float _1171 = _1131 * _1039;
    float _1173 = _1077 * _1039;
    float _1175 = _1079 * _1039;
    float _1177 = _1111 * _1039;
    float _1179 = fma(_1137, _1031, _1171);
    float _1181 = fma(_1073, _1031, _1173);
    float _1183 = fma(_1075, _1031, _1175);
    float _1185 = fma(_1103, _1031, _1177);
    float _1187 = fma(_1135, _1061, _1153);
    float _1189 = fma(_1081, _1061, _1147);
    float _1191 = fma(_1101, _1061, _1149);
    float _1193 = fma(_1133, _1061, _1151);
    float _1195 = _1187 + _1069;
    float _1197 = fma(_1135, _1091, _1163);
    float _1199 = fma(_1081, _1091, _1165);
    float _1201 = fma(_1101, _1091, _1167);
    int _1203 = _879 + 16;
    float _1205 = fma(_1133, _1091, _1169);
    float _1207 = _1197 + _1099;
    int _1209 = _879 + 32;
    float _1211 = fma(_1135, _1121, _1179);
    float _1213 = fma(_1081, _1121, _1181);
    float _1215 = fma(_1101, _1121, _1183);
    float _1217 = fma(_1133, _1121, _1185);
    float _1219 = _1211 + _1129;
    int _1221 = _879 + 48;
    uint _1223 = uint(int(uint(_1203) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1223)] = as_type<uint>(_1189);
    int _1225 = _1203 + 4;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1227)] = as_type<uint>(_1191);
    int _1229 = _1203 + 8;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1231)] = as_type<uint>(_1193);
    int _1233 = _1203 + 12;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1235)] = as_type<uint>(_1195);
    uint _1237 = uint(int(uint(_1209) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1237)] = as_type<uint>(_1199);
    int _1239 = _1209 + 4;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1241)] = as_type<uint>(_1201);
    int _1243 = _1209 + 8;
    uint _1245 = uint(int(uint(_1243) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1245)] = as_type<uint>(_1205);
    int _1247 = _1209 + 12;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1249)] = as_type<uint>(_1207);
    uint _1251 = uint(int(uint(_1221) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1251)] = as_type<uint>(_1213);
    int _1253 = _1221 + 4;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1255)] = as_type<uint>(_1215);
    int _1257 = _1221 + 8;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1259)] = as_type<uint>(_1217);
    int _1261 = _1221 + 12;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1263)] = as_type<uint>(_1219);
}

