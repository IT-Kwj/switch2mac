#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _3177, thread const int& _3178, constant _10& support_buffer)
{
    int _3181 = 1 + _3178;
    float _3183 = support_buffer._m5[_3181].x;
    bool _3185 = _3183 == 1.0;
    if (_3185)
    {
        return _3177;
    }
    float _3187 = float(_3177);
    float _3189 = _3187 * _3183;
    int _3191 = int(_3189);
    return _3191;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _739 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _76 = _74 + 8;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c5)._m0[int(_81)][_83];
    uint _87 = uint(int(uint(_74) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _58(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_85);
    int _103 = 0;
    int _105 = _58(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1267 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1267.xy), uint(_1267.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _58(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _58(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1285 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1285.xy), uint(_1285.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 0;
    int _141 = _58(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_85);
    int _145 = 0;
    int _147 = _58(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1303 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1303.xy), uint(_1303.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 1;
    int _161 = _58(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_93);
    int _165 = 1;
    int _167 = _58(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1321 = int3(_161, _167, 0);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1321.xy), uint(_1321.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    int _177 = _68;
    int _179 = 0;
    int _181 = _58(_177, _179, (*spvDescriptorSet0.support_buffer));
    int _183 = as_type<int>(_85);
    int _185 = 0;
    int _187 = _58(_183, _185, (*spvDescriptorSet0.support_buffer));
    int3 _1339 = int3(_181, _187, 2);
    float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1339.xy), uint(_1339.z), 0).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    int _197 = _68;
    int _199 = 1;
    int _201 = _58(_197, _199, (*spvDescriptorSet0.support_buffer));
    int _203 = as_type<int>(_93);
    int _205 = 1;
    int _207 = _58(_203, _205, (*spvDescriptorSet0.support_buffer));
    int3 _1357 = int3(_201, _207, 2);
    float3 _209 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1357.xy), uint(_1357.z), 0).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    int _217 = _74 + 28;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
    bool _227 = _68 != 0;
    int _229 = _74 + 20;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    uint _233 = uint(int(uint(int(_231)) >> uint(2)));
    int _235 = int(_231) & 3;
    float _237 = (*spvDescriptorSet0.cp_c5)._m0[int(_233)][_235];
    bool _239 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _241 = _111 * _225;
    float _243 = fma(_131, _237, _241);
    float _245 = _243 * 0.15915493667125701904296875;
    float _247 = _115 * _225;
    float _249 = _245 * 6.283185482025146484375;
    float _251 = sin(_249);
    float _253 = fma(_135, _237, _247);
    float _255 = _113 * _225;
    float _257 = _253 * 0.15915493667125701904296875;
    float _259 = fma(_133, _237, _255);
    float _261 = _245 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = _259 * 0.15915493667125701904296875;
    float _267 = _257 * 6.283185482025146484375;
    float _269 = sin(_267);
    float _271 = _257 * 6.283185482025146484375;
    float _273 = cos(_271);
    float _275 = _265 * 6.283185482025146484375;
    float _277 = sin(_275);
    float _279 = _251 * _269;
    float _281 = _151 * _225;
    float _283 = _269 * _263;
    float _285 = _195 * _225;
    int _287 = _68 * 48;
    float _289 = fma(_171, _237, _281);
    int _291 = _68 * 112;
    float _293 = _265 * 6.283185482025146484375;
    float _295 = cos(_293);
    float _297 = _263 * _273;
    float _299 = _251 * _273;
    float _301 = fma(_215, _237, _285);
    uint _303 = as_type<uint>(_285);
    float _305 = _211;
    float _307 = _155;
    float _309 = _213;
    if (!_239)
    {
        int _311 = _287 + 32;
        _303 = uint(_311);
    }
    uint _313 = _303;
    float _315 = _251 * _277;
    float _317 = fma(_277, _297, _279);
    float _319 = -_299;
    float _321 = fma(_277, _283, _319);
    float _323 = fma(_269, _315, _297);
    float _325 = _153 * _225;
    float _327 = -_283;
    float _329 = fma(_273, _315, _327);
    float _331 = _155 * _225;
    float _333 = _295 * _289;
    float _335 = _251 * _295;
    float _337 = fma(_173, _237, _325);
    float _339 = _263 * _295;
    float _341 = _273 * _333;
    float _343 = fma(_175, _237, _331);
    float _345 = _335 * _337;
    float _347 = _193 * _225;
    float _349 = _277 * _289;
    float _351 = _191 * _225;
    float _353 = _269 * _333;
    float _355 = _329 * _337;
    float _357 = _339 * _343;
    float _359 = _317 * _343;
    float _361 = fma(_213, _237, _347);
    float _363 = _323 * _337;
    float _365 = _321 * _343;
    float _367 = fma(_211, _237, _351);
    float _369 = -_349;
    float _371 = _369 + (-0.0);
    float _373 = _323;
    float _375 = _333;
    float _377 = _321;
    float _379 = _317;
    float _381 = _355;
    float _383 = _363;
    float _385 = _359;
    float _387 = _365;
    float _389 = _357;
    if (!_239)
    {
        int _391 = _287 + 16;
        _305 = as_type<float>(_391);
    }
    float _393 = _305;
    int _395 = _287 + 16;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    _39[int(_397)] = as_type<uint>(_353);
    int _399 = _287 + 20;
    uint _401 = uint(int(uint(_399) >> uint(2)));
    _39[int(_401)] = as_type<uint>(_363);
    int _403 = _287 + 24;
    uint _405 = uint(int(uint(_403) >> uint(2)));
    _39[int(_405)] = as_type<uint>(_365);
    int _407 = _287 + 28;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    _39[int(_409)] = as_type<uint>(_361);
    float _411 = _393;
    if (!_227)
    {
        _307 = _367;
    }
    float _413 = _307;
    float _415 = _413;
    if (!_227)
    {
        _373 = _361;
    }
    float _417 = _373;
    int _419 = _287 + 32;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    _39[int(_421)] = as_type<uint>(_371);
    int _423 = _287 + 36;
    uint _425 = uint(int(uint(_423) >> uint(2)));
    _39[int(_425)] = as_type<uint>(_345);
    int _427 = _287 + 40;
    uint _429 = uint(int(uint(_427) >> uint(2)));
    _39[int(_429)] = as_type<uint>(_357);
    int _431 = _287 + 44;
    uint _433 = uint(int(uint(_431) >> uint(2)));
    _39[int(_433)] = as_type<uint>(_301);
    float _435 = _417;
    if (!_227)
    {
        _375 = _301;
    }
    float _437 = _375;
    float _439 = _437;
    if (!_227)
    {
        _309 = _371;
    }
    float _441 = _309;
    uint _443 = uint(int(uint(_287) >> uint(2)));
    _39[int(_443)] = as_type<uint>(_341);
    int _445 = _287 + 4;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    _39[int(_447)] = as_type<uint>(_355);
    int _449 = _287 + 8;
    uint _451 = uint(int(uint(_449) >> uint(2)));
    _39[int(_451)] = as_type<uint>(_359);
    int _453 = _287 + 12;
    uint _455 = uint(int(uint(_453) >> uint(2)));
    _39[int(_455)] = as_type<uint>(_367);
    float _457 = _441;
    if (!_227)
    {
        _377 = _341;
    }
    float _459 = _377;
    float _461 = _459;
    if (!_227)
    {
        _379 = _353;
    }
    float _463 = _379;
    float _465 = _463;
    if (!_239)
    {
        uint _467 = uint(int(uint(_287) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_467)] = as_type<uint>(_341);
        int _469 = _287 + 4;
        uint _471 = uint(int(uint(_469) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_471)] = as_type<uint>(_355);
        int _473 = _287 + 8;
        uint _475 = uint(int(uint(_473) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_475)] = as_type<uint>(_359);
        int _477 = _287 + 12;
        uint _479 = uint(int(uint(_477) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_479)] = as_type<uint>(_367);
    }
    if (!_239)
    {
        uint _481 = uint(int(uint(as_type<int>(_393)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_481)] = as_type<uint>(_353);
        int _483 = as_type<int>(_393) + 4;
        uint _485 = uint(int(uint(_483) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_485)] = as_type<uint>(_363);
        int _487 = as_type<int>(_393) + 8;
        uint _489 = uint(int(uint(_487) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_489)] = as_type<uint>(_365);
        int _491 = as_type<int>(_393) + 12;
        uint _493 = uint(int(uint(_491) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_493)] = as_type<uint>(_361);
    }
    if (!_239)
    {
        uint _495 = uint(int(uint(int(_313)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_495)] = as_type<uint>(_371);
        int _497 = int(_313) + 4;
        uint _499 = uint(int(uint(_497) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_499)] = as_type<uint>(_345);
        int _501 = int(_313) + 8;
        uint _503 = uint(int(uint(_501) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_503)] = as_type<uint>(_357);
        int _505 = int(_313) + 12;
        uint _507 = uint(int(uint(_505) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_507)] = as_type<uint>(_301);
    }
    if (!_227)
    {
        _411 = _345;
    }
    float _509 = _411;
    bool _511 = !_227;
    float _513 = _509;
    if (!_511)
    {
        bool _515 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _517 = !_515;
        if (!_517)
        {
            uint _519 = uint(int(uint(_291) >> uint(2)));
            uint _521 = uint(int(uint(int(_519)) >> uint(2)));
            int _523 = int(_519) & 3;
            float _525 = (*spvDescriptorSet0.cp_c6)._m0[int(_521)][_523];
            int _527 = as_type<int>(_525) * 48;
            int _529 = 0;
            bool _531;
            float _629;
            float _635;
            float _637;
            float _639;
            float _657;
            float _661;
            float _663;
            float _665;
            float _685;
            float _687;
            float _689;
            float _691;
            do
            {
                int _533 = _529;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _535 = uint(int(uint(_527) >> uint(2)));
                float _537 = as_type<float>(_39[int(_535)]);
                int _539 = _527 + 4;
                uint _541 = uint(int(uint(_539) >> uint(2)));
                float _543 = as_type<float>(_39[int(_541)]);
                int _545 = _527 + 8;
                uint _547 = uint(int(uint(_545) >> uint(2)));
                float _549 = as_type<float>(_39[int(_547)]);
                int _551 = _527 + 12;
                uint _553 = uint(int(uint(_551) >> uint(2)));
                float _555 = as_type<float>(_39[int(_553)]);
                int _557 = _533 + 1;
                int _559 = _527 + 16;
                uint _561 = uint(int(uint(_559) >> uint(2)));
                float _563 = as_type<float>(_39[int(_561)]);
                int _565 = _527 + 20;
                uint _567 = uint(int(uint(_565) >> uint(2)));
                float _569 = as_type<float>(_39[int(_567)]);
                int _571 = _527 + 24;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                float _575 = as_type<float>(_39[int(_573)]);
                int _577 = _527 + 28;
                uint _579 = uint(int(uint(_577) >> uint(2)));
                float _581 = as_type<float>(_39[int(_579)]);
                bool _583 = uint(_557) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _585 = _527 + 32;
                uint _587 = uint(int(uint(_585) >> uint(2)));
                float _589 = as_type<float>(_39[int(_587)]);
                int _591 = _527 + 36;
                uint _593 = uint(int(uint(_591) >> uint(2)));
                float _595 = as_type<float>(_39[int(_593)]);
                int _597 = _527 + 40;
                uint _599 = uint(int(uint(_597) >> uint(2)));
                float _601 = as_type<float>(_39[int(_599)]);
                int _603 = _527 + 44;
                uint _605 = uint(int(uint(_603) >> uint(2)));
                float _607 = as_type<float>(_39[int(_605)]);
                float _609 = _361 * _543;
                float _611 = _353 * _543;
                float _613 = _363 * _543;
                float _615 = _365 * _543;
                float _617 = fma(_367, _537, _609);
                float _619 = fma(_341, _537, _611);
                float _621 = fma(_355, _537, _613);
                float _623 = fma(_359, _537, _615);
                float _625 = fma(_301, _549, _617);
                float _627 = -_349;
                _629 = fma(_627, _549, _619);
                float _631 = _361 * _569;
                float _633 = _353 * _569;
                _635 = _555 + _625;
                _637 = fma(_345, _549, _621);
                _639 = fma(_357, _549, _623);
                float _641 = _363 * _569;
                float _643 = _365 * _569;
                float _645 = fma(_367, _563, _631);
                float _647 = fma(_341, _563, _633);
                float _649 = fma(_355, _563, _641);
                float _651 = fma(_359, _563, _643);
                float _653 = fma(_301, _575, _645);
                float _655 = -_349;
                _657 = fma(_655, _575, _647);
                float _659 = _361 * _595;
                _661 = fma(_345, _575, _649);
                _663 = fma(_357, _575, _651);
                _665 = _581 + _653;
                float _667 = _353 * _595;
                float _669 = _363 * _595;
                float _671 = _365 * _595;
                float _673 = fma(_367, _589, _659);
                float _675 = fma(_341, _589, _667);
                float _677 = fma(_355, _589, _669);
                float _679 = fma(_359, _589, _671);
                float _681 = fma(_301, _601, _673);
                float _683 = -_349;
                _685 = fma(_683, _601, _675);
                _687 = fma(_345, _601, _677);
                _689 = fma(_357, _601, _679);
                _691 = _607 + _681;
                uint _693 = uint(int(uint(_287) >> uint(2)));
                _39[int(_693)] = as_type<uint>(_629);
                int _695 = _287 + 4;
                uint _697 = uint(int(uint(_695) >> uint(2)));
                _39[int(_697)] = as_type<uint>(_637);
                int _699 = _287 + 8;
                uint _701 = uint(int(uint(_699) >> uint(2)));
                _39[int(_701)] = as_type<uint>(_639);
                int _703 = _287 + 12;
                uint _705 = uint(int(uint(_703) >> uint(2)));
                _39[int(_705)] = as_type<uint>(_635);
                int _707 = _287 + 16;
                uint _709 = uint(int(uint(_707) >> uint(2)));
                _39[int(_709)] = as_type<uint>(_657);
                int _711 = _287 + 20;
                uint _713 = uint(int(uint(_711) >> uint(2)));
                _39[int(_713)] = as_type<uint>(_661);
                int _715 = _287 + 24;
                uint _717 = uint(int(uint(_715) >> uint(2)));
                _39[int(_717)] = as_type<uint>(_663);
                int _719 = _287 + 28;
                uint _721 = uint(int(uint(_719) >> uint(2)));
                _39[int(_721)] = as_type<uint>(_665);
                int _723 = _287 + 32;
                uint _725 = uint(int(uint(_723) >> uint(2)));
                _39[int(_725)] = as_type<uint>(_685);
                int _727 = _287 + 36;
                uint _729 = uint(int(uint(_727) >> uint(2)));
                _39[int(_729)] = as_type<uint>(_687);
                int _731 = _287 + 40;
                uint _733 = uint(int(uint(_731) >> uint(2)));
                _39[int(_733)] = as_type<uint>(_689);
                int _735 = _287 + 44;
                uint _737 = uint(int(uint(_735) >> uint(2)));
                _39[int(_737)] = as_type<uint>(_691);
                _531 = !_583;
                _529 = _557;
            } while (_531);
            _381 = _637;
            _383 = _661;
            _513 = _687;
            _461 = _629;
            _465 = _657;
            _457 = _685;
            _385 = _639;
            _387 = _663;
            _389 = _689;
            _435 = _665;
            _439 = _691;
            _415 = _635;
            _739 = true;
        }
        else
        {
            _381 = 0.0;
            _383 = 0.0;
            _513 = 0.0;
            _461 = 0.0;
            _465 = 0.0;
            _457 = 0.0;
            _385 = 0.0;
            _387 = 0.0;
            _389 = 0.0;
            _435 = 0.0;
            _439 = 0.0;
            _415 = 0.0;
        }
    }
    _739 = false;
    float _741 = _381;
    float _743 = _383;
    float _745 = _513;
    float _747 = _461;
    float _749 = _465;
    float _751 = _457;
    float _753 = _385;
    float _755 = _387;
    float _757 = _389;
    float _759 = _435;
    float _761 = _439;
    float _763 = _415;
    int _765 = _291 + 80;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.cp_c6)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.cp_c6)._m0[int(_777)][_779];
    int _783 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _785 = _783 + _68;
    int _787 = _291 + 64;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    uint _791 = uint(int(uint(int(_789)) >> uint(2)));
    int _793 = int(_789) & 3;
    float _795 = (*spvDescriptorSet0.cp_c6)._m0[int(_791)][_793];
    int _797 = int(_789) + 1;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    int _801 = _797 & 3;
    float _803 = (*spvDescriptorSet0.cp_c6)._m0[int(_799)][_801];
    int _805 = _785 * 48;
    int _807 = _291 + 88;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    uint _811 = uint(int(uint(int(_809)) >> uint(2)));
    int _813 = int(_809) & 3;
    float _815 = (*spvDescriptorSet0.cp_c6)._m0[int(_811)][_813];
    int _817 = int(_809) + 1;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    int _821 = _817 & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    int _825 = _291 + 72;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.cp_c6)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.cp_c6)._m0[int(_837)][_839];
    int _843 = _291 + 96;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    uint _847 = uint(int(uint(int(_845)) >> uint(2)));
    int _849 = int(_845) & 3;
    float _851 = (*spvDescriptorSet0.cp_c6)._m0[int(_847)][_849];
    int _853 = int(_845) + 1;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    int _857 = _853 & 3;
    float _859 = (*spvDescriptorSet0.cp_c6)._m0[int(_855)][_857];
    int _861 = _291 + 104;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.cp_c6)._m0[int(_873)][_875];
    float _879 = _741 * _773;
    float _881 = _743 * _773;
    float _883 = _745 * _773;
    int _885 = _291 + 16;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    uint _889 = uint(int(uint(int(_887)) >> uint(2)));
    int _891 = int(_887) & 3;
    float _893 = (*spvDescriptorSet0.cp_c6)._m0[int(_889)][_891];
    int _895 = int(_887) + 1;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    int _899 = _895 & 3;
    float _901 = (*spvDescriptorSet0.cp_c6)._m0[int(_897)][_899];
    float _903 = fma(_747, _795, _879);
    float _905 = fma(_749, _795, _881);
    float _907 = fma(_751, _795, _883);
    float _909 = _741 * _781;
    float _911 = _743 * _781;
    float _913 = _745 * _781;
    int _915 = _291 + 32;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    uint _919 = uint(int(uint(int(_917)) >> uint(2)));
    int _921 = int(_917) & 3;
    float _923 = (*spvDescriptorSet0.cp_c6)._m0[int(_919)][_921];
    int _925 = int(_917) + 1;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    int _929 = _925 & 3;
    float _931 = (*spvDescriptorSet0.cp_c6)._m0[int(_927)][_929];
    float _933 = fma(_747, _803, _909);
    float _935 = fma(_749, _803, _911);
    float _937 = _743 * _815;
    float _939 = _743 * _823;
    float _941 = fma(_751, _803, _913);
    float _943 = _745 * _815;
    float _945 = _741 * _815;
    int _947 = _291 + 48;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    uint _951 = uint(int(uint(int(_949)) >> uint(2)));
    int _953 = int(_949) & 3;
    float _955 = (*spvDescriptorSet0.cp_c6)._m0[int(_951)][_953];
    int _957 = int(_949) + 1;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    int _961 = _957 & 3;
    float _963 = (*spvDescriptorSet0.cp_c6)._m0[int(_959)][_961];
    float _965 = _741 * _823;
    float _967 = _745 * _823;
    float _969 = fma(_749, _833, _937);
    float _971 = fma(_749, _841, _939);
    float _973 = fma(_751, _833, _943);
    float _975 = fma(_747, _833, _945);
    float _977 = fma(_747, _841, _965);
    int _979 = _291 + 24;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    uint _983 = uint(int(uint(int(_981)) >> uint(2)));
    int _985 = int(_981) & 3;
    float _987 = (*spvDescriptorSet0.cp_c6)._m0[int(_983)][_985];
    int _989 = int(_981) + 1;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    int _993 = _989 & 3;
    float _995 = (*spvDescriptorSet0.cp_c6)._m0[int(_991)][_993];
    float _997 = fma(_751, _841, _967);
    float _999 = fma(_753, _859, _933);
    float _1001 = fma(_755, _859, _935);
    float _1003 = fma(_755, _851, _905);
    float _1005 = fma(_753, _851, _903);
    float _1007 = fma(_757, _851, _907);
    float _1009 = fma(_757, _859, _941);
    int _1011 = _291 + 40;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    uint _1015 = uint(int(uint(int(_1013)) >> uint(2)));
    int _1017 = int(_1013) & 3;
    float _1019 = (*spvDescriptorSet0.cp_c6)._m0[int(_1015)][_1017];
    int _1021 = int(_1013) + 1;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    int _1025 = _1021 & 3;
    float _1027 = (*spvDescriptorSet0.cp_c6)._m0[int(_1023)][_1025];
    float _1029 = fma(_755, _877, _971);
    float _1031 = fma(_757, _877, _997);
    float _1033 = fma(_753, _877, _977);
    float _1035 = fma(_753, _869, _975);
    float _1037 = _1029 + _759;
    float _1039 = _1031 + _761;
    int _1041 = _291 + 56;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    uint _1045 = uint(int(uint(int(_1043)) >> uint(2)));
    int _1047 = int(_1043) & 3;
    float _1049 = (*spvDescriptorSet0.cp_c6)._m0[int(_1045)][_1047];
    int _1051 = int(_1043) + 1;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    int _1055 = _1051 & 3;
    float _1057 = (*spvDescriptorSet0.cp_c6)._m0[int(_1053)][_1055];
    float _1059 = fma(_755, _869, _969);
    float _1061 = _1033 + _763;
    float _1063 = fma(_757, _869, _973);
    int _1065 = _805 + 32;
    float _1067 = _1037 * _901;
    float _1069 = _1001 * _901;
    float _1071 = _1003 * _901;
    float _1073 = _1059 * _901;
    float _1075 = fma(_1061, _893, _1067);
    float _1077 = fma(_999, _893, _1069);
    float _1079 = fma(_1005, _893, _1071);
    float _1081 = fma(_1035, _893, _1073);
    float _1083 = _1037 * _931;
    float _1085 = _1003 * _931;
    float _1087 = _1001 * _931;
    float _1089 = _1059 * _931;
    float _1091 = fma(_1061, _923, _1083);
    float _1093 = fma(_1005, _923, _1085);
    float _1095 = fma(_999, _923, _1087);
    float _1097 = fma(_1035, _923, _1089);
    float _1099 = _1037 * _963;
    float _1101 = _1003 * _963;
    float _1103 = _1001 * _963;
    float _1105 = _1059 * _963;
    float _1107 = fma(_1061, _955, _1099);
    float _1109 = fma(_1005, _955, _1101);
    float _1111 = fma(_999, _955, _1103);
    float _1113 = fma(_1035, _955, _1105);
    float _1115 = fma(_1039, _987, _1075);
    float _1117 = fma(_1009, _987, _1077);
    float _1119 = fma(_1007, _987, _1079);
    float _1121 = fma(_1063, _987, _1081);
    float _1123 = _1115 + _995;
    int _1125 = _805 + 16;
    int _1127 = _805 + 48;
    float _1129 = fma(_1039, _1019, _1091);
    float _1131 = fma(_1007, _1019, _1093);
    float _1133 = fma(_1009, _1019, _1095);
    float _1135 = fma(_1063, _1019, _1097);
    float _1137 = _1129 + _1027;
    uint _1139 = uint(int(uint(_1125) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1139)] = as_type<uint>(_1119);
    int _1141 = _1125 + 4;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1143)] = as_type<uint>(_1117);
    int _1145 = _1125 + 8;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1147)] = as_type<uint>(_1121);
    int _1149 = _1125 + 12;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1151)] = as_type<uint>(_1123);
    float _1153 = fma(_1039, _1049, _1107);
    float _1155 = fma(_1007, _1049, _1109);
    float _1157 = fma(_1009, _1049, _1111);
    float _1159 = fma(_1063, _1049, _1113);
    float _1161 = _1153 + _1057;
    uint _1163 = uint(int(uint(_1065) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1163)] = as_type<uint>(_1131);
    int _1165 = _1065 + 4;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1167)] = as_type<uint>(_1133);
    int _1169 = _1065 + 8;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1171)] = as_type<uint>(_1135);
    int _1173 = _1065 + 12;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1175)] = as_type<uint>(_1137);
    uint _1177 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1177)] = as_type<uint>(_1155);
    int _1179 = _1127 + 4;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = as_type<uint>(_1157);
    int _1183 = _1127 + 8;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1185)] = as_type<uint>(_1159);
    int _1187 = _1127 + 12;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1189)] = as_type<uint>(_1161);
}

