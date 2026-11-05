#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
    device _21* cp_s10 [[id(10)]];
    device _21* cp_s11 [[id(11)]];
    device _21* cp_s12 [[id(12)]];
    device _21* cp_s13 [[id(13)]];
    texture3d<float> cp_t_tcb_12 [[id(14)]];
    sampler cp_t_tcb_12Smplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_16 [[id(16)]];
    sampler cp_t_tcb_16Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_14 [[id(18)]];
    sampler cp_t_tcb_14Smplr [[id(19)]];
    texture2d<float> cp_t_tcb_2A [[id(20)]];
    sampler cp_t_tcb_2ASmplr [[id(21)]];
    texture2d<float> cp_t_tcb_22 [[id(22)]];
    sampler cp_t_tcb_22Smplr [[id(23)]];
    sampler cp_t_tcb_12Smplr_w [[id(24)]];
    sampler cp_t_tcb_14Smplr_w [[id(25)]];
    sampler cp_t_tcb_2ASmplr_w [[id(26)]];
    sampler cp_t_tcb_22Smplr_w [[id(27)]];
    constant dm_border_t* dm_border [[id(28)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2929 = false;
    bool _1327 = false;
    bool _911 = false;
    bool _413 = false;
    float _85 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _87 = as_type<float>(gl_LocalInvocationID.x);
    float _89 = as_type<float>(gl_WorkGroupID.x);
    int _92 = as_type<int>(_89) << 5;
    int _94 = _92 + as_type<int>(_87);
    float _96 = trunc(_85);
    int _98 = int(_96);
    bool _102 = _94 >= _98;
    int _104 = 0;
    if (_102)
    {
        _104 = 0;
    }
    int _106 = _104;
    int _108 = _106;
    int _110 = _106;
    if (!_102)
    {
        int _112 = _94 << 4;
        int _114 = _112 + 12;
        uint _117 = uint(int(uint(_114) >> uint(2)));
        float _119 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_117)]);
        float _121 = trunc(_119);
        int _123 = int(_121);
        bool _125 = _123 >= 1;
        int _127 = _125 ? (-1) : 0;
        if (!_125)
        {
            _108 = 0;
        }
        int _129 = _108;
        bool _131 = !_125;
        _110 = _129;
        if (!_131)
        {
            float _133 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _135 = uint(int(uint(_114) >> uint(2)));
            float _137 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_135)]);
            float _139 = float(_123);
            float _141 = -_137;
            float _143 = _133 + _141;
            bool _145 = _143 > _139;
            int _147 = as_type<int>(_133);
            if (!_145)
            {
                bool _149 = _133 >= _137;
                bool _151 = isnan(_133);
                bool _153 = _149 || _151;
                bool _155 = isnan(_137);
                bool _157 = _153 || _155;
                _127 = _157 ? (-1) : 0;
            }
            int _159 = _127;
            if (_145)
            {
                _147 = 0;
            }
            int _161 = _147;
            _110 = _161;
            if (!_145)
            {
                int _163 = ~_159;
                int _165 = (_163 != 0) ? 0 : 1;
                _110 = _165;
            }
        }
    }
    int _167 = _110;
    int _169 = _167 & 1;
    bool _171 = _169 != 0;
    if (!_171)
    {
        return;
    }
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _177 = _94 << 4;
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    int _185 = _177 + 12;
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    uint _191 = uint(int(uint(_185) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_191)]);
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    uint _197 = uint(int(uint(_177) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_197)]);
    int _201 = _177 + 4;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_203)]);
    int _207 = _177 + 8;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_209)]);
    int _213 = _177 + 12;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    float _217 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_215)]);
    uint _219 = uint(int(uint(_177) >> uint(2)));
    float _221 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_219)]);
    int _223 = _177 + 4;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    float _227 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_225)]);
    int _229 = _177 + 8;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_231)]);
    float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _237 = uint(int(uint(_185) >> uint(2)));
    float _239 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_237)]);
    uint _241 = uint(int(uint(_177) >> uint(2)));
    float _243 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_241)]);
    int _245 = _177 + 4;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    float _249 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_247)]);
    int _251 = _177 + 8;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    float _255 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_253)]);
    uint _257 = uint(int(uint(_177) >> uint(2)));
    float _259 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_257)]);
    float _261 = abs(_175);
    float _263 = log2(_261);
    float _265 = _173 * _263;
    float _267 = exp2(_265);
    float _269 = _179 * _187;
    bool _271 = _189 > 0.0;
    float _273 = _181 * _187;
    float _275 = _183 * _187;
    float _277 = _173 * _269;
    float _279 = _193 * _173;
    float _281 = _173 * _273;
    float _283 = _173 * _275;
    float _285 = fma(_205, _279, _227);
    float _287 = fma(_199, _267, _277);
    float _289 = fma(_199, _279, _221);
    float _291 = fma(_211, _279, _233);
    float _293 = fma(_205, _267, _281);
    float _295 = fma(_211, _267, _283);
    int _297 = as_type<int>(_195) & 512;
    bool _299 = _297 != 0;
    float _301 = -_239;
    float _303 = _235 + _301;
    float _305 = _217;
    float _307 = _205;
    float _309 = _267;
    bool _311 = _271;
    float _313 = _195;
    float _315 = _173;
    float _317 = _287;
    if (!_271)
    {
        _305 = _289;
    }
    float _319 = _305;
    float _321 = _319;
    float _323 = _319;
    if (!_271)
    {
        _307 = _285;
    }
    float _325 = _307;
    float _327 = _325;
    float _329 = _325;
    if (!_271)
    {
        _309 = _291;
    }
    float _331 = _309;
    bool _333 = !_271;
    float _335 = _331;
    float _337 = _331;
    float _339 = 0.0;
    float _341 = 0.0;
    float _343 = 0.0;
    int _345 = as_type<int>(_243);
    int _347 = as_type<int>(_249);
    int _349 = as_type<int>(_255);
    int _351 = as_type<int>(_243);
    int _353 = as_type<int>(_249);
    int _355 = as_type<int>(_255);
    int _357 = as_type<int>(_243);
    int _359 = as_type<int>(_249);
    int _361 = as_type<int>(_255);
    if (!_333)
    {
        bool _363 = !_299;
        if (!_363)
        {
            float _365 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _367 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _369 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _371 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _373 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _375 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _377 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _379 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _381 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _383 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _385 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _387 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _389 = _285 * _367;
            float _391 = _285 * _375;
            float _393 = fma(_289, _365, _389);
            float _395 = _285 * _383;
            float _397 = fma(_289, _373, _391);
            float _399 = fma(_291, _369, _393);
            float _401 = fma(_289, _381, _395);
            float _403 = fma(_291, _377, _397);
            float _405 = _371 + _399;
            float _407 = fma(_291, _385, _401);
            float _409 = _379 + _403;
            float _411 = _387 + _407;
            _323 = _405;
            _337 = _411;
            _329 = _409;
            _339 = _401;
            _341 = _407;
            _343 = _387;
            _413 = true;
        }
        else
        {
            int _415 = as_type<int>(_195) & 1024;
            bool _417 = _415 != 0;
            bool _419 = !_417;
            if (!_419)
            {
                float _421 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _423 = uint(int(uint(_177) >> uint(2)));
                float _425 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_423)]);
                int _427 = _177 + 4;
                uint _429 = uint(int(uint(_427) >> uint(2)));
                float _431 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_429)]);
                int _433 = _177 + 8;
                uint _435 = uint(int(uint(_433) >> uint(2)));
                float _437 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_435)]);
                uint _439 = uint(int(uint(_177) >> uint(2)));
                float _441 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_439)]);
                int _443 = _177 + 4;
                uint _445 = uint(int(uint(_443) >> uint(2)));
                float _447 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_445)]);
                int _449 = _177 + 8;
                uint _451 = uint(int(uint(_449) >> uint(2)));
                float _453 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_451)]);
                uint _455 = uint(int(uint(_177) >> uint(2)));
                float _457 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_455)]);
                int _459 = _177 + 4;
                uint _461 = uint(int(uint(_459) >> uint(2)));
                float _463 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_461)]);
                int _465 = _177 + 8;
                uint _467 = uint(int(uint(_465) >> uint(2)));
                float _469 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_467)]);
                int _471 = _177 + 12;
                uint _473 = uint(int(uint(_471) >> uint(2)));
                float _475 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_473)]);
                float _477 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _479 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _481 = _285 * _431;
                float _483 = _285 * _447;
                float _485 = _285 * _463;
                float _487 = fma(_289, _425, _481);
                float _489 = fma(_289, _441, _483);
                float _491 = fma(_289, _457, _485);
                float _493 = fma(_291, _437, _487);
                float _495 = fma(_291, _453, _489);
                float _497 = fma(_291, _469, _491);
                float _499 = _421 + _493;
                float _501 = _477 + _495;
                float _503 = _479 + _497;
                _323 = _499;
                _337 = _503;
                _329 = _501;
                _339 = _491;
                _341 = _497;
                _343 = _475;
                _413 = true;
            }
            else
            {
                int _505 = as_type<int>(_195) & 2048;
                bool _507 = _505 != 0;
                if (!_507)
                {
                    _321 = _289;
                }
                float _509 = _321;
                _323 = _509;
                if (!_507)
                {
                    _327 = _285;
                }
                float _511 = _327;
                _329 = _511;
                if (!_507)
                {
                    _335 = _291;
                }
                float _513 = _335;
                bool _515 = !_507;
                _337 = _513;
                _339 = 0.0;
                _341 = 0.0;
                _343 = 0.0;
                if (!_515)
                {
                    uint _517 = uint(int(uint(_177) >> uint(2)));
                    float _519 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_517)]);
                    int _521 = _177 + 4;
                    uint _523 = uint(int(uint(_521) >> uint(2)));
                    float _525 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_523)]);
                    int _527 = _177 + 8;
                    uint _529 = uint(int(uint(_527) >> uint(2)));
                    float _531 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_529)]);
                    int _533 = _177 + 12;
                    uint _535 = uint(int(uint(_533) >> uint(2)));
                    float _537 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_535)]);
                    uint _539 = uint(int(uint(_177) >> uint(2)));
                    float _541 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_539)]);
                    int _543 = _177 + 4;
                    uint _545 = uint(int(uint(_543) >> uint(2)));
                    float _547 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_545)]);
                    int _549 = _177 + 8;
                    uint _551 = uint(int(uint(_549) >> uint(2)));
                    float _553 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_551)]);
                    int _555 = _177 + 12;
                    uint _557 = uint(int(uint(_555) >> uint(2)));
                    float _559 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_557)]);
                    uint _561 = uint(int(uint(_177) >> uint(2)));
                    float _563 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_561)]);
                    int _565 = _177 + 4;
                    uint _567 = uint(int(uint(_565) >> uint(2)));
                    float _569 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_567)]);
                    int _571 = _177 + 8;
                    uint _573 = uint(int(uint(_571) >> uint(2)));
                    float _575 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_573)]);
                    int _577 = _177 + 12;
                    uint _579 = uint(int(uint(_577) >> uint(2)));
                    float _581 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_579)]);
                    float _583 = _285 * _525;
                    float _585 = _285 * _547;
                    float _587 = _285 * _569;
                    float _589 = fma(_289, _519, _583);
                    float _591 = fma(_289, _541, _585);
                    float _593 = fma(_289, _563, _587);
                    float _595 = fma(_291, _531, _589);
                    float _597 = fma(_291, _553, _591);
                    float _599 = fma(_291, _575, _593);
                    float _601 = _595 + _537;
                    float _603 = _597 + _559;
                    float _605 = _599 + _581;
                    _323 = _601;
                    _337 = _605;
                    _329 = _603;
                    _339 = _593;
                    _341 = _599;
                    _343 = _581;
                }
            }
        }
    }
    _413 = false;
    float _607 = _323;
    float _609 = _337;
    float _611 = _329;
    float _613 = _339;
    float _615 = _341;
    float _617 = _343;
    float _619 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _621 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[60]);
    float _623 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[62]);
    float _625 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[61]);
    float _627 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[59]);
    float _629 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[63]);
    bool _631 = _619 != 0.0;
    bool _633 = isnan(_619);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = _235 * _621;
    float _643 = _235 * _623;
    float _645 = _235 * _625;
    float _647 = fma(_627, _607, _641);
    float _649 = fma(_627, _609, _643);
    float _651 = fma(_627, _611, _645);
    float _653 = _629;
    float _655 = _607;
    float _657 = _623;
    float _659 = _613;
    float _661 = _615;
    float _663 = _617;
    if (_639)
    {
        float _665 = _259 * _629;
        _653 = _665;
    }
    float _667 = _653;
    float _669 = _651 + _667;
    float _671 = -_667;
    bool _673 = _647 >= _671;
    bool _675 = isnan(_647);
    bool _677 = _673 || _675;
    bool _679 = isnan(_671);
    bool _681 = _677 || _679;
    float _683 = _647 + _667;
    float _685 = -_667;
    bool _687 = _649 >= _685;
    bool _689 = isnan(_649);
    bool _691 = _687 || _689;
    bool _693 = isnan(_685);
    bool _695 = _691 || _693;
    float _697 = _649 + _667;
    float _699 = -_667;
    bool _701 = _651 >= _699;
    bool _703 = isnan(_651);
    bool _705 = _701 || _703;
    bool _707 = isnan(_699);
    bool _709 = _705 || _707;
    bool _711 = !_681;
    float _713 = -_683;
    float _715 = _711 ? _713 : _683;
    bool _717 = !_695;
    float _719 = -_697;
    float _721 = _717 ? _719 : _697;
    bool _723 = !_709;
    float _725 = -_669;
    float _727 = _723 ? _725 : _669;
    float _729 = _715 * 0.03125;
    float _731 = _721 * 0.03125;
    float _733 = _727 * 0.03125;
    float3 _4137 = float3(_729, _733, _731);
    float3 _737 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_4137, float3(0.0), isnan(_4137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_4137, float3(0.0), isnan(_4137)), level(0.0)).xyz;
    float _739 = _737.x;
    float _741 = _737.y;
    float _743 = _737.z;
    float _745 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[56]);
    float _747 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[57]);
    float _749 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[58]);
    float _751 = _739 + (-0.5);
    float _753 = _741 + (-0.5);
    float _755 = _743 + (-0.5);
    float _757 = _751 * _745;
    float _759 = _753 * _747;
    float _761 = _755 * _749;
    float _763 = _751;
    float _765 = _755;
    float _767 = _749;
    if (!_271)
    {
        _763 = _757;
    }
    float _769 = _763;
    float _771 = _769;
    float _773 = _769;
    if (!_271)
    {
        _655 = _759;
    }
    float _775 = _655;
    float _777 = _775;
    float _779 = _775;
    if (!_271)
    {
        _765 = _761;
    }
    float _781 = _765;
    bool _783 = !_271;
    float _785 = _781;
    float _787 = _781;
    if (!_783)
    {
        bool _789 = !_299;
        if (!_789)
        {
            float _791 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _793 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _795 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _797 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _799 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _801 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _803 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _805 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _807 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _809 = _795 * _797;
            float _811 = _795 * _799;
            float _813 = _793 * _797;
            float _815 = -_809;
            float _817 = fma(_791, _801, _815);
            float _819 = -_811;
            float _821 = fma(_793, _801, _819);
            float _823 = -_813;
            float _825 = fma(_791, _799, _823);
            float _827 = _805 * _791;
            float _829 = _805 * _817;
            float _831 = _807 * _793;
            float _833 = _803 * _799;
            float _835 = -_827;
            float _837 = fma(_803, _793, _835);
            float _839 = -_829;
            float _841 = fma(_803, _821, _839);
            float _843 = _805 * _801;
            float _845 = _807 * _797;
            float _847 = -_833;
            float _849 = fma(_805, _797, _847);
            float _851 = fma(_807, _825, _841);
            float _853 = -_843;
            float _855 = fma(_807, _799, _853);
            float _857 = -_845;
            float _859 = fma(_803, _801, _857);
            float _861 = _803 * _795;
            float _863 = 1.0 / _851;
            float _865 = -_791;
            float _867 = fma(_865, _801, _809);
            float _869 = -_831;
            float _871 = fma(_805, _795, _869);
            float _873 = -_861;
            float _875 = fma(_807, _791, _873);
            float _877 = _855 * _863;
            float _879 = _859 * _863;
            float _881 = _849 * _863;
            float _883 = _757 * _863;
            float _885 = _759 * _877;
            float _887 = _759 * _879;
            float _889 = _759 * _881;
            float _891 = _867 * _863;
            float _893 = _871 * _863;
            float _895 = _875 * _863;
            float _897 = _837 * _863;
            float _899 = fma(_821, _883, _885);
            float _901 = fma(_757, _891, _887);
            float _903 = fma(_825, _883, _889);
            float _905 = fma(_761, _893, _899);
            float _907 = fma(_761, _895, _901);
            float _909 = fma(_761, _897, _903);
            _779 = _907;
            _787 = _909;
            _773 = _905;
            _767 = _803;
            _657 = _877;
            _659 = _805;
            _661 = _807;
            _663 = _897;
            _911 = true;
        }
        else
        {
            int _913 = as_type<int>(_195) & 1024;
            bool _915 = _913 != 0;
            if (_915)
            {
                _311 = true;
            }
            bool _917 = _311;
            bool _919 = _917;
            if (!_915)
            {
                int _921 = as_type<int>(_195) & 2048;
                bool _923 = _921 != 0;
                _919 = _923;
            }
            bool _925 = _919;
            if (!_925)
            {
                _771 = _757;
            }
            float _927 = _771;
            _773 = _927;
            if (!_925)
            {
                _777 = _759;
            }
            float _929 = _777;
            _779 = _929;
            if (!_925)
            {
                _785 = _761;
            }
            float _931 = _785;
            bool _933 = !_925;
            _787 = _931;
            if (!_933)
            {
                uint _935 = uint(int(uint(_177) >> uint(2)));
                float _937 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_935)]);
                int _939 = _177 + 4;
                uint _941 = uint(int(uint(_939) >> uint(2)));
                float _943 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_941)]);
                int _945 = _177 + 8;
                uint _947 = uint(int(uint(_945) >> uint(2)));
                float _949 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_947)]);
                uint _951 = uint(int(uint(_177) >> uint(2)));
                float _953 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_951)]);
                int _955 = _177 + 4;
                uint _957 = uint(int(uint(_955) >> uint(2)));
                float _959 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_957)]);
                int _961 = _177 + 8;
                uint _963 = uint(int(uint(_961) >> uint(2)));
                float _965 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_963)]);
                uint _967 = uint(int(uint(_177) >> uint(2)));
                float _969 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_967)]);
                int _971 = _177 + 4;
                uint _973 = uint(int(uint(_971) >> uint(2)));
                float _975 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_973)]);
                int _977 = _177 + 8;
                uint _979 = uint(int(uint(_977) >> uint(2)));
                float _981 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_979)]);
                float _983 = _949 * _953;
                float _985 = _949 * _959;
                float _987 = _943 * _953;
                float _989 = -_983;
                float _991 = fma(_937, _965, _989);
                float _993 = -_985;
                float _995 = fma(_943, _965, _993);
                float _997 = -_987;
                float _999 = fma(_937, _959, _997);
                float _1001 = _975 * _937;
                float _1003 = _975 * _991;
                float _1005 = _981 * _943;
                float _1007 = _969 * _959;
                float _1009 = -_1001;
                float _1011 = fma(_969, _943, _1009);
                float _1013 = -_1003;
                float _1015 = fma(_969, _995, _1013);
                float _1017 = _975 * _965;
                float _1019 = _981 * _953;
                float _1021 = -_1007;
                float _1023 = fma(_975, _953, _1021);
                float _1025 = fma(_981, _999, _1015);
                float _1027 = -_1017;
                float _1029 = fma(_981, _959, _1027);
                float _1031 = -_1019;
                float _1033 = fma(_969, _965, _1031);
                float _1035 = _969 * _949;
                float _1037 = 1.0 / _1025;
                float _1039 = -_937;
                float _1041 = fma(_1039, _965, _983);
                float _1043 = -_1005;
                float _1045 = fma(_975, _949, _1043);
                float _1047 = -_1035;
                float _1049 = fma(_981, _937, _1047);
                float _1051 = _1029 * _1037;
                float _1053 = _1033 * _1037;
                float _1055 = _1023 * _1037;
                float _1057 = _757 * _1037;
                float _1059 = _759 * _1051;
                float _1061 = _759 * _1053;
                float _1063 = _759 * _1055;
                float _1065 = _1041 * _1037;
                float _1067 = _1045 * _1037;
                float _1069 = _1049 * _1037;
                float _1071 = _1011 * _1037;
                float _1073 = fma(_995, _1057, _1059);
                float _1075 = fma(_757, _1065, _1061);
                float _1077 = fma(_999, _1057, _1063);
                float _1079 = fma(_761, _1067, _1073);
                float _1081 = fma(_761, _1069, _1075);
                float _1083 = fma(_761, _1071, _1077);
                _779 = _1081;
                _787 = _1083;
                _773 = _1079;
                _767 = _969;
                _657 = _1051;
                _659 = _975;
                _661 = _981;
                _663 = _1071;
            }
        }
    }
    _911 = false;
    float _1085 = _779;
    float _1087 = _787;
    float _1089 = _773;
    float _1091 = _767;
    float _1093 = _657;
    float _1095 = _659;
    float _1097 = _661;
    float _1099 = _663;
    float _1101 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[86]);
    float _1103 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[85]);
    float _1105 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[84]);
    float _1107 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1109 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1111 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _1113 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _1115 = uint(int(uint(_185) >> uint(2)));
    float _1117 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1115)]);
    float _1119 = fma(_173, _1085, _293);
    float _1121 = fma(_173, _1087, _295);
    float _1123 = fma(_173, _1089, _287);
    bool _1125 = _1101 > 0.0;
    bool _1127 = _1103 > 0.0;
    float _1129 = _1105 * _1103;
    float _1131 = _173 * _1107;
    float _1133 = _1091;
    float _1135 = _1105;
    float _1137 = _1093;
    bool _1139 = _1127;
    float _1141 = _1131;
    float _1143 = _1109;
    float _1145 = _1113;
    float _1147 = _1095;
    float _1149 = _1097;
    float _1151 = _1099;
    if (_1125)
    {
        float _1153 = 1.0 / _1101;
        _1133 = _1153;
    }
    float _1155 = _1133;
    float _1157 = _173 * _1111;
    float _1159 = _1157;
    if (_1127)
    {
        float _1161 = -_1129;
        float _1163 = fma(_259, _1161, _1105);
        _1135 = _1163;
    }
    float _1165 = _1135;
    float _1167 = _173 * _1109;
    float _1169 = _1155;
    float _1171 = _1165;
    float _1173 = _1167;
    if (_1125)
    {
        float _1175 = _303 * _1155;
        _1137 = _1175;
    }
    float _1177 = _1137;
    if (_1125)
    {
        float _1179 = precise::min(_1177, 1.0);
        _1169 = _1179;
    }
    float _1181 = _1169;
    float _1183 = _1181;
    if (_1125)
    {
        float _1185 = _1181 * _1165;
        _1171 = _1185;
    }
    float _1187 = _1171;
    float _1189 = _1131 * _1187;
    float _1191 = _1167 * _1187;
    float _1193 = _1157 * _1187;
    bool _1195 = !_299;
    float _1197 = _1187;
    float _1199 = _1191;
    float _1201 = _1189;
    float _1203 = _1193;
    float _1325;
    if (!_1195)
    {
        float _1205 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1207 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1209 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1211 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1213 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1217 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1219 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1221 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1223 = _1209 * _1211;
        float _1225 = _1209 * _1213;
        float _1227 = _1207 * _1211;
        float _1229 = -_1223;
        float _1231 = fma(_1205, _1215, _1229);
        float _1233 = -_1225;
        float _1235 = fma(_1207, _1215, _1233);
        float _1237 = _1221 * _1207;
        float _1239 = _1217 * _1213;
        float _1241 = _1219 * _1231;
        float _1243 = -_1227;
        float _1245 = fma(_1205, _1213, _1243);
        float _1247 = _1219 * _1205;
        float _1249 = -_1237;
        float _1251 = fma(_1219, _1209, _1249);
        float _1253 = -_1241;
        float _1255 = fma(_1217, _1235, _1253);
        float _1257 = _1217 * _1209;
        float _1259 = -_1247;
        float _1261 = fma(_1217, _1207, _1259);
        float _1263 = _1219 * _1215;
        float _1265 = fma(_1221, _1245, _1255);
        float _1267 = _1221 * _1211;
        float _1269 = -_1239;
        float _1271 = fma(_1219, _1211, _1269);
        float _1273 = -_1263;
        float _1275 = fma(_1221, _1213, _1273);
        float _1277 = -_1257;
        float _1279 = fma(_1221, _1205, _1277);
        float _1281 = -_1267;
        float _1283 = fma(_1217, _1215, _1281);
        float _1285 = 1.0 / _1265;
        float _1287 = -_1205;
        float _1289 = fma(_1287, _1215, _1223);
        float _1291 = _1275 * _1285;
        float _1293 = _1283 * _1285;
        float _1295 = _1271 * _1285;
        float _1297 = _1189 * _1285;
        float _1299 = _1291 * _1191;
        float _1301 = _1293 * _1191;
        float _1303 = _1295 * _1191;
        float _1305 = _1289 * _1285;
        float _1307 = _1251 * _1285;
        float _1309 = fma(_1235, _1297, _1299);
        float _1311 = _1279 * _1285;
        float _1313 = _1261 * _1285;
        float _1315 = fma(_1305, _1189, _1301);
        float _1317 = fma(_1245, _1297, _1303);
        float _1319 = fma(_1307, _1193, _1309);
        float _1321 = fma(_1311, _1193, _1315);
        float _1323 = fma(_1313, _1193, _1317);
        _1141 = _1211;
        _1143 = _1311;
        _1159 = _1289;
        _1145 = _1267;
        _1173 = _1315;
        _315 = _1317;
        _317 = _1297;
        _1197 = _1235;
        _1183 = _1293;
        _1147 = _1219;
        _1149 = _1279;
        _1151 = _1257;
        _1199 = _1321;
        _1201 = _1319;
        _1325 = _1323;
        _1327 = true;
    }
    else
    {
        int _1329 = as_type<int>(_195) & 1024;
        bool _1331 = _1329 != 0;
        if (_1331)
        {
            _1139 = true;
        }
        bool _1333 = _1139;
        bool _1335 = _1333;
        if (!_1331)
        {
            int _1337 = as_type<int>(_195) & 2048;
            bool _1339 = _1337 != 0;
            _1335 = _1339;
        }
        bool _1341 = _1335;
        if (!_1341)
        {
            _313 = _1193;
        }
        float _1343 = _313;
        bool _1345 = !_1341;
        _1325 = _1343;
        if (!_1345)
        {
            uint _1347 = uint(int(uint(_177) >> uint(2)));
            float _1349 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1347)]);
            int _1351 = _177 + 4;
            uint _1353 = uint(int(uint(_1351) >> uint(2)));
            float _1355 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1353)]);
            int _1357 = _177 + 8;
            uint _1359 = uint(int(uint(_1357) >> uint(2)));
            float _1361 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1359)]);
            uint _1363 = uint(int(uint(_177) >> uint(2)));
            float _1365 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1363)]);
            int _1367 = _177 + 4;
            uint _1369 = uint(int(uint(_1367) >> uint(2)));
            float _1371 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1369)]);
            int _1373 = _177 + 8;
            uint _1375 = uint(int(uint(_1373) >> uint(2)));
            float _1377 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1375)]);
            uint _1379 = uint(int(uint(_177) >> uint(2)));
            float _1381 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1379)]);
            int _1383 = _177 + 4;
            uint _1385 = uint(int(uint(_1383) >> uint(2)));
            float _1387 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1385)]);
            int _1389 = _177 + 8;
            uint _1391 = uint(int(uint(_1389) >> uint(2)));
            float _1393 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1391)]);
            float _1395 = _1361 * _1365;
            float _1397 = _1361 * _1371;
            float _1399 = _1355 * _1365;
            float _1401 = -_1395;
            float _1403 = fma(_1349, _1377, _1401);
            float _1405 = -_1397;
            float _1407 = fma(_1355, _1377, _1405);
            float _1409 = _1393 * _1355;
            float _1411 = _1381 * _1371;
            float _1413 = _1387 * _1403;
            float _1415 = -_1399;
            float _1417 = fma(_1349, _1371, _1415);
            float _1419 = _1387 * _1349;
            float _1421 = -_1409;
            float _1423 = fma(_1387, _1361, _1421);
            float _1425 = -_1413;
            float _1427 = fma(_1381, _1407, _1425);
            float _1429 = _1381 * _1361;
            float _1431 = -_1419;
            float _1433 = fma(_1381, _1355, _1431);
            float _1435 = _1387 * _1377;
            float _1437 = fma(_1393, _1417, _1427);
            float _1439 = _1393 * _1365;
            float _1441 = -_1411;
            float _1443 = fma(_1387, _1365, _1441);
            float _1445 = -_1435;
            float _1447 = fma(_1393, _1371, _1445);
            float _1449 = -_1429;
            float _1451 = fma(_1393, _1349, _1449);
            float _1453 = -_1439;
            float _1455 = fma(_1381, _1377, _1453);
            float _1457 = 1.0 / _1437;
            float _1459 = -_1349;
            float _1461 = fma(_1459, _1377, _1395);
            float _1463 = _1447 * _1457;
            float _1465 = _1455 * _1457;
            float _1467 = _1443 * _1457;
            float _1469 = _1189 * _1457;
            float _1471 = _1463 * _1191;
            float _1473 = _1465 * _1191;
            float _1475 = _1467 * _1191;
            float _1477 = _1461 * _1457;
            float _1479 = _1423 * _1457;
            float _1481 = fma(_1407, _1469, _1471);
            float _1483 = _1451 * _1457;
            float _1485 = _1433 * _1457;
            float _1487 = fma(_1477, _1189, _1473);
            float _1489 = fma(_1417, _1469, _1475);
            float _1491 = fma(_1479, _1193, _1481);
            float _1493 = fma(_1483, _1193, _1487);
            float _1495 = fma(_1485, _1193, _1489);
            _1141 = _1365;
            _1143 = _1483;
            _1159 = _1461;
            _1145 = _1439;
            _1173 = _1487;
            _315 = _1489;
            _317 = _1469;
            _1197 = _1407;
            _1183 = _1465;
            _1147 = _1387;
            _1149 = _1451;
            _1151 = _1429;
            _1199 = _1493;
            _1201 = _1491;
            _1325 = _1495;
        }
    }
    _1327 = false;
    float _1497 = _1141;
    float _1499 = _1143;
    float _1501 = _1159;
    float _1503 = _1145;
    float _1505 = _1173;
    float _1507 = _315;
    float _1509 = _317;
    float _1511 = _1197;
    float _1513 = _1183;
    float _1515 = _1147;
    float _1517 = _1149;
    float _1519 = _1151;
    float _1521 = _1199;
    float _1523 = _1201;
    float _1525 = _1325;
    uint _1527 = uint(int(uint(_185) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1527)] = as_type<uint>(_1117);
    float _1529 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1531 = as_type<int>(_1529) & 512;
    bool _1533 = _1531 != 0;
    int _1535 = as_type<int>(_1529) & 1024;
    bool _1537 = _1535 != 0;
    float _1539 = _1497;
    float _1541 = _1499;
    float _1543 = _1501;
    float _1545 = _1503;
    float _1547 = _1521;
    float _1549 = _1525;
    float _1551 = _1523;
    if (_1533)
    {
        float _1553 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1555 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1557 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1559 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1539 = _1553;
        _1541 = _1555;
        _1543 = _1557;
        _1545 = _1559;
    }
    float _1561 = _1539;
    float _1563 = _1541;
    float _1565 = _1543;
    float _1567 = _1545;
    float _1569 = _1505;
    float _1571 = _1507;
    float _1573 = _1509;
    float _1575 = _1511;
    if (_1533)
    {
        float _1577 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1579 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1581 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1583 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1569 = _1577;
        _1571 = _1579;
        _1573 = _1581;
        _1575 = _1583;
    }
    float _1585 = _1569;
    float _1587 = _1571;
    float _1589 = _1573;
    float _1591 = _1575;
    float _1593 = _1513;
    float _1595 = _1515;
    float _1597 = _1517;
    float _1599 = _1519;
    if (_1533)
    {
        float _1601 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1603 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1605 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1607 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1593 = _1601;
        _1595 = _1603;
        _1597 = _1605;
        _1599 = _1607;
    }
    float _1609 = _1593;
    float _1611 = _1595;
    float _1613 = _1597;
    float _1615 = _1599;
    float _1617 = _285 + _1521;
    float _1619 = _289 + _1523;
    float _1621 = _291 + _1525;
    if (!_1533)
    {
        _1547 = 0.0;
    }
    float _1623 = _1547;
    float _1625 = _1623;
    if (!_1533)
    {
        _1549 = 0.0;
    }
    float _1627 = _1549;
    float _1629 = _1627;
    if (!_1533)
    {
        _1203 = 0.0;
    }
    float _1631 = _1203;
    int _1633 = as_type<int>(_1529) & 2048;
    bool _1635 = _1633 != 0;
    float _1637 = _1631;
    if (_1533)
    {
        float _1639 = _1617 * _1563;
        _1551 = _1639;
    }
    float _1641 = _1551;
    float _1643 = _1587;
    float _1645 = _1641;
    float _1647 = _1611;
    float _1649 = _1609;
    float _1651 = _1589;
    if (_1533)
    {
        float _1653 = _1617 * _1587;
        _1643 = _1653;
    }
    float _1655 = _1643;
    float _1657 = _1655;
    if (_1533)
    {
        float _1659 = fma(_1619, _1561, _1641);
        _1645 = _1659;
    }
    float _1661 = _1645;
    float _1663 = _1661;
    if (_1533)
    {
        float _1665 = _1617 * _1611;
        _1647 = _1665;
    }
    float _1667 = _1647;
    if (_1533)
    {
        float _1669 = fma(_1619, _1585, _1655);
        _1657 = _1669;
    }
    float _1671 = _1657;
    if (_1533)
    {
        float _1673 = fma(_1621, _1565, _1661);
        _1663 = _1673;
    }
    float _1675 = _1663;
    if (_1533)
    {
        float _1677 = fma(_1619, _1609, _1667);
        _1649 = _1677;
    }
    float _1679 = _1649;
    float _1681 = _1679;
    if (_1533)
    {
        float _1683 = fma(_1621, _1589, _1671);
        _1651 = _1683;
    }
    float _1685 = _1651;
    if (_1533)
    {
        float _1687 = _1567 + _1675;
        _1625 = _1687;
    }
    float _1689 = _1625;
    float _1691 = _1689;
    if (_1533)
    {
        float _1693 = fma(_1621, _1613, _1679);
        _1681 = _1693;
    }
    float _1695 = _1681;
    if (_1533)
    {
        float _1697 = _1591 + _1685;
        _1629 = _1697;
    }
    float _1699 = _1629;
    float _1701 = _1699;
    if (_1533)
    {
        float _1703 = _1615 + _1695;
        _1637 = _1703;
    }
    float _1705 = _1637;
    bool _1707 = !_1537;
    float _1709 = _1705;
    if (!_1707)
    {
        float _1711 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1713 = uint(int(uint(_177) >> uint(2)));
        float _1715 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1713)]);
        int _1717 = _177 + 4;
        uint _1719 = uint(int(uint(_1717) >> uint(2)));
        float _1721 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1719)]);
        int _1723 = _177 + 8;
        uint _1725 = uint(int(uint(_1723) >> uint(2)));
        float _1727 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1725)]);
        uint _1729 = uint(int(uint(_177) >> uint(2)));
        float _1731 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1729)]);
        int _1733 = _177 + 4;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        float _1737 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1735)]);
        int _1739 = _177 + 8;
        uint _1741 = uint(int(uint(_1739) >> uint(2)));
        float _1743 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1741)]);
        uint _1745 = uint(int(uint(_177) >> uint(2)));
        float _1747 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1745)]);
        int _1749 = _177 + 4;
        uint _1751 = uint(int(uint(_1749) >> uint(2)));
        float _1753 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1751)]);
        int _1755 = _177 + 8;
        uint _1757 = uint(int(uint(_1755) >> uint(2)));
        float _1759 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1757)]);
        float _1761 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1763 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1765 = _1617 * _1721;
        float _1767 = _1617 * _1737;
        float _1769 = _1617 * _1753;
        float _1771 = fma(_1619, _1715, _1765);
        float _1773 = fma(_1619, _1731, _1767);
        float _1775 = fma(_1619, _1747, _1769);
        float _1777 = fma(_1621, _1727, _1771);
        float _1779 = fma(_1621, _1743, _1773);
        float _1781 = fma(_1621, _1759, _1775);
        float _1783 = _1711 + _1777;
        float _1785 = _1761 + _1779;
        float _1787 = _1763 + _1781;
        _1701 = _1785;
        _1691 = _1783;
        _1709 = _1787;
    }
    float _1789 = _1701;
    float _1791 = _1691;
    float _1793 = _1709;
    bool _1795 = !_1635;
    float _1797 = _1789;
    float _1799 = _1791;
    float _1801 = _1793;
    if (!_1795)
    {
        uint _1803 = uint(int(uint(_177) >> uint(2)));
        float _1805 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1803)]);
        int _1807 = _177 + 4;
        uint _1809 = uint(int(uint(_1807) >> uint(2)));
        float _1811 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1809)]);
        int _1813 = _177 + 8;
        uint _1815 = uint(int(uint(_1813) >> uint(2)));
        float _1817 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1815)]);
        int _1819 = _177 + 12;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        float _1823 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1821)]);
        uint _1825 = uint(int(uint(_177) >> uint(2)));
        float _1827 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1825)]);
        int _1829 = _177 + 4;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        float _1833 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1831)]);
        int _1835 = _177 + 8;
        uint _1837 = uint(int(uint(_1835) >> uint(2)));
        float _1839 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1837)]);
        int _1841 = _177 + 12;
        uint _1843 = uint(int(uint(_1841) >> uint(2)));
        float _1845 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1843)]);
        uint _1847 = uint(int(uint(_177) >> uint(2)));
        float _1849 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1847)]);
        int _1851 = _177 + 4;
        uint _1853 = uint(int(uint(_1851) >> uint(2)));
        float _1855 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1853)]);
        int _1857 = _177 + 8;
        uint _1859 = uint(int(uint(_1857) >> uint(2)));
        float _1861 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1859)]);
        int _1863 = _177 + 12;
        uint _1865 = uint(int(uint(_1863) >> uint(2)));
        float _1867 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1865)]);
        float _1869 = _1617 * _1811;
        float _1871 = _1617 * _1833;
        float _1873 = fma(_1619, _1805, _1869);
        float _1875 = _1617 * _1855;
        float _1877 = fma(_1619, _1827, _1871);
        float _1879 = fma(_1619, _1849, _1875);
        float _1881 = fma(_1621, _1817, _1873);
        float _1883 = fma(_1621, _1839, _1877);
        float _1885 = fma(_1621, _1861, _1879);
        float _1887 = _1881 + _1823;
        float _1889 = _1883 + _1845;
        float _1891 = _1885 + _1867;
        _1797 = _1889;
        _1799 = _1887;
        _1801 = _1891;
    }
    float _1893 = _1797;
    float _1895 = _1799;
    float _1897 = _1801;
    float _1899 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1901 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1903 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1905 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1907 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1909 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1911 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[70]);
    float _1913 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1915 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1917 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1919 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1921 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1923 = _1901 * _1893;
    float _1925 = fma(_1899, _1895, _1923);
    float _1927 = fma(_1903, _1897, _1925);
    float _1929 = _1905 + _1927;
    float _1931 = -_1929;
    bool _1933 = _1907 >= _1931;
    bool _1935 = isnan(_1907);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan(_1931);
    bool _1941 = _1937 || _1939;
    float _1943 = -_1929;
    bool _1945 = _1909 >= _1943;
    bool _1947 = isnan(_1909);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(_1943);
    bool _1953 = _1949 || _1951;
    int _1955 = _1941 ? 0 : 1;
    int _1957 = 2;
    if (_1941)
    {
        _1957 = 1;
    }
    int _1959 = _1957;
    int _1961 = _1959;
    if (_1953)
    {
        _1961 = _1955;
    }
    int _1963 = _1961;
    int _1965 = _1963 << 6;
    int _1967 = _1965 + 96;
    uint _1969 = uint(int(uint(_1967) >> uint(2)));
    float _1971 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1969)]);
    int _1973 = _1967 + 4;
    uint _1975 = uint(int(uint(_1973) >> uint(2)));
    float _1977 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1975)]);
    int _1979 = _1967 + 8;
    uint _1981 = uint(int(uint(_1979) >> uint(2)));
    float _1983 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1981)]);
    int _1985 = _1967 + 12;
    uint _1987 = uint(int(uint(_1985) >> uint(2)));
    float _1989 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1987)]);
    int _1991 = _1965 + 48;
    int _1993 = _1965 + 64;
    uint _1995 = uint(int(uint(_1991) >> uint(2)));
    float _1997 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1995)]);
    int _1999 = _1991 + 4;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    float _2003 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2001)]);
    int _2005 = _1991 + 8;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    float _2009 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2007)]);
    int _2011 = _1991 + 12;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    float _2015 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2013)]);
    uint _2017 = uint(int(uint(_1993) >> uint(2)));
    float _2019 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2017)]);
    int _2021 = _1993 + 4;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    float _2025 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2023)]);
    int _2027 = _1993 + 8;
    uint _2029 = uint(int(uint(_2027) >> uint(2)));
    float _2031 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2029)]);
    int _2033 = _1993 + 12;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    float _2037 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2035)]);
    int _2039 = _1965 + 80;
    float _2041 = _1911 + 1.0;
    float _2043 = _2041 + _1893;
    uint _2045 = uint(int(uint(_2039) >> uint(2)));
    float _2047 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2045)]);
    int _2049 = _2039 + 4;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    float _2053 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2051)]);
    int _2055 = _2039 + 8;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    float _2059 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2057)]);
    int _2061 = _2039 + 12;
    uint _2063 = uint(int(uint(_2061) >> uint(2)));
    float _2065 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2063)]);
    float _2067 = _2043 * _1915;
    float _2069 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _2071 = fma(_1913, _1895, _2067);
    float _2073 = fma(_1917, _1897, _2071);
    float _2075 = _1919 + _2073;
    float _2077 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _2079 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _2081 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _2083 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _2085 = trunc(_2075);
    int _2087 = int(_2085);
    int _2089 = ~as_type<int>(_1921);
    int _2091 = _2087 + _2089;
    int _2093 = _2091 + 1;
    bool _2095 = _2093 >= 0;
    int _2097 = as_type<int>(_761);
    float _2099 = as_type<float>(_2087);
    if (_2095)
    {
        float _2101 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _2097 = as_type<int>(_2101);
    }
    int _2103 = _2097;
    float _2105 = _2043 * _1977;
    float _2107 = fma(_1971, _1895, _2105);
    float _2109 = fma(_1983, _1897, _2107);
    float _2111 = _1989 + _2109;
    float _2113 = _2043 * _2003;
    float _2115 = 1.0 / _2111;
    float _2117 = fma(_1997, _1895, _2113);
    float _2119 = _2043 * _2025;
    float _2121 = fma(_2009, _1897, _2117);
    float _2123 = fma(_2019, _1895, _2119);
    float _2125 = _2015 + _2121;
    float _2127 = fma(_2031, _1897, _2123);
    float _2129 = _2125 * _2115;
    float _2131 = _2037 + _2127;
    bool _2133 = _2129 >= 0.0;
    float _2135 = _2131 * _2115;
    bool _2137 = _2129 <= 1.0;
    bool _2139 = _2137 && _2133;
    bool _2141 = _2135 >= 0.0;
    bool _2143 = _2141 && _2139;
    bool _2145 = _2135 <= 1.0;
    bool _2147 = _2145 && _2143;
    float _2149 = _2043 * _2053;
    float _2151 = fma(_2047, _1895, _2149);
    float _2153 = _2127;
    float _2155 = _2037;
    float _2157 = _1997;
    float _2159 = _2117;
    float _2161 = _2125;
    float _2163 = _2015;
    if (_2147)
    {
        float _2165 = float(_1963);
        _2099 = _2165;
    }
    float _2167 = _2099;
    float _2169 = _2019;
    float _2171 = _2167;
    if (_2147)
    {
        float _2173 = rint(_2167);
        float _2175 = precise::max(_2173, 0.0);
        uint _2177 = uint(_2175);
        uint _2179 = clamp(_2177, 0u, 65535u);
        _2169 = as_type<float>(_2179);
    }
    float _2181 = _2169;
    float _2183 = fma(_2059, _1897, _2151);
    float _2185 = _2065 + _2183;
    float _2187 = _2185 * _2115;
    float _2189 = _2181;
    if (_2147)
    {
        float3 _6392 = float3(_2129, _2135, float(as_type<int>(_2181)));
        float3 _6394 = select(_6392, float3(0.0), isnan(_6392));
        float _2191 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _6394.xy, uint(rint(_6394.z)), _2187, level(0.0));
        _2189 = _2191;
    }
    float _2193 = _2189;
    float _2195 = _2043 * _2079;
    float _2197 = fma(_2077, _1895, _2195);
    float _2199 = fma(_2081, _1897, _2197);
    float _2201 = _2083 + _2199;
    float _2203 = trunc(_2201);
    int _2205 = int(_2203);
    bool _2207 = _2103 <= _2093;
    bool _2209 = !_2095;
    bool _2211 = _2207 || _2209;
    int _2213 = ~as_type<int>(_2069);
    int _2215 = _2205 + _2213;
    int _2217 = _2215 + 1;
    bool _2219 = _2217 < 0;
    bool _2221 = _2219 || _2211;
    float _2223 = _2197;
    if (!_2221)
    {
        float _2225 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _2223 = _2225;
    }
    float _2227 = _2223;
    bool _2229 = as_type<int>(_2227) <= _2217;
    bool _2231 = _2229 || _2221;
    float _2233 = _2227;
    if (_2231)
    {
        _2171 = 1.0;
    }
    float _2235 = _2171;
    float _2237 = _2235;
    if (!_2231)
    {
        float _2239 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _2241 = _2217 * as_type<int>(_2239);
        int _2243 = _2241 + _2093;
        int _2245 = _2243 << 2;
        uint _2247 = uint(int(uint(_2243) >> uint(2)));
        int _2249 = 12 & _2245;
        int _2251 = int(_2247) << 4;
        int _2253 = _2251 + _2249;
        int _2255 = _2253 + 400;
        uint _2257 = uint(int(uint(_2255) >> uint(2)));
        float _2259 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2257)]);
        float _2261 = floor(_2075);
        float _2263 = floor(_2201);
        float _2265 = -_2261;
        float _2267 = _2075 + _2265;
        float _2269 = -_2263;
        float _2271 = _2201 + _2269;
        float _2273 = rint(_2259);
        float _2275 = precise::max(_2273, 0.0);
        uint _2277 = uint(_2275);
        uint _2279 = clamp(_2277, 0u, 65535u);
        float3 _6527 = float3(_2267, _2271, float(int(_2279)));
        float3 _6529 = select(_6527, float3(0.0), isnan(_6527));
        float _2281 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _6529.xy, uint(rint(_6529.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _6529.xy, uint(rint(_6529.z)), level(0.0)).x;
        int _2283 = _2243 << 4;
        int _2285 = _2283 + 2048;
        uint _2287 = uint(int(uint(_2285) >> uint(2)));
        float _2289 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2287)]);
        int _2291 = _2285 + 4;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        float _2295 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2293)]);
        int _2297 = _2285 + 8;
        uint _2299 = uint(int(uint(_2297) >> uint(2)));
        float _2301 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2299)]);
        int _2303 = _2285 + 12;
        uint _2305 = uint(int(uint(_2303) >> uint(2)));
        float _2307 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2305)]);
        float _2309 = _2043 * _2295;
        float _2311 = fma(_2289, _1895, _2309);
        float _2313 = fma(_2301, _1897, _2311);
        float _2315 = _2307 + _2313;
        float _2317 = precise::clamp(_2315, 0.0, 1.0);
        float _2319 = -_2317;
        float _2321 = _2319 + _2281;
        float _2323 = fma(_2321, 500.0, 1.5);
        float _2325 = exp2(_2323);
        float _2327 = 0.0 + _2325;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        _2233 = as_type<float>(_2285);
        _2237 = _2329;
        _2153 = as_type<float>(_2279);
        _2155 = _2281;
        _2157 = _2289;
        _2159 = _2311;
        _2161 = _2325;
        _2163 = _2307;
    }
    float _2331 = _2233;
    float _2333 = _2237;
    float _2335 = _2153;
    float _2337 = _2155;
    float _2339 = _2157;
    float _2341 = _2159;
    float _2343 = _2161;
    float _2345 = _2163;
    uint _2347 = uint(int(uint(_177) >> uint(2)));
    float _2349 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2347)]);
    float _2351 = _2331;
    if (!_2147)
    {
        _2351 = 1.0;
    }
    float _2353 = _2351;
    bool _2355 = _303 > 0.001000000047497451305389404296875;
    bool _2357 = isnan(_303);
    bool _2359 = _2355 || _2357;
    bool _2361 = isnan(0.001000000047497451305389404296875);
    bool _2363 = _2359 || _2361;
    float _2365 = _2353;
    if (_2147)
    {
        bool _2367 = _2193 >= _2187;
        bool _2369 = isnan(_2193);
        bool _2371 = _2367 || _2369;
        bool _2373 = isnan(_2187);
        bool _2375 = _2371 || _2373;
        float _2377 = float(_2375);
        _2365 = _2377;
    }
    float _2379 = _2365;
    float _2381 = -_2379;
    float _2383 = fma(_2381, _2333, 1.0);
    float _2385 = -_2349;
    float _2387 = _2383 + _2385;
    float _2389 = _2383;
    float _2391 = _2387;
    float _2393 = _2349;
    if (_2363)
    {
        float _2395 = fma(_2387, 0.0500000007450580596923828125, _2349);
        _2389 = _2395;
    }
    float _2397 = _2389;
    float _2399 = precise::max(0.0, _2397);
    float _2401 = precise::min(_2399, 0.999000012874603271484375);
    uint _2403 = uint(int(uint(_177) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2403)] = as_type<uint>(_2401);
    float _2405 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _2407 = as_type<int>(_2405) & 512;
    bool _2409 = _2407 != 0;
    int _2411 = as_type<int>(_2405) & 1024;
    bool _2413 = _2411 != 0;
    float _2415 = _2193;
    float _2417 = _2129;
    float _2419 = _2335;
    float _2421 = _2337;
    float _2423 = _2401;
    float _2425 = _2399;
    bool _2427 = _2409;
    if (_2409)
    {
        float _2429 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _2431 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _2433 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _2435 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _2415 = _2429;
        _2417 = _2431;
        _2419 = _2433;
        _2421 = _2435;
    }
    float _2437 = _2415;
    float _2439 = _2417;
    float _2441 = _2419;
    float _2443 = _2421;
    float _2445 = _2339;
    float _2447 = _2341;
    float _2449 = _2343;
    float _2451 = _2345;
    if (_2409)
    {
        float _2453 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _2455 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _2457 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _2459 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _2445 = _2453;
        _2447 = _2455;
        _2449 = _2457;
        _2451 = _2459;
    }
    float _2461 = _2445;
    float _2463 = _2447;
    float _2465 = _2449;
    float _2467 = _2451;
    float _2469 = _2047;
    float _2471 = _2151;
    float _2473 = _2183;
    float _2475 = _2065;
    if (_2409)
    {
        float _2477 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _2479 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _2481 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _2483 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _2469 = _2477;
        _2471 = _2479;
        _2473 = _2481;
        _2475 = _2483;
    }
    float _2485 = _2469;
    float _2487 = _2471;
    float _2489 = _2473;
    float _2491 = _2475;
    if (!_2409)
    {
        _2391 = 0.0;
    }
    float _2493 = _2391;
    float _2495 = _2493;
    if (!_2409)
    {
        _2423 = 0.0;
    }
    float _2497 = _2423;
    int _2499 = as_type<int>(_2405) & 2048;
    bool _2501 = _2499 != 0;
    int _2503 = _177 + 8;
    float _2505 = _2441;
    float _2507 = _2497;
    if (_2409)
    {
        float _2509 = _1617 * _2439;
        _2425 = _2509;
    }
    float _2511 = _2425;
    float _2513 = _2463;
    float _2515 = _2511;
    float _2517 = _2465;
    if (_2409)
    {
        float _2519 = _1617 * _2463;
        _2513 = _2519;
    }
    float _2521 = _2513;
    float _2523 = _2521;
    if (_2409)
    {
        float _2525 = fma(_1619, _2437, _2511);
        _2515 = _2525;
    }
    float _2527 = _2515;
    float _2529 = _2487;
    float _2531 = _2527;
    float _2533 = _2485;
    if (_2409)
    {
        float _2535 = _1617 * _2487;
        _2529 = _2535;
    }
    float _2537 = _2529;
    if (_2409)
    {
        float _2539 = fma(_1619, _2461, _2521);
        _2523 = _2539;
    }
    float _2541 = _2523;
    if (_2409)
    {
        float _2543 = fma(_1621, _2441, _2527);
        _2505 = _2543;
    }
    float _2545 = _2505;
    if (!_2409)
    {
        _2531 = 0.0;
    }
    float _2547 = _2531;
    float _2549 = _2547;
    if (_2409)
    {
        float _2551 = fma(_1619, _2485, _2537);
        _2533 = _2551;
    }
    float _2553 = _2533;
    float _2555 = _2553;
    if (_2409)
    {
        float _2557 = fma(_1621, _2465, _2541);
        _2517 = _2557;
    }
    float _2559 = _2517;
    if (_2409)
    {
        float _2561 = _2443 + _2545;
        _2495 = _2561;
    }
    float _2563 = _2495;
    float _2565 = _2563;
    if (_2409)
    {
        float _2567 = fma(_1621, _2489, _2553);
        _2555 = _2567;
    }
    float _2569 = _2555;
    if (_2409)
    {
        float _2571 = _2467 + _2559;
        _2549 = _2571;
    }
    float _2573 = _2549;
    float _2575 = _2573;
    if (_2409)
    {
        float _2577 = _2491 + _2569;
        _2507 = _2577;
    }
    float _2579 = _2507;
    bool _2581 = !_2413;
    float _2583 = _2579;
    if (!_2581)
    {
        float _2585 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2587 = uint(int(uint(_177) >> uint(2)));
        float _2589 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2587)]);
        int _2591 = _177 + 4;
        uint _2593 = uint(int(uint(_2591) >> uint(2)));
        float _2595 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2593)]);
        int _2597 = _177 + 8;
        uint _2599 = uint(int(uint(_2597) >> uint(2)));
        float _2601 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2599)]);
        int _2603 = _177 + 12;
        uint _2605 = uint(int(uint(_2603) >> uint(2)));
        float _2607 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2605)]);
        uint _2609 = uint(int(uint(_177) >> uint(2)));
        float _2611 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2609)]);
        int _2613 = _177 + 4;
        uint _2615 = uint(int(uint(_2613) >> uint(2)));
        float _2617 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2615)]);
        int _2619 = _177 + 8;
        uint _2621 = uint(int(uint(_2619) >> uint(2)));
        float _2623 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2621)]);
        uint _2625 = uint(int(uint(_177) >> uint(2)));
        float _2627 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2625)]);
        int _2629 = _177 + 4;
        uint _2631 = uint(int(uint(_2629) >> uint(2)));
        float _2633 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2631)]);
        int _2635 = _177 + 8;
        uint _2637 = uint(int(uint(_2635) >> uint(2)));
        float _2639 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2637)]);
        float _2641 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2643 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2645 = _1617 * _2595;
        float _2647 = _1617 * _2617;
        float _2649 = fma(_1619, _2589, _2645);
        float _2651 = _1617 * _2633;
        float _2653 = fma(_1619, _2611, _2647);
        float _2655 = fma(_1619, _2627, _2651);
        float _2657 = fma(_1621, _2601, _2649);
        float _2659 = fma(_1621, _2623, _2653);
        float _2661 = fma(_1621, _2639, _2655);
        float _2663 = _2585 + _2657;
        float _2665 = _2641 + _2659;
        float _2667 = _2643 + _2661;
        _2565 = _2663;
        _2393 = _2607;
        _2583 = _2667;
        _2575 = _2665;
    }
    float _2669 = _2565;
    float _2671 = _2393;
    float _2673 = _2583;
    float _2675 = _2575;
    bool _2677 = !_2501;
    float _2679 = _2669;
    float _2681 = _2673;
    float _2683 = _2675;
    float _2685 = _2671;
    if (!_2677)
    {
        uint _2687 = uint(int(uint(_177) >> uint(2)));
        float _2689 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2687)]);
        int _2691 = _177 + 4;
        uint _2693 = uint(int(uint(_2691) >> uint(2)));
        float _2695 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2693)]);
        int _2697 = _177 + 8;
        uint _2699 = uint(int(uint(_2697) >> uint(2)));
        float _2701 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2699)]);
        int _2703 = _177 + 12;
        uint _2705 = uint(int(uint(_2703) >> uint(2)));
        float _2707 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2705)]);
        uint _2709 = uint(int(uint(_177) >> uint(2)));
        float _2711 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2709)]);
        int _2713 = _177 + 4;
        uint _2715 = uint(int(uint(_2713) >> uint(2)));
        float _2717 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2715)]);
        int _2719 = _177 + 8;
        uint _2721 = uint(int(uint(_2719) >> uint(2)));
        float _2723 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2721)]);
        int _2725 = _177 + 12;
        uint _2727 = uint(int(uint(_2725) >> uint(2)));
        float _2729 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2727)]);
        uint _2731 = uint(int(uint(_177) >> uint(2)));
        float _2733 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2731)]);
        int _2735 = _177 + 4;
        uint _2737 = uint(int(uint(_2735) >> uint(2)));
        float _2739 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2737)]);
        int _2741 = _177 + 8;
        uint _2743 = uint(int(uint(_2741) >> uint(2)));
        float _2745 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2743)]);
        int _2747 = _177 + 12;
        uint _2749 = uint(int(uint(_2747) >> uint(2)));
        float _2751 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2749)]);
        float _2753 = _1617 * _2695;
        float _2755 = _1617 * _2717;
        float _2757 = fma(_1619, _2689, _2753);
        float _2759 = _1617 * _2739;
        float _2761 = fma(_1619, _2711, _2755);
        float _2763 = fma(_1619, _2733, _2759);
        float _2765 = fma(_1621, _2701, _2757);
        float _2767 = fma(_1621, _2723, _2761);
        float _2769 = fma(_1621, _2745, _2763);
        float _2771 = _2765 + _2707;
        float _2773 = _2767 + _2729;
        float _2775 = _2769 + _2751;
        _2679 = _2771;
        _2681 = _2775;
        _2683 = _2773;
        _2685 = _2707;
    }
    float _2777 = _2679;
    float _2779 = _2681;
    float _2781 = _2683;
    float _2783 = _2685;
    uint _2785 = uint(int(uint(_2503) >> uint(2)));
    float _2787 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2785)]);
    float _2789 = fma(_2777, 6.2500002968590706586837768554688e-05, 0.5);
    float _2791 = fma(_2779, 6.2500002968590706586837768554688e-05, 0.5);
    float _2793 = _2363 ? _2787 : 1.0;
    bool _2795 = _2793 > 0.00999999977648258209228515625;
    float _2797 = _2777;
    float _2799 = _2781;
    float _2801 = _2783;
    if (_2795)
    {
        float2 _7304 = float2(_2789, _2791);
        float _2803 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7304, float2(0.0), isnan(_7304)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7304, float2(0.0), isnan(_7304)), level(0.0)).x;
        _2797 = _2803;
    }
    float _2805 = _2797;
    float2 _7317 = float2(_2789, _2791);
    float _2807 = dm_bs(spvDescriptorSet0.cp_t_tcb_22.sample(spvDescriptorSet0.cp_t_tcb_22Smplr, select(_7317, float2(0.0), isnan(_7317)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_22, spvDescriptorSet0.cp_t_tcb_22Smplr_w, select(_7317, float2(0.0), isnan(_7317)), level(0.0)).x;
    if (_2795)
    {
        float _2809 = _2781 + 1.0;
        _2799 = _2809;
    }
    float _2811 = _2799;
    if (_2795)
    {
        float _2813 = _2805 * 2000.0;
        _2801 = _2813;
    }
    float _2815 = _2801;
    float _2817 = abs(_2807);
    bool _2819 = _2817 == 0.0;
    float _2821 = float(_2819);
    float _2823 = _2821;
    if (_2795)
    {
        bool _2825 = _2811 >= _2815;
        bool _2827 = isnan(_2811);
        bool _2829 = _2825 || _2827;
        bool _2831 = isnan(_2815);
        bool _2833 = _2829 || _2831;
        _2427 = _2833;
    }
    bool _2835 = _2427;
    float _2837 = -_233;
    float _2839 = _2837 + _1621;
    if (_2795)
    {
        float _2841 = _2835 ? _2821 : 1.0;
        _2823 = _2841;
    }
    float _2843 = _2823;
    float _2845 = -_2793;
    float _2847 = _2845 + _2843;
    float _2849 = _2843;
    if (_2363)
    {
        float _2851 = fma(_2847, 0.0500000007450580596923828125, _2793);
        _2849 = _2851;
    }
    float _2853 = _2849;
    float _2855 = -_221;
    float _2857 = _2855 + _1619;
    float _2859 = 0.0 + _2853;
    float _2861 = precise::clamp(_2859, 0.0, 1.0);
    float _2863 = -_227;
    float _2865 = _2863 + _1617;
    int _2867 = _177 + 4;
    uint _2869 = uint(int(uint(_2503) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2869)] = as_type<uint>(_2861);
    uint _2871 = uint(int(uint(_185) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2871)] = as_type<uint>(_1117);
    uint _2873 = uint(int(uint(_177) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2873)] = as_type<uint>(_1619);
    uint _2875 = uint(int(uint(_2867) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2875)] = as_type<uint>(_1617);
    uint _2877 = uint(int(uint(_2503) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2877)] = as_type<uint>(_1621);
    uint _2879 = uint(int(uint(_177) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2879)] = as_type<uint>(_1123);
    uint _2881 = uint(int(uint(_2867) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2881)] = as_type<uint>(_1119);
    uint _2883 = uint(int(uint(_2503) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2883)] = as_type<uint>(_1121);
    uint _2885 = uint(int(uint(_177) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2885)] = as_type<uint>(_2857);
    uint _2887 = uint(int(uint(_2867) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2887)] = as_type<uint>(_2865);
    uint _2889 = uint(int(uint(_2503) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2889)] = as_type<uint>(_2839);
    float _2891 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2893 = _2865 * _2865;
    float _2895 = _1119 * _1119;
    float _2897 = fma(_2857, _2857, _2893);
    float _2899 = fma(_1123, _1123, _2895);
    float _2901 = fma(_2839, _2839, _2897);
    float _2903 = fma(_1121, _1121, _2899);
    float _2905 = sqrt(_2901);
    float _2907 = sqrt(_2903);
    bool _2909 = _2905 >= 9.9999999747524270787835121154785e-07;
    bool _2911 = isnan(_2905);
    bool _2913 = _2909 || _2911;
    bool _2915 = isnan(9.9999999747524270787835121154785e-07);
    bool _2917 = _2913 || _2915;
    if (!_2917)
    {
        bool _2919 = _235 != _239;
        bool _2921 = isnan(_235);
        bool _2923 = _2919 || _2921;
        bool _2925 = isnan(_239);
        bool _2927 = _2923 || _2925;
        _2929 = _2927;
        if (!_2929)
        {
            float _2931 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2933 = _2931 > 0.0;
            bool _2935 = !_2933;
            if (!_2935)
            {
                float _2937 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2939 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2941 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2943 = _2939 * _2939;
                float _2945 = fma(_2937, _2937, _2943);
                float _2947 = fma(_2941, _2941, _2945);
                float _2949 = rsqrt(_2947);
                float _2951 = _2949 * 9.9999999747524270787835121154785e-07;
                float _2953 = _2937 * _2951;
                float _2955 = _2939 * _2951;
                float _2957 = _2941 * _2951;
                _357 = as_type<int>(_2953);
                _359 = as_type<int>(_2955);
                _361 = as_type<int>(_2957);
                _2929 = true;
            }
            else
            {
                bool _2959 = _2907 >= 9.9999999747524270787835121154785e-07;
                bool _2961 = isnan(_2907);
                bool _2963 = _2959 || _2961;
                bool _2965 = isnan(9.9999999747524270787835121154785e-07);
                bool _2967 = _2963 || _2965;
                if (!_2967)
                {
                    float _2969 = _1617 * _1617;
                    float _2971 = fma(_1619, _1619, _2969);
                    float _2973 = fma(_1621, _1621, _2971);
                    float _2975 = sqrt(_2973);
                    bool _2977 = _2975 >= 9.9999999747524270787835121154785e-07;
                    bool _2979 = isnan(_2975);
                    bool _2981 = _2977 || _2979;
                    bool _2983 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2985 = _2981 || _2983;
                    float _2987 = _2975;
                    if (_2985)
                    {
                        float _2989 = rsqrt(_2973);
                        _2987 = _2989;
                    }
                    float _2991 = _2987;
                    if (!_2985)
                    {
                        _345 = 0;
                    }
                    int _2993 = _345;
                    int _2995 = _2993;
                    if (!_2985)
                    {
                        _347 = 897988541;
                    }
                    int _2997 = _347;
                    int _2999 = _2997;
                    if (!_2985)
                    {
                        _349 = 0;
                    }
                    int _3001 = _349;
                    float _3003 = _2991;
                    int _3005 = _3001;
                    if (_2985)
                    {
                        float _3007 = _2991 * 9.9999999747524270787835121154785e-07;
                        _3003 = _3007;
                    }
                    float _3009 = _3003;
                    if (_2985)
                    {
                        float _3011 = _1619 * _3009;
                        _2995 = as_type<int>(_3011);
                    }
                    int _3013 = _2995;
                    _357 = _3013;
                    if (_2985)
                    {
                        float _3015 = _1617 * _3009;
                        _2999 = as_type<int>(_3015);
                    }
                    int _3017 = _2999;
                    _359 = _3017;
                    if (_2985)
                    {
                        float _3019 = _1621 * _3009;
                        _3005 = as_type<int>(_3019);
                    }
                    int _3021 = _3005;
                    _361 = _3021;
                    _2929 = true;
                }
                else
                {
                    float _3023 = rsqrt(_2903);
                    float _3025 = _3023 * 9.9999999747524270787835121154785e-07;
                    float _3027 = _1123 * _3025;
                    float _3029 = _1119 * _3025;
                    float _3031 = _1121 * _3025;
                    _357 = as_type<int>(_3027);
                    _359 = as_type<int>(_3029);
                    _361 = as_type<int>(_3031);
                    _2929 = true;
                }
            }
        }
    }
    else
    {
        float _3033 = _2907 * _2891;
        bool _3035 = _3033 >= 0.001000000047497451305389404296875;
        bool _3037 = isnan(_3033);
        bool _3039 = _3035 || _3037;
        bool _3041 = isnan(0.001000000047497451305389404296875);
        bool _3043 = _3039 || _3041;
        bool _3045 = _3033 > 0.0;
        bool _3047 = !_3043;
        bool _3049 = _3045 && _3047;
        bool _3051 = _2905 < 0.001000000047497451305389404296875;
        bool _3053 = _3051 && _3049;
        if (!_3053)
        {
            _351 = as_type<int>(_2857);
        }
        int _3055 = _351;
        int _3057 = _3055;
        if (_3053)
        {
            float _3059 = _1123 * _2891;
            _3057 = as_type<int>(_3059);
        }
        int _3061 = _3057;
        _357 = _3061;
        if (!_3053)
        {
            _353 = as_type<int>(_2865);
        }
        int _3063 = _353;
        int _3065 = _3063;
        if (_3053)
        {
            float _3067 = _1119 * _2891;
            _3065 = as_type<int>(_3067);
        }
        int _3069 = _3065;
        _359 = _3069;
        if (!_3053)
        {
            _355 = as_type<int>(_2839);
        }
        int _3071 = _355;
        _361 = _3071;
        if (_3053)
        {
            float _3073 = _1121 * _2891;
            _361 = as_type<int>(_3073);
        }
    }
    _2929 = false;
    int _3075 = _357;
    int _3077 = _359;
    int _3079 = _361;
    uint _3081 = uint(int(uint(_177) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_3081)] = uint(_3075);
    uint _3083 = uint(int(uint(_2867) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_3083)] = uint(_3077);
    uint _3085 = uint(int(uint(_2503) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_3085)] = uint(_3079);
}

