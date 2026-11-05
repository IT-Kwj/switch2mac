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

// Implementation of the unsigned GLSL findMSB() function
template<typename T>
inline T spvFindUMSB(T x)
{
    return select(clz(T(0)) - (clz(x) + T(1)), T(-1), x == T(0));
}

inline uint4 spvSubgroupBallot(bool value)
{
    simd_vote vote = simd_ballot(value);
    // simd_ballot() returns a 64-bit integer-like object, but
    // SPIR-V callers expect a uint4. We must convert.
    // FIXME: This won't include higher bits if Apple ever supports
    // 128 lanes in an SIMD-group.
    return uint4(as_type<uint2>((simd_vote::vote_t)vote), 0, 0);
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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _25* cp_s0 [[id(2)]];
    device _25* cp_s1 [[id(3)]];
};

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 132>& _35)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _127 = false;
    float _49 = as_type<float>(gl_SubgroupInvocationID);
    uint _52 = spvSubgroupBallot(true).x;
    bool _56 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[18].z);
    int _59 = reverse_bits(int(_52));
    int _61 = int(spvFindUMSB(uint(_59)));
    bool _63 = _61 != (-1);
    int _65 = _61 ^ 31;
    int _67 = _63 ? _65 : _61;
    bool _69 = as_type<int>(_49) == _67;
    bool _71 = _69 && _56;
    bool _73 = !_71;
    if (!_73)
    {
        bool _75 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[1].y) != 1;
        if (!_75)
        {
            bool _77 = 0 != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[1].z);
            int _79 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) * 48;
            if (!_77)
            {
                int _81 = _79 + 12;
                int _83 = _79 + 16;
                uint _85 = uint(int(uint(_79) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_85)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].x);
                int _87 = _79 + 4;
                uint _89 = uint(int(uint(_87) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_89)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].y);
                int _91 = _79 + 28;
                int _93 = _79 + 8;
                uint _95 = uint(int(uint(_93) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_95)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].z);
                int _97 = _79 + 32;
                int _99 = _79 + 44;
                uint _101 = uint(int(uint(_81) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_101)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].w);
                uint _103 = uint(int(uint(_83) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_103)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].x);
                int _105 = _83 + 4;
                uint _107 = uint(int(uint(_105) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_107)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].y);
                int _109 = _83 + 8;
                uint _111 = uint(int(uint(_109) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_111)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].z);
                uint _113 = uint(int(uint(_91) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_113)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].w);
                uint _115 = uint(int(uint(_97) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_115)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].x);
                int _117 = _97 + 4;
                uint _119 = uint(int(uint(_117) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_119)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].y);
                int _121 = _97 + 8;
                uint _123 = uint(int(uint(_121) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_123)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].z);
                uint _125 = uint(int(uint(_99) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_125)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].w);
                _127 = true;
            }
            else
            {
                bool _129 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[1].z) != 1;
                if (!_129)
                {
                    int _131 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[1].x) + (-1);
                    int _133 = ~as_type<int>((*spvDescriptorSet0.cp_c4)._m0[1].x);
                    int _135 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + 1;
                    int _137 = _135 + _133;
                    int _139 = _137 + 1;
                    bool _141 = 0 < _131;
                    bool _143 = _139 >= 0;
                    int _145 = _143 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
                    int _147 = _139 + _145;
                    bool _149 = !_141;
                    if (!_149)
                    {
                        int _151 = 0;
                        bool _153;
                        do
                        {
                            int _155 = _151;
                            int _157 = _147 + _155;
                            bool _159 = _157 >= as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
                            int _161 = _157 + 1;
                            bool _163 = !_159;
                            int _165 = _163 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
                            bool _167 = _161 >= as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
                            int _169 = -_165;
                            int _171 = _157 + _169;
                            bool _173 = !_167;
                            int _175 = _173 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
                            int _177 = _171 * 48;
                            int _179 = -_175;
                            int _181 = _161 + _179;
                            int _183 = _177 + 44;
                            int _185 = _181 * 48;
                            uint _187 = uint(int(uint(_183) >> uint(2)));
                            float _189 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_187)]);
                            int _191 = _185 + 44;
                            int _193 = _185 + 16;
                            uint _195 = uint(int(uint(_185) >> uint(2)));
                            float _197 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_195)]);
                            int _199 = _185 + 4;
                            uint _201 = uint(int(uint(_199) >> uint(2)));
                            float _203 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_201)]);
                            int _205 = _185 + 8;
                            uint _207 = uint(int(uint(_205) >> uint(2)));
                            float _209 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_207)]);
                            uint _211 = uint(int(uint(_191) >> uint(2)));
                            float _213 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_211)]);
                            int _215 = _185 + 12;
                            int _217 = _185 + 28;
                            uint _219 = uint(int(uint(_193) >> uint(2)));
                            float _221 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_219)]);
                            int _223 = _193 + 4;
                            uint _225 = uint(int(uint(_223) >> uint(2)));
                            float _227 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_225)]);
                            int _229 = _193 + 8;
                            uint _231 = uint(int(uint(_229) >> uint(2)));
                            float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_231)]);
                            int _235 = _185 + 32;
                            uint _237 = uint(int(uint(_215) >> uint(2)));
                            float _239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_237)]);
                            uint _241 = uint(int(uint(_217) >> uint(2)));
                            float _243 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_241)]);
                            uint _245 = uint(int(uint(_235) >> uint(2)));
                            float _247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_245)]);
                            int _249 = _235 + 4;
                            uint _251 = uint(int(uint(_249) >> uint(2)));
                            float _253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_251)]);
                            int _255 = _235 + 8;
                            uint _257 = uint(int(uint(_255) >> uint(2)));
                            float _259 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_257)]);
                            int _261 = _155 + 1;
                            int _263 = _177 + 28;
                            int _265 = _177 + 32;
                            bool _267 = _189 >= 0.0;
                            bool _269 = _213 >= 0.0;
                            bool _271 = !_267;
                            bool _273 = _269 && _271;
                            float _275 = _273 ? (-1.0) : 1.0;
                            bool _277 = _261 >= _131;
                            int _279 = _177 + 12;
                            int _281 = _177 + 16;
                            uint _283 = uint(int(uint(_177) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_283)] = as_type<uint>(_197);
                            int _285 = _177 + 4;
                            uint _287 = uint(int(uint(_285) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_287)] = as_type<uint>(_203);
                            float _289 = _213 * _275;
                            int _291 = _177 + 8;
                            uint _293 = uint(int(uint(_291) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_293)] = as_type<uint>(_209);
                            uint _295 = uint(int(uint(_279) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_295)] = as_type<uint>(_239);
                            uint _297 = uint(int(uint(_281) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_297)] = as_type<uint>(_221);
                            int _299 = _281 + 4;
                            uint _301 = uint(int(uint(_299) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_301)] = as_type<uint>(_227);
                            int _303 = _281 + 8;
                            uint _305 = uint(int(uint(_303) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_305)] = as_type<uint>(_233);
                            uint _307 = uint(int(uint(_263) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_307)] = as_type<uint>(_243);
                            uint _309 = uint(int(uint(_265) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_309)] = as_type<uint>(_247);
                            int _311 = _265 + 4;
                            uint _313 = uint(int(uint(_311) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_313)] = as_type<uint>(_253);
                            int _315 = _265 + 8;
                            uint _317 = uint(int(uint(_315) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_317)] = as_type<uint>(_259);
                            uint _319 = uint(int(uint(_183) >> uint(2)));
                            (*spvDescriptorSet0.cp_s0)._m0[int(_319)] = as_type<uint>(_289);
                            _153 = !_277;
                            _151 = _261;
                        } while (_153);
                    }
                    int _321 = _79 + 12;
                    uint _323 = uint(int(uint(_79) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_323)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].x);
                    int _325 = _79 + 4;
                    uint _327 = uint(int(uint(_325) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_327)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].y);
                    int _329 = _79 + 16;
                    int _331 = _79 + 28;
                    int _333 = _79 + 32;
                    int _335 = _79 + 8;
                    uint _337 = uint(int(uint(_335) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_337)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].z);
                    int _339 = _79 + 44;
                    uint _341 = uint(int(uint(_321) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_341)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[2].w);
                    uint _343 = uint(int(uint(_329) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_343)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].x);
                    int _345 = _329 + 4;
                    uint _347 = uint(int(uint(_345) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_347)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].y);
                    int _349 = _329 + 8;
                    uint _351 = uint(int(uint(_349) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_351)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].z);
                    uint _353 = uint(int(uint(_331) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_353)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[3].w);
                    uint _355 = uint(int(uint(_333) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_355)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].x);
                    int _357 = _333 + 4;
                    uint _359 = uint(int(uint(_357) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_359)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].y);
                    int _361 = _333 + 8;
                    uint _363 = uint(int(uint(_361) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_363)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].z);
                    uint _365 = uint(int(uint(_339) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_365)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[4].w);
                }
            }
            _127 = false;
            int _367 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) >> 5;
            int _369 = _367 * 64;
            if (!_77)
            {
                int _371 = _367 * 64;
                int _373 = _371 + 28;
                uint _375 = uint(int(uint(_373) >> uint(2)));
                float _377 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_375)]);
                int _379 = _371 + 32;
                int _381 = _371 + 36;
                int _383 = _371 + 48;
                int _385 = as_type<int>(_377) + 1;
                uint _387 = uint(int(uint(_373) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_387)] = uint(_385);
                uint _389 = uint(int(uint(_379) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_389)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[7].x);
                uint _391 = uint(int(uint(_381) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_391)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[7].y);
                uint _393 = uint(int(uint(_383) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_393)] = as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[7].z);
            }
            uint _395 = uint(int(uint(_369) >> uint(2)));
            float _397 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_395)]);
            int _399 = _369 + 4;
            uint _401 = uint(int(uint(_399) >> uint(2)));
            float _403 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_401)]);
            int _405 = _369 + 8;
            uint _407 = uint(int(uint(_405) >> uint(2)));
            float _409 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_407)]);
            int _411 = _369 + 16;
            float _413 = (-3.0) + (*spvDescriptorSet0.cp_c4)._m0[2].x;
            float _415 = (-3.0) + (*spvDescriptorSet0.cp_c4)._m0[2].y;
            float _417 = (-3.0) + (*spvDescriptorSet0.cp_c4)._m0[2].z;
            float _419 = precise::min(_397, _413);
            float _421 = precise::min(_403, _415);
            float _423 = precise::min(_409, _417);
            uint _425 = uint(int(uint(_369) >> uint(2)));
            (*spvDescriptorSet0.cp_s1)._m0[int(_425)] = as_type<uint>(_419);
            int _427 = _369 + 4;
            uint _429 = uint(int(uint(_427) >> uint(2)));
            (*spvDescriptorSet0.cp_s1)._m0[int(_429)] = as_type<uint>(_421);
            int _431 = _369 + 8;
            uint _433 = uint(int(uint(_431) >> uint(2)));
            (*spvDescriptorSet0.cp_s1)._m0[int(_433)] = as_type<uint>(_423);
            uint _435 = uint(int(uint(_411) >> uint(2)));
            float _437 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_435)]);
            int _439 = _411 + 4;
            uint _441 = uint(int(uint(_439) >> uint(2)));
            float _443 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_441)]);
            int _445 = _411 + 8;
            uint _447 = uint(int(uint(_445) >> uint(2)));
            float _449 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_447)]);
            float _451 = 3.0 + (*spvDescriptorSet0.cp_c4)._m0[2].x;
            float _453 = 3.0 + (*spvDescriptorSet0.cp_c4)._m0[2].y;
            float _455 = 3.0 + (*spvDescriptorSet0.cp_c4)._m0[2].z;
            int _457 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) & 31;
            bool _459 = _457 != 0;
            float _461 = precise::max(_437, _451);
            float _463 = precise::max(_443, _453);
            float _465 = precise::max(_449, _455);
            uint _467 = uint(int(uint(_411) >> uint(2)));
            (*spvDescriptorSet0.cp_s1)._m0[int(_467)] = as_type<uint>(_461);
            int _469 = _411 + 4;
            uint _471 = uint(int(uint(_469) >> uint(2)));
            (*spvDescriptorSet0.cp_s1)._m0[int(_471)] = as_type<uint>(_463);
            int _473 = _411 + 8;
            uint _475 = uint(int(uint(_473) >> uint(2)));
            (*spvDescriptorSet0.cp_s1)._m0[int(_475)] = as_type<uint>(_465);
            if (!_459)
            {
                bool _477 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) > 31;
                int _479 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z) >> 31;
                int _481 = _479 & 31;
                int _483 = _481 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
                int _485 = _483 >> 5;
                int _487 = _477 ? _367 : _485;
                int _489 = _487 + (-1);
                int _491 = _489 * 64;
                int _493 = _491 + 28;
                uint _495 = uint(int(uint(_493) >> uint(2)));
                float _497 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_495)]);
                bool _499 = as_type<int>(_497) != 0;
                bool _501 = !_499;
                if (!_501)
                {
                    uint _503 = uint(int(uint(_491) >> uint(2)));
                    float _505 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_503)]);
                    int _507 = _491 + 4;
                    uint _509 = uint(int(uint(_507) >> uint(2)));
                    float _511 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_509)]);
                    int _513 = _491 + 8;
                    uint _515 = uint(int(uint(_513) >> uint(2)));
                    float _517 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_515)]);
                    float _519 = precise::min(_415, _511);
                    float _521 = precise::min(_413, _505);
                    float _523 = precise::min(_417, _517);
                    int _525 = _491 + 16;
                    uint _527 = uint(int(uint(_491) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_527)] = as_type<uint>(_521);
                    int _529 = _491 + 4;
                    uint _531 = uint(int(uint(_529) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_531)] = as_type<uint>(_519);
                    int _533 = _491 + 8;
                    uint _535 = uint(int(uint(_533) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_535)] = as_type<uint>(_523);
                    uint _537 = uint(int(uint(_525) >> uint(2)));
                    float _539 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_537)]);
                    int _541 = _525 + 4;
                    uint _543 = uint(int(uint(_541) >> uint(2)));
                    float _545 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_543)]);
                    int _547 = _525 + 8;
                    uint _549 = uint(int(uint(_547) >> uint(2)));
                    float _551 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_549)]);
                    float _553 = precise::max(_451, _539);
                    float _555 = precise::max(_453, _545);
                    float _557 = precise::max(_455, _551);
                    uint _559 = uint(int(uint(_525) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_559)] = as_type<uint>(_553);
                    int _561 = _525 + 4;
                    uint _563 = uint(int(uint(_561) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_563)] = as_type<uint>(_555);
                    int _565 = _525 + 8;
                    uint _567 = uint(int(uint(_565) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_567)] = as_type<uint>(_557);
                    if (!_77)
                    {
                        uint _569 = uint(int(uint(_493) >> uint(2)));
                        float _571 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_569)]);
                        int _573 = as_type<int>(_571) + 1;
                        uint _575 = uint(int(uint(_493) >> uint(2)));
                        (*spvDescriptorSet0.cp_s1)._m0[int(_575)] = uint(_573);
                    }
                }
            }
            bool _577 = _457 != 31;
            if (!_577)
            {
                int _579 = _367 + 1;
                int _581 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z) >> 31;
                int _583 = _581 & 31;
                int _585 = _583 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
                uint _587 = uint(int(uint(_585) >> uint(5)));
                int _589 = int(_587) + (-1);
                bool _591 = _367 >= _589;
                bool _593 = !_591;
                int _595 = _593 ? _579 : 0;
                int _597 = _595 * 64;
                int _599 = _597 + 28;
                int _601 = _597 + 16;
                int _603 = _597 + 40;
                uint _605 = uint(int(uint(_599) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_605)] = 0u;
                int _607 = _597 + 44;
                uint _609 = uint(int(uint(_597) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_609)] = 1174011904u;
                int _611 = _597 + 4;
                uint _613 = uint(int(uint(_611) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_613)] = 1174011904u;
                int _615 = _597 + 8;
                uint _617 = uint(int(uint(_615) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_617)] = 1174011904u;
                uint _619 = uint(int(uint(_601) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_619)] = 3321495552u;
                int _621 = _601 + 4;
                uint _623 = uint(int(uint(_621) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_623)] = 3321495552u;
                int _625 = _601 + 8;
                uint _627 = uint(int(uint(_625) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_627)] = 3321495552u;
                uint _629 = uint(int(uint(_603) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_629)] = 0u;
                uint _631 = uint(int(uint(_607) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_631)] = 0u;
            }
        }
        bool _633 = 0 < as_type<int>((*spvDescriptorSet0.cp_c4)._m0[1].w);
        bool _635 = !_633;
        if (!_635)
        {
            int _637 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) * 48;
            int _639 = _637 + 12;
            uint _641 = uint(int(uint(_639) >> uint(2)));
            float _643 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_641)]);
            int _645 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + (-1);
            bool _647 = _645 >= 0;
            int _649 = _647 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
            int _651 = _645 + _649;
            int _653 = _651 * 48;
            int _655 = _653 + 12;
            float _657 = _643 * (*spvDescriptorSet0.cp_c4)._m0[5].x;
            uint _659 = uint(int(uint(_639) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_659)] = as_type<uint>(_657);
            uint _661 = uint(int(uint(_655) >> uint(2)));
            float _663 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_661)]);
            int _665 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + (-2);
            bool _667 = _665 >= 0;
            int _669 = _667 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
            int _671 = _665 + _669;
            int _673 = _671 * 48;
            int _675 = _673 + 12;
            float _677 = _663 * (*spvDescriptorSet0.cp_c4)._m0[5].y;
            uint _679 = uint(int(uint(_655) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_679)] = as_type<uint>(_677);
            uint _681 = uint(int(uint(_675) >> uint(2)));
            float _683 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_681)]);
            int _685 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + (-3);
            bool _687 = _685 >= 0;
            int _689 = _687 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
            int _691 = _685 + _689;
            int _693 = _691 * 48;
            int _695 = _693 + 12;
            float _697 = _683 * (*spvDescriptorSet0.cp_c4)._m0[5].z;
            uint _699 = uint(int(uint(_675) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_699)] = as_type<uint>(_697);
            uint _701 = uint(int(uint(_695) >> uint(2)));
            float _703 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_701)]);
            int _705 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + (-4);
            bool _707 = _705 >= 0;
            int _709 = _707 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
            int _711 = _705 + _709;
            int _713 = _711 * 48;
            int _715 = _713 + 12;
            float _717 = _703 * (*spvDescriptorSet0.cp_c4)._m0[5].w;
            uint _719 = uint(int(uint(_695) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_719)] = as_type<uint>(_717);
            uint _721 = uint(int(uint(_715) >> uint(2)));
            float _723 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_721)]);
            int _725 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + (-5);
            bool _727 = _725 >= 0;
            int _729 = _727 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
            int _731 = _725 + _729;
            int _733 = _731 * 48;
            int _735 = _733 + 12;
            float _737 = _723 * (*spvDescriptorSet0.cp_c4)._m0[6].x;
            uint _739 = uint(int(uint(_715) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_739)] = as_type<uint>(_737);
            uint _741 = uint(int(uint(_735) >> uint(2)));
            float _743 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_741)]);
            int _745 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + (-6);
            bool _747 = _745 >= 0;
            int _749 = _747 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
            int _751 = _745 + _749;
            int _753 = _751 * 48;
            int _755 = _753 + 12;
            float _757 = _743 * (*spvDescriptorSet0.cp_c4)._m0[6].y;
            uint _759 = uint(int(uint(_735) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_759)] = as_type<uint>(_757);
            uint _761 = uint(int(uint(_755) >> uint(2)));
            float _763 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_761)]);
            int _765 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w) + (-7);
            bool _767 = _765 >= 0;
            int _769 = _767 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
            int _771 = _765 + _769;
            int _773 = _771 * 48;
            int _775 = _773 + 12;
            float _777 = _763 * (*spvDescriptorSet0.cp_c4)._m0[6].z;
            uint _779 = uint(int(uint(_755) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_779)] = as_type<uint>(_777);
            uint _781 = uint(int(uint(_775) >> uint(2)));
            float _783 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_781)]);
            float _785 = _783 * (*spvDescriptorSet0.cp_c4)._m0[6].w;
            uint _787 = uint(int(uint(_775) >> uint(2)));
            (*spvDescriptorSet0.cp_s0)._m0[int(_787)] = as_type<uint>(_785);
        }
    }
    int _789 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z) >> 31;
    int _791 = _789 & 31;
    int _793 = _791 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
    int _795 = _793 >> 5;
    bool _797 = as_type<uint>(_49) >= uint(_795);
    if (_797)
    {
        return;
    }
    int _799 = as_type<int>(_49) * 64;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    float _803 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_801)]);
    int _805 = _799 + 4;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    float _809 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_807)]);
    int _811 = _799 + 8;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    float _815 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_813)]);
    int _817 = _799 + 16;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    float _821 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_819)]);
    int _823 = _799 + 20;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    float _827 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_825)]);
    int _829 = _799 + 24;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    float _833 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_831)]);
    bool _835 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[11].y;
    bool _837 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[11].x;
    bool _839 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[18].z);
    float _841 = _835 ? _809 : _827;
    int _843 = _799 + 28;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    float _847 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_845)]);
    bool _849 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[11].z;
    float _851 = _837 ? _803 : _821;
    float _853 = _841 * (*spvDescriptorSet0.cp_c3)._m0[11].y;
    int _855 = _849 ? as_type<int>(_815) : as_type<int>(_833);
    float _857 = fma(_851, (*spvDescriptorSet0.cp_c3)._m0[11].x, _853);
    float _859 = fma(as_type<float>(_855), (*spvDescriptorSet0.cp_c3)._m0[11].z, _857);
    float _861 = -(*spvDescriptorSet0.cp_c3)._m0[11].w;
    bool _863 = _859 > _861;
    bool _865 = _837;
    bool _867 = _863;
    int _869 = as_type<int>(_859);
    int _871 = as_type<int>(_853);
    int _873 = _855;
    int _875 = as_type<int>(_803);
    uint _877 = as_type<uint>(_809);
    if (_863)
    {
        _865 = true;
    }
    bool _879 = _865;
    bool _881 = _879;
    if (!_863)
    {
        bool _883 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[12].y;
        bool _885 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _887 = _883 ? _809 : _827;
        bool _889 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _891 = _885 ? _803 : _821;
        float _893 = _887 * (*spvDescriptorSet0.cp_c3)._m0[12].y;
        int _895 = _889 ? as_type<int>(_815) : as_type<int>(_833);
        float _897 = fma(_891, (*spvDescriptorSet0.cp_c3)._m0[12].x, _893);
        float _899 = fma(as_type<float>(_895), (*spvDescriptorSet0.cp_c3)._m0[12].z, _897);
        float _901 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        bool _903 = _899 > _901;
        _881 = _903;
        _867 = _889;
        _869 = as_type<int>(_899);
        _871 = as_type<int>(_893);
        _873 = _895;
    }
    bool _905 = _881;
    bool _907 = _867;
    int _909 = _869;
    int _911 = _871;
    int _913 = _873;
    bool _915 = _907;
    bool _917 = _905;
    int _919 = _909;
    int _921 = _911;
    int _923 = _913;
    if (_905)
    {
        _915 = true;
    }
    bool _925 = _915;
    bool _927 = _925;
    if (!_905)
    {
        bool _929 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[13].y;
        bool _931 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _933 = _929 ? _809 : _827;
        bool _935 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _937 = _931 ? _803 : _821;
        float _939 = _933 * (*spvDescriptorSet0.cp_c3)._m0[13].y;
        int _941 = _935 ? as_type<int>(_815) : as_type<int>(_833);
        float _943 = fma(_937, (*spvDescriptorSet0.cp_c3)._m0[13].x, _939);
        float _945 = fma(as_type<float>(_941), (*spvDescriptorSet0.cp_c3)._m0[13].z, _943);
        float _947 = -(*spvDescriptorSet0.cp_c3)._m0[13].w;
        bool _949 = _945 > _947;
        _927 = _949;
        _917 = _931;
        _919 = as_type<int>(_945);
        _921 = as_type<int>(_939);
        _923 = _941;
    }
    bool _951 = _927;
    bool _953 = _917;
    int _955 = _919;
    int _957 = _921;
    int _959 = _923;
    bool _961 = _953;
    bool _963 = _951;
    int _965 = _955;
    int _967 = _957;
    int _969 = _959;
    if (_951)
    {
        _961 = true;
    }
    bool _971 = _961;
    bool _973 = _971;
    if (!_951)
    {
        bool _975 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[14].y;
        bool _977 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[14].x;
        float _979 = _975 ? _809 : _827;
        bool _981 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[14].z;
        float _983 = _977 ? _803 : _821;
        float _985 = _979 * (*spvDescriptorSet0.cp_c3)._m0[14].y;
        int _987 = _981 ? as_type<int>(_815) : as_type<int>(_833);
        float _989 = fma(_983, (*spvDescriptorSet0.cp_c3)._m0[14].x, _985);
        float _991 = fma(as_type<float>(_987), (*spvDescriptorSet0.cp_c3)._m0[14].z, _989);
        float _993 = -(*spvDescriptorSet0.cp_c3)._m0[14].w;
        bool _995 = _991 > _993;
        _973 = _995;
        _963 = _981;
        _965 = as_type<int>(_991);
        _967 = as_type<int>(_985);
        _969 = _987;
    }
    bool _997 = _973;
    bool _999 = _963;
    int _1001 = _965;
    int _1003 = _967;
    int _1005 = _969;
    bool _1007 = _999;
    int _1009 = _1001;
    int _1011 = _997 ? (-1) : 0;
    int _1013 = _1003;
    int _1015 = _1005;
    if (_997)
    {
        _1007 = true;
    }
    bool _1017 = _1007;
    bool _1019 = _1017;
    if (!_997)
    {
        bool _1021 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[15].y;
        bool _1023 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[15].x;
        float _1025 = _1021 ? _809 : _827;
        bool _1027 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[15].z;
        float _1029 = _1023 ? _803 : _821;
        float _1031 = _1025 * (*spvDescriptorSet0.cp_c3)._m0[15].y;
        int _1033 = _1027 ? as_type<int>(_815) : as_type<int>(_833);
        float _1035 = fma(_1029, (*spvDescriptorSet0.cp_c3)._m0[15].x, _1031);
        float _1037 = fma(as_type<float>(_1033), (*spvDescriptorSet0.cp_c3)._m0[15].z, _1035);
        float _1039 = -(*spvDescriptorSet0.cp_c3)._m0[15].w;
        bool _1041 = _1037 > _1039;
        _1019 = _1041;
        _1009 = as_type<int>(_1037);
        _1011 = _1023 ? (-1) : 0;
        _1013 = as_type<int>(_1031);
        _1015 = _1033;
    }
    bool _1043 = _1019;
    int _1045 = _1009;
    int _1047 = _1011;
    int _1049 = _1013;
    int _1051 = _1015;
    int _1053 = _1047;
    int _1055 = _1049;
    int _1057 = _1051;
    if (_1043)
    {
        _1053 = -1;
    }
    int _1059 = _1053;
    int _1061 = _1059;
    if (!_1043)
    {
        bool _1063 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[16].y;
        bool _1065 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[16].x;
        float _1067 = _1063 ? _809 : _827;
        bool _1069 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[16].z;
        float _1071 = _1065 ? _803 : _821;
        float _1073 = _1067 * (*spvDescriptorSet0.cp_c3)._m0[16].y;
        float _1075 = _1069 ? _815 : _833;
        float _1077 = fma(_1071, (*spvDescriptorSet0.cp_c3)._m0[16].x, _1073);
        float _1079 = fma(_1075, (*spvDescriptorSet0.cp_c3)._m0[16].z, _1077);
        float _1081 = -(*spvDescriptorSet0.cp_c3)._m0[16].w;
        bool _1083 = _1079 > _1081;
        _1061 = _1083 ? (-1) : 0;
        _1055 = as_type<int>(_1079);
        _875 = as_type<int>(_1077);
        _877 = as_type<uint>(_1073);
    }
    int _1085 = _1061;
    int _1087 = _1055;
    int _1089 = _875;
    uint _1091 = _877;
    int _1093 = _1045;
    uint _1095 = _1091;
    if (_839)
    {
        int _1097 = _799 + 40;
        uint _1099 = uint(int(uint(_1097) >> uint(2)));
        float _1101 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1099)]);
        _1093 = as_type<int>(_1101);
    }
    int _1103 = _1093;
    bool _1105 = as_type<int>(_847) != 0;
    int _1107 = ~_1085;
    int _1109 = (_1105 ? (-1) : 0) & _1107;
    int _1111 = _1087;
    if (_1109 != 0)
    {
        float _1113 = as_type<float>(gl_SubgroupLtMask.x);
        _1111 = as_type<int>(_1113);
    }
    int _1115 = _1111;
    uint _1117 = spvSubgroupBallot(_1109 != 0).x;
    uint _1119 = spvSubgroupBallot(true).x;
    int _1121 = _1103;
    if (_839)
    {
        float _1123 = as_type<float>(_1103) + (*spvDescriptorSet0.cp_c3)._m0[19].w;
        _1121 = as_type<int>(_1123);
    }
    int _1125 = _1121;
    if (_839)
    {
        int _1127 = _799 + 40;
        uint _1129 = uint(int(uint(_1127) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_1129)] = uint(_1125);
    }
    int _1131 = _1089;
    if (_1109 != 0)
    {
        int _1133 = _799 + 40;
        uint _1135 = uint(int(uint(_1133) >> uint(2)));
        float _1137 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1135)]);
        _1131 = as_type<int>(_1137);
    }
    int _1139 = _1131;
    int _1141 = _1115;
    if (_1109 != 0)
    {
        int _1143 = int(_1117) & _1115;
        _1141 = _1143;
    }
    int _1145 = _1141;
    int _1147 = reverse_bits(int(_1119));
    if (_1109 != 0)
    {
        int _1149 = _799 + 44;
        _1095 = uint(_1149);
    }
    uint _1151 = _1095;
    int _1153 = int(spvFindUMSB(uint(_1147)));
    bool _1155 = _1153 != (-1);
    int _1157 = _1153 ^ 31;
    int _1159 = _1155 ? _1157 : _1153;
    int _1161 = _1145;
    if (_1109 != 0)
    {
        int _1163 = popcount(_1145);
        _1161 = _1163;
    }
    int _1165 = _1161;
    bool _1167 = as_type<int>(_49) != _1159;
    if (_1109 != 0)
    {
        int _1169 = _1165 * 4;
        _1057 = _1169;
    }
    int _1171 = _1057;
    if (_1109 != 0)
    {
        int _1173 = _1171 + 288;
        uint _1175 = uint(int(uint(_1173) >> uint(2)));
        _35[int(_1175)] = as_type<uint>(_49);
    }
    if (_1109 != 0)
    {
        uint _1177 = uint(int(uint(int(_1151)) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_1177)] = uint(_1139);
    }
    if (_1109 != 0)
    {
        int _1179 = _799 + 40;
        uint _1181 = uint(int(uint(_1179) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = 0u;
    }
    if (_1167)
    {
        return;
    }
    int _1183 = popcount(int(_1117));
    _35[69] = uint(_1183);
}


struct dm_payload_t { uint w[64]; };
[[object]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], object_data dm_payload_t& dm_payload [[payload]], mesh_grid_properties dm_grid, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 132> _35;
    for (uint i = dm_lid; i < 132u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _35[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) dm_payload.w[i] = _35[68u + i];
    if (dm_lid == 0u) dm_grid.set_threadgroups_per_grid(uint3(min(_35[69], 1024u), 1u, 1u));
}
