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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _315 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_315, float2(0.0), isnan(_315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_315, float2(0.0), isnan(_315))).x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _72 = 1.0 / _70;
    float _74 = -_68;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _80 = 1.0 / _76;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[8].y, _82);
    float _86 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _88 = _84 * _72;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _86;
    float _98 = exp2(_96);
    float _100 = _78 * _98;
    float _102 = precise::min(_78, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_78);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = in.m_36.x;
        float _123 = gl_FragCoord.w;
        float _125 = _121 * _123;
        float _127 = in.m_36.y;
        float _129 = gl_FragCoord.w;
        float _131 = _127 * _129;
        float _133 = in.m_36.z;
        float _135 = gl_FragCoord.w;
        float _137 = _133 * _135;
        float _139 = in.m_36.w;
        float _141 = gl_FragCoord.w;
        float _143 = _139 * _141;
        float _145 = in.m_38.x;
        float _147 = gl_FragCoord.w;
        float _149 = _145 * _147;
        float _151 = in.m_38.y;
        float _153 = gl_FragCoord.w;
        float _155 = _151 * _153;
        float _157 = in.m_38.z;
        float _159 = gl_FragCoord.w;
        float _161 = _157 * _159;
        float _163 = _62 * _125;
        float _165 = _62 * _131;
        float _167 = _62 * _137;
        float _169 = _62 * _143;
        float _171 = _62 * _149;
        float _173 = _62 * _155;
        float _175 = _62 * _161;
        float _177 = 0.0;
        int _179 = 0;
        float _181 = 0.0;
        bool _183;
        float _279;
        do
        {
            float _185 = _177;
            int _187 = _179;
            float _189 = _181;
            float _191 = _185 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _193 = abs(_191);
            float _195 = log2(_193);
            float _197 = _195 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _199 = exp2(_197);
            float _201 = fma(_199, _173, _165);
            float _203 = fma(_199, _171, _163);
            float _205 = fma(_199, _175, _167);
            float _207 = _201 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _209 = _201 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _211 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[13].x, _207);
            float _213 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[13].z, _211);
            float _215 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[11].x, _209);
            float _217 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[13].w, _213);
            float _219 = _201 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _221 = _201 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _223 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[10].x, _219);
            float _225 = 1.0 / _217;
            float _227 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[12].x, _221);
            float _229 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[11].z, _215);
            float _231 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[10].z, _223);
            float _233 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[12].z, _227);
            float _235 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[11].w, _229);
            float _237 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[10].w, _231);
            float _239 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[12].w, _233);
            float _241 = _235 * _225;
            float _243 = _237 * _225;
            float _245 = _239 * _225;
            float _247 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[15].w, _241);
            float _249 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[15].z, _243);
            float _251 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[15].z, _243);
            float _253 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[15].w, _241);
            float3 _616 = float3(_249, _247, float(0));
            float3 _620 = select(_616, float3(0.0), isnan(_616));
            float _255 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _620.xy, uint(rint(_620.z)), _245, level(0.0));
            float3 _627 = float3(_251, _247, float(0));
            float3 _629 = select(_627, float3(0.0), isnan(_627));
            float _257 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _629.xy, uint(rint(_629.z)), _245, level(0.0));
            float3 _636 = float3(_249, _253, float(0));
            float3 _638 = select(_636, float3(0.0), isnan(_636));
            float _259 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _638.xy, uint(rint(_638.z)), _245, level(0.0));
            float3 _645 = float3(_251, _253, float(0));
            float3 _647 = select(_645, float3(0.0), isnan(_645));
            float _261 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _647.xy, uint(rint(_647.z)), _245, level(0.0));
            int _263 = _187 + 1;
            float _265 = _185 + 1.0;
            bool _267 = _263 >= _107;
            float _269 = _255 + _257;
            float _271 = _269 + _259;
            float _273 = _271 + _261;
            float _275 = _273 * 0.25;
            float _277 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            _279 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[8].x, _189);
            _183 = !_267;
            _177 = _265;
            _179 = _263;
            _181 = _279;
        } while (_183);
        _119 = as_type<int>(_279);
    }
    int _281 = _119;
    out.m_41.x = as_type<float>(_281);
    out.m_41.y = as_type<float>(_281);
    out.m_41.z = as_type<float>(_281);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _315 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_315, float2(0.0), isnan(_315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_315, float2(0.0), isnan(_315))).x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _72 = 1.0 / _70;
    float _74 = -_68;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _80 = 1.0 / _76;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[8].y, _82);
    float _86 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _88 = _84 * _72;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _92 = abs(_90);
    float _94 = log2(_92);
    float _96 = _94 * _86;
    float _98 = exp2(_96);
    float _100 = _78 * _98;
    float _102 = precise::min(_78, _100);
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 > 0;
    int _113 = as_type<int>(_78);
    if (!_111)
    {
        _113 = 0;
    }
    int _115 = _113;
    bool _117 = !_111;
    int _119 = _115;
    if (!_117)
    {
        float _121 = in.m_36.x;
        float _123 = gl_FragCoord.w;
        float _125 = _121 * _123;
        float _127 = in.m_36.y;
        float _129 = gl_FragCoord.w;
        float _131 = _127 * _129;
        float _133 = in.m_36.z;
        float _135 = gl_FragCoord.w;
        float _137 = _133 * _135;
        float _139 = in.m_36.w;
        float _141 = gl_FragCoord.w;
        float _143 = _139 * _141;
        float _145 = in.m_38.x;
        float _147 = gl_FragCoord.w;
        float _149 = _145 * _147;
        float _151 = in.m_38.y;
        float _153 = gl_FragCoord.w;
        float _155 = _151 * _153;
        float _157 = in.m_38.z;
        float _159 = gl_FragCoord.w;
        float _161 = _157 * _159;
        float _163 = _62 * _125;
        float _165 = _62 * _131;
        float _167 = _62 * _137;
        float _169 = _62 * _143;
        float _171 = _62 * _149;
        float _173 = _62 * _155;
        float _175 = _62 * _161;
        float _177 = 0.0;
        int _179 = 0;
        float _181 = 0.0;
        bool _183;
        float _279;
        do
        {
            float _185 = _177;
            int _187 = _179;
            float _189 = _181;
            float _191 = _185 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _193 = abs(_191);
            float _195 = log2(_193);
            float _197 = _195 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
            float _199 = exp2(_197);
            float _201 = fma(_199, _173, _165);
            float _203 = fma(_199, _171, _163);
            float _205 = fma(_199, _175, _167);
            float _207 = _201 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
            float _209 = _201 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _211 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[13].x, _207);
            float _213 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[13].z, _211);
            float _215 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[11].x, _209);
            float _217 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[13].w, _213);
            float _219 = _201 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _221 = _201 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
            float _223 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[10].x, _219);
            float _225 = 1.0 / _217;
            float _227 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[12].x, _221);
            float _229 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[11].z, _215);
            float _231 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[10].z, _223);
            float _233 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[12].z, _227);
            float _235 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[11].w, _229);
            float _237 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[10].w, _231);
            float _239 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[12].w, _233);
            float _241 = _235 * _225;
            float _243 = _237 * _225;
            float _245 = _239 * _225;
            float _247 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[15].w, _241);
            float _249 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[15].z, _243);
            float _251 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[15].z, _243);
            float _253 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[15].w, _241);
            float3 _616 = float3(_249, _247, float(0));
            float3 _620 = select(_616, float3(0.0), isnan(_616));
            float _255 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _620.xy, uint(rint(_620.z)), _245, level(0.0));
            float3 _627 = float3(_251, _247, float(0));
            float3 _629 = select(_627, float3(0.0), isnan(_627));
            float _257 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _629.xy, uint(rint(_629.z)), _245, level(0.0));
            float3 _636 = float3(_249, _253, float(0));
            float3 _638 = select(_636, float3(0.0), isnan(_636));
            float _259 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _638.xy, uint(rint(_638.z)), _245, level(0.0));
            float3 _645 = float3(_251, _253, float(0));
            float3 _647 = select(_645, float3(0.0), isnan(_645));
            float _261 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _647.xy, uint(rint(_647.z)), _245, level(0.0));
            int _263 = _187 + 1;
            float _265 = _185 + 1.0;
            bool _267 = _263 >= _107;
            float _269 = _255 + _257;
            float _271 = _269 + _259;
            float _273 = _271 + _261;
            float _275 = _273 * 0.25;
            float _277 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
            _279 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[8].x, _189);
            _183 = !_267;
            _177 = _265;
            _179 = _263;
            _181 = _279;
        } while (_183);
        _119 = as_type<int>(_279);
    }
    int _281 = _119;
    out.m_41.x = as_type<float>(_281);
    out.m_41.y = as_type<float>(_281);
    out.m_41.z = as_type<float>(_281);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

