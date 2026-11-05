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
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3180, thread const int& _3181, constant _10& support_buffer)
{
    int _3184 = 1 + _3181;
    float _3186 = support_buffer._m5[_3184].x;
    bool _3188 = _3186 == 1.0;
    if (_3188)
    {
        return _3180;
    }
    float _3190 = float(_3180);
    float _3192 = _3190 * _3186;
    int _3194 = int(_3192);
    return _3194;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _703 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    float _97 = _76 ? as_type<float>(_89) : as_type<float>(_95);
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = as_type<int>(_97) & as_type<int>(_109);
    bool _113 = _111 != 0;
    int _115 = 0;
    float _117 = _97;
    float _119 = _109;
    if (_113)
    {
        uint _121 = uint(int(uint(_99) >> uint(2)));
        uint _123 = uint(int(uint(int(_121)) >> uint(2)));
        int _125 = int(_121) & 3;
        float _127 = (*spvDescriptorSet0.cp_c5)._m0[int(_123)][_125];
        _115 = as_type<int>(_127);
    }
    int _129 = _115;
    if (!_113)
    {
        _117 = 0.0;
    }
    float _131 = _117;
    float _133 = 0.0;
    float _135 = 0.0;
    if (!_113)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _137 = _133;
    float _139 = _135;
    float _141 = 0.0;
    if (_113)
    {
        _141 = 1.4012984643248170709237295832899e-45;
    }
    float _143 = _141;
    float _145 = 0.0;
    float _147 = 0.0;
    if (!_113)
    {
        _145 = 0.0;
        _147 = 0.0;
    }
    float _149 = _145;
    float _151 = _147;
    float _153 = 0.0;
    float _155 = _149;
    float _157 = _151;
    if (!_113)
    {
        _153 = 0.0;
    }
    float _159 = _153;
    int _161 = 0;
    int _163 = 0;
    float _165 = _159;
    if (!_113)
    {
        _161 = 0;
        _163 = 0;
    }
    int _167 = _161;
    int _169 = _163;
    if (!_113)
    {
        _119 = 0.0;
    }
    float _171 = _119;
    float _173 = 0.0;
    if (_113)
    {
        _173 = 2.8025969286496341418474591665798e-45;
    }
    float _175 = _173;
    float _177 = _137;
    float _179 = _139;
    float _181 = _131;
    if (_113)
    {
        int _183 = _66;
        int _185 = 0;
        int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
        int _189 = _129;
        int _191 = 0;
        int _193 = _56(_189, _191, (*spvDescriptorSet0.support_buffer));
        int3 _1382 = int3(_187, _193, as_type<int>(_143));
        float3 _197 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1382.xy), uint(_1382.z), 0).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        _177 = _199;
        _179 = _201;
        _181 = _203;
    }
    float _205 = _177;
    float _207 = _179;
    float _209 = _181;
    if (_113)
    {
        int _211 = _66;
        int _213 = 0;
        int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _129;
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1408 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1408.xy), uint(_1408.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        _155 = _225;
        _157 = _227;
        _165 = _229;
    }
    float _231 = _155;
    float _233 = _157;
    float _235 = _165;
    int _237 = _167;
    int _239 = _169;
    float _241 = _171;
    float _243 = _231;
    float _245 = _235;
    float _247 = _233;
    if (_113)
    {
        int _249 = _66;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = _129;
        int _257 = 0;
        int _259 = _56(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1442 = int3(_253, _259, as_type<int>(_175));
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1442.xy), uint(_1442.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        _237 = as_type<int>(_263);
        _239 = as_type<int>(_265);
        _241 = _267;
    }
    int _269 = _237;
    int _271 = _239;
    float _273 = _241;
    bool _275 = _66 != 0;
    float _277 = _205 * 0.15915493667125701904296875;
    float _279 = _209 * 0.15915493667125701904296875;
    float _281 = _207 * 0.15915493667125701904296875;
    float _283 = _277 * 6.283185482025146484375;
    float _285 = sin(_283);
    float _287 = _277 * 6.283185482025146484375;
    float _289 = cos(_287);
    float _291 = _279 * 6.283185482025146484375;
    float _293 = sin(_291);
    float _295 = _279 * 6.283185482025146484375;
    float _297 = cos(_295);
    float _299 = _281 * 6.283185482025146484375;
    float _301 = cos(_299);
    float _303 = _293 * _289;
    float _305 = _285 * _293;
    int _307 = _66 * 112;
    float _309 = _281 * 6.283185482025146484375;
    float _311 = sin(_309);
    float _313 = _289 * _297;
    float _315 = _285 * _297;
    float _317 = _289 * _301;
    float _319 = _285 * _301;
    float _321 = _285 * _311;
    float _323 = _301 * _231;
    float _325 = _311 * _231;
    float _327 = fma(_311, _313, _305);
    float _329 = -_315;
    float _331 = fma(_311, _303, _329);
    float _333 = -_303;
    float _335 = fma(_297, _321, _333);
    float _337 = fma(_293, _321, _313);
    float _339 = _293 * _323;
    float _341 = _297 * _323;
    float _343 = _335 * _233;
    float _345 = _317 * _235;
    float _347 = _319 * _233;
    float _349 = _337 * _233;
    float _351 = _327 * _235;
    float _353 = _331 * _235;
    int _355 = _66 * 48;
    float _357 = -_325;
    float _359 = (-0.0) + _357;
    float _361 = _331;
    float _363 = _303;
    float _365 = _321;
    float _367 = _337;
    float _369 = _319;
    float _371 = _313;
    float _373 = _327;
    float _375 = _315;
    float _377 = _297;
    if (!_275)
    {
        _361 = as_type<float>(_269);
    }
    float _379 = _361;
    float _381 = _379;
    if (!_275)
    {
        _363 = as_type<float>(_271);
    }
    float _383 = _363;
    uint _385 = uint(int(uint(_355) >> uint(2)));
    _39[int(_385)] = as_type<uint>(_341);
    int _387 = _355 + 4;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    _39[int(_389)] = as_type<uint>(_343);
    int _391 = _355 + 8;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    _39[int(_393)] = as_type<uint>(_351);
    int _395 = _355 + 12;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    _39[int(_397)] = uint(_269);
    int _399 = _355 + 16;
    int _401 = _355 + 32;
    int _403 = _355 + 16;
    uint _405 = uint(int(uint(_403) >> uint(2)));
    _39[int(_405)] = as_type<uint>(_339);
    int _407 = _355 + 20;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    _39[int(_409)] = as_type<uint>(_349);
    int _411 = _355 + 24;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    _39[int(_413)] = as_type<uint>(_353);
    int _415 = _355 + 28;
    uint _417 = uint(int(uint(_415) >> uint(2)));
    _39[int(_417)] = uint(_271);
    float _419 = _383;
    if (!_275)
    {
        _365 = _273;
    }
    float _421 = _365;
    float _423 = _421;
    if (!_275)
    {
        _367 = _359;
    }
    float _425 = _367;
    int _427 = _355 + 32;
    uint _429 = uint(int(uint(_427) >> uint(2)));
    _39[int(_429)] = as_type<uint>(_359);
    int _431 = _355 + 36;
    uint _433 = uint(int(uint(_431) >> uint(2)));
    _39[int(_433)] = as_type<uint>(_347);
    int _435 = _355 + 40;
    uint _437 = uint(int(uint(_435) >> uint(2)));
    _39[int(_437)] = as_type<uint>(_345);
    int _439 = _355 + 44;
    uint _441 = uint(int(uint(_439) >> uint(2)));
    _39[int(_441)] = as_type<uint>(_273);
    float _443 = _425;
    if (!_275)
    {
        _369 = _341;
    }
    float _445 = _369;
    float _447 = _445;
    if (!_275)
    {
        _243 = _339;
    }
    float _449 = _243;
    float _451 = _449;
    if (!_275)
    {
        _371 = _347;
    }
    float _453 = _371;
    float _455 = _453;
    if (!_275)
    {
        _245 = _345;
    }
    float _457 = _245;
    float _459 = _457;
    if (!_275)
    {
        _373 = _343;
    }
    float _461 = _373;
    float _463 = _461;
    if (!_275)
    {
        _375 = _351;
    }
    float _465 = _375;
    float _467 = _465;
    if (!_275)
    {
        _247 = _349;
    }
    float _469 = _247;
    float _471 = _469;
    if (!_275)
    {
        _377 = _353;
    }
    float _473 = _377;
    bool _475 = !_275;
    float _477 = _473;
    if (!_475)
    {
        bool _479 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _481 = !_479;
        if (!_481)
        {
            uint _483 = uint(int(uint(_307) >> uint(2)));
            uint _485 = uint(int(uint(int(_483)) >> uint(2)));
            int _487 = int(_483) & 3;
            float _489 = (*spvDescriptorSet0.cp_c6)._m0[int(_485)][_487];
            int _491 = as_type<int>(_489) * 48;
            int _493 = 0;
            bool _495;
            float _595;
            float _597;
            float _605;
            float _617;
            float _619;
            float _631;
            float _643;
            float _645;
            float _649;
            float _651;
            float _653;
            float _655;
            do
            {
                int _497 = _493;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _499 = uint(int(uint(_491) >> uint(2)));
                float _501 = as_type<float>(_39[int(_499)]);
                int _503 = _491 + 4;
                uint _505 = uint(int(uint(_503) >> uint(2)));
                float _507 = as_type<float>(_39[int(_505)]);
                int _509 = _491 + 8;
                uint _511 = uint(int(uint(_509) >> uint(2)));
                float _513 = as_type<float>(_39[int(_511)]);
                int _515 = _491 + 12;
                uint _517 = uint(int(uint(_515) >> uint(2)));
                float _519 = as_type<float>(_39[int(_517)]);
                int _521 = _497 + 1;
                int _523 = _491 + 16;
                uint _525 = uint(int(uint(_523) >> uint(2)));
                float _527 = as_type<float>(_39[int(_525)]);
                int _529 = _491 + 20;
                uint _531 = uint(int(uint(_529) >> uint(2)));
                float _533 = as_type<float>(_39[int(_531)]);
                int _535 = _491 + 24;
                uint _537 = uint(int(uint(_535) >> uint(2)));
                float _539 = as_type<float>(_39[int(_537)]);
                int _541 = _491 + 28;
                uint _543 = uint(int(uint(_541) >> uint(2)));
                float _545 = as_type<float>(_39[int(_543)]);
                bool _547 = uint(_521) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _549 = _491 + 32;
                uint _551 = uint(int(uint(_549) >> uint(2)));
                float _553 = as_type<float>(_39[int(_551)]);
                int _555 = _491 + 36;
                uint _557 = uint(int(uint(_555) >> uint(2)));
                float _559 = as_type<float>(_39[int(_557)]);
                int _561 = _491 + 40;
                uint _563 = uint(int(uint(_561) >> uint(2)));
                float _565 = as_type<float>(_39[int(_563)]);
                int _567 = _491 + 44;
                uint _569 = uint(int(uint(_567) >> uint(2)));
                float _571 = as_type<float>(_39[int(_569)]);
                float _573 = _507 * as_type<float>(_271);
                float _575 = _339 * _507;
                float _577 = _349 * _507;
                float _579 = _353 * _507;
                float _581 = fma(_501, as_type<float>(_269), _573);
                float _583 = fma(_341, _501, _575);
                float _585 = fma(_343, _501, _577);
                float _587 = fma(_351, _501, _579);
                float _589 = fma(_513, _273, _581);
                float _591 = _533 * as_type<float>(_271);
                float _593 = -_325;
                _595 = fma(_593, _513, _583);
                _597 = fma(_347, _513, _585);
                float _599 = _339 * _533;
                float _601 = _349 * _533;
                float _603 = fma(_527, as_type<float>(_269), _591);
                _605 = _519 + _589;
                float _607 = fma(_341, _527, _599);
                float _609 = fma(_343, _527, _601);
                float _611 = fma(_539, _273, _603);
                float _613 = _559 * as_type<float>(_271);
                float _615 = -_325;
                _617 = fma(_615, _539, _607);
                _619 = fma(_347, _539, _609);
                float _621 = _339 * _559;
                float _623 = _349 * _559;
                float _625 = _353 * _533;
                float _627 = _353 * _559;
                float _629 = fma(_553, as_type<float>(_269), _613);
                _631 = _545 + _611;
                float _633 = fma(_351, _527, _625);
                float _635 = fma(_341, _553, _621);
                float _637 = fma(_343, _553, _623);
                float _639 = fma(_351, _553, _627);
                float _641 = fma(_565, _273, _629);
                _643 = fma(_345, _513, _587);
                _645 = fma(_345, _539, _633);
                float _647 = -_325;
                _649 = fma(_647, _565, _635);
                _651 = fma(_347, _565, _637);
                _653 = fma(_345, _565, _639);
                _655 = _571 + _641;
                uint _657 = uint(int(uint(_355) >> uint(2)));
                _39[int(_657)] = as_type<uint>(_595);
                int _659 = _355 + 4;
                uint _661 = uint(int(uint(_659) >> uint(2)));
                _39[int(_661)] = as_type<uint>(_597);
                int _663 = _355 + 8;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                _39[int(_665)] = as_type<uint>(_643);
                int _667 = _355 + 12;
                uint _669 = uint(int(uint(_667) >> uint(2)));
                _39[int(_669)] = as_type<uint>(_605);
                int _671 = _355 + 16;
                uint _673 = uint(int(uint(_671) >> uint(2)));
                _39[int(_673)] = as_type<uint>(_617);
                int _675 = _355 + 20;
                uint _677 = uint(int(uint(_675) >> uint(2)));
                _39[int(_677)] = as_type<uint>(_619);
                int _679 = _355 + 24;
                uint _681 = uint(int(uint(_679) >> uint(2)));
                _39[int(_681)] = as_type<uint>(_645);
                int _683 = _355 + 28;
                uint _685 = uint(int(uint(_683) >> uint(2)));
                _39[int(_685)] = as_type<uint>(_631);
                int _687 = _355 + 32;
                uint _689 = uint(int(uint(_687) >> uint(2)));
                _39[int(_689)] = as_type<uint>(_649);
                int _691 = _355 + 36;
                uint _693 = uint(int(uint(_691) >> uint(2)));
                _39[int(_693)] = as_type<uint>(_651);
                int _695 = _355 + 40;
                uint _697 = uint(int(uint(_695) >> uint(2)));
                _39[int(_697)] = as_type<uint>(_653);
                int _699 = _355 + 44;
                uint _701 = uint(int(uint(_699) >> uint(2)));
                _39[int(_701)] = as_type<uint>(_655);
                _495 = !_547;
                _493 = _521;
            } while (_495);
            _447 = _595;
            _463 = _597;
            _467 = _643;
            _381 = _605;
            _451 = _617;
            _471 = _619;
            _477 = _645;
            _419 = _631;
            _443 = _649;
            _455 = _651;
            _459 = _653;
            _423 = _655;
            _703 = true;
        }
        else
        {
            _447 = 0.0;
            _463 = 0.0;
            _467 = 0.0;
            _381 = 0.0;
            _451 = 0.0;
            _471 = 0.0;
            _477 = 0.0;
            _419 = 0.0;
            _443 = 0.0;
            _455 = 0.0;
            _459 = 0.0;
            _423 = 0.0;
        }
    }
    _703 = false;
    float _705 = _447;
    float _707 = _463;
    float _709 = _467;
    float _711 = _381;
    float _713 = _451;
    float _715 = _471;
    float _717 = _477;
    float _719 = _419;
    float _721 = _443;
    float _723 = _455;
    float _725 = _459;
    float _727 = _423;
    int _729 = _307 + 80;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.cp_c6)._m0[int(_741)][_743];
    bool _747 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _749 = _307 + 64;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    uint _753 = uint(int(uint(int(_751)) >> uint(2)));
    int _755 = int(_751) & 3;
    float _757 = (*spvDescriptorSet0.cp_c6)._m0[int(_753)][_755];
    int _759 = int(_751) + 1;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    int _763 = _759 & 3;
    float _765 = (*spvDescriptorSet0.cp_c6)._m0[int(_761)][_763];
    int _767 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _769 = _767 + _66;
    int _771 = _307 + 88;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    uint _775 = uint(int(uint(int(_773)) >> uint(2)));
    int _777 = int(_773) & 3;
    float _779 = (*spvDescriptorSet0.cp_c6)._m0[int(_775)][_777];
    int _781 = int(_773) + 1;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    int _785 = _781 & 3;
    float _787 = (*spvDescriptorSet0.cp_c6)._m0[int(_783)][_785];
    int _789 = _307 + 72;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
    int _799 = int(_791) + 1;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    int _803 = _799 & 3;
    float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
    int _807 = _307 + 96;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    uint _811 = uint(int(uint(int(_809)) >> uint(2)));
    int _813 = int(_809) & 3;
    float _815 = (*spvDescriptorSet0.cp_c6)._m0[int(_811)][_813];
    int _817 = int(_809) + 1;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    int _821 = _817 & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    int _825 = _307 + 104;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.cp_c6)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.cp_c6)._m0[int(_837)][_839];
    int _843 = _307 + 16;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    uint _847 = uint(int(uint(int(_845)) >> uint(2)));
    int _849 = int(_845) & 3;
    float _851 = (*spvDescriptorSet0.cp_c6)._m0[int(_847)][_849];
    int _853 = int(_845) + 1;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    int _857 = _853 & 3;
    float _859 = (*spvDescriptorSet0.cp_c6)._m0[int(_855)][_857];
    if (!_747)
    {
        uint _861 = uint(int(uint(_355) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_861)] = as_type<uint>(_705);
        int _863 = _355 + 4;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_865)] = as_type<uint>(_707);
        int _867 = _355 + 8;
        uint _869 = uint(int(uint(_867) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_869)] = as_type<uint>(_709);
        int _871 = _355 + 12;
        uint _873 = uint(int(uint(_871) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_873)] = as_type<uint>(_711);
        uint _875 = uint(int(uint(_399) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_875)] = as_type<uint>(_713);
        int _877 = _399 + 4;
        uint _879 = uint(int(uint(_877) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_879)] = as_type<uint>(_715);
        int _881 = _399 + 8;
        uint _883 = uint(int(uint(_881) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_883)] = as_type<uint>(_717);
        int _885 = _399 + 12;
        uint _887 = uint(int(uint(_885) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_887)] = as_type<uint>(_719);
        uint _889 = uint(int(uint(_401) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_889)] = as_type<uint>(_721);
        int _891 = _401 + 4;
        uint _893 = uint(int(uint(_891) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_893)] = as_type<uint>(_723);
        int _895 = _401 + 8;
        uint _897 = uint(int(uint(_895) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_897)] = as_type<uint>(_725);
        int _899 = _401 + 12;
        uint _901 = uint(int(uint(_899) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_901)] = as_type<uint>(_727);
    }
    float _903 = _715 * _737;
    float _905 = _723 * _737;
    int _907 = _307 + 32;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.cp_c6)._m0[int(_911)][_913];
    int _917 = int(_909) + 1;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    int _921 = _917 & 3;
    float _923 = (*spvDescriptorSet0.cp_c6)._m0[int(_919)][_921];
    float _925 = _707 * _737;
    float _927 = fma(_713, _757, _903);
    float _929 = _707 * _745;
    float _931 = fma(_721, _757, _905);
    float _933 = _715 * _745;
    float _935 = _723 * _745;
    float _937 = fma(_705, _765, _929);
    int _939 = _307 + 48;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    uint _943 = uint(int(uint(int(_941)) >> uint(2)));
    int _945 = int(_941) & 3;
    float _947 = (*spvDescriptorSet0.cp_c6)._m0[int(_943)][_945];
    int _949 = int(_941) + 1;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    int _953 = _949 & 3;
    float _955 = (*spvDescriptorSet0.cp_c6)._m0[int(_951)][_953];
    float _957 = _707 * _779;
    float _959 = _707 * _787;
    float _961 = _715 * _779;
    float _963 = _715 * _787;
    float _965 = _723 * _779;
    float _967 = _723 * _787;
    float _969 = fma(_705, _757, _925);
    float _971 = fma(_713, _765, _933);
    float _973 = fma(_721, _765, _935);
    float _975 = fma(_705, _797, _957);
    int _977 = _307 + 24;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    uint _981 = uint(int(uint(int(_979)) >> uint(2)));
    int _983 = int(_979) & 3;
    float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
    int _987 = int(_979) + 1;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    int _991 = _987 & 3;
    float _993 = (*spvDescriptorSet0.cp_c6)._m0[int(_989)][_991];
    float _995 = fma(_705, _805, _959);
    float _997 = fma(_713, _797, _961);
    float _999 = fma(_713, _805, _963);
    float _1001 = fma(_721, _797, _965);
    float _1003 = fma(_721, _805, _967);
    float _1005 = fma(_709, _823, _937);
    float _1007 = fma(_717, _815, _927);
    int _1009 = _307 + 40;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    uint _1013 = uint(int(uint(int(_1011)) >> uint(2)));
    int _1015 = int(_1011) & 3;
    float _1017 = (*spvDescriptorSet0.cp_c6)._m0[int(_1013)][_1015];
    int _1019 = int(_1011) + 1;
    uint _1021 = uint(int(uint(_1019) >> uint(2)));
    int _1023 = _1019 & 3;
    float _1025 = (*spvDescriptorSet0.cp_c6)._m0[int(_1021)][_1023];
    float _1027 = fma(_717, _823, _971);
    float _1029 = fma(_717, _833, _997);
    float _1031 = fma(_717, _841, _999);
    float _1033 = fma(_709, _841, _995);
    float _1035 = fma(_709, _815, _969);
    float _1037 = fma(_709, _833, _975);
    float _1039 = _1031 + _719;
    int _1041 = _307 + 56;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    uint _1045 = uint(int(uint(int(_1043)) >> uint(2)));
    int _1047 = int(_1043) & 3;
    float _1049 = (*spvDescriptorSet0.cp_c6)._m0[int(_1045)][_1047];
    int _1051 = int(_1043) + 1;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    int _1055 = _1051 & 3;
    float _1057 = (*spvDescriptorSet0.cp_c6)._m0[int(_1053)][_1055];
    float _1059 = fma(_725, _841, _1003);
    float _1061 = _1033 + _711;
    float _1063 = _1039 * _859;
    float _1065 = fma(_725, _815, _931);
    float _1067 = fma(_725, _823, _973);
    float _1069 = fma(_725, _833, _1001);
    float _1071 = _1027 * _859;
    float _1073 = _1059 + _727;
    float _1075 = _1007 * _859;
    float _1077 = _1029 * _859;
    float _1079 = fma(_1061, _851, _1063);
    int _1081 = _769 * 48;
    float _1083 = _1039 * _923;
    float _1085 = _1027 * _923;
    float _1087 = _1007 * _923;
    float _1089 = _1029 * _923;
    float _1091 = fma(_1061, _915, _1083);
    float _1093 = fma(_1035, _851, _1075);
    float _1095 = fma(_1005, _851, _1071);
    float _1097 = fma(_1037, _851, _1077);
    float _1099 = _1039 * _955;
    float _1101 = _1027 * _955;
    float _1103 = _1007 * _955;
    float _1105 = _1029 * _955;
    float _1107 = fma(_1061, _947, _1099);
    float _1109 = fma(_1005, _947, _1101);
    float _1111 = fma(_1005, _915, _1085);
    float _1113 = fma(_1035, _915, _1087);
    float _1115 = fma(_1037, _915, _1089);
    float _1117 = fma(_1035, _947, _1103);
    float _1119 = fma(_1037, _947, _1105);
    float _1121 = fma(_1073, _985, _1079);
    float _1123 = fma(_1065, _985, _1093);
    float _1125 = fma(_1067, _985, _1095);
    float _1127 = fma(_1069, _985, _1097);
    float _1129 = _1121 + _993;
    int _1131 = _1081 + 32;
    float _1133 = fma(_1073, _1017, _1091);
    float _1135 = fma(_1067, _1017, _1111);
    float _1137 = fma(_1065, _1017, _1113);
    float _1139 = fma(_1069, _1017, _1115);
    float _1141 = _1133 + _1025;
    float _1143 = fma(_1073, _1049, _1107);
    float _1145 = fma(_1067, _1049, _1109);
    int _1147 = _1081 + 16;
    float _1149 = fma(_1065, _1049, _1117);
    float _1151 = fma(_1069, _1049, _1119);
    float _1153 = _1143 + _1057;
    int _1155 = _1081 + 48;
    uint _1157 = uint(int(uint(_1147) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1157)] = as_type<uint>(_1123);
    int _1159 = _1147 + 4;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1161)] = as_type<uint>(_1125);
    int _1163 = _1147 + 8;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1165)] = as_type<uint>(_1127);
    int _1167 = _1147 + 12;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1169)] = as_type<uint>(_1129);
    uint _1171 = uint(int(uint(_1131) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1171)] = as_type<uint>(_1137);
    int _1173 = _1131 + 4;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1175)] = as_type<uint>(_1135);
    int _1177 = _1131 + 8;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1179)] = as_type<uint>(_1139);
    int _1181 = _1131 + 12;
    uint _1183 = uint(int(uint(_1181) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1183)] = as_type<uint>(_1141);
    uint _1185 = uint(int(uint(_1155) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1185)] = as_type<uint>(_1149);
    int _1187 = _1155 + 4;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1189)] = as_type<uint>(_1145);
    int _1191 = _1155 + 8;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1193)] = as_type<uint>(_1151);
    int _1195 = _1155 + 12;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1197)] = as_type<uint>(_1153);
}

