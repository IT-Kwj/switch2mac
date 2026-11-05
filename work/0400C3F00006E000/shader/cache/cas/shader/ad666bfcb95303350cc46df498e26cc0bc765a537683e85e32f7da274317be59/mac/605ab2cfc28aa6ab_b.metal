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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d_array<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_34.z;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_34.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_34.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_36.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_36.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _46;
    float _80 = _78 * _52;
    float _82 = _78 * _58;
    float _84 = _78 * _64;
    float _86 = _78 * _70;
    float _88 = rint(_80);
    float _90 = precise::max(_88, 0.0);
    uint _93 = uint(_90);
    uint _95 = clamp(_93, 0u, 65535u);
    float _97 = _78 * _76;
    float3 _370 = float3(_82, _84, float(int(_95)));
    float3 _374 = select(_370, float3(0.0), isnan(_370));
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _374.xy, uint(rint(_374.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _374.xy, uint(rint(_374.z))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _387 = float2(_86, _97);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    bool _122 = _103 >= 0.5;
    bool _124 = isnan(_103);
    bool _126 = _122 || _124;
    bool _128 = isnan(0.5);
    bool _130 = _126 || _128;
    float _132 = _78;
    float _134 = _103;
    float _136 = _105;
    int _139 = as_type<int>(_80);
    int _141 = as_type<int>(_84);
    if (!_130)
    {
        _132 = 63.75;
    }
    float _143 = _132;
    float _145 = 0.0;
    float _147 = _143;
    if (!_130)
    {
        float _149 = fma(_105, _143, 0.125);
        _145 = _149;
    }
    float _151 = _145;
    if (!_130)
    {
        float _153 = fma(_103, _143, 0.125);
        _147 = _153;
    }
    float _155 = _147;
    if (_130)
    {
        _134 = 0.0;
        _136 = 0.0;
    }
    float _157 = _134;
    float _159 = _136;
    float _161 = 0.0;
    if (!_130)
    {
        float _163 = floor(_151);
        _161 = _163;
    }
    float _165 = _161;
    float _167 = 0.0;
    if (!_130)
    {
        float _169 = floor(_155);
        _167 = _169;
    }
    float _171 = _167;
    float _173 = _165;
    if (!_130)
    {
        float _175 = -_165;
        float _177 = _151 + _175;
        _173 = _177;
    }
    float _179 = _173;
    int _181 = 0;
    int _183 = as_type<int>(_179);
    if (!_130)
    {
        float _185 = trunc(_151);
        int _187 = int(_185);
        _181 = _187;
    }
    int _189 = _181;
    int _191 = _189;
    if (!_130)
    {
        float _193 = _179 * 4.0;
        _183 = as_type<int>(_193);
    }
    int _195 = _183;
    float _197 = _171;
    if (!_130)
    {
        float _199 = -_171;
        float _201 = _155 + _199;
        _197 = _201;
    }
    float _203 = _197;
    int _205 = as_type<int>(_203);
    if (!_130)
    {
        float _207 = trunc(_155);
        int _209 = int(_207);
        _139 = _209;
    }
    int _211 = _139;
    int _213 = _211;
    if (!_130)
    {
        float _215 = _203 * 4.0;
        _205 = as_type<int>(_215);
    }
    int _217 = _205;
    int _219 = _195;
    if (!_130)
    {
        float _221 = trunc(as_type<float>(_195));
        int _223 = int(_221);
        _219 = _223;
    }
    int _225 = _219;
    int _227 = _217;
    if (!_130)
    {
        float _229 = trunc(as_type<float>(_217));
        int _231 = int(_229);
        _227 = _231;
    }
    int _233 = _227;
    if (!_130)
    {
        int _235 = _189 << 2;
        int _237 = _235 + _225;
        _191 = _237;
    }
    int _239 = _191;
    if (!_130)
    {
        int _241 = _211 << 2;
        int _243 = _241 + _233;
        _141 = _243;
    }
    int _245 = _141;
    int _247 = _245;
    if (!_130)
    {
        int _249 = _239 << 2;
        _213 = _249;
    }
    int _251 = _213;
    if (!_130)
    {
        int _253 = _245 << 2;
        _247 = _253;
    }
    int _255 = _247;
    float _257 = _157;
    if (!_130)
    {
        int _259 = _251 + 144;
        uint _261 = uint(int(uint(_259) >> uint(2)));
        uint _263 = uint(int(uint(int(_261)) >> uint(2)));
        int _265 = int(_261) & 3;
        float _267 = (*spvDescriptorSet0.fp_c3)._m0[int(_263)][_265];
        _257 = _267;
    }
    float _269 = _257;
    float _271 = _159;
    if (!_130)
    {
        int _273 = _255 + 144;
        uint _275 = uint(int(uint(_273) >> uint(2)));
        uint _277 = uint(int(uint(int(_275)) >> uint(2)));
        int _279 = int(_275) & 3;
        float _281 = (*spvDescriptorSet0.fp_c3)._m0[int(_277)][_279];
        _271 = _281;
    }
    float _283 = _271;
    float _285 = -_283;
    float _287 = _269 + _285;
    float _289 = fma(_107, _287, _283);
    float _291 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[7].x, _112);
    out.m_39.x = _291;
    out.m_39.y = _114;
    out.m_39.z = _116;
    out.m_39.w = _118;
    return out;
}

