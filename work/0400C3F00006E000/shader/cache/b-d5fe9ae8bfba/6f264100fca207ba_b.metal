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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _45;
    float _85 = _83 * _51;
    float _87 = _83 * _63;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _91 = _85 + _89;
    float _93 = _83 * _57;
    float _95 = floor(_91);
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _99 = _93 + _97;
    float _101 = floor(_99);
    float _103 = -_95;
    float _105 = _91 + _103;
    float _107 = _83 * _75;
    float _109 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _111 = -_101;
    float _113 = _99 + _111;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _117 = _109 + _115;
    float _119 = _83 * _81;
    float _121 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _123 = _83 * _69;
    float _125 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[6].y, _87);
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _129 = _121 + _127;
    float _131 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[6].y, _123);
    float _133 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[6].y, _87);
    float _135 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[6].y, _123);
    float2 _385 = float2(_125, _133);
    float4 _138 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float2 _404 = float2(_131, _133);
    float4 _148 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_404, float2(0.0), isnan(_404)), int2(0), component::x).xyzw;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    float _156 = _148.w;
    float2 _420 = float2(_125, _135);
    float4 _158 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_420, float2(0.0), isnan(_420)), int2(0), component::x).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float2 _436 = float2(_131, _135);
    float4 _168 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_436, float2(0.0), isnan(_436)), int2(0), component::x).xyzw;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float _176 = _168.w;
    float2 _452 = float2(_107, _119);
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float _188 = precise::min(_140, _142);
    float _190 = precise::min(_144, _146);
    float _192 = precise::min(_150, _152);
    float _194 = precise::min(_154, _156);
    float _196 = precise::min(_160, _162);
    float _198 = precise::min(_164, _166);
    float _200 = precise::min(_170, _172);
    float _202 = precise::min(_174, _176);
    float _204 = precise::min(_188, _190);
    float _206 = precise::min(_192, _194);
    float _208 = precise::min(_196, _198);
    float _210 = precise::min(_200, _202);
    float _212 = precise::min(_204, _206);
    float _214 = precise::min(_208, _210);
    float _216 = precise::min(_212, _214);
    bool _220 = _180 >= _216;
    bool _222 = isnan(_180);
    bool _224 = _220 || _222;
    bool _226 = isnan(_216);
    bool _228 = _224 || _226;
    int _231 = as_type<int>(_180);
    if (!_228)
    {
        float _233 = _180 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _231 = as_type<int>(_233);
    }
    int _235 = _231;
    out.m_38.x = as_type<float>(_235);
    out.m_38.y = _182;
    out.m_38.z = _184;
    out.m_38.w = _186;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _45;
    float _85 = _83 * _51;
    float _87 = _83 * _63;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _91 = _85 + _89;
    float _93 = _83 * _57;
    float _95 = floor(_91);
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _99 = _93 + _97;
    float _101 = floor(_99);
    float _103 = -_95;
    float _105 = _91 + _103;
    float _107 = _83 * _75;
    float _109 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _111 = -_101;
    float _113 = _99 + _111;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _117 = _109 + _115;
    float _119 = _83 * _81;
    float _121 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _123 = _83 * _69;
    float _125 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[6].y, _87);
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _129 = _121 + _127;
    float _131 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[6].y, _123);
    float _133 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[6].y, _87);
    float _135 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[6].y, _123);
    float2 _385 = float2(_125, _133);
    float4 _138 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float2 _404 = float2(_131, _133);
    float4 _148 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_404, float2(0.0), isnan(_404)), int2(0), component::x).xyzw;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    float _156 = _148.w;
    float2 _420 = float2(_125, _135);
    float4 _158 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_420, float2(0.0), isnan(_420)), int2(0), component::x).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float2 _436 = float2(_131, _135);
    float4 _168 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_436, float2(0.0), isnan(_436)), int2(0), component::x).xyzw;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float _176 = _168.w;
    float2 _452 = float2(_107, _119);
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float _188 = precise::min(_140, _142);
    float _190 = precise::min(_144, _146);
    float _192 = precise::min(_150, _152);
    float _194 = precise::min(_154, _156);
    float _196 = precise::min(_160, _162);
    float _198 = precise::min(_164, _166);
    float _200 = precise::min(_170, _172);
    float _202 = precise::min(_174, _176);
    float _204 = precise::min(_188, _190);
    float _206 = precise::min(_192, _194);
    float _208 = precise::min(_196, _198);
    float _210 = precise::min(_200, _202);
    float _212 = precise::min(_204, _206);
    float _214 = precise::min(_208, _210);
    float _216 = precise::min(_212, _214);
    bool _220 = _180 >= _216;
    bool _222 = isnan(_180);
    bool _224 = _220 || _222;
    bool _226 = isnan(_216);
    bool _228 = _224 || _226;
    int _231 = as_type<int>(_180);
    if (!_228)
    {
        float _233 = _180 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _231 = as_type<int>(_233);
    }
    int _235 = _231;
    out.m_38.x = as_type<float>(_235);
    out.m_38.y = _182;
    out.m_38.z = _184;
    out.m_38.w = _186;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

