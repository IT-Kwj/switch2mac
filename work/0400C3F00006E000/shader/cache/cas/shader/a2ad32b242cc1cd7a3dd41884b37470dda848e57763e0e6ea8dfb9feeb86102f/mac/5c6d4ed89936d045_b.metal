#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    device _23* cp_s1 [[id(3)]];
    device _23* cp_s2 [[id(4)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    bool _38 = 0u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _40 = !_38;
    bool _42 = _38;
    int _45 = 0;
    int _47 = 0;
    if (!_40)
    {
        bool _49 = 0u >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _51 = 0;
        uint _54 = 0u;
        if (_49)
        {
            _51 = 0;
        }
        int _56 = _51;
        if (_49)
        {
            bool _58 = as_type<uint>((*spvDescriptorSet0.cp_c0)._m0[54].x) < 0u;
            _42 = _58;
        }
        bool _60 = _42;
        uint _62 = 0u;
        if (_49)
        {
            int _64 = _56 + 4;
            _62 = uint(_64);
        }
        uint _66 = _62;
        int _68 = 0;
        if (_49)
        {
            int _70 = int(_60);
            int _72 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[54].y) + _70;
            _68 = _72;
        }
        int _74 = _68;
        uint _76 = 0u;
        if (_49)
        {
            int _78 = _56 + 16;
            _76 = uint(_78);
        }
        uint _80 = _76;
        if (_49)
        {
            uint _82 = uint(int(uint(int(_66)) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_82)] = 0u;
        }
        if (_49)
        {
            uint _84 = uint(int(uint(int(_80)) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_84)] = 0u;
        }
        int _86 = _74;
        if (_49)
        {
            float _89 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[0]);
            _86 = as_type<int>(_89);
        }
        int _91 = _86;
        if (_49)
        {
            _54 = 1u;
        }
        uint _93 = _54;
        bool _95 = _93 >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _97 = ~int(_93);
        int _99 = _97 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _101 = _99 + 1;
        bool _103 = uint(_101) <= 3u;
        bool _105 = _103 || _95;
        bool _107 = !_49;
        int _109 = int(_93);
        uint _111 = _93;
        int _113 = _107 ? (-1) : 0;
        if (_49)
        {
            _45 = _91;
        }
        int _115 = _45;
        int _117 = _115;
        int _119 = _115;
        if (!_105)
        {
            int _121 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x) + (-3);
            _113 = 0;
            bool _123;
            do
            {
                int _125 = _109;
                int _127 = _117;
                int _129 = _125 * 20;
                int _131 = _125 << 2;
                int _133 = _129 + 4;
                int _135 = _129 + 16;
                uint _137 = uint(int(uint(_133) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_137)] = 0u;
                uint _139 = uint(int(uint(_135) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_139)] = uint(_127);
                uint _141 = uint(int(uint(_131) >> uint(2)));
                float _143 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_141)]);
                int _145 = _125 + 1;
                int _147 = _129 + 24;
                int _149 = _145 << 2;
                int _151 = _129 + 36;
                uint _153 = uint(int(uint(_147) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_153)] = 0u;
                int _155 = as_type<int>(_143) + _127;
                uint _157 = uint(int(uint(_151) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_157)] = uint(_155);
                uint _159 = uint(int(uint(_149) >> uint(2)));
                float _161 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_159)]);
                int _163 = _125 + 2;
                int _165 = _129 + 44;
                int _167 = _163 << 2;
                int _169 = _129 + 56;
                uint _171 = uint(int(uint(_165) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_171)] = 0u;
                int _173 = _155 + as_type<int>(_161);
                uint _175 = uint(int(uint(_169) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_175)] = uint(_173);
                uint _177 = uint(int(uint(_167) >> uint(2)));
                float _179 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_177)]);
                int _181 = _125 + 3;
                int _183 = _129 + 64;
                int _185 = _181 << 2;
                int _187 = _129 + 76;
                uint _189 = uint(int(uint(_183) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_189)] = 0u;
                int _191 = _125 + 4;
                int _193 = _173 + as_type<int>(_179);
                uint _195 = uint(int(uint(_187) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_195)] = uint(_193);
                uint _197 = uint(int(uint(_185) >> uint(2)));
                float _199 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_197)]);
                bool _201 = uint(_191) >= uint(_121);
                int _203 = _193 + as_type<int>(_199);
                _123 = !_201;
                _109 = _191;
                _117 = _203;
                _111 = uint(_191);
                _119 = _203;
            } while (_123);
        }
        uint _205 = _111;
        int _207 = _119;
        int _209 = _113;
        bool _211 = _205 >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _213 = ~int(_205);
        int _215 = _213 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _217 = _215 + 1;
        bool _219 = uint(_217) <= 1u;
        bool _221 = _219 || _211;
        uint _223 = _205;
        int _225 = _209;
        int _227 = _207;
        if (!_221)
        {
            int _229 = int(_205) * 20;
            int _231 = int(_205) << 2;
            int _233 = _229 + 4;
            int _235 = _229 + 16;
            uint _237 = uint(int(uint(_233) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_237)] = 0u;
            uint _239 = uint(int(uint(_235) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_239)] = uint(_207);
            uint _241 = uint(int(uint(_231) >> uint(2)));
            float _243 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_241)]);
            int _245 = int(_205) + 1;
            int _247 = _229 + 24;
            int _249 = _245 << 2;
            int _251 = _229 + 36;
            uint _253 = uint(int(uint(_247) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_253)] = 0u;
            int _255 = _207 + as_type<int>(_243);
            uint _257 = uint(int(uint(_251) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_257)] = uint(_255);
            uint _259 = uint(int(uint(_249) >> uint(2)));
            float _261 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_259)]);
            int _263 = int(_205) + 2;
            int _265 = _255 + as_type<int>(_261);
            _223 = uint(_263);
            _225 = 0;
            _227 = _265;
        }
        uint _267 = _223;
        int _269 = _225;
        int _271 = _227;
        bool _273 = _267 < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _275 = (_273 ? (-1) : 0) | _269;
        int _277 = ~_275;
        _47 = _271;
        if (!(_277 != 0))
        {
            int _279 = int(_267) * 20;
            int _281 = int(_267) << 2;
            int _283 = _279 + 4;
            int _285 = _279 + 16;
            uint _287 = uint(int(uint(_283) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_287)] = 0u;
            uint _289 = uint(int(uint(_285) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_289)] = uint(_271);
            uint _291 = uint(int(uint(_281) >> uint(2)));
            float _293 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_291)]);
            int _295 = _271 + as_type<int>(_293);
            _47 = _295;
        }
    }
    int _297 = _47;
    int _299 = _297 + 63;
    uint _301 = uint(int(uint(_299) >> uint(6)));
    (*spvDescriptorSet0.cp_s2)._m0[1] = _301;
}

