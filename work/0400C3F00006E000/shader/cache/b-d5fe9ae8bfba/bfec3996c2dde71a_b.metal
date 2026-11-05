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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _339 = false;
    float _47 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _49 = as_type<float>(gl_LocalInvocationID.x);
    float _51 = as_type<float>(gl_WorkGroupID.x);
    int _54 = as_type<int>(_51) << 5;
    int _56 = _54 + as_type<int>(_49);
    float _58 = trunc(_47);
    int _60 = int(_58);
    bool _64 = _56 >= _60;
    int _66 = as_type<int>(_51);
    if (_64)
    {
        _66 = 0;
    }
    int _68 = _66;
    int _70 = _68;
    int _72 = _68;
    if (!_64)
    {
        int _74 = _56 << 4;
        int _76 = _74 + 12;
        uint _79 = uint(int(uint(_76) >> uint(2)));
        float _81 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_79)]);
        float _83 = trunc(_81);
        int _85 = int(_83);
        bool _87 = _85 >= 1;
        int _89 = _87 ? (-1) : 0;
        if (!_87)
        {
            _70 = 0;
        }
        int _91 = _70;
        bool _93 = !_87;
        _72 = _91;
        if (!_93)
        {
            float _95 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _97 = uint(int(uint(_76) >> uint(2)));
            float _99 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_97)]);
            float _101 = float(_85);
            float _103 = -_99;
            float _105 = _95 + _103;
            bool _107 = _105 > _101;
            int _109 = as_type<int>(_95);
            if (!_107)
            {
                bool _111 = _95 >= _99;
                bool _113 = isnan(_95);
                bool _115 = _111 || _113;
                bool _117 = isnan(_99);
                bool _119 = _115 || _117;
                _89 = _119 ? (-1) : 0;
            }
            int _121 = _89;
            if (_107)
            {
                _109 = 0;
            }
            int _123 = _109;
            _72 = _123;
            if (!_107)
            {
                int _125 = ~_121;
                int _127 = (_125 != 0) ? 0 : 1;
                _72 = _127;
            }
        }
    }
    int _129 = _72;
    int _131 = _129 & 1;
    bool _133 = _131 != 0;
    if (!_133)
    {
        return;
    }
    float _135 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _137 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _139 = _56 << 4;
    float _141 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    int _143 = _139 + 12;
    float _145 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _149 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    uint _151 = uint(int(uint(_143) >> uint(2)));
    float _153 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_151)]);
    uint _155 = uint(int(uint(_139) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_155)]);
    int _159 = _139 + 4;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_161)]);
    int _165 = _139 + 8;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_167)]);
    uint _171 = uint(int(uint(_139) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_171)]);
    int _175 = _139 + 4;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_177)]);
    int _181 = _139 + 8;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_183)]);
    uint _187 = uint(int(uint(_143) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_187)]);
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _193 = abs(_137);
    float _195 = log2(_193);
    float _197 = _135 * _195;
    float _199 = exp2(_197);
    float _201 = _135 * _141;
    float _203 = _153 * _135;
    float _205 = _145 * _201;
    float _207 = _147 * _201;
    float _209 = _157 * _203;
    float _211 = _149 * _201;
    float _213 = fma(_157, _199, _205);
    float _215 = fma(_163, _199, _207);
    float _217 = _163 * _203;
    float _219 = _169 * _203;
    float _221 = fma(_169, _199, _211);
    float _223 = _173 + _209;
    float _225 = _217 * _217;
    float _227 = _179 + _217;
    float _229 = _185 + _219;
    uint _231 = uint(int(uint(_143) >> uint(2)));
    float _233 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_231)]);
    uint _235 = uint(int(uint(_139) >> uint(2)));
    float _237 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_235)]);
    int _239 = _139 + 4;
    uint _241 = uint(int(uint(_239) >> uint(2)));
    float _243 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_241)]);
    int _245 = _139 + 8;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    float _249 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_247)]);
    uint _251 = uint(int(uint(_143) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_251)] = as_type<uint>(_189);
    float _253 = fma(_209, _209, _225);
    float _255 = fma(_219, _219, _253);
    float _257 = sqrt(_255);
    float _259 = _215 * _215;
    int _261 = _139 + 4;
    int _263 = _139 + 8;
    float _265 = fma(_213, _213, _259);
    uint _267 = uint(int(uint(_139) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_267)] = as_type<uint>(_223);
    uint _269 = uint(int(uint(_261) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_269)] = as_type<uint>(_227);
    float _271 = fma(_221, _221, _265);
    uint _273 = uint(int(uint(_263) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_273)] = as_type<uint>(_229);
    bool _275 = _257 >= 9.9999999747524270787835121154785e-07;
    bool _277 = isnan(_257);
    bool _279 = _275 || _277;
    bool _281 = isnan(9.9999999747524270787835121154785e-07);
    bool _283 = _279 || _281;
    uint _285 = uint(int(uint(_139) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_285)] = as_type<uint>(_213);
    float _287 = sqrt(_271);
    uint _289 = uint(int(uint(_261) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_289)] = as_type<uint>(_215);
    uint _291 = uint(int(uint(_263) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_291)] = as_type<uint>(_221);
    uint _293 = uint(int(uint(_139) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_293)] = as_type<uint>(_209);
    uint _295 = uint(int(uint(_261) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_295)] = as_type<uint>(_217);
    uint _297 = uint(int(uint(_263) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_297)] = as_type<uint>(_219);
    float _299 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    int _301 = as_type<int>(_209);
    int _303 = as_type<int>(_233);
    int _305 = as_type<int>(_257);
    float _307 = _243;
    int _309 = as_type<int>(_233);
    int _311 = as_type<int>(_209);
    int _313 = as_type<int>(_257);
    int _329;
    int _333;
    int _337;
    if (!_283)
    {
        bool _315 = _191 != _233;
        bool _317 = isnan(_191);
        bool _319 = _315 || _317;
        bool _321 = isnan(_233);
        bool _323 = _319 || _321;
        if (_323)
        {
            _301 = as_type<int>(_237);
        }
        int _325 = _301;
        int _327 = _325;
        _329 = _325;
        if (_323)
        {
            _303 = as_type<int>(_243);
        }
        int _331 = _303;
        _333 = _331;
        if (_323)
        {
            _305 = as_type<int>(_249);
        }
        int _335 = _305;
        _337 = _335;
        _339 = _323;
        if (!_339)
        {
            float _341 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _343 = _341 > 0.0;
            bool _345 = !_343;
            if (!_345)
            {
                float _347 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _349 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _351 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _353 = _349 * _349;
                float _355 = fma(_347, _347, _353);
                float _357 = fma(_351, _351, _355);
                float _359 = rsqrt(_357);
                float _361 = _359 * 9.9999999747524270787835121154785e-07;
                float _363 = _347 * _361;
                float _365 = _349 * _361;
                float _367 = _351 * _361;
                _329 = as_type<int>(_363);
                _333 = as_type<int>(_365);
                _337 = as_type<int>(_367);
                _339 = true;
            }
            else
            {
                bool _369 = _287 >= 9.9999999747524270787835121154785e-07;
                bool _371 = isnan(_287);
                bool _373 = _369 || _371;
                bool _375 = isnan(9.9999999747524270787835121154785e-07);
                bool _377 = _373 || _375;
                if (!_377)
                {
                    float _379 = _227 * _227;
                    float _381 = fma(_223, _223, _379);
                    float _383 = fma(_229, _229, _381);
                    float _385 = sqrt(_383);
                    bool _387 = _385 >= 9.9999999747524270787835121154785e-07;
                    bool _389 = isnan(_385);
                    bool _391 = _387 || _389;
                    bool _393 = isnan(9.9999999747524270787835121154785e-07);
                    bool _395 = _391 || _393;
                    int _397 = as_type<int>(_385);
                    int _399 = as_type<int>(_381);
                    if (_395)
                    {
                        float _401 = rsqrt(_383);
                        _397 = as_type<int>(_401);
                    }
                    int _403 = _397;
                    if (!_395)
                    {
                        _327 = 0;
                    }
                    int _405 = _327;
                    int _407 = _405;
                    if (!_395)
                    {
                        _399 = 897988541;
                    }
                    int _409 = _399;
                    int _411 = _403;
                    int _413 = _409;
                    if (_395)
                    {
                        float _415 = as_type<float>(_403) * 9.9999999747524270787835121154785e-07;
                        _307 = _415;
                    }
                    float _417 = _307;
                    if (!_395)
                    {
                        _411 = 0;
                    }
                    int _419 = _411;
                    int _421 = _419;
                    if (_395)
                    {
                        float _423 = _223 * _417;
                        _407 = as_type<int>(_423);
                    }
                    int _425 = _407;
                    _329 = _425;
                    if (_395)
                    {
                        float _427 = _227 * _417;
                        _413 = as_type<int>(_427);
                    }
                    int _429 = _413;
                    _333 = _429;
                    if (_395)
                    {
                        float _431 = _229 * _417;
                        _421 = as_type<int>(_431);
                    }
                    int _433 = _421;
                    _337 = _433;
                    _339 = true;
                }
                else
                {
                    float _435 = rsqrt(_271);
                    float _437 = _435 * 9.9999999747524270787835121154785e-07;
                    float _439 = _213 * _437;
                    float _441 = _215 * _437;
                    float _443 = _221 * _437;
                    _329 = as_type<int>(_439);
                    _333 = as_type<int>(_441);
                    _337 = as_type<int>(_443);
                    _339 = true;
                }
            }
        }
    }
    else
    {
        float _445 = _287 * _299;
        bool _447 = _445 >= 0.001000000047497451305389404296875;
        bool _449 = isnan(_445);
        bool _451 = _447 || _449;
        bool _453 = isnan(0.001000000047497451305389404296875);
        bool _455 = _451 || _453;
        bool _457 = _445 > 0.0;
        bool _459 = !_455;
        bool _461 = _457 && _459;
        bool _463 = _257 < 0.001000000047497451305389404296875;
        bool _465 = _463 && _461;
        if (!_465)
        {
            _309 = as_type<int>(_217);
        }
        int _467 = _309;
        int _469 = _467;
        if (_465)
        {
            float _471 = _213 * _299;
            _311 = as_type<int>(_471);
        }
        int _473 = _311;
        _329 = _473;
        if (!_465)
        {
            _313 = as_type<int>(_219);
        }
        int _475 = _313;
        _337 = _475;
        if (_465)
        {
            float _477 = _215 * _299;
            _469 = as_type<int>(_477);
        }
        int _479 = _469;
        _333 = _479;
        if (_465)
        {
            float _481 = _221 * _299;
            _337 = as_type<int>(_481);
        }
    }
    _339 = false;
    int _483 = _329;
    int _485 = _333;
    int _487 = _337;
    uint _489 = uint(int(uint(_139) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_489)] = uint(_483);
    uint _491 = uint(int(uint(_261) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_491)] = uint(_485);
    uint _493 = uint(int(uint(_263) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_493)] = uint(_487);
}

