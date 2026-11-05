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
    texturecube<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _200 = false;
    bool _186 = false;
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
        bool _138;
        float _196;
        float _198;
        bool _212;
        bool _250;
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
            float _120 = _96;
            float _122 = _98;
            float _124 = _102;
            float _126 = _100;
            if (!_108)
            {
                float _128 = float(_104);
                float _130 = _128 + 0.5;
                float _132 = _130 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
                float _134 = fma(_132, 2.0, -1.0);
                int _136 = _86;
                do
                {
                    int _140 = _136;
                    float _142 = _110;
                    float _144 = _112;
                    float _146 = _114;
                    float _148 = _116;
                    bool _150 = as_type<int>(_46) >= 3;
                    float _152 = float(_140);
                    float _154 = _152 + 0.5;
                    float _156 = _154 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
                    float _158 = fma(_156, 2.0, -1.0);
                    bool _160 = !_150;
                    float _162 = _156;
                    float _164 = 2.0;
                    float _166 = _158;
                    float _168 = _156;
                    float _170 = _158;
                    float _172 = 2.0;
                    float _174 = _158;
                    if (!_160)
                    {
                        bool _176 = as_type<int>(_46) >= 4;
                        bool _178 = !_176;
                        if (!_178)
                        {
                            bool _180 = as_type<int>(_46) >= 5;
                            bool _182 = !_180;
                            if (!_182)
                            {
                                bool _184 = as_type<int>(_46) != 5;
                                _186 = _184;
                                if (!_186)
                                {
                                    float _188 = -_158;
                                    float _190 = _188 + (-0.0);
                                    float _192 = -_134;
                                    float _194 = _192 + (-0.0);
                                    _174 = _190;
                                    _196 = _194;
                                    _198 = -1.0;
                                    _200 = true;
                                }
                            }
                            else
                            {
                                float _202 = -_134;
                                float _204 = _202 + (-0.0);
                                _196 = _204;
                                _198 = 1.0;
                                _200 = true;
                            }
                        }
                        else
                        {
                            float _206 = -_134;
                            float _208 = _206 + (-0.0);
                            _196 = -1.0;
                            _198 = _208;
                            _200 = true;
                        }
                    }
                    if ((!_200) || _186)
                    {
                        if (!_186)
                        {
                            bool _210 = as_type<int>(_46) >= 1;
                            _212 = !_210;
                        }
                        if ((!_212) && (!_186))
                        {
                            bool _214 = as_type<int>(_46) >= 2;
                            if (_214)
                            {
                                _162 = _134;
                            }
                            float _216 = _162;
                            float _218 = _216;
                            if (_214)
                            {
                                _164 = 1.0;
                            }
                            float _220 = _164;
                            float _222 = _220;
                            if (!_214)
                            {
                                _218 = _158;
                            }
                            float _224 = _218;
                            _198 = _224;
                            if (!_214)
                            {
                                _166 = -1.0;
                            }
                            float _226 = _166;
                            _174 = _226;
                            if (!_214)
                            {
                                float _228 = -_134;
                                float _230 = _228 + (-0.0);
                                _222 = _230;
                            }
                            float _232 = _222;
                            _196 = _232;
                            _200 = true;
                        }
                        else
                        {
                            if (!_186)
                            {
                                bool _234 = as_type<int>(_46) != 0;
                                if (!_234)
                                {
                                    float _236 = -_158;
                                    float _238 = _236 + (-0.0);
                                    _168 = _238;
                                }
                                float _240 = _168;
                                _198 = _240;
                                if (!_234)
                                {
                                    _170 = 1.0;
                                }
                                float _242 = _170;
                                _174 = _242;
                                if (!_234)
                                {
                                    float _244 = -_134;
                                    float _246 = _244 + (-0.0);
                                    _172 = _246;
                                }
                                float _248 = _172;
                                _250 = !_234;
                                _196 = _248;
                            }
                            if ((!_250) || _186)
                            {
                                _186 = false;
                                _174 = 0.0;
                                _196 = 0.0;
                                _198 = 0.0;
                            }
                        }
                    }
                    _200 = false;
                    float _252 = _174;
                    float _254 = _196;
                    float _256 = _198;
                    float _258 = abs(_252);
                    float _260 = abs(_254);
                    float _262 = precise::max(_258, _260);
                    float _264 = abs(_256);
                    float _266 = precise::max(_262, _264);
                    float _268 = 1.0 / _266;
                    float _270 = _268 * _256;
                    float _272 = _268 * _252;
                    float _274 = _268 * _254;
                    float3 _670 = float3(_272, _274, _270);
                    float4 _277 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_670, float3(0.0), isnan(_670)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_670, float3(0.0), isnan(_670)), level(0.0)).xyzw;
                    float _279 = _277.x;
                    float _281 = _277.y;
                    float _283 = _277.z;
                    float _285 = _277.w;
                    int _287 = _140 + 1;
                    bool _289 = uint(_287) >= _90;
                    float _291 = _279 + _142;
                    float _293 = _281 + _144;
                    float _295 = _283 + _146;
                    float _297 = _285 + _148;
                    _138 = !_289;
                    _136 = _287;
                    _110 = _291;
                    _112 = _293;
                    _114 = _295;
                    _116 = _297;
                    _118 = as_type<int>(_285);
                    _120 = _291;
                    _122 = _293;
                    _124 = _297;
                    _126 = _295;
                } while (_138);
            }
            int _299 = _118;
            float _301 = _120;
            float _303 = _122;
            float _305 = _124;
            float _307 = _126;
            int _309 = _104 + 1;
            bool _311 = uint(_309) >= _60;
            _94 = !_311;
            _66 = _301;
            _68 = _303;
            _70 = _307;
            _72 = _305;
            _74 = _309;
            _92 = _299;
            _76 = as_type<int>(_301);
            _78 = as_type<int>(_303);
            _80 = as_type<int>(_307);
            _82 = as_type<int>(_305);
        } while (_94);
    }
    int _313 = _76;
    int _315 = _78;
    int _317 = _80;
    int _319 = _82;
    int _321 = as_type<int>(_46) << 6;
    int _323 = _321 + _55;
    int _325 = _323 << 4;
    uint _327 = uint(int(uint(_325) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_327)] = uint(_313);
    int _329 = _325 + 4;
    uint _331 = uint(int(uint(_329) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_331)] = uint(_315);
    int _333 = _325 + 8;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_335)] = uint(_317);
    int _337 = _325 + 12;
    uint _339 = uint(int(uint(_337) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_339)] = uint(_319);
}

