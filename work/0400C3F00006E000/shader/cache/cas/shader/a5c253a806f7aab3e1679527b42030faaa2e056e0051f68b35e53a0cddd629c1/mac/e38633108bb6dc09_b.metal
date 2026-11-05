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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2945, thread const int& _2946, constant _10& support_buffer)
{
    int _2949 = 1 + _2946;
    float _2951 = support_buffer._m5[_2949].x;
    bool _2953 = _2951 == 1.0;
    if (_2953)
    {
        return _2945;
    }
    float _2955 = float(_2945);
    float _2957 = _2955 * _2951;
    int _2959 = int(_2957);
    return _2959;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _679 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = _64 & 31;
    bool _72 = _70 == 0;
    bool _74 = uint(_70) < 32u;
    int _76 = 32 - _70;
    int _78 = _70 - 32;
    int _80 = 1 << _70;
    uint _83 = uint(int(uint(0) >> uint(_76)));
    int _85 = _80 | int(_83);
    int _87 = _72 ? 1 : _85;
    bool _89 = uint(_78) < 32u;
    int _91 = 0 << _78;
    int _93 = _89 ? _91 : 0;
    float _95 = _74 ? as_type<float>(_87) : as_type<float>(_93);
    int _97 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _99 = _97 + 32;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = as_type<int>(_95) & as_type<int>(_107);
    bool _111 = _109 != 0;
    float _113 = 0.0;
    float _115 = _95;
    int _117 = as_type<int>(_107);
    if (!_111)
    {
        _113 = 0.0;
    }
    float _119 = _113;
    float _121 = 0.0;
    float _123 = 0.0;
    float _125 = _119;
    if (!_111)
    {
        _121 = 0.0;
        _123 = 0.0;
    }
    float _127 = _121;
    float _129 = _123;
    float _131 = _127;
    float _133 = _129;
    if (!_111)
    {
        _115 = 0.0;
    }
    float _135 = _115;
    float _137 = 0.0;
    float _139 = 0.0;
    float _141 = _135;
    if (!_111)
    {
        _137 = 0.0;
        _139 = 0.0;
    }
    float _143 = _137;
    float _145 = _139;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = _143;
    float _153 = _145;
    if (!_111)
    {
        _147 = 0.0;
        _149 = 0.0;
    }
    float _155 = _147;
    float _157 = _149;
    float _159 = _155;
    float _161 = _157;
    if (!_111)
    {
        _117 = 0;
    }
    int _163 = _117;
    bool _165 = !_111;
    int _167 = _163;
    if (!_165)
    {
        uint _169 = uint(int(uint(_97) >> uint(2)));
        uint _171 = uint(int(uint(int(_169)) >> uint(2)));
        int _173 = int(_169) & 3;
        float _175 = (*spvDescriptorSet0.cp_c5)._m0[int(_171)][_173];
        int _177 = _64;
        int _179 = 0;
        int _181 = _54(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = as_type<int>(_175);
        int _185 = 0;
        int _187 = _54(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1304 = int3(_181, _187, 0);
        float3 _191 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1304.xy), uint(_1304.z), 0).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        int _199 = _64;
        int _201 = 0;
        int _203 = _54(_199, _201, (*spvDescriptorSet0.support_buffer));
        int _205 = as_type<int>(_175);
        int _207 = 0;
        int _209 = _54(_205, _207, (*spvDescriptorSet0.support_buffer));
        int3 _1322 = int3(_203, _209, 2);
        float3 _211 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1322.xy), uint(_1322.z), 0).xyz;
        float _213 = _211.x;
        float _215 = _211.y;
        float _217 = _211.z;
        int _219 = _64;
        int _221 = 0;
        int _223 = _54(_219, _221, (*spvDescriptorSet0.support_buffer));
        int _225 = as_type<int>(_175);
        int _227 = 0;
        int _229 = _54(_225, _227, (*spvDescriptorSet0.support_buffer));
        int3 _1340 = int3(_223, _229, 1);
        float3 _231 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1340.xy), uint(_1340.z), 0).xyz;
        float _233 = _231.x;
        float _235 = _231.y;
        float _237 = _231.z;
        _159 = _233;
        _141 = _237;
        _161 = _235;
        _151 = _215;
        _131 = _193;
        _125 = _197;
        _133 = _195;
        _153 = _213;
        _167 = as_type<int>(_217);
    }
    float _239 = _159;
    float _241 = _141;
    float _243 = _161;
    float _245 = _151;
    float _247 = _131;
    float _249 = _125;
    float _251 = _133;
    float _253 = _153;
    int _255 = _167;
    float _257 = _239 * 0.15915493667125701904296875;
    float _259 = _241 * 0.15915493667125701904296875;
    float _261 = _243 * 0.15915493667125701904296875;
    float _263 = _257 * 6.283185482025146484375;
    float _265 = cos(_263);
    bool _267 = _64 != 0;
    float _269 = _259 * 6.283185482025146484375;
    float _271 = sin(_269);
    float _273 = _259 * 6.283185482025146484375;
    float _275 = cos(_273);
    float _277 = _261 * 6.283185482025146484375;
    float _279 = cos(_277);
    float _281 = _271 * _265;
    float _283 = _257 * 6.283185482025146484375;
    float _285 = sin(_283);
    float _287 = _265 * _275;
    float _289 = _261 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = _265 * _279;
    float _295 = _285 * _275;
    float _297 = _285 * _279;
    float _299 = _285 * _271;
    int _301 = _64 * 48;
    float _303 = _285 * _291;
    float _305 = _279 * _247;
    float _307 = _291 * _247;
    float _309 = -_295;
    float _311 = fma(_291, _281, _309);
    float _313 = fma(_271, _303, _287);
    float _315 = _271 * _305;
    float _317 = fma(_291, _287, _299);
    float _319 = _311 * _249;
    float _321 = _313 * _251;
    float _323 = -_281;
    float _325 = fma(_275, _303, _323);
    float _327 = _275 * _305;
    float _329 = _293 * _249;
    float _331 = _317 * _249;
    int _333 = _301 + 16;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    _37[int(_335)] = as_type<uint>(_315);
    int _337 = _301 + 20;
    uint _339 = uint(int(uint(_337) >> uint(2)));
    _37[int(_339)] = as_type<uint>(_321);
    int _341 = _301 + 24;
    uint _343 = uint(int(uint(_341) >> uint(2)));
    _37[int(_343)] = as_type<uint>(_319);
    int _345 = _301 + 28;
    uint _347 = uint(int(uint(_345) >> uint(2)));
    _37[int(_347)] = as_type<uint>(_245);
    float _349 = _325 * _251;
    float _351 = _297 * _251;
    float _353 = -_307;
    float _355 = _353 + (-0.0);
    int _357 = _64 * 112;
    float _359 = _311;
    float _361 = _297;
    float _363 = _303;
    float _365 = _313;
    float _367 = _299;
    float _369 = _281;
    float _371 = _251;
    float _373 = _317;
    float _375 = _253;
    float _377 = _355;
    float _379 = _349;
    float _381 = _331;
    if (!_267)
    {
        _359 = _253;
    }
    float _383 = _359;
    uint _385 = uint(int(uint(_301) >> uint(2)));
    _37[int(_385)] = as_type<uint>(_327);
    int _387 = _301 + 4;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    _37[int(_389)] = as_type<uint>(_349);
    int _391 = _301 + 8;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    _37[int(_393)] = as_type<uint>(_331);
    int _395 = _301 + 12;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    _37[int(_397)] = as_type<uint>(_253);
    float _399 = _383;
    if (!_267)
    {
        _361 = _355;
    }
    float _401 = _361;
    float _403 = _401;
    if (!_267)
    {
        _363 = _245;
    }
    float _405 = _363;
    int _407 = _301 + 32;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    _37[int(_409)] = as_type<uint>(_355);
    int _411 = _301 + 36;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    _37[int(_413)] = as_type<uint>(_351);
    int _415 = _301 + 40;
    uint _417 = uint(int(uint(_415) >> uint(2)));
    _37[int(_417)] = as_type<uint>(_329);
    int _419 = _301 + 44;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    _37[int(_421)] = uint(_255);
    float _423 = _405;
    if (!_267)
    {
        _365 = as_type<float>(_255);
    }
    float _425 = _365;
    float _427 = _425;
    if (!_267)
    {
        _367 = _327;
    }
    float _429 = _367;
    float _431 = _429;
    if (!_267)
    {
        _369 = _315;
    }
    float _433 = _369;
    float _435 = _433;
    if (!_267)
    {
        _371 = _351;
    }
    float _437 = _371;
    float _439 = _437;
    if (!_267)
    {
        _373 = _321;
    }
    float _441 = _373;
    float _443 = _441;
    if (!_267)
    {
        _375 = _329;
    }
    float _445 = _375;
    float _447 = _445;
    if (!_267)
    {
        _377 = _319;
    }
    float _449 = _377;
    bool _451 = !_267;
    float _453 = _449;
    if (!_451)
    {
        bool _455 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _457 = !_455;
        if (!_457)
        {
            uint _459 = uint(int(uint(_357) >> uint(2)));
            uint _461 = uint(int(uint(int(_459)) >> uint(2)));
            int _463 = int(_459) & 3;
            float _465 = (*spvDescriptorSet0.cp_c6)._m0[int(_461)][_463];
            int _467 = as_type<int>(_465) * 48;
            int _469 = 0;
            bool _471;
            float _569;
            float _571;
            float _573;
            float _575;
            float _599;
            float _601;
            float _611;
            float _621;
            float _625;
            float _627;
            float _629;
            float _631;
            do
            {
                int _473 = _469;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _475 = uint(int(uint(_467) >> uint(2)));
                float _477 = as_type<float>(_37[int(_475)]);
                int _479 = _467 + 4;
                uint _481 = uint(int(uint(_479) >> uint(2)));
                float _483 = as_type<float>(_37[int(_481)]);
                int _485 = _467 + 8;
                uint _487 = uint(int(uint(_485) >> uint(2)));
                float _489 = as_type<float>(_37[int(_487)]);
                int _491 = _467 + 12;
                uint _493 = uint(int(uint(_491) >> uint(2)));
                float _495 = as_type<float>(_37[int(_493)]);
                int _497 = _473 + 1;
                int _499 = _467 + 16;
                uint _501 = uint(int(uint(_499) >> uint(2)));
                float _503 = as_type<float>(_37[int(_501)]);
                int _505 = _467 + 20;
                uint _507 = uint(int(uint(_505) >> uint(2)));
                float _509 = as_type<float>(_37[int(_507)]);
                int _511 = _467 + 24;
                uint _513 = uint(int(uint(_511) >> uint(2)));
                float _515 = as_type<float>(_37[int(_513)]);
                int _517 = _467 + 28;
                uint _519 = uint(int(uint(_517) >> uint(2)));
                float _521 = as_type<float>(_37[int(_519)]);
                bool _523 = uint(_497) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _525 = _467 + 32;
                uint _527 = uint(int(uint(_525) >> uint(2)));
                float _529 = as_type<float>(_37[int(_527)]);
                int _531 = _467 + 36;
                uint _533 = uint(int(uint(_531) >> uint(2)));
                float _535 = as_type<float>(_37[int(_533)]);
                int _537 = _467 + 40;
                uint _539 = uint(int(uint(_537) >> uint(2)));
                float _541 = as_type<float>(_37[int(_539)]);
                int _543 = _467 + 44;
                uint _545 = uint(int(uint(_543) >> uint(2)));
                float _547 = as_type<float>(_37[int(_545)]);
                float _549 = _483 * _245;
                float _551 = _315 * _483;
                float _553 = _321 * _483;
                float _555 = _319 * _483;
                float _557 = fma(_477, _253, _549);
                float _559 = fma(_327, _477, _551);
                float _561 = fma(_349, _477, _553);
                float _563 = fma(_331, _477, _555);
                float _565 = fma(_489, as_type<float>(_255), _557);
                float _567 = -_307;
                _569 = fma(_567, _489, _559);
                _571 = fma(_351, _489, _561);
                _573 = fma(_329, _489, _563);
                _575 = _495 + _565;
                float _577 = _509 * _245;
                float _579 = _315 * _509;
                float _581 = _321 * _509;
                float _583 = _319 * _509;
                float _585 = fma(_503, _253, _577);
                float _587 = fma(_327, _503, _579);
                float _589 = fma(_349, _503, _581);
                float _591 = fma(_331, _503, _583);
                float _593 = fma(_515, as_type<float>(_255), _585);
                float _595 = _535 * _245;
                float _597 = -_307;
                _599 = fma(_597, _515, _587);
                _601 = fma(_351, _515, _589);
                float _603 = _315 * _535;
                float _605 = _321 * _535;
                float _607 = _319 * _535;
                float _609 = fma(_529, _253, _595);
                _611 = _521 + _593;
                float _613 = fma(_327, _529, _603);
                float _615 = fma(_349, _529, _605);
                float _617 = fma(_331, _529, _607);
                float _619 = fma(_541, as_type<float>(_255), _609);
                _621 = fma(_329, _515, _591);
                float _623 = -_307;
                _625 = fma(_623, _541, _613);
                _627 = fma(_351, _541, _615);
                _629 = fma(_329, _541, _617);
                _631 = _547 + _619;
                uint _633 = uint(int(uint(_301) >> uint(2)));
                _37[int(_633)] = as_type<uint>(_569);
                int _635 = _301 + 4;
                uint _637 = uint(int(uint(_635) >> uint(2)));
                _37[int(_637)] = as_type<uint>(_571);
                int _639 = _301 + 8;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                _37[int(_641)] = as_type<uint>(_573);
                int _643 = _301 + 12;
                uint _645 = uint(int(uint(_643) >> uint(2)));
                _37[int(_645)] = as_type<uint>(_575);
                int _647 = _301 + 16;
                uint _649 = uint(int(uint(_647) >> uint(2)));
                _37[int(_649)] = as_type<uint>(_599);
                int _651 = _301 + 20;
                uint _653 = uint(int(uint(_651) >> uint(2)));
                _37[int(_653)] = as_type<uint>(_601);
                int _655 = _301 + 24;
                uint _657 = uint(int(uint(_655) >> uint(2)));
                _37[int(_657)] = as_type<uint>(_621);
                int _659 = _301 + 28;
                uint _661 = uint(int(uint(_659) >> uint(2)));
                _37[int(_661)] = as_type<uint>(_611);
                int _663 = _301 + 32;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                _37[int(_665)] = as_type<uint>(_625);
                int _667 = _301 + 36;
                uint _669 = uint(int(uint(_667) >> uint(2)));
                _37[int(_669)] = as_type<uint>(_627);
                int _671 = _301 + 40;
                uint _673 = uint(int(uint(_671) >> uint(2)));
                _37[int(_673)] = as_type<uint>(_629);
                int _675 = _301 + 44;
                uint _677 = uint(int(uint(_675) >> uint(2)));
                _37[int(_677)] = as_type<uint>(_631);
                _471 = !_523;
                _469 = _497;
            } while (_471);
            _443 = _601;
            _379 = _571;
            _439 = _627;
            _435 = _599;
            _431 = _569;
            _403 = _625;
            _381 = _573;
            _453 = _621;
            _447 = _629;
            _423 = _611;
            _399 = _575;
            _427 = _631;
            _679 = true;
        }
        else
        {
            _443 = 0.0;
            _379 = 0.0;
            _439 = 0.0;
            _435 = 0.0;
            _431 = 0.0;
            _403 = 0.0;
            _381 = 0.0;
            _453 = 0.0;
            _447 = 0.0;
            _423 = 0.0;
            _399 = 0.0;
            _427 = 0.0;
        }
    }
    _679 = false;
    float _681 = _443;
    float _683 = _379;
    float _685 = _439;
    float _687 = _435;
    float _689 = _431;
    float _691 = _403;
    float _693 = _381;
    float _695 = _453;
    float _697 = _447;
    float _699 = _423;
    float _701 = _399;
    float _703 = _427;
    int _705 = _357 + 80;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    uint _709 = uint(int(uint(int(_707)) >> uint(2)));
    int _711 = int(_707) & 3;
    float _713 = (*spvDescriptorSet0.cp_c6)._m0[int(_709)][_711];
    int _715 = int(_707) + 1;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    int _719 = _715 & 3;
    float _721 = (*spvDescriptorSet0.cp_c6)._m0[int(_717)][_719];
    int _723 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _725 = _723 + _64;
    int _727 = _357 + 64;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    uint _731 = uint(int(uint(int(_729)) >> uint(2)));
    int _733 = int(_729) & 3;
    float _735 = (*spvDescriptorSet0.cp_c6)._m0[int(_731)][_733];
    int _737 = int(_729) + 1;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    int _741 = _737 & 3;
    float _743 = (*spvDescriptorSet0.cp_c6)._m0[int(_739)][_741];
    int _745 = _725 * 48;
    int _747 = _357 + 88;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.cp_c6)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.cp_c6)._m0[int(_759)][_761];
    int _765 = _357 + 72;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.cp_c6)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.cp_c6)._m0[int(_777)][_779];
    int _783 = _357 + 104;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.cp_c6)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.cp_c6)._m0[int(_795)][_797];
    int _801 = _357 + 96;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.cp_c6)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.cp_c6)._m0[int(_813)][_815];
    float _819 = _681 * _713;
    int _821 = _357 + 32;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    uint _825 = uint(int(uint(int(_823)) >> uint(2)));
    int _827 = int(_823) & 3;
    float _829 = (*spvDescriptorSet0.cp_c6)._m0[int(_825)][_827];
    int _831 = int(_823) + 1;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    int _835 = _831 & 3;
    float _837 = (*spvDescriptorSet0.cp_c6)._m0[int(_833)][_835];
    float _839 = _683 * _713;
    float _841 = _685 * _713;
    float _843 = _685 * _721;
    float _845 = fma(_687, _735, _819);
    float _847 = _681 * _721;
    int _849 = _357 + 16;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    uint _853 = uint(int(uint(int(_851)) >> uint(2)));
    int _855 = int(_851) & 3;
    float _857 = (*spvDescriptorSet0.cp_c6)._m0[int(_853)][_855];
    int _859 = int(_851) + 1;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    int _863 = _859 & 3;
    float _865 = (*spvDescriptorSet0.cp_c6)._m0[int(_861)][_863];
    float _867 = fma(_689, _735, _839);
    float _869 = fma(_691, _735, _841);
    float _871 = fma(_687, _743, _847);
    float _873 = fma(_691, _743, _843);
    float _875 = _683 * _721;
    float _877 = _683 * _755;
    float _879 = _683 * _763;
    int _881 = _357 + 48;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    float _899 = _681 * _755;
    float _901 = _685 * _755;
    float _903 = _681 * _763;
    float _905 = _685 * _763;
    float _907 = fma(_689, _743, _875);
    float _909 = fma(_689, _773, _877);
    float _911 = fma(_689, _781, _879);
    int _913 = _357 + 24;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    float _931 = fma(_691, _773, _901);
    float _933 = fma(_687, _773, _899);
    float _935 = fma(_687, _781, _903);
    float _937 = fma(_691, _781, _905);
    float _939 = fma(_693, _791, _909);
    float _941 = fma(_695, _799, _935);
    int _943 = _357 + 40;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    uint _947 = uint(int(uint(int(_945)) >> uint(2)));
    int _949 = int(_945) & 3;
    float _951 = (*spvDescriptorSet0.cp_c6)._m0[int(_947)][_949];
    int _953 = int(_945) + 1;
    uint _955 = uint(int(uint(_953) >> uint(2)));
    int _957 = _953 & 3;
    float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
    float _961 = fma(_693, _799, _911);
    float _963 = fma(_697, _791, _931);
    float _965 = _941 + _699;
    float _967 = _961 + _701;
    float _969 = fma(_695, _809, _845);
    float _971 = fma(_693, _809, _867);
    int _973 = _357 + 56;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    uint _977 = uint(int(uint(int(_975)) >> uint(2)));
    int _979 = int(_975) & 3;
    float _981 = (*spvDescriptorSet0.cp_c6)._m0[int(_977)][_979];
    int _983 = int(_975) + 1;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    int _987 = _983 & 3;
    float _989 = (*spvDescriptorSet0.cp_c6)._m0[int(_985)][_987];
    float _991 = fma(_693, _817, _907);
    float _993 = fma(_695, _817, _871);
    float _995 = fma(_695, _791, _933);
    float _997 = fma(_697, _809, _869);
    float _999 = fma(_697, _799, _937);
    float _1001 = fma(_697, _817, _873);
    float _1003 = _969 * _837;
    float _1005 = _993 * _837;
    float _1007 = _995 * _837;
    float _1009 = _965 * _837;
    float _1011 = fma(_971, _829, _1003);
    float _1013 = fma(_991, _829, _1005);
    float _1015 = fma(_939, _829, _1007);
    float _1017 = fma(_967, _829, _1009);
    float _1019 = _999 + _703;
    float _1021 = _965 * _865;
    float _1023 = _993 * _865;
    float _1025 = _969 * _865;
    float _1027 = _995 * _865;
    float _1029 = fma(_967, _857, _1021);
    float _1031 = fma(_991, _857, _1023);
    float _1033 = fma(_971, _857, _1025);
    float _1035 = fma(_939, _857, _1027);
    float _1037 = _965 * _897;
    float _1039 = _969 * _897;
    float _1041 = _993 * _897;
    float _1043 = _995 * _897;
    float _1045 = fma(_967, _889, _1037);
    float _1047 = fma(_971, _889, _1039);
    float _1049 = fma(_991, _889, _1041);
    float _1051 = fma(_939, _889, _1043);
    float _1053 = fma(_1019, _921, _1029);
    float _1055 = fma(_1001, _921, _1031);
    float _1057 = fma(_997, _921, _1033);
    float _1059 = fma(_963, _921, _1035);
    float _1061 = _1053 + _929;
    int _1063 = _745 + 16;
    int _1065 = _745 + 32;
    float _1067 = fma(_1019, _951, _1017);
    float _1069 = fma(_997, _951, _1011);
    float _1071 = fma(_1001, _951, _1013);
    float _1073 = fma(_963, _951, _1015);
    float _1075 = _1067 + _959;
    int _1077 = _745 + 48;
    uint _1079 = uint(int(uint(_1063) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1079)] = as_type<uint>(_1057);
    int _1081 = _1063 + 4;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1083)] = as_type<uint>(_1055);
    int _1085 = _1063 + 8;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1087)] = as_type<uint>(_1059);
    int _1089 = _1063 + 12;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1091)] = as_type<uint>(_1061);
    float _1093 = fma(_1019, _981, _1045);
    float _1095 = fma(_997, _981, _1047);
    float _1097 = fma(_1001, _981, _1049);
    float _1099 = fma(_963, _981, _1051);
    float _1101 = _1093 + _989;
    uint _1103 = uint(int(uint(_1065) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1103)] = as_type<uint>(_1069);
    int _1105 = _1065 + 4;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1107)] = as_type<uint>(_1071);
    int _1109 = _1065 + 8;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1111)] = as_type<uint>(_1073);
    int _1113 = _1065 + 12;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1115)] = as_type<uint>(_1075);
    uint _1117 = uint(int(uint(_1077) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1117)] = as_type<uint>(_1095);
    int _1119 = _1077 + 4;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1121)] = as_type<uint>(_1097);
    int _1123 = _1077 + 8;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1125)] = as_type<uint>(_1099);
    int _1127 = _1077 + 12;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1129)] = as_type<uint>(_1101);
}

