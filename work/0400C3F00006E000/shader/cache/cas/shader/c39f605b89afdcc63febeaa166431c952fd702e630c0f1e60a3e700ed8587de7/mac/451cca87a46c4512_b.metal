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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_36.z;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_36.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_36.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _48;
    float _82 = _80 * _54;
    float _84 = _80 * _60;
    float _86 = _80 * _66;
    float _88 = _80 * _72;
    float _90 = _80 * _78;
    float _92 = rint(_82);
    float _94 = precise::max(_92, 0.0);
    uint _97 = uint(_94);
    uint _99 = clamp(_97, 0u, 65535u);
    float3 _398 = float3(_86, _84, float(int(_99)));
    float3 _402 = select(_398, float3(0.0), isnan(_398));
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _402.xy, uint(rint(_402.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _402.xy, uint(rint(_402.z))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _415 = float2(_88, _90);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_415, float2(0.0), isnan(_415))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _433 = float2(_88, _90);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_433, float2(0.0), isnan(_433))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    bool _134 = _105 >= 0.5;
    bool _136 = isnan(_105);
    bool _138 = _134 || _136;
    bool _140 = isnan(0.5);
    bool _142 = _138 || _140;
    float _144 = 0.0;
    float _146 = _107;
    int _149 = as_type<int>(_86);
    int _151 = as_type<int>(_88);
    float _153 = _90;
    if (!_142)
    {
        _144 = 63.75;
    }
    float _155 = _144;
    float _157 = 0.0;
    int _159 = as_type<int>(_155);
    if (!_142)
    {
        float _161 = fma(_107, _155, 0.125);
        _157 = _161;
    }
    float _163 = _157;
    int _165 = as_type<int>(_163);
    if (!_142)
    {
        float _167 = fma(_105, _155, 0.125);
        _146 = _167;
    }
    float _169 = _146;
    float _171 = 0.0;
    if (!_142)
    {
        float _173 = floor(_163);
        _171 = _173;
    }
    float _175 = _171;
    float _177 = _105;
    if (!_142)
    {
        float _179 = floor(_169);
        _177 = _179;
    }
    float _181 = _177;
    float _183 = _175;
    if (!_142)
    {
        float _185 = -_175;
        float _187 = _163 + _185;
        _183 = _187;
    }
    float _189 = _183;
    int _191 = as_type<int>(_189);
    if (!_142)
    {
        float _193 = trunc(_163);
        int _195 = int(_193);
        _159 = _195;
    }
    int _197 = _159;
    int _199 = _197;
    if (!_142)
    {
        float _201 = _189 * 4.0;
        _191 = as_type<int>(_201);
    }
    int _203 = _191;
    float _205 = _181;
    if (!_142)
    {
        float _207 = -_181;
        float _209 = _169 + _207;
        _205 = _209;
    }
    float _211 = _205;
    float _213 = _211;
    if (!_142)
    {
        float _215 = trunc(_169);
        int _217 = int(_215);
        _149 = _217;
    }
    int _219 = _149;
    int _221 = _219;
    if (!_142)
    {
        float _223 = _211 * 4.0;
        _151 = as_type<int>(_223);
    }
    int _225 = _151;
    if (_142)
    {
        _153 = 0.0;
    }
    float _227 = _153;
    if (_142)
    {
        _213 = 0.0;
    }
    float _229 = _213;
    int _231 = _203;
    if (!_142)
    {
        float _233 = trunc(as_type<float>(_203));
        int _235 = int(_233);
        _231 = _235;
    }
    int _237 = _231;
    float _239 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _241 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[5].y, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    int _243 = _225;
    if (!_142)
    {
        float _245 = trunc(as_type<float>(_225));
        int _247 = int(_245);
        _243 = _247;
    }
    int _249 = _243;
    float _251 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[4].x, _239);
    if (!_142)
    {
        int _253 = _197 << 2;
        int _255 = _253 + _237;
        _199 = _255;
    }
    int _257 = _199;
    if (!_142)
    {
        int _259 = _257 << 2;
        _165 = _259;
    }
    int _261 = _165;
    if (!_142)
    {
        int _263 = _219 << 2;
        int _265 = _263 + _249;
        _221 = _265;
    }
    int _267 = _221;
    float _269 = _227;
    int _271 = _267;
    if (!_142)
    {
        int _273 = _261 + 144;
        uint _275 = uint(int(uint(_273) >> uint(2)));
        uint _277 = uint(int(uint(int(_275)) >> uint(2)));
        int _279 = int(_275) & 3;
        float _281 = (*spvDescriptorSet0.fp_c3)._m0[int(_277)][_279];
        _269 = _281;
    }
    float _283 = _269;
    if (!_142)
    {
        int _285 = _267 << 2;
        _271 = _285;
    }
    int _287 = _271;
    float _289 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _291 = _229;
    if (!_142)
    {
        int _293 = _287 + 144;
        uint _295 = uint(int(uint(_293) >> uint(2)));
        uint _297 = uint(int(uint(int(_295)) >> uint(2)));
        int _299 = int(_295) & 3;
        float _301 = (*spvDescriptorSet0.fp_c3)._m0[int(_297)][_299];
        _291 = _301;
    }
    float _303 = _291;
    float _305 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[4].w, _289);
    float _307 = -_303;
    float _309 = _283 + _307;
    float _311 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[5].z, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _313 = fma(_109, _309, _303);
    float _315 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[4].y, _241);
    float _317 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[4].z, _311);
    float _319 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[7].x, _251);
    out.m_41.x = _319;
    out.m_41.y = _315;
    out.m_41.z = _317;
    out.m_41.w = _305;
    return out;
}

