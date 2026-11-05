#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
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
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
    float4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _244 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_244, float2(0.0), isnan(_244)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = gl_FragCoord.y;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = gl_FragCoord.x;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _96 = _65 * _92;
    float _98 = _67 * _94;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_84);
    int _111 = int(_109);
    int _113 = _107 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _103;
    float _117 = trunc(_90);
    int _119 = int(_117);
    int _121 = _111 * 2;
    int _123 = _119 & 1;
    int _125 = 2 & _121;
    int _127 = (-3) & _123;
    int _129 = _125 | _127;
    int _131 = _115 << 2;
    int _133 = _131 + _129;
    float _135 = precise::min(_72, _74);
    float _137 = precise::min(_76, _78);
    float _139 = precise::min(_135, _137);
    float _141 = precise::max(_72, _74);
    bool _145 = _139 >= 1.0;
    bool _147 = isnan(_139);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = -_139;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _159 = 1.0 / _157;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[1].w, _161);
    float _165 = precise::max(_76, _78);
    float _167 = _163 * 16777215.0;
    float _169 = precise::max(_141, _165);
    bool _171 = !_153;
    float _173 = _171 ? _167 : 16777215.0;
    float _175 = -_169;
    float _177 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _179 = _133 << 2;
    float _181 = trunc(_173);
    float _183 = precise::max(_181, 0.0);
    uint _186 = uint(_183);
    float _188 = 1.0 / _177;
    bool _190 = _169 >= 1.0;
    bool _192 = isnan(_169);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    uint _200 = uint(int(uint(_179) >> uint(2)));
    uint _424 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_200)], _186, memory_order_relaxed);
    uint _202 = _424;
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _206 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[1].w, _204);
    bool _208 = !_198;
    int _210 = _208 ? as_type<int>(_206) : 1065353216;
    out.gl_FragDepth = _206;
    out.m_40.x = _78;
    out.m_40.y = _78;
    out.m_40.z = _78;
    out.m_40.w = _78;
    out.m_42.x = as_type<float>(_210);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
    uint4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _244 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_244, float2(0.0), isnan(_244)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = gl_FragCoord.y;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = gl_FragCoord.x;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _96 = _65 * _92;
    float _98 = _67 * _94;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_84);
    int _111 = int(_109);
    int _113 = _107 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _103;
    float _117 = trunc(_90);
    int _119 = int(_117);
    int _121 = _111 * 2;
    int _123 = _119 & 1;
    int _125 = 2 & _121;
    int _127 = (-3) & _123;
    int _129 = _125 | _127;
    int _131 = _115 << 2;
    int _133 = _131 + _129;
    float _135 = precise::min(_72, _74);
    float _137 = precise::min(_76, _78);
    float _139 = precise::min(_135, _137);
    float _141 = precise::max(_72, _74);
    bool _145 = _139 >= 1.0;
    bool _147 = isnan(_139);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = -_139;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _159 = 1.0 / _157;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[1].w, _161);
    float _165 = precise::max(_76, _78);
    float _167 = _163 * 16777215.0;
    float _169 = precise::max(_141, _165);
    bool _171 = !_153;
    float _173 = _171 ? _167 : 16777215.0;
    float _175 = -_169;
    float _177 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _179 = _133 << 2;
    float _181 = trunc(_173);
    float _183 = precise::max(_181, 0.0);
    uint _186 = uint(_183);
    float _188 = 1.0 / _177;
    bool _190 = _169 >= 1.0;
    bool _192 = isnan(_169);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    uint _200 = uint(int(uint(_179) >> uint(2)));
    uint _424 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_200)], _186, memory_order_relaxed);
    uint _202 = _424;
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _206 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[1].w, _204);
    bool _208 = !_198;
    int _210 = _208 ? as_type<int>(_206) : 1065353216;
    out.gl_FragDepth = _206;
    out.m_40.x = _78;
    out.m_40.y = _78;
    out.m_40.z = _78;
    out.m_40.w = _78;
    out.m_42.x = as_type<float>(_210);
    return main0_out_u{as_type<uint4>(out.m_40), as_type<uint4>(out.m_42), out.gl_FragDepth};
}


struct main0_out_m
{
    float4 m_40 [[color(0)]];
    uint4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _244 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_244, float2(0.0), isnan(_244)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = gl_FragCoord.y;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = gl_FragCoord.x;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _96 = _65 * _92;
    float _98 = _67 * _94;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_84);
    int _111 = int(_109);
    int _113 = _107 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _103;
    float _117 = trunc(_90);
    int _119 = int(_117);
    int _121 = _111 * 2;
    int _123 = _119 & 1;
    int _125 = 2 & _121;
    int _127 = (-3) & _123;
    int _129 = _125 | _127;
    int _131 = _115 << 2;
    int _133 = _131 + _129;
    float _135 = precise::min(_72, _74);
    float _137 = precise::min(_76, _78);
    float _139 = precise::min(_135, _137);
    float _141 = precise::max(_72, _74);
    bool _145 = _139 >= 1.0;
    bool _147 = isnan(_139);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = -_139;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _159 = 1.0 / _157;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[1].w, _161);
    float _165 = precise::max(_76, _78);
    float _167 = _163 * 16777215.0;
    float _169 = precise::max(_141, _165);
    bool _171 = !_153;
    float _173 = _171 ? _167 : 16777215.0;
    float _175 = -_169;
    float _177 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _179 = _133 << 2;
    float _181 = trunc(_173);
    float _183 = precise::max(_181, 0.0);
    uint _186 = uint(_183);
    float _188 = 1.0 / _177;
    bool _190 = _169 >= 1.0;
    bool _192 = isnan(_169);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    uint _200 = uint(int(uint(_179) >> uint(2)));
    uint _424 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_200)], _186, memory_order_relaxed);
    uint _202 = _424;
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _206 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[1].w, _204);
    bool _208 = !_198;
    int _210 = _208 ? as_type<int>(_206) : 1065353216;
    out.gl_FragDepth = _206;
    out.m_40.x = _78;
    out.m_40.y = _78;
    out.m_40.z = _78;
    out.m_40.w = _78;
    out.m_42.x = as_type<float>(_210);
    return main0_out_m{out.m_40, as_type<uint4>(out.m_42), out.gl_FragDepth};
}

