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
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    texture2d<float> vp_t_tcb_8 [[id(4)]];
    sampler vp_t_tcb_8Smplr [[id(5)]];
    sampler vp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(0)]];
    float4 m_39 [[attribute(1)]];
    float4 m_33 [[attribute(8)]];
    float4 m_35 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_33.x;
    float _55 = in.m_33.y;
    float _57 = fma((*spvDescriptorSet0.vp_c11)._m0[24].x, (*spvDescriptorSet0.vp_c11)._m0[40].y, _55);
    float2 _299 = float2(_53, _57);
    float _59 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299)), level(0.0)).x;
    float _61 = in.m_35.x;
    float _63 = in.m_35.y;
    float _65 = in.m_35.z;
    float _67 = (*spvDescriptorSet0.vp_c11)._m0[24].x * (*spvDescriptorSet0.vp_c11)._m0[41].x;
    float _69 = in.m_37.x;
    float _71 = in.m_37.y;
    float _73 = in.m_37.z;
    float _75 = _61 + _65;
    float _77 = fma(_75, (*spvDescriptorSet0.vp_c11)._m0[40].z, _67);
    float _79 = in.m_39.x;
    float _81 = in.m_39.y;
    float _83 = in.m_39.z;
    float _85 = _77 * 0.15915493667125701904296875;
    float _87 = _85 * 6.283185482025146484375;
    float _89 = sin(_87);
    float _91 = fma(_89, 0.5, 0.5);
    float _93 = _91 * (*spvDescriptorSet0.vp_c11)._m0[40].w;
    float _95 = fma(_59, 2.0, -1.0);
    float _97 = fma(_95, (*spvDescriptorSet0.vp_c11)._m0[40].x, _93);
    float _99 = _97 * _63;
    float _101 = _99 * (*spvDescriptorSet0.vp_c11)._m0[41].y;
    float _103 = fma(_81, _101, _71);
    float _105 = fma(_79, _101, _69);
    float _107 = fma(_83, _101, _73);
    float _109 = _103 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _111 = _103 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _113 = _103 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _115 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[2].x, _109);
    float _117 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[0].x, _111);
    float _119 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[1].x, _113);
    float _121 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[2].z, _115);
    float _123 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[0].z, _117);
    float _125 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[1].z, _119);
    float _127 = _121 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _129 = _123 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _131 = _125 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _133 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _135 = _127 + _133;
    float _137 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _139 = _129 + _137;
    float _141 = _131 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _143 = _135 * _135;
    float _145 = fma(_129, (*spvDescriptorSet0.vp_c4)._m0[2].x, _141);
    float _147 = fma(_139, _139, _143);
    float _149 = fma(_127, (*spvDescriptorSet0.vp_c4)._m0[2].z, _145);
    float _151 = sqrt(_147);
    float _153 = _149 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _157 = _151 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    bool _159 = !_157;
    float _161 = _131;
    float _163 = _129;
    float _165 = _127;
    float _167 = _153;
    if (!_159)
    {
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _171 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _173 = _151 + _171;
        float _175 = rsqrt(_147);
        float _177 = _173 * _169;
        float _179 = _131 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _181 = _177 * 0.15915493667125701904296875;
        float _183 = _181 * 6.283185482025146484375;
        float _185 = cos(_183);
        float _187 = _181 * 6.283185482025146484375;
        float _189 = sin(_187);
        float _191 = _185 + (-1.0);
        float _193 = _191 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _195 = fma(_189, _179, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _197 = fma(_131, _185, _193);
        float _199 = _175 * _195;
        float _201 = _197 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _203 = fma(_139, _199, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _205 = fma(_135, _199, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _207 = fma(_203, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
        float _209 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
        float _211 = _209 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _161 = _197;
        _163 = _203;
        _165 = _205;
        _167 = _211;
    }
    float _213 = _161;
    float _215 = _163;
    float _217 = _165;
    float _219 = _167;
    float _221 = _213 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _223 = _213 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _225 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[1].x, _221);
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[0].x, _223);
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[1].z, _225);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[0].z, _227);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _235 = _231 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _237 = _233 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _239 = _233 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _243 = _233 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _245 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[8].x, _237);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[7].x, _239);
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[9].x, _241);
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[10].x, _243);
    float _253 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _245);
    float _255 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _247);
    float _257 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _249);
    float _259 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _251);
    float _261 = _253 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _267 = _259 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _263;
    out.gl_Position.y = _261;
    out.gl_Position.z = _265;
    out.gl_Position.w = _267;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_33.x;
    float _55 = in.m_33.y;
    float _57 = fma((*spvDescriptorSet0.vp_c11)._m0[24].x, (*spvDescriptorSet0.vp_c11)._m0[40].y, _55);
    float2 _299 = float2(_53, _57);
    float _59 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299)), level(0.0)).x;
    float _61 = in.m_35.x;
    float _63 = in.m_35.y;
    float _65 = in.m_35.z;
    float _67 = (*spvDescriptorSet0.vp_c11)._m0[24].x * (*spvDescriptorSet0.vp_c11)._m0[41].x;
    float _69 = in.m_37.x;
    float _71 = in.m_37.y;
    float _73 = in.m_37.z;
    float _75 = _61 + _65;
    float _77 = fma(_75, (*spvDescriptorSet0.vp_c11)._m0[40].z, _67);
    float _79 = in.m_39.x;
    float _81 = in.m_39.y;
    float _83 = in.m_39.z;
    float _85 = _77 * 0.15915493667125701904296875;
    float _87 = _85 * 6.283185482025146484375;
    float _89 = sin(_87);
    float _91 = fma(_89, 0.5, 0.5);
    float _93 = _91 * (*spvDescriptorSet0.vp_c11)._m0[40].w;
    float _95 = fma(_59, 2.0, -1.0);
    float _97 = fma(_95, (*spvDescriptorSet0.vp_c11)._m0[40].x, _93);
    float _99 = _97 * _63;
    float _101 = _99 * (*spvDescriptorSet0.vp_c11)._m0[41].y;
    float _103 = fma(_81, _101, _71);
    float _105 = fma(_79, _101, _69);
    float _107 = fma(_83, _101, _73);
    float _109 = _103 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _111 = _103 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _113 = _103 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _115 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[2].x, _109);
    float _117 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[0].x, _111);
    float _119 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[1].x, _113);
    float _121 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[2].z, _115);
    float _123 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[0].z, _117);
    float _125 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[1].z, _119);
    float _127 = _121 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _129 = _123 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _131 = _125 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _133 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _135 = _127 + _133;
    float _137 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _139 = _129 + _137;
    float _141 = _131 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _143 = _135 * _135;
    float _145 = fma(_129, (*spvDescriptorSet0.vp_c4)._m0[2].x, _141);
    float _147 = fma(_139, _139, _143);
    float _149 = fma(_127, (*spvDescriptorSet0.vp_c4)._m0[2].z, _145);
    float _151 = sqrt(_147);
    float _153 = _149 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _157 = _151 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    bool _159 = !_157;
    float _161 = _131;
    float _163 = _129;
    float _165 = _127;
    float _167 = _153;
    if (!_159)
    {
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _171 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _173 = _151 + _171;
        float _175 = rsqrt(_147);
        float _177 = _173 * _169;
        float _179 = _131 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _181 = _177 * 0.15915493667125701904296875;
        float _183 = _181 * 6.283185482025146484375;
        float _185 = cos(_183);
        float _187 = _181 * 6.283185482025146484375;
        float _189 = sin(_187);
        float _191 = _185 + (-1.0);
        float _193 = _191 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _195 = fma(_189, _179, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _197 = fma(_131, _185, _193);
        float _199 = _175 * _195;
        float _201 = _197 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _203 = fma(_139, _199, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _205 = fma(_135, _199, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _207 = fma(_203, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
        float _209 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
        float _211 = _209 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _161 = _197;
        _163 = _203;
        _165 = _205;
        _167 = _211;
    }
    float _213 = _161;
    float _215 = _163;
    float _217 = _165;
    float _219 = _167;
    float _221 = _213 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _223 = _213 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _225 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[1].x, _221);
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[0].x, _223);
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[1].z, _225);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[0].z, _227);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _235 = _231 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _237 = _233 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _239 = _233 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _243 = _233 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _245 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[8].x, _237);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[7].x, _239);
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[9].x, _241);
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[10].x, _243);
    float _253 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _245);
    float _255 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _247);
    float _257 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _249);
    float _259 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _251);
    float _261 = _253 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _267 = _259 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _263;
    out.gl_Position.y = _261;
    out.gl_Position.z = _265;
    out.gl_Position.w = _267;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_33.x;
    float _55 = in.m_33.y;
    float _57 = fma((*spvDescriptorSet0.vp_c11)._m0[24].x, (*spvDescriptorSet0.vp_c11)._m0[40].y, _55);
    float2 _299 = float2(_53, _57);
    float _59 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299)), level(0.0)).x;
    float _61 = in.m_35.x;
    float _63 = in.m_35.y;
    float _65 = in.m_35.z;
    float _67 = (*spvDescriptorSet0.vp_c11)._m0[24].x * (*spvDescriptorSet0.vp_c11)._m0[41].x;
    float _69 = in.m_37.x;
    float _71 = in.m_37.y;
    float _73 = in.m_37.z;
    float _75 = _61 + _65;
    float _77 = fma(_75, (*spvDescriptorSet0.vp_c11)._m0[40].z, _67);
    float _79 = in.m_39.x;
    float _81 = in.m_39.y;
    float _83 = in.m_39.z;
    float _85 = _77 * 0.15915493667125701904296875;
    float _87 = _85 * 6.283185482025146484375;
    float _89 = sin(_87);
    float _91 = fma(_89, 0.5, 0.5);
    float _93 = _91 * (*spvDescriptorSet0.vp_c11)._m0[40].w;
    float _95 = fma(_59, 2.0, -1.0);
    float _97 = fma(_95, (*spvDescriptorSet0.vp_c11)._m0[40].x, _93);
    float _99 = _97 * _63;
    float _101 = _99 * (*spvDescriptorSet0.vp_c11)._m0[41].y;
    float _103 = fma(_81, _101, _71);
    float _105 = fma(_79, _101, _69);
    float _107 = fma(_83, _101, _73);
    float _109 = _103 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _111 = _103 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _113 = _103 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _115 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[2].x, _109);
    float _117 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[0].x, _111);
    float _119 = fma(_105, (*spvDescriptorSet0.vp_c7)._m0[1].x, _113);
    float _121 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[2].z, _115);
    float _123 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[0].z, _117);
    float _125 = fma(_107, (*spvDescriptorSet0.vp_c7)._m0[1].z, _119);
    float _127 = _121 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _129 = _123 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _131 = _125 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _133 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _135 = _127 + _133;
    float _137 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _139 = _129 + _137;
    float _141 = _131 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _143 = _135 * _135;
    float _145 = fma(_129, (*spvDescriptorSet0.vp_c4)._m0[2].x, _141);
    float _147 = fma(_139, _139, _143);
    float _149 = fma(_127, (*spvDescriptorSet0.vp_c4)._m0[2].z, _145);
    float _151 = sqrt(_147);
    float _153 = _149 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _157 = _151 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    bool _159 = !_157;
    float _161 = _131;
    float _163 = _129;
    float _165 = _127;
    float _167 = _153;
    if (!_159)
    {
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _171 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _173 = _151 + _171;
        float _175 = rsqrt(_147);
        float _177 = _173 * _169;
        float _179 = _131 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _181 = _177 * 0.15915493667125701904296875;
        float _183 = _181 * 6.283185482025146484375;
        float _185 = cos(_183);
        float _187 = _181 * 6.283185482025146484375;
        float _189 = sin(_187);
        float _191 = _185 + (-1.0);
        float _193 = _191 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _195 = fma(_189, _179, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _197 = fma(_131, _185, _193);
        float _199 = _175 * _195;
        float _201 = _197 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _203 = fma(_139, _199, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _205 = fma(_135, _199, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _207 = fma(_203, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
        float _209 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
        float _211 = _209 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _161 = _197;
        _163 = _203;
        _165 = _205;
        _167 = _211;
    }
    float _213 = _161;
    float _215 = _163;
    float _217 = _165;
    float _219 = _167;
    float _221 = _213 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _223 = _213 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _225 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[1].x, _221);
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[0].x, _223);
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[1].z, _225);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[0].z, _227);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _235 = _231 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _237 = _233 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _239 = _233 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _243 = _233 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _245 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[8].x, _237);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[7].x, _239);
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[9].x, _241);
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[10].x, _243);
    float _253 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _245);
    float _255 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _247);
    float _257 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _249);
    float _259 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _251);
    float _261 = _253 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _267 = _259 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _263;
    out.gl_Position.y = _261;
    out.gl_Position.z = _265;
    out.gl_Position.w = _267;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

