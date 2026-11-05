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
    constant _16* cp_c3 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    texturecube_array<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _210 = false;
    bool _196 = false;
    float _42 = as_type<float>(gl_LocalInvocationID.y);
    float _44 = as_type<float>(gl_LocalInvocationID.x);
    float _46 = as_type<float>(gl_WorkGroupID.x);
    int _49 = as_type<int>(_42) + 1;
    int _51 = as_type<int>(_42) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _53 = as_type<int>(_42) << 3;
    int _55 = _53 + as_type<int>(_44);
    int _57 = _49 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    uint _60 = min(uint(_57), as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].w));
    bool _64 = uint(_51) >= _60;
    float _66 = 0.0;
    float _68 = 0.0;
    float _70 = 0.0;
    float _72 = 0.0;
    int _74 = _51;
    int _76 = 0;
    int _78 = 0;
    int _80 = 0;
    int _82 = 0;
    if (!_64)
    {
        int _84 = as_type<int>(_44) + 1;
        int _86 = as_type<int>(_44) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _88 = _84 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        uint _90 = min(uint(_88), as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z));
        int _92 = 0;
        bool _94;
        bool _148;
        float _206;
        float _208;
        bool _222;
        bool _260;
        do
        {
            float _96 = _66;
            float _98 = _68;
            float _100 = _70;
            float _102 = _72;
            int _104 = _74;
            int _106 = _92;
            bool _108 = uint(_86) >= _90;
            float _110 = _96;
            float _112 = _98;
            float _114 = _100;
            float _116 = _102;
            int _118 = _106;
            float _120 = _98;
            float _122 = _96;
            float _124 = _102;
            float _126 = _100;
            if (!_108)
            {
                float _128 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].y));
                float _130 = float(_104);
                float _132 = rint(_128);
                float _134 = precise::max(_132, 0.0);
                uint _136 = uint(_134);
                uint _138 = clamp(_136, 0u, 65535u);
                float _140 = _130 + 0.5;
                float _142 = _140 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
                float _144 = fma(_142, 2.0, -1.0);
                int _146 = _86;
                _118 = int(_138);
                do
                {
                    int _150 = _146;
                    float _152 = _110;
                    float _154 = _112;
                    float _156 = _114;
                    float _158 = _116;
                    bool _160 = as_type<int>(_46) >= 3;
                    float _162 = float(_150);
                    float _164 = _162 + 0.5;
                    float _166 = _164 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
                    float _168 = fma(_166, 2.0, -1.0);
                    bool _170 = !_160;
                    float _172 = _166;
                    float _174 = 2.0;
                    float _176 = _168;
                    float _178 = _166;
                    float _180 = _168;
                    float _182 = 2.0;
                    float _184 = _168;
                    if (!_170)
                    {
                        bool _186 = as_type<int>(_46) >= 4;
                        bool _188 = !_186;
                        if (!_188)
                        {
                            bool _190 = as_type<int>(_46) >= 5;
                            bool _192 = !_190;
                            if (!_192)
                            {
                                bool _194 = as_type<int>(_46) != 5;
                                _196 = _194;
                                if (!_196)
                                {
                                    float _198 = -_168;
                                    float _200 = _198 + (-0.0);
                                    float _202 = -_144;
                                    float _204 = _202 + (-0.0);
                                    _184 = _200;
                                    _206 = _204;
                                    _208 = -1.0;
                                    _210 = true;
                                }
                            }
                            else
                            {
                                float _212 = -_144;
                                float _214 = _212 + (-0.0);
                                _206 = _214;
                                _208 = 1.0;
                                _210 = true;
                            }
                        }
                        else
                        {
                            float _216 = -_144;
                            float _218 = _216 + (-0.0);
                            _206 = -1.0;
                            _208 = _218;
                            _210 = true;
                        }
                    }
                    if ((!_210) || _196)
                    {
                        if (!_196)
                        {
                            bool _220 = as_type<int>(_46) >= 1;
                            _222 = !_220;
                        }
                        if ((!_222) && (!_196))
                        {
                            bool _224 = as_type<int>(_46) >= 2;
                            if (_224)
                            {
                                _172 = _144;
                            }
                            float _226 = _172;
                            float _228 = _226;
                            if (_224)
                            {
                                _174 = 1.0;
                            }
                            float _230 = _174;
                            float _232 = _230;
                            if (!_224)
                            {
                                _228 = _168;
                            }
                            float _234 = _228;
                            _208 = _234;
                            if (!_224)
                            {
                                _176 = -1.0;
                            }
                            float _236 = _176;
                            _184 = _236;
                            if (!_224)
                            {
                                float _238 = -_144;
                                float _240 = _238 + (-0.0);
                                _232 = _240;
                            }
                            float _242 = _232;
                            _206 = _242;
                            _210 = true;
                        }
                        else
                        {
                            if (!_196)
                            {
                                bool _244 = as_type<int>(_46) != 0;
                                if (!_244)
                                {
                                    float _246 = -_168;
                                    float _248 = _246 + (-0.0);
                                    _178 = _248;
                                }
                                float _250 = _178;
                                _208 = _250;
                                if (!_244)
                                {
                                    _180 = 1.0;
                                }
                                float _252 = _180;
                                _184 = _252;
                                if (!_244)
                                {
                                    float _254 = -_144;
                                    float _256 = _254 + (-0.0);
                                    _182 = _256;
                                }
                                float _258 = _182;
                                _260 = !_244;
                                _206 = _258;
                            }
                            if ((!_260) || _196)
                            {
                                _196 = false;
                                _184 = 0.0;
                                _206 = 0.0;
                                _208 = 0.0;
                            }
                        }
                    }
                    _210 = false;
                    float _262 = _184;
                    float _264 = _206;
                    float _266 = _208;
                    float _268 = abs(_262);
                    float _270 = abs(_264);
                    float _272 = precise::max(_268, _270);
                    float _274 = abs(_266);
                    float _276 = precise::max(_272, _274);
                    float _278 = 1.0 / _276;
                    float _280 = _278 * _264;
                    float _282 = _278 * _266;
                    float _284 = _278 * _262;
                    float4 _698 = float4(_284, _280, _282, float(int(_138)));
                    float4 _702 = select(_698, float4(0.0), isnan(_698));
                    float4 _287 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _702.xyz, uint(rint(_702.w)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _702.xyz, uint(rint(_702.w)), level(0.0)).xyzw;
                    float _289 = _287.x;
                    float _291 = _287.y;
                    float _293 = _287.z;
                    float _295 = _287.w;
                    int _297 = _150 + 1;
                    bool _299 = uint(_297) >= _90;
                    float _301 = _289 + _152;
                    float _303 = _291 + _154;
                    float _305 = _293 + _156;
                    float _307 = _295 + _158;
                    _148 = !_299;
                    _146 = _297;
                    _110 = _301;
                    _112 = _303;
                    _114 = _305;
                    _116 = _307;
                    _120 = _303;
                    _122 = _301;
                    _124 = _307;
                    _126 = _305;
                } while (_148);
            }
            int _309 = _118;
            float _311 = _120;
            float _313 = _122;
            float _315 = _124;
            float _317 = _126;
            int _319 = _104 + 1;
            bool _321 = uint(_319) >= _60;
            _94 = !_321;
            _66 = _313;
            _68 = _311;
            _70 = _317;
            _72 = _315;
            _74 = _319;
            _92 = _309;
            _76 = as_type<int>(_313);
            _78 = as_type<int>(_311);
            _80 = as_type<int>(_317);
            _82 = as_type<int>(_315);
        } while (_94);
    }
    int _323 = _76;
    int _325 = _78;
    int _327 = _80;
    int _329 = _82;
    int _331 = as_type<int>(_46) << 6;
    int _333 = _331 + _55;
    int _335 = _333 << 4;
    uint _337 = uint(int(uint(_335) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_337)] = uint(_323);
    int _339 = _335 + 4;
    uint _341 = uint(int(uint(_339) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_341)] = uint(_325);
    int _343 = _335 + 8;
    uint _345 = uint(int(uint(_343) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_345)] = uint(_327);
    int _347 = _335 + 12;
    uint _349 = uint(int(uint(_347) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_349)] = uint(_329);
}

