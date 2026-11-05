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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_36.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_36.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_36.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _48;
    float _94 = _92 * _54;
    float _96 = _92 * _66;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _100 = _94 + _98;
    float _102 = _92 * _60;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _106 = floor(_100);
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _110 = _102 + _108;
    float _112 = floor(_110);
    float _114 = rint(_104);
    float _116 = precise::max(_114, 0.0);
    uint _119 = uint(_116);
    uint _121 = clamp(_119, 0u, 65535u);
    float _123 = -_106;
    float _125 = _100 + _123;
    float _127 = _92 * _78;
    float _129 = _92 * _84;
    float _131 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _133 = -_112;
    float _135 = _110 + _133;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _139 = _131 + _137;
    float _141 = _92 * _90;
    float _143 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _145 = _92 * _72;
    float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].y, _129);
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _151 = _143 + _149;
    float _153 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].y, _145);
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[6].y, _145);
    float _157 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[6].y, _129);
    float3 _436 = float3(_157, _147, float(int(_121)));
    float3 _440 = select(_436, float3(0.0), isnan(_436));
    float4 _160 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _440.xy, uint(rint(_440.z)), int2(0), component::x).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float3 _457 = float3(_155, _147, float(int(_121)));
    float3 _459 = select(_457, float3(0.0), isnan(_457));
    float4 _170 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _459.xy, uint(rint(_459.z)), int2(0), component::x).xyzw;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    float _178 = _170.w;
    float3 _476 = float3(_157, _153, float(int(_121)));
    float3 _478 = select(_476, float3(0.0), isnan(_476));
    float4 _180 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _478.xy, uint(rint(_478.z)), int2(0), component::x).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float3 _495 = float3(_155, _153, float(int(_121)));
    float3 _497 = select(_495, float3(0.0), isnan(_495));
    float4 _190 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _497.xy, uint(rint(_497.z)), int2(0), component::x).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float2 _512 = float2(_127, _141);
    float4 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_512, float2(0.0), isnan(_512))).xyzw;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = _200.z;
    float _208 = _200.w;
    float _210 = precise::min(_162, _164);
    float _212 = precise::min(_166, _168);
    float _214 = precise::min(_172, _174);
    float _216 = precise::min(_176, _178);
    float _218 = precise::min(_182, _184);
    float _220 = precise::min(_186, _188);
    float _222 = precise::min(_192, _194);
    float _224 = precise::min(_196, _198);
    float _226 = precise::min(_210, _212);
    float _228 = precise::min(_214, _216);
    float _230 = precise::min(_218, _220);
    float _232 = precise::min(_222, _224);
    float _234 = precise::min(_226, _228);
    float _236 = precise::min(_230, _232);
    float _238 = precise::min(_234, _236);
    bool _242 = _202 >= _238;
    bool _244 = isnan(_202);
    bool _246 = _242 || _244;
    bool _248 = isnan(_238);
    bool _250 = _246 || _248;
    int _253 = as_type<int>(_202);
    if (!_250)
    {
        float _255 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _253 = as_type<int>(_255);
    }
    int _257 = _253;
    out.m_41.x = as_type<float>(_257);
    out.m_41.y = _204;
    out.m_41.z = _206;
    out.m_41.w = _208;
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
    float _50 = in.m_34.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_36.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_36.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_36.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _48;
    float _94 = _92 * _54;
    float _96 = _92 * _66;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _100 = _94 + _98;
    float _102 = _92 * _60;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _106 = floor(_100);
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _110 = _102 + _108;
    float _112 = floor(_110);
    float _114 = rint(_104);
    float _116 = precise::max(_114, 0.0);
    uint _119 = uint(_116);
    uint _121 = clamp(_119, 0u, 65535u);
    float _123 = -_106;
    float _125 = _100 + _123;
    float _127 = _92 * _78;
    float _129 = _92 * _84;
    float _131 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _133 = -_112;
    float _135 = _110 + _133;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _139 = _131 + _137;
    float _141 = _92 * _90;
    float _143 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _145 = _92 * _72;
    float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].y, _129);
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _151 = _143 + _149;
    float _153 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].y, _145);
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[6].y, _145);
    float _157 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[6].y, _129);
    float3 _436 = float3(_157, _147, float(int(_121)));
    float3 _440 = select(_436, float3(0.0), isnan(_436));
    float4 _160 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _440.xy, uint(rint(_440.z)), int2(0), component::x).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float3 _457 = float3(_155, _147, float(int(_121)));
    float3 _459 = select(_457, float3(0.0), isnan(_457));
    float4 _170 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _459.xy, uint(rint(_459.z)), int2(0), component::x).xyzw;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    float _178 = _170.w;
    float3 _476 = float3(_157, _153, float(int(_121)));
    float3 _478 = select(_476, float3(0.0), isnan(_476));
    float4 _180 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _478.xy, uint(rint(_478.z)), int2(0), component::x).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float3 _495 = float3(_155, _153, float(int(_121)));
    float3 _497 = select(_495, float3(0.0), isnan(_495));
    float4 _190 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, _497.xy, uint(rint(_497.z)), int2(0), component::x).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float2 _512 = float2(_127, _141);
    float4 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_512, float2(0.0), isnan(_512))).xyzw;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = _200.z;
    float _208 = _200.w;
    float _210 = precise::min(_162, _164);
    float _212 = precise::min(_166, _168);
    float _214 = precise::min(_172, _174);
    float _216 = precise::min(_176, _178);
    float _218 = precise::min(_182, _184);
    float _220 = precise::min(_186, _188);
    float _222 = precise::min(_192, _194);
    float _224 = precise::min(_196, _198);
    float _226 = precise::min(_210, _212);
    float _228 = precise::min(_214, _216);
    float _230 = precise::min(_218, _220);
    float _232 = precise::min(_222, _224);
    float _234 = precise::min(_226, _228);
    float _236 = precise::min(_230, _232);
    float _238 = precise::min(_234, _236);
    bool _242 = _202 >= _238;
    bool _244 = isnan(_202);
    bool _246 = _242 || _244;
    bool _248 = isnan(_238);
    bool _250 = _246 || _248;
    int _253 = as_type<int>(_202);
    if (!_250)
    {
        float _255 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _253 = as_type<int>(_255);
    }
    int _257 = _253;
    out.m_41.x = as_type<float>(_257);
    out.m_41.y = _204;
    out.m_41.z = _206;
    out.m_41.w = _208;
    return main0_out_u{as_type<uint4>(out.m_41)};
}

